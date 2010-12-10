;; lightweight javascript editing mode
;; this is useful when there is javascript and html in the same page
(load "espresso")

;; js2 javascript IDE
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; jslint settings
(defvar jslint-global-vars "/*global Ext, Zenoss, _t*/")
(defvar jslint-global-config "/*jslint browser:true, devel:true, nomen:false, white:false, onevar:true, eqeqeq:false, plusplus:false*/"
   "All of the options to pass into jslint, see the http://www.jslint.com/lint.html for a list of them all")

(defun js-toggle-modes()
  "switches between espress and js2 modes"
  (interactive)
  (if (string= major-mode "js2-mode")
      (espresso-mode)
    (js2-mode)))

(defun jslint-current-buffer ()
  "This will run jslint in the foreground on the current file you are working on
and display the results in the other window. Since JSlint is so slow with rhino this
is good to use to check your work not to use with flymake. Honestly jslint is far to picky
to run in flymake mode so I think this is a better option"
  (interactive)
  (when (buffer-file-name)
    (save-excursion
      ;; goto the begining of the buffer and place the magic keywords for the js file
      (goto-char (point-min))
      (insert jslint-global-config)
      (insert "\n")
      (insert jslint-global-vars)
      (insert "\n")
      (save-buffer)

      ;; actually run the command on the file
      (shell-command
       (concat "java org.mozilla.javascript.tools.shell.Main ~/Library/JSLint/jslint.js "
               (buffer-file-name))
       "JSLint Output")
      (switch-to-buffer-other-window "JSLint Output")

      ;; now delete the global vars declaration
      (other-window 1)
      (goto-char (point-min))
      (kill-line 2)
      (save-buffer))))

;; jscomint inferior process and set up files
(require 'js-comint)
(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             (local-set-key "\C-cb" 'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-c\C-r" 'js-send-region-and-go)
             (local-set-key "\C-c\C-d" 'js-toggle-modes)
             (local-set-key "\C-cl" 'js-load-file-and-go)
             (local-set-key "\C-c\C-z" 'run-js)

             ;; js2 ignores some commands
             (local-set-key (kbd "RET") 'newline-and-indent)
             (local-set-key "\C-a" 'back-to-indentation)
             (local-set-key (kbd "\C-c i") 'jslint-current-buffer)
             ;; toggle js modes
             (local-set-key "\M-n" 'forward-paragraph)
             (local-set-key "\M-p" 'backward-paragraph)
             (drag-stuff-mode t)
             (setq js2-bounce-indent-p nil)
             (yas/minor-mode-on)
             ))
(add-hook 'espresso-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-d" 'js-toggle-modes)
             (local-set-key "\M-n" 'forward-paragraph)
             (local-set-key "\M-p" 'backward-paragraph)
             ))
;; for jscomint, tells it where my js file is
;; (setq inferior-js-program-command "java org.mozilla.javascript.tools.shell.Main")
(setq inferior-js-program-command "v8")

;; list of my JS libraries I need to load by default.
(defvar js-comint-libraries  '("/Users/joseph/Library/JavaScript/env.js",
    "/Users/joseph/zenoss/lib/python/zenoss/extjs/src/ext-all-debug.js",
    "/Users/joseph/zenoss/lib/python/zenoss/extjs/src/adapters/ext/ext-base-debug.js"))

(defun js-comint-load-libraries ()
  "iterate through each JS library i need open and loads it in the running comint shell
This assumes the shell to be open and is called *js*"
  (interactive)
  (switch-to-buffer "*js*")
  (mapcar
   (lambda (library)
     (insert (concat "load(\"" library "\");" ))
     (comint-send-input)) js-comint-libraries))


;; sane indenting
(setq js-indent-level 4)
(setq js2-basic-offset 4)
(setq js2-cleanup-whitespace t)

;; Custom indentation function since JS2 indenting is terrible.
;; Uses js-mode's (espresso-mode) indentation semantics.
;;
;; Based on: http://mihai.bazon.net/projects/editing-javascript-with-emacs-js2-mode
;; (Thanks!)
(defun my-js2-indent-function ()
  (interactive)
  (save-restriction
    (widen)
    (let* ((inhibit-point-motion-hooks t)
           (parse-status (save-excursion (syntax-ppss (point-at-bol))))
           (offset (- (current-column) (current-indentation)))
           (indentation (js--proper-indentation parse-status))
           node)

      (save-excursion

        ;; I like to indent case and labels to half of the tab width
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (setq indentation (+ indentation (/ js-indent-level 2))))

        ;; consecutive declarations in a var statement are nice if
        ;; properly aligned, i.e:
        ;;
        ;; var foo = "bar",
        ;; bar = "foo";
        (setq node (js2-node-at-point))
        (when (and node
                   (= js2-NAME (js2-node-type node))
                   (= js2-VAR (js2-node-type (js2-node-parent node))))
          (setq indentation (+ 4 indentation))))

      (indent-line-to indentation)
      (when (> offset 0) (forward-char offset)))))

(defun my-js2-mode-hook ()
  (if (not (boundp 'js--proper-indentation))
      (progn (js-mode)
             (remove-hook 'js2-mode-hook 'my-js2-mode-hook)
             (js2-mode)
             (add-hook 'js2-mode-hook 'my-js2-mode-hook)))
  (set (make-local-variable 'indent-line-function) 'my-js2-indent-function)
  (define-key js2-mode-map [(return)] 'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward)

;; Add the hook so this is all loaded when JS2-mode is loaded
(add-hook 'js2-mode-hook 'my-js2-mode-hook)


;; mozrepl
(autoload 'inferior-moz-mode "moz" "MozRepl Inferior Mode" t)
(autoload 'moz-minor-mode "moz" "MozRepl Minor Mode" t)
(add-hook 'js2-mode-hook 'javascript-moz-setup)
(defun javascript-moz-setup () (moz-minor-mode 1))

;; reload current page function
(defun maybe-reload-page ()
  "If you have the mozrepl running this will reload the page
from emacs, this is only useful to me in js mode"
  (interactive)
  (if (get-buffer "*MozRepl*")
      (progn
        (comint-send-string (inferior-moz-process)
                      "content.location.reload();"))
    (message "must start mozrepl before reloading the page")))
(global-set-key  "\C-cu" 'maybe-reload-page)

;; jslint compile mode (like pep8)


;; flymake using gjslint
;; (require 'flymake)

;; (defun flymake-gjslint-init ()
;;   "Initialize flymake for gjslint"
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace)))
;;     (list "/Users/joseph/zenoss/bin/gjslint" (list temp-file "--nosummary"))))

;; (add-to-list 'flymake-allowed-file-name-masks
;;              '(".+\\.js$"
;;                flymake-gjslint-init
;;                flymake-simple-cleanup
;;                flymake-get-real-file-name))

;; (add-to-list 'flymake-err-line-patterns
;;              '("^Line \\([[:digit:]]+\\), E:[[:digit:]]+: "
;;                nil 1 nil))
