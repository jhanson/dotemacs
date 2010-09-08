;; will switch to the shell and run the last comand (M-p)

;; While this is called execute last command it actually executes the command in "register r" C-x rir
(fset 'execute-last-command
   [?\C-c ?5 ?\C-x ?r ?i ?r return])

(global-set-key (kbd "\C-x t") 'execute-last-command)

;; proxy property
(fset 'proxyproperty
   [?\C-  ?\C-s ?: ?\' ?\C-m ?\C-w ?\C-s ?\' ?\C-? ?\' ?\C-m backspace ?\C-k ?\C-  ?\C-a ?\M-w ?\C-e ?  ?= ?  ?P ?R ?o backspace backspace ?r ?o ?x ?y ?P ?r ?o ?p ?e ?r ?t ?y ?\( ?\' ?\C-y ?\' ?\) ?\C-n ?\C-a tab])


