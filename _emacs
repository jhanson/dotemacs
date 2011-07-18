;; local directory of plugins
(add-to-list 'load-path "~/emacs")
(add-to-list 'load-path "~/.emacs.d/")

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
(load "php-config.el")
(load "python-config.el")
(load "javascript-config.el")

;; (load "java-config.el")
(load "erlang-config.el")

;; irc.efnet.org
(load "watch-queue.el")


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("left8" (ecb-directories-buffer-name 0.1925925925925926 . 0.2894736842105263) (ecb-sources-buffer-name 0.1925925925925926 . 0.23684210526315788) (ecb-methods-buffer-name 0.1925925925925926 . 0.2894736842105263) (ecb-history-buffer-name 0.1925925925925926 . 0.17105263157894737)))))
 '(ecb-options-version "2.40")
 '(jde-compiler (quote (("eclipse java compiler server" "/Users/joseph/dev/eclipse/plugins/org.eclipse.jdt.core_3.6.0.v_A58.jar"))))
 '(jde-jdk (quote ("1.6.0")))
 '(jde-jdk-registry (quote (("1.6.0" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/"))))
 '(org-agenda-files (quote ("~/Documents/org/avalon.org"))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )



;; start up the named buffers
(zenoss-startup-shells)