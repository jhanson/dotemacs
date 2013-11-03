;; load up my path from the system (todo figure out why this doesnt do
;; this automatically)
(setenv "PATH"
        "/Users/joseph/zenoss/bin:/opt/local/bin:/opt/local/sbin:/opt/subversion/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Xcode3.1.4/usr/bin:/usr/local/mysql/bin/:/usr/local/git/bin/:/Library/PostgreSQL/9.1/bin:/Users/joseph/source/go/bin:/Users/joseph/bin"
        )

(setenv "ZENHOME"
        "/Users/joseph/zenoss"
        )

(setenv "PYTHONPATH"
        "/Users/joseph/zenoss/lib/python:/Users/joseph/dev/sandbox/trunk/Products:/Users/joseph/zenoss"
        )
(setenv "INSTANCE_HOME"
        "/Users/joseph/zenoss"
        )
(setenv "JAVA_HOME"
        "/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"
        )

(setenv "PS1" "\\u:\\w$ ")
;; mac only font
(set-default-font "-apple-Menlo-bold-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;; now delete forward deletes a char
(global-set-key (kbd "<kp-delete>") 'delete-char)

;; end by default goes to the end of the buffer
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<home>") 'back-to-indentation)

;; control Itunes with the f6 key
(load-file "~/emacs/osx-osascript.el")
(load-file "~/emacs/itunes.el")

;; growl notifications from emacs
(defvar growl-program "/usr/local/bin/growlnotify")
(defun growl (title message)
  (start-process "growl" " growl"
                 growl-program
                 title
                 "-a" "Emacs")
  (process-send-string " growl" message)
  (process-send-string " growl" "\n")
  (process-send-eof " growl"))

(load-file "~/emacs/pianobar.el")
(setq pianobar-program-command "/opt/local/bin/pianobar")
(setq pianobar-username "jrh0090@gmail.com")


;; set the color theme
(require 'color-theme)
(load-file "~/emacs/color-theme-blackboard.el")
(color-theme-sanityinc-solarized-dark)
;; drag a file to emacs to open it
(define-key global-map [ns-drag-file] 'ns-find-file)

(set-frame-parameter (selected-frame) 'alpha '(99 85))
(add-to-list 'exec-path "/usr/local/mysql/bin")
(add-to-list 'exec-path "/opt/local/sbin")
(add-to-list 'exec-path (getenv "PATH"))
(setq ns-pop-up-frames nil) ;; keep OSX from opening more windows

;; alias the fullscreen command (I never use hide)

(defun ns-small-window ()
  "Make the window smaller"
  (interactive)
  (set-frame-height (selected-frame) 50)
  (set-frame-width (selected-frame) 180))

(defun ns-maximize-window ()
  "Make the window smaller"
  (interactive)
  (set-frame-position (selected-frame) 0 0)
  (set-frame-height (selected-frame) 1000)
  (set-frame-width (selected-frame) 1000))

(define-key global-map [?\s-h] 'ns-maximize-window)


;; zenoss specific mysql (i don't use it for anything else)
(setq sql-mysql-program "/usr/local/mysql/bin/mysql" )

(setq sql-postgres-program "/Library/PostgreSQL/9.1/bin/psql")

;; short cut aliases
(add-hook 'shell-mode-hook '(lambda ()
                              (local-set-key "\M-ss" 'dirs)
                              ))
