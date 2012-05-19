;; slime
;; (setq inferior-lisp-program "/opt/local/bin/sbcl")
;; (require 'slime)
;; (slime-setup)

;; clojure
(add-to-list 'load-path "~/emacs/clojure-mode/")
(require 'clojure-mode)

;; swank-clojure works like a champ
(add-to-list 'load-path "~/emacs/clojure-mode/swank-clojure")

(setq swank-clojure-jar-path "/Users/joseph/dev/clojure/clojure-1.2.1/clojure.jar")

(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))
(require 'slime)
(slime-setup)
(setq clojure-project-root-file "/Users/joseph/emacs/clojure-mode/swank-clojure")
