;;; osx-spotify.el --- control spotify from emacs
;;


;; Author:    Joseph Hanson <jrh0090@gmail.com>
;; URL:
;; License:   GPL v2
;; Keywords:  osx, osascript, spotify

;;; Basic controls of spotify from emacs using applescript
;;
;; This requires the osx-osascript
;; TODO: get the current track/album info
;; osascript -e 'tell application "Spotify" to get name of current track'
;; Gospel Train/Orchestra
;; jhanson@joseph-macbook:~/emacs$ osascript -e 'tell application "Spotify" to get artist of current track'
;; Tom Waits
;; jhanson@joseph-macbook:~/emacs$ osascript -e 'tell application "Spotify" to get album of current track'
;; The Black Rider
;; jhanson@joseph-macbook:~/emacs$
;; TODO: ask spotify for the



(require 'osx-osascript)
(require 'cl)


;;; Code:

(defun osx-spotify-do (&rest pgm)
  "Tell iTunes to run the osascript PGM."
  (osascript-run-str-elispify `("
set retval to false
tell application \"Spotify\"
 " ,@pgm "
end tell
elispify(retval)
")))


;;; Simple itunes commands

(defun osx-spotify-playpause ()
  "Tell Spotify to play or pause."
  (interactive)
  (osx-spotify-do "playpause"))

(defun osx-spotify-next-track ()
  "Tell spotify to skip to the next track."
  (interactive)
  (osx-spotify-do "next track"))

(defun osx-spotify-prev-track ()
  "Tell spotify to skip to the previous track."
  (interactive)
  (osx-spotify-do "back track"))


(provide 'osx-spotify)
(global-set-key "\M-sp" 'osx-spotify-playpause)
;;; osx-spotify.el ends here
