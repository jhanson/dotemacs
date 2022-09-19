;;;; All of my environmental variables and config settings go here
;;;;
;;;;

;; always show matching parenthesis
(show-paren-mode t)

;; set new offsets to 4
(setq-default c-basic-offset 4)
(setq tab-width 4)
(setq css-indent-level 4)

;; supposedly this makes all tabs spaces
(setq indent-tabs-mode nil)
(setq default-tab-width 4)

;; set the indentation in xml and html modes
(setq sgml-basic-offset 4)

;; only for x windows
(if (functionp 'x-cut-buffer-or-selection-value)
    (progn
      (setq x-select-enable-clipboard t)
      (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)))

;; Add color to a shell running in emacs 'M-x shell'
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)


;; make the prompt read only in shell
;;(setq comint-prompt-read-only nil)

;; high light current line
(global-hl-line-mode 0)

;; prevent back ups from being created
(setq make-backup-files nil)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; make the default mode text mode with flyspell
(setq default-major-mode 'text-mode)
;; commented out until flyspell starts working for me
(add-hook 'text-mode-hook 'flyspell-mode)

(defadvice ispell-command-loop (before ispell-reverse-miss-list activate)
  "reverse the first argument to ispell-command-loop"
  (ad-set-arg 0 (reverse (ad-get-arg 0))))

;; do not beep when you mess up
(setq ring-bell-function 'ignore)

;; remove the gui elements
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; highlights your marked region
(transient-mark-mode 1)

;; always highlight syntax
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

;; will always need this
(require 'flymake)

;; when you have two open buffers with the same name, make it
;; not retarded ie. Display.php <2>
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator "|")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;; keep all my backups in one place
(push '("." . "~/.emacs-backups") backup-directory-alist)

;; no spash screen on start up
(setq inhibit-splash-screen t)

;; use y or n instead of yes or no and then pressing return
(fset 'yes-or-no-p 'y-or-n-p)

;; i like blinking cursors
(blink-cursor-mode t)

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; remember the last place in your file
(setq save-place-file "~/.emacs.d/saveplace") ;; keep my ~/ clean
(setq-default save-place t)                   ;; activate it for all buffers
(require 'saveplace)

;; smart tab key (complete/indent)
(setq tab-always-indent 'complete)

;; aspell
;;(setq-default ispell-program-name "aspell")

;; easier to navigate between frames
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

;; use ibuffer to list buffer contents
(global-set-key (kbd "\C-x\C-b") 'ibuffer)

;; never use the message box (evil!)
(defalias 'message-box 'message)

;; used so i could compile cedet
(setq max-lisp-eval-depth 1600)

;; display time mode (shows time and load in the menu bar)
(display-time-mode 1)

;; eshell variables
(eshell)
(add-to-list 'eshell-visual-commands "htop")
(add-to-list 'eshell-visual-commands "vim")

;; (add-hook 'shell-mode-hook '(lambda ()
;;                               (ansi-color-for-comint-mode-on)
;;                               (compilation-shell-minor-mode)))


