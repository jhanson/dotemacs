;; ubuntu (vmware) specific settings
(menu-bar-mode -1)
(setq large-file-warning-threshold nil)
;; zenoss specific mysql 
(setq sql-mysql-program "/usr/bin/mysql" )

<<<<<<< HEAD
(setenv "ZENHOME"
        "/opt/zenoss"
        )

(setenv "PYTHONPATH"
        "/opt/zenoss/lib/python:/home/zenoss/4.2/core/Products"
        )
(setenv "INSTANCE_HOME"
        "/opt/zenoss"
        )
=======
;; zenoss specific mysql (i don't use it for anything else)
(setq sql-mysql-program "/usr/bin/mysql" )

;; load a nice them if we are running from a GUI
(if window-system 
    (progn
      (load-theme 'wombat)))
>>>>>>> af8af045435290fa1a6b7e7cc208a2f6a2e66b06
