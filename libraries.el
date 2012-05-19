
;; don't question opening in the same buffer
(put 'dired-find-alternate-file 'disabled nil)

;;; Org Mode
;; org mode short cuts
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; log the time when done
(setq org-log-done t)
;; show blocked tasks
(setq org-agenda-dim-blocked-tasks t)

;;; IDO Mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

(defun ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
    (let ((enable-recursive-minibuffers t)) (visit-tags-table-buffer))
    (find-file (expand-file-name
                (ido-completing-read "Project file: "
                                     (tags-table-files) nil t)))))
(global-set-key (kbd "\C-x\C-g") 'ido-find-file-in-tag-files)

;; ido for M-x
(require 'smex)
(add-hook 'after-init-hook 'smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(define-key global-map "\C-x\C-m" 'smex)

;;; YaSnippet
(add-to-list 'load-path "~/emacs/plugins/yasnippet/")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)

(defun reload-snippets ()
  "Convenience method for reloading the ya snippet plugins"
  (interactive)
  (yas/load-directory "~/emacs/plugins/yasnippet/snippets"))
(reload-snippets)
;; browse the kill ring
(require 'browse-kill-ring)

;;; Support for the elisp library elib.
(setq load-path (append (list "/Applications/Emacs.app/Contents/Resources/site-lisp/elib")
                        load-path))

;; drag stuff
(require 'drag-stuff)
(add-hook 'org-mode-hook '(lambda ()
                           (drag-stuff-mode 0)
                           ))
(load-file "~/.emacs.d/auto-complete.el")
(load-file "~/.emacs.d/auto-complete-config.el")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/joseph/.emacs.d//ac-dict")
(ac-config-default)

(autoload 'rainbow-mode "rainbow-mode" nil t)
(autoload 'google-maps "google-maps" nil t)

;; protobuff
(autoload 'protobuf-mode "protobuf-mode" nil t)
(setq auto-mode-alist (cons '("\\.proto$" . protobuf-mode) auto-mode-alist))

;; markdown
(autoload 'markdown-mode "markdown-mode" nil t)
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))

;; go mode
(autoload (quote go-mode) "go-mode" "\
Major mode for editing Go source text.

This provides basic syntax highlighting for keywords, built-ins,
functions, and some types.  It also provides indentation that is
\(almost) identical to gofmt.

\(fn)" t nil)

(add-to-list (quote auto-mode-alist) (cons "\\.go$" (function go-mode)))



;; sass mode
(add-to-list (quote auto-mode-alist) (cons "\\.scss$" (function sass-mode)))
(add-hook 'sass-mode-hook 'rainbow-mode)

;; actionscript mode
(autoload (quote actionscript-mode) "actionscript-mode" "actionscript mode" t nil)
(add-to-list (quote auto-mode-alist) (cons "\\.as$" (function actionscript-mode)))
(add-to-list (quote auto-mode-alist) (cons "\\.mxml$" (function actionscript-mode)))

(put 'narrow-to-page 'disabled nil)

;; extended dired mode
(require 'dired+)

(setq max-specpdl-size 500000)
(setq max-lisp-eval-depth 50000)

;; haskell mode
(add-to-list 'load-path "~/emacs/haskell-mode")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(autoload 'haskell-mode "haskell-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(autoload 'sass-mode "sass-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))
