
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
(require 'smex)
(add-hook 'after-init-hook 'smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(define-key global-map "\C-x\C-m" 'smex)
(require 'browser-refresh)


;;; YaSnippet
(add-to-list 'load-path "~/emacs/plugins/yasnippet/")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)

(defun reload-snippets ()
  "Convenience method for reloading the ya snippet plugins"
  (interactive)
  (yas/load-directory "~/emacs/plugins/yasnippet/snippets"))
(reload-snippets)


;;; Support for the elisp library elib.

;; automatically show eclispse style code browser
;;(ecb-activate)



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

(autoload 'rainbow-mode "rainbow-mode" nil t)

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

(setq max-specpdl-size 50000)
(setq max-lisp-eval-depth 5000)

;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; helm update
;; (add-to-list 'load-path "~/emacs/helm/async")
;; (add-to-list 'load-path "~/emacs/helm/helm")
;; (add-to-list 'load-path "~/emacs/helm/projectile")
;; (require 'helm-config)
;; (require 'helm-grep)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; (global-unset-key (kbd "C-x c"))

;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; (when (executable-find "curl")
;;   (setq helm-google-suggest-use-curl-p t))

;; (setq helm-quick-update                     t ; do not display invisible candidates
;;       helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;;       helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
;;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;;       helm-ff-file-name-history-use-recentf t)

;; (helm-mode 1)
;; (global-set-key "\C-xb" 'helm-mini)
;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; (global-set-key (kbd "M-s o") 'helm-occur)
;; (define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)
;; (require 'projectile)
;; (require 'helm-projectile)
;; (projectile-global-mode)
;; (global-set-key (kbd "\C-x\C-g") 'helm-projectile)
;; (setq projectile-indexing-method 'native)
;; (setq projectile-enable-caching t)
