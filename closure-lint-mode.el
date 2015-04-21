(require 'flymake)

(defcustom closure-lint-gjs-lint "gjslint"
  "The name of the Closure Linter program."
  :type 'string
  :group 'closure-lint)

(defcustom closure-lint-fix-js-style "fixjsstyle"
  "The name of the Closure Fix JS Style program."
  :type 'string
  :group 'closure-lint)

(defvar closure-lint-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map "\C-c\C-e" 'flymake-display-err-menu-for-current-line)
    (define-key map "\C-c\C-f" 'closure-lint-fix-buffer)
    map)
  "The keymap used in `closure-lint-mode buffers.")

;;;###autoload
(define-minor-mode closure-lint-mode
  "Closure Lint mode.
     With no argument, this command toggles the mode.
     Non-null prefix argument turns on the mode.
     Null prefix argument turns off the mode."
  :init-value nil
  :lighter " GJSLint"
  :keymap '(("\C-c\C-f" 'closure-lint-fix-buffer))
  :group 'closure-lint)

(defun closure-lint-find-file-hook ()
  "Hook function to enable closure-lint-mode and flymake-mode if
the current buffer's file is a Javascript file."
  (when (string-match "\\.js$" buffer-file-name)
    (closure-lint-mode 't)
    (flymake-mode 't)))

(defun closure-lint-fix-file (filename)
  "Run the \"fixjsstyle\" program on `filename."
  (let* ((command (concat closure-lint-fix-js-style " " filename))
         (output (shell-command-to-string command)))
    (message output)))

(defun closure-lint-fix-buffer ()
  "Run the \"fixjsstyle\" program on the content of the current
  buffer and replace the current buffer's content with the fixed
  content."
  (interactive)
  (let* ((current-point (point))
         (temp-file (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace)))
    (progn
      (closure-lint-fix-file temp-file)
      (erase-buffer)
      (insert-file-contents temp-file)
      (goto-char current-point)
      (delete-file temp-file))))

(defun closure-lint-flymake-init ()
  "Flymake init function using the closure linter."
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list closure-lint-gjs-lint (list (expand-file-name local-file)))))

(add-hook 'find-file-hooks 'closure-lint-find-file-hook)

(add-to-list 'flymake-allowed-file-name-masks
             '(".+\\.js$" closure-lint-flymake-init flymake-simple-cleanup flymake-get-real-file-name))

(add-to-list 'flymake-err-line-patterns
             '("^Line \\([[:digit:]]+\\), E:\\([[:digit:]]+\\):\\(.+\\)$" nil 1 nil 3))

(provide 'closure-lint-mode)
