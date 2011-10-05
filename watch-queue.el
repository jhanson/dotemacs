(defvar queue-watch-is-watching-queues 'nil)
(defvar queue-watch-command "sudo rabbitmqctl list_queues -p /zenoss")
(defvar queue-watch-buffer "*WATCH-QUEUES*")
(defvar queue-watch-repeat-interval "2 seconds")

(defun maybe-kill-buffer (buffer-name)
  "Kills the buffer if it exist"
  (if (get-buffer buffer-name)
      (kill-buffer buffer-name)))

(defun show-queue-results ()
  (if queue-watch-is-watching-queues
      (progn
        (shell-command queue-watch-command queue-watch-buffer)
        (run-at-time queue-watch-repeat-interval nil 'show-queue-results)
        )))

(defun watch-queues ()
  "Starts watching the rabbitmq queues as defined by the command queue-watch-command. This will cycle
every interval defined as by queue-watch-repeat-interval. By cycling it actually deletes and recreates the buffer. Thus
reseting your marker position."
  (interactive)
  (if (not queue-watch-is-watching-queues)
      (progn
        (setq queue-watch-is-watching-queues 't)
        (show-queue-results)
        (switch-to-buffer queue-watch-buffer))
    (progn
      (setq queue-watch-is-watching-queues nil)
      (maybe-kill-buffer queue-watch-buffer)
      )))
(global-set-key "\C-cq" 'watch-queues)

(defun zenoss-dump-queues ()
  "Runs show queues"
  (interactive)
  (let ((queue-buffer-name "*queue-output*"))
    (if (get-buffer queue-buffer-name)
        (kill-buffer queue-buffer-name))
    (shell-command "zenqdump&" queue-buffer-name)
    (switch-to-buffer-other-window queue-buffer-name)))
(global-set-key "\C-cw" 'zenoss-dump-queues)
