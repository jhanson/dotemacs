;; associate .tpl files with html-mode
(setq auto-mode-alist (cons '("\\.tpl$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.pt$" . nxml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.zcml$" . nxml-mode) auto-mode-alist))

;; cpy files as python (stupid plone)
(setq auto-mode-alist (cons '("\\.cpy$" . python-mode) auto-mode-alist))


;; all of this stuff automatically cleans up files and turns
;; tabs to spaces when i save
(defun untabify-buffer ()
  "Untabify current buffer"
  (interactive)
  (untabify (point-min) (point-max)))

(defun progmodes-hooks ()
  "Hooks for programming modes"
  (yas/minor-mode-on)
  (add-hook 'before-save-hook 'progmodes-write-hooks))

(defun progmodes-write-hooks ()
  "Hooks which run on file write for programming modes"
  (prog1 nil
    (set-buffer-file-coding-system 'utf-8-unix)
    (untabify-buffer)
    (delete-trailing-whitespace)))

(defun ws ()
  "Make sure there is a space after every comma"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward ",\\([^[:space:]\n,]\\)" nil t) (replace-match ", \\1"))
    (goto-char (point-min))
    (while (search-forward "( " nil t) (replace-match "("))
    (goto-char (point-min))
    (while (search-forward " )" nil t) (replace-match ")"))
    (goto-char (point-min))
    (while (search-forward "if(" nil t) (replace-match "if ("))
    (goto-char (point-min))
    (while (search-forward "for(" nil t) (replace-match "for ("))
    (goto-char (point-min))
    (while (search-forward "while(" nil t) (replace-match "while ("))
    (goto-char (point-min))
    (while (search-forward "){" nil t) (replace-match ") {"))
    (goto-char (point-min))
    (while (re-search-forward ")[[:space:]]+{" nil t) (replace-match ") {"))
    (c-set-offset 'case-label '+)
    (c-set-offset 'statement-case-open '+)
    (indent-region (point-min) (point-max) nil)))

;; modes i want to untabify etc
(add-hook 'php-mode-hook 'progmodes-hooks)
(add-hook 'python-mode-hook 'progmodes-hooks)
(add-hook 'js2-mode-hook 'progmodes-hooks)

;; zope functions
(defun quick-switch-to-buffer (name)
  (if (get-buffer name)
      (progn
        (switch-to-buffer name)
        (goto-char (point-max)))
    (message (concat name  " doesn't exist"))))

(defun switch-to-zope ()
  "Switchs to my zope.output file, where i keep my zope instance"
  (interactive)
  (quick-switch-to-buffer "zope.out"))

(global-set-key (kbd "\C-c 6") 'switch-to-zope)

(defun switch-to-zep ()
  "switches to zep"
  (interactive)
  (quick-switch-to-buffer "zep.out"))
(global-set-key (kbd "\C-c 2") 'switch-to-zep)

(defun switch-to-zenhub ()
  "switches to zenhub"
  (interactive)
  (quick-switch-to-buffer "zenhub.out"))
(global-set-key (kbd "\C-c 3") 'switch-to-zenhub)

;; (defun switch-to-zendmd ()
;;   (interactive)
;;   (quick-switch-to-buffer "zendmd.out"))
;; (global-set-key (kbd "\C-c 1") 'switch-to-zendmd)

(defun switch-to-dsa ()
  (interactive)
  (quick-switch-to-buffer "dsa.out"))
(global-set-key (kbd "\C-c 4") 'switch-to-dsa)

(defun switch-to-irc ()
  "Goes to the irc session, "
  (interactive)
  (quick-switch-to-buffer "#zenoss"))
(global-set-key (kbd "\C-c 9") 'switch-to-irc)

(defun restart-zope ()
  "Restarts your zope server and takes you to the output.
This assumes that you have your zope instance in a shell file called zope.out"
  (interactive)
  (let (old-buffer (buffer-name (current-buffer)))
    (progn
      (switch-to-zope)
      ;; stop the previous instance
      (comint-interrupt-subjob)
      (goto-char (point-max))
      ;; new instance command
      (insert "runzope")
      ;; press Enter
      (comint-send-input)
      ;; Go back to where i was
      (switch-to-buffer old-buffer)
      (message "Restarted ur zopez"))))
(global-set-key "\C-x\C-r" 'restart-zope)

(defun restart-zep ()
  "Restarts the zep process"
  (interactive))
  ;; (progn
  ;;   (switch-to-zep)
  ;;   (comint-interrupt-subjob)
  ;;   (goto-char (point-max))
  ;;   (insert "mvn clean jetty:run")
  ;;   (comint-send-input)
  ;;   (message "restarted ur zeps")))
(global-set-key "\C-x\C-t" 'restart-zep)

;; Trac functions
(defvar trac-public-url "http://dev.zenoss.org/trac/ticket/" "Where tickets are on the public trac")
(defvar trac-svn-log "http://dev.zenoss.org/trac/log/sandboxen/jhanson/")
(defvar svn-sandbox-url "http://dev.zenoss.org/svn/sandboxen/jhanson/")
(defvar main-sandbox "~/dev/sandbox/trunk")
(defvar svn-enterprise-url "http://dev.zenoss.com/svnint/sandboxen/jhanson/")
(defvar svn-enterprise-sandbox "~/dev/sandbox/enterprise_zenpacks")

(defun zen-view-revisions ()
  "Browse to the svn log revision changes of the given word"
  (interactive)
  (browse-url (concat trac-svn-log (current-word t))))

(defun trac-browse-public-url()
  "Browse to the current word as a trac ticket on the public trac url"
  (interactive)
  (browse-url (concat trac-public-url (current-word t))))

;; SVN helper functions

(defun svn-switch-sandboxen (name)
  (let ((command (concat "svn switch " svn-sandbox-url name " " main-sandbox)))
    (shell-command command "svn-output")
    (switch-to-buffer-other-window "svn-output")))

(defun svn-switch-project (name)
  (interactive "sName of Branch: ")
  (progn
    (svn-switch-sandboxen name)
    (restart-zope)))

(defun svn-create-new-sandbox(name)
  "Will copy svn trunk to the new branch name and switch the dev/sandbox to the new checkout"
  (interactive "sName of Sandbox: ")
  (let* ((new-trunk (concat svn-sandbox-url name))
         (command (concat "svn cp -m \"copying trunk\" http://dev.zenoss.org/svn/trunk/ " new-trunk)))
    (progn
      (shell-command command "svn-output")
      (svn-switch-sandboxen name)
      ;; this will restart zope for me
      (zen-switch-to-sandbox))))

(global-set-key "\C-xvn" 'svn-create-new-sandbox)


;; new enterprise
(defun svn-create-new-enterprise(name)
  "Will copy svn enterprise to a new branch and switch to it"
  (interactive "sName of Enterprise Sandbox: ")
  (let* ((new-trunk (concat svn-enterprise-url name))
         (command (concat "svn cp -m \"copying trunk\" http://dev.zenoss.com/svnint/trunk/enterprise/zenpacks " new-trunk)))
    (progn
      (shell-command command "svn-output")
      (shell-command (concat "svn switch "  new-trunk " ~/dev/sandbox/enterprise_zenpacks")))))
(global-set-key "\C-xve" 'svn-create-new-enterprise)

(defun svn-merge-enterprise()
  "Preps merging enterprise to trunk"
  (interactive)
  (progn
    (shell-command (concat "svn info " svn-enterprise-sandbox) "current-project-output")
    (switch-to-buffer "current-project-output")
    ;; go to the svn output, find the string and copy it to the buffer
    (beginning-of-buffer)
    (search-forward "URL: http")
    (backward-word 1)
    (kill-line )
    (kill-buffer "current-project-output")
    ;; message the most recent thing we killed (the url of our svn)
    (let ((sandbox-url (car kill-ring-yank-pointer)))
      ;; get the revision
      (shell-command (concat "svn log " sandbox-url " | head -n 1000") "svn-log-output")
      (switch-to-buffer "svn-log-output")
      (beginning-of-buffer)
      ;; phrase i always use to create a branch
      (search-forward "copying trunk")
      ;; go back two lines to the revision number
      (back-to-indentation)
      (previous-line 2)
      ;; don't need the r in the revision number
      (forward-char 1)
      (copy-word 1)
      (kill-buffer "svn-log-output")
      ;; switch to trunk
      (shell-command "svn switch http://dev.zenoss.com/svnint/trunk/enterprise/zenpacks ~/dev/sandbox/enterprise_zenpacks")
      (or (switch-to-buffer "*eshell*")
           (eshell))
      (insert "cd ~/dev/sandbox/enterprise_zenpacks")
      (eshell-send-input)
      (insert (concat "svn merge -r " (car kill-ring-yank-pointer) ":HEAD " sandbox-url))
      )))

(defun svn-list-projects ()
  "Outputs a list of all the svn sandboxen I have"
  (interactive)
  (shell-command-other-window (concat "svn ls " svn-sandbox-url) "svn-output"))

(defun zen-switch-to-sandbox ()
  "Will switch my Products to my sandbox (always checked out in
dev/sandbox/Products) and will restart zope "
  (interactive)
  (shell-command "rm ~/zenoss/Products && ln -s ~/dev/sandbox/trunk/Products/ ~/zenoss/Products")
  (shell-command "rm ~/zenoss/zep && ln -s ~/dev/sandbox/trunk/zep/ ~/zenoss/zep")
  (shell-command "rm ~/zenoss/protocols && ln -s ~/dev/sandbox/trunk/protocols ~/zenoss/protocols")
  (shell-command "cd ~/zenoss/protocols/python && make")
  (shell-command "cd ~/zenoss/protocols/python && python setup.py develop")
  (restart-zope)
  (restart-zep))

(defun zen-switch-to-trunk ()
  "Changes the zenoss/Products to trunk and restarts zope"
  (interactive)
  (shell-command "rm ~/zenoss/Products && ln -s ~/dev/trunk/Products/ ~/zenoss/Products")
  (shell-command "rm ~/zenoss/zep && ln -s ~/dev/trunk/zep ~/zenoss/zep")
  (shell-command "rm ~/zenoss/protocols && ln -s ~/dev/trunk/protocols ~/zenoss/protocols")
  (shell-command "cd ~/zenoss/protocols/python && make")
  (shell-command "cd ~/zenoss/protocols/python && python setup.py develop")
  (restart-zope)
  (restart-zep))

(defun zen-reload-tags ()
  "Re-creates the tags file and then reloads it"
  (interactive)
  (progn
    (shell-command (concat "find ~/dev/sandbox/trunk/Products -type f | egrep \"(\.js|\.py)\"  | grep -v '.svn' | grep -v '.pyc' | xargs etags  ~/dev/sandbox/trunk/Products/TAGS " main-sandbox))
    (visit-tags-table (concat main-sandbox "/Products"))))

(defun zen-kill-zenoss ()
  (interactive)
  (shell-command "ps aux | grep 'zen' | grep -v 'grep' | awk '{print $2}' | xargs sudo kill -9"))

(defun zen-model-device (name)
  "Will model the device specified by name. This runs asynchronously. "
  (interactive "sName Of Device: ")
  (shell-command (concat "zenmodeler run -d" name "--now -v 10 &") (concat "*" name "-model-output*")))

(defun svn-browse-change-log()
  "Sends firefox to the log page for the current svn project"
  (interactive)
  (progn
    (let ((current-svn-url (svn-current-project)))
      (browse-url  (replace-regexp-in-string "svn/" "trac/log/" current-svn-url)))))
 (global-set-key "\C-xvf" 'svn-browse-change-log)

(defun svn-project-diff()
  "Shows me the differences in my current sandbox"
  (interactive)
  (progn
    (shell-command
     (concat "svn diff " main-sandbox)
     "*VC-DIFF-PROJECT*")
    (switch-to-buffer "*VC-DIFF-PROJECT*")
    (diff-mode)
    ;; fullscreen it
    (delete-other-windows)))
 (global-set-key "\C-xvo" 'svn-project-diff)

(defun svn-enterprise-diff()
  "Shows me the differences in my current enterprise sandbox"
  (interactive)
  (progn
    (maybe-kill-buffer "*VC-DIFF-PROJECT-ENTERPRISE*")
    (shell-command
     (concat "svn diff " svn-enterprise-sandbox)
     "*VC-DIFF-PROJECT-ENTERPRISE*")
    (switch-to-buffer "*VC-DIFF-PROJECT-ENTERPRISE*")
    (diff-mode)
    ;; fullscreen it
    (delete-other-windows)))
 (global-set-key "\C-xvt" 'svn-enterprise-diff)

(defun svn-current-project ()
  "Messages a string of what the current svn project URL is, also saves it as the most recent kill"
  (interactive)
  (save-excursion
    (progn
      (shell-command (concat "svn info " main-sandbox) "current-project-output")
      (switch-to-buffer "current-project-output")
      ;; go to the svn output, find the string and copy it to the buffer
      (beginning-of-buffer)
      (search-forward "URL: http")
      (backward-word 1)
      (kill-line )
      (kill-buffer "current-project-output")
      ;; message the most recent thing we killed (the url of our svn)
      (car kill-ring-yank-pointer)
      (message (car kill-ring-yank-pointer)))
      ))
(global-set-key "\C-xvp" 'svn-current-project)

(defun svn-merge-sandbox ()
  "Goes and gets the first revision for the current sandbox and sets up the merge command on the shell,
this does not actually execute the command"
  (interactive)
  (svn-current-project)
  (let ((current-svn-url (car kill-ring-yank-pointer)))
    (progn
      ;; assume i will always have less than a 1k lines of commits :P
      (shell-command (concat "svn log " current-svn-url " | head -n 1000") "svn-log-output")
      (switch-to-buffer "svn-log-output")
      (beginning-of-buffer)
      ;; phrase i always use to create a branch
      (search-forward "copying trunk")
      ;; go back two lines to the revision number
      (back-to-indentation)
      (previous-line 2)
      ;; don't need the r in the revision number
      (forward-char 1)
      (copy-word 1)
      (kill-buffer "svn-log-output")
      (eshell)
      (insert "cd ~/dev/trunk")
      (eshell-send-input)
      (delete-other-windows)
      (insert (concat "svn merge -r " (car kill-ring-yank-pointer) ":HEAD " current-svn-url " .")))))

;; zenoss specific mysql (i don't use it for anything else)
(setq sql-mysql-program "/usr/local/mysql/bin/mysql" )

(defun maybe-kill-buffer (buffer-name)
  "Kills the buffer if it exist"
  (if (get-buffer buffer-name)
      (kill-buffer buffer-name)))

;; test this function
(defun get-current-python-package ()
  "Returns a string of the current python package, will be of the form
Products.Zuul etc "
  (interactive)
  (let* ((file-name (buffer-file-name (current-buffer)))
         (pieces (split-string file-name "/"))
         (zenpack  (nth 6 pieces)))
    (if (string-match "ZenPack" zenpack)
        zenpack
      (concat (nth 6 pieces) "." (nth 7 pieces)))))

(defvar last-single-unit-test-command "")

(defun run-this-unit-test ()
  "If the cursor is in a method that is a unit test, it is executed, otherwise the last
single unit test is executed"
  (interactive)
  (save-excursion
    (maybe-kill-buffer "*Async Shell Command*")
    (or (search-backward "def\s")
        (beginning-of-defun ))
    (forward-word 2)
    (let ((function-name (current-word))
          (package (get-current-python-package)))
      ;; use if test appears in method name
      (if (string-match "test" function-name)
          (setq last-single-unit-test-command (concat "runtests -n "
                                                      function-name
                                                      " "
                                                      package
                                                      "&")))

      (message (concat "Running unit test: " last-single-unit-test-command))
      ;; would always sub divide the current window, which I found annoying
      (delete-other-windows)
      (shell-command last-single-unit-test-command))))
;; making this global so we can use it from shell etc
(global-set-key "\C-ct" 'run-this-unit-test)

(defun zen-test-this-module ()
  "Runs the unit tests for the current python module we are sitting
in, doesn't remember previous test"
  (interactive)
  (if (get-buffer "*Async Shell Command*")
        (kill-buffer "*Async Shell Command*"))
  (let ((package (get-current-python-package)))
    (shell-command (concat "runtests " package "&"))))

(defun zenoss-startup-shells ()
  "Sets up the various shells that I usually have running at any given point."
  (interactive)
  (let ((shell-list '( "zope.out" "zep.out" "dsa.out" "zenhub.out")))
    (mapcar
     (lambda (shell-name)
       (if (not (get-buffer shell-name))
             (progn
               (shell)
               (rename-buffer shell-name)))) shell-list)
    ;; get zope up and running
    (switch-to-zope)))

(defun get-guid-in-zendmd (start end)
  "Looks up the guid that is highlighted by switching to the dmd output and eval'ing it there"
  (interactive "r")
  (let ((guid (buffer-substring start end)))
    (progn
      (zendmd-send-string (concat "lookupGuid(\"" guid "\")"))
      (switch-to-zendmd))))

;; queue shortcuts
(defun zenoss-show-queues ()
  "Runs show queues"
  (interactive)
  (let ((queue-command "/Users/joseph/Cellar/rabbitmq/2.1.0/sbin/rabbitmqctl"))
    (shell-command (concat queue-command " list_queues -p /zenoss"))))
(global-set-key "\C-cq" 'zenoss-show-queues)

(defun zenoss-dump-queues ()
  "Runs show queues"
  (interactive)
  (let ((queue-buffer-name "*queue-output*"))
    (if (get-buffer queue-buffer-name)
        (kill-buffer queue-buffer-name))
    (shell-command "zenqdump&" queue-buffer-name)
    (switch-to-buffer-other-window queue-buffer-name)))
(global-set-key "\C-cw" 'zenoss-dump-queues)

;; zenoss status global minor mode