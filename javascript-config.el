(load "espresso")
(load "js2-mode")


;; (load "closure-lint-mode.el")
;; (setq closure-lint-gjs-lint "/Users/joseph/zenoss/bin/gjslint")
;; js2 javascript IDE
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; prettier on save hook configuration
(require 'prettier-js)
(setq prettier-js-command "/Users/joseph.hanson/.nvm/versions/node/v10.15.3/bin/prettier")
(setq prettier-js-args '(
  "--print-width" "120"
  "--single-quote" "true"
  "--tab-width" "4"
  "--trailing-comma" "none"
))

(add-hook 'js2-mode-hook 'prettier-js-mode)

;; jslint settings
(defvar jslint-global-vars "/*global Ext, Zenoss, _t*/")
(defvar jslint-global-config "/*jslint browser:true, devel:true, nomen:false, white:false, onevar:true, eqeqeq:false, plusplus:false*/"
   "All of the options to pass into jslint, see the http://www.jslint.com/lint.html for a list of them all.")

(defun js-toggle-modes()
  "switches between espress and js2 modes"
  (interactive)
  (if (string= major-mode "js2-mode")
      (espresso-mode)
    (js2-mode)))

(defvar jest-last-test "", "The last test we ran on jest")
(defun js-test-file-jest()
  "tests the current buffer in jest"
  (interactive)
  (let* ((fName buffer-file-name))
    (if (string-match-p (regexp-quote "spec") fName)
         (setq jest-last-test fName)))
  (shell-command
       (concat "cd ~/projects/manage-view; /Users/joseph.hanson/.nvm/versions/node/v10.15.3/bin/jest " jest-last-test " &")
       "*JEST-OUTPUT*"))

(defun js-test-debug-file-jest()
  "tests the current buffer in jest"
  (interactive)
  (let* ((fName buffer-file-name))
    (if (string-match-p (regexp-quote "spec") fName)
        (setq jest-last-test fName)))
  (when (get-buffer "*JEST-OUTPUT-DEBUG*")
    (kill-buffer "*JEST-OUTPUT-DEBUG*"))
  (shell-command
       (concat "cd ~/projects/tocoma-ui; node inspect ./node_modules/jest/bin/jest.js " jest-last-test " &")
       "*JEST-OUTPUT-DEBUG*")
  (other-window 1))

(require 'javascript-jshint)
(add-hook 'js2-mode-hook
          '(lambda ()
             (local-set-key "\C-x\C-e" 'js-send-last-sexp)
             (local-set-key "\C-\M-x" 'js-send-last-sexp-and-go)
             (local-set-key "\C-cb" 'js-send-buffer)
             (local-set-key "\C-c\C-b" 'js-send-buffer-and-go)
             (local-set-key "\C-c\C-r" 'js-test-file-jest)
             (local-set-key "\C-c\C-d" 'js-toggle-modes)
             (local-set-key "\C-c\k" 'react-dom-fix)
             (local-set-key "\C-cl" 'js-load-file-and-go)
             (local-set-key "\C-c\C-z" 'run-js)
             (local-set-key "\M-." 'find-tag)

             ;; js2 ignores some commands
             (local-set-key (kbd "RET") 'newline-and-indent)
             (local-set-key "\C-a" 'back-to-indentation)
             (local-set-key (kbd "\C-c i") 'javascript-jshint)
             ;; toggle js modes
             (local-set-key "\M-n" 'forward-paragraph)
             (local-set-key "\M-p" 'backward-paragraph)
             (drag-stuff-mode t)
             (setq js2-bounce-indent-p nil)
             ;; (closure-lint-mode)
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
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward))

;; Add the hook so this is all loaded when JS2-mode is loaded
(add-hook 'js2-mode-hook 'my-js2-mode-hook)


(setq flycheck-less-executable "/usr/bin/less")
(setq flycheck-javascript-jshint-executable "/usr/local/bin/jshint")
(setq flycheck-javascript-eslint-executable "/usr/local/bin/eslint")


(provide 'javascript-config)
;;; javascript-config.el ends here
