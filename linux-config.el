;; ubuntu (vmware) specific settings
(menu-bar-mode -1)

;; zenoss specific mysql (i don't use it for anything else)
(setq sql-mysql-program "/usr/bin/mysql" )

;; load a nice them if we are running from a GUI
(if window-system 
    (progn
      (load-theme 'wombat)))
