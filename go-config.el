;; uses go fmt to add flymake support to go
(require 'go-mode)
(require 'flymake)

(defvar flymake-go-executable "go" "The go executable to use for syntax checking")

(defun flymake-go-init ()
  (list flymake-go-executable
		(list "fmt"
			  (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))))

(push '(".+\\.go$" flymake-go-init) flymake-allowed-file-name-masks)

(add-hook 'go-mode-hook (lambda () (flymake-mode)))

(provide 'flymake-go)
(defun tabify-buffer ()
  "Tabify current buffer"
  (interactive)
  (if (not (string= major-mode "makefile-gmake-mode"))
	  (tabify (point-min) (point-max))))

(defun gomodes-hooks ()
  "Hooks for programming modes"
  (yas/minor-mode-on)
  (add-hook 'before-save-hook 'gomodes-write-hooks)
  (local-set-key "\C-c\C-d" 'godef-describe)
  (local-set-key "\C-c\C-j" 'godef-jump)
  (local-set-key "\C-c\C-h" 'godoc)
  )

(defun gomodes-write-hooks ()
  "Hooks which run on file write for go mode files"
  (if (string= major-mode "go-mode")
	  (prog1 nil
		(set-buffer-file-coding-system 'utf-8-unix)
		(tabify-buffer)
		(delete-trailing-whitespace)
		(gofmt))))

(add-hook 'go-mode-hook 'gomodes-hooks)



(define-key global-map "\M-g" 'goto-line)
