(defun zen-list-tags ()
  "Lists the tags of our current buffer, will let you jump to definition from new buffer"
  (interactive)
  (let ((current-file (buffer-file-name (current-buffer))))
    (if (string-match "/Products/" current-file)
        (list-tags (replace-regexp-in-string "^.*Products/" "" current-file)))))

;; flymake python (pyflakes)
;; stolen from http://www.plope.com/Members/chrism/flymake-mode
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'find-file-hook 'flymake-find-file-hook)


(load "python-pylint.el")
(load "python-pep8.el")

(add-hook 'python-mode-hook '(lambda ()
             (drag-stuff-mode t)
             (flyspell-prog-mode)
             (define-key python-mode-map "\C-co" 'zen-list-tags)
             (define-key python-mode-map "\C-ci" 'python-pep8)
             (define-key python-mode-map "\M-n" 'forward-paragraph)
             (define-key python-mode-map "\M-p" 'backward-paragraph)
             ))
(setq-default show-trailing-whitespace t)

;; todo turn class definition into an interface function