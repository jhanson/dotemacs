;; ubuntu (vmware) specific settings
(menu-bar-mode -1)
(setq large-file-warning-threshold nil)
;; zenoss specific mysql 
(setq sql-mysql-program "/usr/bin/mysql" )

(setenv "ZENHOME"
        "/opt/zenoss"
        )

(setenv "PYTHONPATH"
        "/opt/zenoss/lib/python:/home/zenoss/4.2/core/Products"
        )
(setenv "INSTANCE_HOME"
        "/opt/zenoss"
        )
;; zenoss specific mysql (i don't use it for anything else)
(setq sql-mysql-program "/usr/bin/mysql" )
