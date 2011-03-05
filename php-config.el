(require 'cc-mode)
(add-to-list 'c-mode-common-hook
             (lambda () (setq c-syntactic-indentation 1)))

(add-to-list 'c-mode-common-hook
             (lambda ()
               (setq c-auto-newline 0)
               (c-toggle-auto-newline -1)
               ))

;; newest version of php-mode. The one in packages was like 4 years old
(autoload (quote php-mode) "php-mode" "php mode" t nil)
(add-to-list (quote auto-mode-alist) (cons "\\.php$" (function php-mode)))
(setq auto-mode-alist (cons '("\\.ctp$" . php-mode) auto-mode-alist))

;; php manual location)
;; (setq php-manual-path "~/php-manual")

;; set the c style for my curly braces and such
(setq c-default-style "k&r")
;;(setq c-default-style "java")

;; flymake php syntax
(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
         (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
             '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))
(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))


(add-hook 'php-mode-hook '(lambda ()
                            (drag-stuff-mode t)
                            (flyspell-prog-mode)
                            ;; flymake short cuts
                            (define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
                            (define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)
                            (define-key php-mode-map "\C-c\C-t" 'php-complete-function)             
                            ))

