;; load up my path from the system (todo figure out why this doesnt do
;; this automatically)
(setenv "PATH" "/usr/local/apache-maven-3.2.5/bin:/Users/jhanson/bin/Sencha/Cmd/5.0.3.324:/Users/joseph/zenoss/bin:/opt/local/bin:/opt/local/sbin:/opt/subversion/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/Xcode3.1.4/usr/bin:/usr/local/mysql/bin/:/usr/local/git/bin/:/Library/PostgreSQL/9.1/bin:/Users/joseph/source/go/bin:/Users/joseph/bin:/usr/local/bin:/usr/local/mysql/bin")


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

(setq load-path (append (list "/Applications/Emacs.app/Contents/Resources/site-lisp/elib")
                        load-path))

(setenv "PS1" "\\u:\\w$ ")
;; mac theme
(load-theme 'wombat)
;; mac only font
(set-default-font "-apple-Menlo-bold-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;; now delete forward deletes a char
(global-set-key (kbd "<kp-delete>") 'delete-char)

;; end by default goes to the end of the buffer
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<home>") 'back-to-indentation)

(load-file "~/emacs/pianobar.el")
(setq pianobar-program-command "/opt/local/bin/pianobar")
(setq pianobar-username "jrh0090@gmail.com")


(define-key global-map [ns-drag-file] 'ns-find-file)

(set-frame-parameter (selected-frame) 'alpha '(99 85))

(add-to-list 'exec-path (getenv "PATH"))
(setq ns-pop-up-frames nil) ;; keep OSX from opening more windows
