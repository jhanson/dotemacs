
;; all of this stuff automatically cleans up files and turns
;; tabs to spaces when i save
(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (if (not (string= major-mode "makefile-gmake-mode"))
      (untabify (point-min) (point-max))))

(defun progmodes-hooks ()
  "Hooks for programming modes"
  (yas/minor-mode-on)
  (add-hook 'before-save-hook 'progmodes-write-hooks))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (set-buffer-file-coding-system 'utf-8-unix)
    ;; everything besides go uses spaces instead of tabs
    (unless (equal major-mode 'go-mode) (untabify-buffer))
     (delete-trailing-whitespace)))

;; make trailing whitespace ugly
(setq-default show-trailing-whitespace nil)

;; modes i want to untabify etc
(add-hook 'php-mode-hook 'progmodes-hooks)
(add-hook 'python-mode-hook 'progmodes-hooks)
(add-hook 'js2-mode-hook 'progmodes-hooks)
;(add-hook 'java-mode-hook 'progmodes-hooks)

(defvar ic-backend-project-dir "~/projects/ic-backend")
(defvar ic-backend-ui-project-dir "~/projects/ic-backend-ui")
(defvar tocoma-ui-project-dir "~/projects/tocoma-ui")
(defvar manage-view-project-dir "~/projects/manage-view")
(defvar roy-bean-project-dir "~/projects/roybean")

;; buffer functions
(defun quick-switch-to-buffer (name)
  (if (get-buffer name)
      (progn
        (switch-to-buffer name)
        (goto-char (point-max)))
    (progn
      (shell name)
      (insert "source ~/.profile")
      ;; press Enter
      (comint-send-input))))

(defun switch-to-ant ()
  "Switchs to my ant.out buffer where I usually run ic-backend"
  (interactive)
  (quick-switch-to-buffer "ant.out"))

(global-set-key (kbd "\C-c 6") 'switch-to-ant)

(defun switch-to-mysql ()
  "Switch to mysql."
  (interactive)
  (sql-mysql)
  (delete-other-windows)
  )
(global-set-key (kbd "\C-c 2") 'switch-to-mysql)

(defun switch-to-zenhub ()
  "Switch to zenhub."
  (interactive)
  (quick-switch-to-buffer "zenhub.out"))

(global-set-key (kbd "\C-c 3") 'switch-to-zenhub)

(defun switch-to-analytics ()
  (interactive)
  (quick-switch-to-buffer "analytics.out"))
(global-set-key (kbd "\C-c 4") 'switch-to-analytics)

(defun switch-to-output-txt ()
  "Opens the output file of running ic-backend in the current frame."
  (interactive)
  (find-file (concat ic-backend-project-dir "/output.txt"))
  (auto-revert-tail-mode t)
  (revert-buffer t t))
(global-set-key (kbd "\C-c 9") 'switch-to-output-txt)

(defun kill-ic-backend ()
  "force kills the ic-backend"
  (shell-command "ps aux | grep -i 'play-1.2' | grep -v 'grep' | awk '{print $2}' | xargs kill -9")
  )

(defun run-ic-backend ()
  "Runs the ic-backend program in the ant.out buffer with the output streaming to output.txt"
  (interactive)
  (let (old-buffer (buffer-name (current-buffer)))
    (progn
      (switch-to-ant)
      ;; stop whatever is going on there
      (comint-interrupt-subjob)
      (goto-char (point-max))
      (kill-ic-backend)
      ;; new instance command
      (insert "ant run > output.txt 2>&1")
      ;; press Enter
      (comint-send-input)
      ;; Go back to where i was
      (switch-to-buffer old-buffer)
      (message "Restarted ic-backend"))))
(global-set-key "\C-x\C-r" 'run-ic-backend)

(defun run-ic-backend-test ()
  "Runs the ic-backend in the ant.out buffer with the output going to output.txt in the same directory. This runs the ant test target"
  (interactive)
  (let (old-buffer (buffer-name (current-buffer)))
    (progn
      (switch-to-ant)
      ;; stop whatever is going on there
      (comint-interrupt-subjob)
      (goto-char (point-max))
      (kill-ic-backend)
      ;; go to the right directory
      (insert (concat "cd " ic-backend-project-dir))
      (comint-send-input)
      ;; new instance command
      (insert "ant run > output.txt 2>&1")
      ;; press Enter
      (comint-send-input)
      ;; Go back to where i was
      (switch-to-buffer old-buffer)
      (message "Restarted ic-backend"))))
(global-set-key "\C-xt" 'run-ic-backend-test)

(defun ic-backend-project-diff()
  "Shows me the differences in my current sandbox"
  (interactive)
  (progn
    (let ((default-directory ic-backend-project-dir))
      (shell-command
       (concat "cd " ic-backend-project-dir "; git diff  " ic-backend-project-dir)
       "*VC-DIFF-PROJECT*")
      (switch-to-buffer "*VC-DIFF-PROJECT*")
      (diff-mode)
      ;; fullscreen it
      (delete-other-windows))))
 (global-set-key "\C-xvo" 'ic-backend-project-diff)

(defun ic-backend-project-ui-diff()
  "Shows me the differences in my current UI sandbox"
  (interactive)
  (progn
    (let ((default-directory ic-backend-ui-project-dir))
      (shell-command
       (concat "cd " ic-backend-ui-project-dir "; git diff  " ic-backend-ui-project-dir)
       "*VC-DIFF-PROJECT*")
      (switch-to-buffer "*VC-DIFF-PROJECT*")
      (diff-mode)
      ;; fullscreen it
      (delete-other-windows))))
 (global-set-key "\C-xvp" 'ic-backend-project-ui-diff)

(defun tocoma-ui-project-ui-diff()
  "Show me the differences in my current tocoma ui."
  (interactive)
  (progn
    (let ((default-directory tocoma-ui-project-dir))
      (shell-command
       (concat "cd " tocoma-ui-project-dir "; git diff  " tocoma-ui-project-dir)
       "*VC-DIFF-PROJECT*")
      (switch-to-buffer "*VC-DIFF-PROJECT*")
      (diff-mode)
      ;; fullscreen it
      (delete-other-windows))))
(global-set-key "\C-xvt" 'tocoma-ui-project-ui-diff)

(defun manage-view-project-ui-diff()
  "Show me the differences in my current manage view."
  (interactive)
  (progn
    (let ((default-directory manage-view-project-dir))
      (shell-command
       (concat "cd " manage-view-project-dir "; git diff  " manage-view-project-dir)
       "*VC-DIFF-PROJECT*")
      (switch-to-buffer "*VC-DIFF-PROJECT*")
      (diff-mode)
      ;; fullscreen it
      (delete-other-windows))))
 (global-set-key "\C-xve" 'manage-view-project-ui-diff)


(defun maybe-kill-buffer (buffer-name)
  "Kills the buffer if it exist"
  (if (get-buffer buffer-name)
      (kill-buffer buffer-name)))


(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)
    )
  )

(defun roy-bean-verify ()
  (interactive)
  (let ((roybean-buffer-name "*ROYBEAN-VERIFY*"))
     (maybe-kill-buffer roybean-buffer-name)
     (shell-command (concat "java -version; cd " roy-bean-project-dir " && mvn clean compile verify&") roybean-buffer-name)
     (switch-to-buffer roybean-buffer-name)
     (delete-other-windows)))
 (global-set-key (kbd "<f5>") 'roy-bean-verify)


(setq sql-mysql-program "/Users/joseph.hanson/sandboxes/msb_5_6_19/use")
(setq sql-user "root")
(setq sql-password "msandbox")
(setq sql-server "localhost")

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")                         ("melpa" . "https://melpa.org/packages/")))

(setq package-check-signature nil)

;; start the server so we can use emacsclient in intellij
(server-start)
