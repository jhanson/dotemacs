;; a file for all of my custom emacs utility functions


;; copy line instead of kill-undo
(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))

(setq-default kill-read-only-ok t)
(global-set-key "\M-k" 'copy-line)

(defun duplicate-line()
  "adds a copy of the current line on the line below"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(global-set-key (kbd "\C-c j") 'duplicate-line)

(defun shell-command-other-window (command window-name)
  "Runs the command passed in and outputs it in the other window named by window name
This always runs on the current buffer"
  (save-excursion
    (progn
      (when (buffer-file-name)
        (shell-command (concat command " " (buffer-file-name)) window-name)
        (switch-to-buffer-other-window window-name)
        (other-window 1)))))

(defun inc-dec-number (func)
  (let ((num (string-to-number (current-word))))
    (if num
        (save-excursion
          (forward-word 1)
          (backward-kill-word 1)
          (insert (number-to-string
                   (if (string= func "+") (+ 1 num)
                     (- num 1))))))))

(defun increment-number()
  (interactive)
  (inc-dec-number "+"))
(global-set-key "\C-c=" 'increment-number)

(defun decrement-number()
  (interactive)
  (inc-dec-number "-"))
(global-set-key "\C-c-" 'decrement-number)

;; copy word
(defun copy-word (&optional arg)
  "Adds the next word to the kill ring, the same as mark-word followed by kill-ring-save"
  (interactive "P")
  (save-excursion
    (toggle-read-only 1)
    (kill-word arg)
    (toggle-read-only 0)))
(global-set-key "\M-r" 'copy-word)

(defun opposite-case()
  "If the current letter is uppercase, this makes it lower case, otherwise it makes it uppercase"
  (interactive)
  (let ((char  (char-after)))
    (save-excursion
      ;; remove current character
      (delete-char 1)
      ;; place the opposite one
      (insert   (if (> char 90)
                    (- char 32)
                  (+ char 32))))))
;; was formerly "insert space to tab"
(global-set-key "\M-i" 'opposite-case)

(defun opposite-quote()
  "Turns the string into the opposite quote either single quote to double quote. You must start out on the char before the quote"
  (interactive)
  (let ((char (char-after)))
    (save-excursion
      (if (= char 34)
          (progn
            (delete-char 1)
            (insert "'")))
      (if (= char 39)
          (progn
            (delete-char 1)
            (insert "\"")))
      (search-forward (char-to-string char))
      (backward-char 1)
      (if (= char 34)
          (progn
            (delete-char 1)
            (insert "'")))
      (if (= char 39)
          (progn
            (delete-char 1)
            (insert "\"")))
      )))
(global-set-key "\M-sj" 'opposite-quote)

;; now able to have control w be smart about what i am doing
(defun backward-kill-word-or-kill-region (&optional arg)
  (interactive "p")
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word arg)))

(global-set-key (kbd "C-w") 'backward-kill-word-or-kill-region)

;; swap windows
(defun swap-windows ()
  "If you have 2 windows, it swaps them."
  (interactive)
  (cond ((/= (count-windows) 2)
         (message "You need exactly 2 windows to do this."))
        (t
         (let* ((w1 (first (window-list)))
                (w2 (second (window-list)))
                (b1 (window-buffer w1))
                (b2 (window-buffer w2))
                (s1 (window-start w1))
                (s2 (window-start w2)))
           (set-window-buffer w1 b2)
           (set-window-buffer w2 b1)
           (set-window-start w1 s2)
           (set-window-start w2 s1))))
  (other-window 1))
(global-set-key (kbd "C-c s") 'swap-windows)


(defun beautify-json ()
  "Formats the selected JSON."
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
     "python -mjson.tool" (current-buffer) t)))
(global-set-key "\M-sk" 'beautify-json)

(defun github-pr ()
    "Open GitHub PR for current repository and branch"
    (interactive)
    (setq gpr-branch (shell-command-to-string "git rev-parse --abbrev-ref HEAD"))
    (setq gpr-project (shell-command-to-string "basename $(git rev-parse --show-toplevel)"))
    (setq gpr-url (format "open https://github.com/realworklabs/%s/pull/new/%s"
                          (string-trim-right gpr-project)
                          (string-trim-right gpr-branch)))
    (message gpr-url)
    (shell-command gpr-url))



