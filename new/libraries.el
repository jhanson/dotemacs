
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

;; ido for M-x
;;(require 'smex)
;;(add-hook 'after-init-hook 'smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;(define-key global-map "\C-x\C-m" 'smex)

;;; YaSnippet
(add-to-list 'load-path "~/emacs/plugins/yasnippet/")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)

(defun reload-snippets ()
  "Convenience method for reloading the ya snippet plugins"
  (interactive)
  (yas/load-directory "~/emacs/plugins/yasnippet/snippets"))
(reload-snippets)

;; sass mode
(add-to-list (quote auto-mode-alist) (cons "\\.scss$" (function sass-mode)))
(add-hook 'sass-mode-hook 'rainbow-mode)

(put 'narrow-to-page 'disabled nil)

(setq max-specpdl-size 50000)
(setq max-lisp-eval-depth 5000)

;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

