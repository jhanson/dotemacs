;; Alias ctrl x ctrl m for alt m
(define-key global-map "\C-x\C-p" 'revert-buffer)
(define-key global-map "\M-g" 'goto-line)

;; control a to begining of statement instead of line
(global-set-key (kbd "C-a") 'back-to-indentation)

;; make ctrl z undo, as well as ctrl x ctrl u
(global-set-key "\C-z" 'undo)
(global-set-key "\C-x\C-u" 'undo)
;; was suspend frame i kept hitting accidently
(global-set-key "\C-x\C-z" 'repeat)

;; auto indent after new line
(define-key global-map (kbd "RET") 'newline-and-indent)

;; short cut to shell
(global-set-key (kbd "\C-c 5") 'eshell)
(global-set-key (kbd "\C-c 7") 'shell)

;; shortcuts i like
(global-set-key (kbd "\C-c \C-t") 'lisp-complete-symbol)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key (kbd "<f5>") 'rgrep)
(global-set-key (kbd "<f8>") 'ielm)

;; usually bound to M-SPC which is taken by OSX
(global-set-key (kbd "M-m") 'just-one-space)

(defun switch-to-previous-buffer()
  "Goes to the last buffer"
  (interactive)
  (switch-to-buffer (other-buffer)))
(global-set-key (kbd "\C-q") 'switch-to-previous-buffer)

;; delete pair (will delete matching "" or ())
(global-set-key "\M-sd" 'delete-pair)
(global-set-key "\M-sf" 'flyspell-correct-word-before-point)

(require 'recentf)

;; enable recent files mode.
(recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
;; get rid of `toggle-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-q") 'ido-recentf-open)


