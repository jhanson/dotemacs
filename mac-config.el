(setenv "PATH" "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin")
(setq exec-path (append exec-path '("/opt/homebrew/bin")))
;; load up my path from the system (todo figure out why this doesnt do
;; this automatically)
;;(setenv "PATH" "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki:/Users/joseph.hanson/devdeps/play-1.2.x-lsw-1.2.6-121-g1651372")

;; (setenv "JAVA_HOME"
;;         "$(/usr/libexec/java_home -v 1.7)"
;;         )

(setq load-path (append (list "/Applications/Emacs.app/Contents/Resources/site-lisp/elib")
                        load-path))

(setenv "PS1" "\\u:\\w$ ")
;; mac theme
(load "blackboard-theme")

;; mac only font
;;(set-default-font "-apple-Menlo-bold-normal-normal-*-*-*-*-*-m-0-iso10646-1")
;;(set-face-attribute 'default nil :height 120)

;; now delete forward deletes a char
(global-set-key (kbd "<kp-delete>") 'delete-char)

;; end by default goes to the end of the buffer
(global-set-key (kbd "<end>") 'move-end-of-line)
(global-set-key (kbd "<home>") 'back-to-indentation)

(define-key global-map [ns-drag-file] 'ns-find-file)
;; make the default font larger

(set-frame-parameter (selected-frame) 'alpha '(99 95))

(add-to-list 'exec-path (getenv "PATH"))
(setq ns-pop-up-frames nil) ;; keep OSX from opening more windows

;; This sets up the meta to be alt (or command) for emacs
;; It will NOT work in a terminal emacs application
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq ispell-program-name "/opt/homebrew/bin/ispell")
