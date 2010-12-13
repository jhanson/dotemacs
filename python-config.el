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


;; make trailing whitespace ugly
(setq-default show-trailing-whitespace t)

;; open directory returned from python package
(defun open-python-directory (python-package)
  "Will attempt to open the directory from the python import"
  (interactive "sPython Package: ")
  (let ((directory nil))
    (if (string-match "Products." python-package)
        (setq directory (concat main-sandbox "/" (mapconcat 'identity (split-string python-package "\\.")  "/"))))
    ;; most likely enterprise
    (if (string-match "ZenPacks." python-package)
        (progn
          ;; TODO
          ;; split by /
          ;; join the first three (zenpack name)
          ;; then add the mapconcat crap
        (setq directory (concat svn-enterprise-sandbox "/" python-package "/" (mapconcat 'identity (split-string python-package "\\.")  "/"))))

    ;; find out if it is a directory
    (if (file-exists-p (concat directory ".py"))
        (find-file (concat directory ".py")))
    (if (file-exists-p directory)
        (find-file  directory)
      (message (concat directory " does not exist")))
      )))

(defun open-python-directory-from-region (start end)
  "opens the directory of the package you have highlighted"
  (interactive "r")
  (open-python-directory (buffer-substring start end)))

(add-hook 'python-mode-hook '(lambda ()
             (drag-stuff-mode t)
             (flyspell-prog-mode)
             (define-key python-mode-map "\C-co" 'zen-list-tags)
             (define-key python-mode-map "\C-ci" 'python-pep8)
             (define-key python-mode-map "\M-n" 'forward-paragraph)
             (define-key python-mode-map "\M-p" 'backward-paragraph)
             (define-key python-mode-map "\C-cp" 'open-python-directory-from-region)
             ))

;; set up zendmd as a comint inferior process
(require 'zendmd-comint)
(setq inferior-zendmd-program-command "/Users/joseph/zenoss/bin/zendmd")
(add-hook 'python-mode-hook '(lambda ()
                               (zendmd-minor-mode 1)))
(global-set-key (kbd "\C-c 1") 'switch-to-zendmd)
