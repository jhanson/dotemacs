
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
(yas/load-directory "~/emacs/plugins/yasnippet/snippets")

;; browse the kill ring
(require 'browse-kill-ring)

;; winring
(require 'winring)

;; cedet
(load-file "~/emacs/cedet-1.0pre7/common/cedet.el")
(global-ede-mode t)

;; ecb
(add-to-list 'load-path
             "~/emacs/ecb-snap/")
(require 'ecb)
(add-to-list 'ecb-source-path
             "~/dev/sandbox/Products")


;;; $Id: startup-template.el,v 0.5 1993/05/31 23:49:29 ceder Exp $
;;; Support for the elisp library elib.
(setq load-path (append (list "/Applications/Emacs.app/Contents/Resources/site-lisp/elib")
                        load-path))

;; automatically show eclispse style code browser
;;(ecb-activate)
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(require 'undo-tree)
;; ;; magit
;; (setq magit-git-executable "/usr/local/git/bin/git")
;; ;; regular vc git
;; (add-to-list 'vc-handled-backends 'Git)
;; (autoload 'mo-git-blame-file "mo-git-blame" nil t)
;; (autoload 'mo-git-blame-current "mo-git-blame" nil t)
;; (global-set-key "\C-cg" 'mo-git-blame-current)
;; (setq mo-git-blame-git-executable "/usr/local/git/bin/git")

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

;; actionscript mode
(autoload (quote actionscript-mode) "actionscript-mode" "actionscript mode" t nil)
(add-to-list (quote auto-mode-alist) (cons "\\.as$" (function actionscript-mode)))
(add-to-list (quote auto-mode-alist) (cons "\\.mxml$" (function actionscript-mode)))

(put 'narrow-to-page 'disabled nil)

