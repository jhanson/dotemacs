

(add-to-list 'load-path (expand-file-name "~/emacs/jdee-2.4.0.1/lisp/"))
(require 'jde)

;; maven code
(require 'compile)



(defvar mvn-command-history nil
  "Maven command history variable")

(defvar mvn-command-option "jetty:run"
  "Default option for mvn, I am cheating since we always jetty:run it in the bitch")

(defun mvnfast()
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
        (compile (concat "mvn -f " dir "/pom.xml " mvn-command-option  "  -Dmaven.test.skip=true"))))))

(define-key java-mode-map "\C-c\C-x5" 'mvnfast)

(defun mvn(&optional args)
  "Runs maven in the current project. Starting at the directoy where the file being vsisited resides, a search is
   made for pom.xml recsurively. A maven command is made from the first directory where the pom.xml file is found is then displayed
  in the minibuffer. The command can be edited as needed and then executed. Errors are navigate to as in any other compile mode"
  (interactive)
  (let ((fn (buffer-file-name)))
    (let ((dir (file-name-directory fn)))
      (while (and (not (file-exists-p (concat dir "/pom.xml")))
                  (not (equal dir (file-truename (concat dir "/..")))))
        (setq dir (file-truename (concat dir "/.."))))
      (if (not (file-exists-p (concat dir "/pom.xml")))
          (message "No pom.xml found")
        (compile (read-from-minibuffer "Command: "
                                       (concat "mvn -f " dir "/pom.xml " mvn-command-option " -Dmaven.test.skip=true")
                                       nil nil 'mvn-command-history))))))
;; String pattern for locating errors in maven output. This assumes a Windows drive letter at the beginning
(add-to-list
 'compilation-error-regexp-alist
 '("^\([a-zA-Z]:.*\):\[\([0-9]+\),\([0-9]+\)\]" 1 2 3))


;; ;; flymake using eclipse
;; (require 'jde-eclipse-compiler-server)

;; ;; /Users/joseph/dev/eclipse/plugins/org.eclipse.jdt.core.manipulation_1.3.0.v20100520-0800.jar
;;  (add-to-list 'flymake-allowed-file-name-masks '("\\.java$" jde-ecj-flymake-init jde-ecj-flymake-cleanup))

;; customize this to not include imports everything else should work
;; jde-ecj-command-line-args