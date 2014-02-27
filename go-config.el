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

(defun build-control-plane()
  "Runs make on the control plane"
  (interactive)
  (compile "make -C /home/jhanson/src/go/src/github.com/zenoss/serviced/ -k"))

(global-set-key (kbd "<f6>") 'build-control-plane)


(defun test-control-plane()
  "Runs make test on the control plan in a separate buffer also moves the cursor to that buffer"
  (interactive)
  (delete-other-windows)
  (compile "make -C /home/jhanson/src/go/src/github.com/zenoss/serviced/ -k test")
  (other-window 1)
  (goto-char (point-max)))
  
(global-set-key (kbd "<f7>") 'test-control-plane)

;; this should already be here but it isn't alas
(setenv "GOPATH" "/home/jhanson/src/go")


(load "go-lint.el")

;;; TODO shortcut for make and make test
;; go test this specific method
;; go vet the current buffer
;; command to run serviced in a gud buffer with a break point at the current line

