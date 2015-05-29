;; Add this to the .emacs to get it to load this as the init script
;; (add-to-list 'load-path "~/emacs")
;; (load "_emacs")
;; local directory of plugins
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/emacs/flycheck")
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(load "funcs.el")
(if (eq system-type 'darwin)
        (load "mac-config.el")
      )
(if (eq system-type 'gnu/linux)
        (load "linux-config.el")
      )
(load "environment.el")
(load "libraries.el")
(load "zenoss-config.el")
(load "shortcuts.el")
;; (load "php-config.el")
(load "python-config.el")
(load "javascript-config.el")
(load "go-config.el")
;; (load "java-config.el")
;; (load "erlang-config.el")

;; (load "watch-queue.el")

(custom-set-variables

  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
  )
