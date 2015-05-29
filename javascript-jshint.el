;;; javascript-jshint.el --- minor mode for running `jshint'

;; Copyright (c) 2009, 2010 Ian Eure <ian.eure@gmail.com>

;; Author: Ian Eure <ian.eure@gmail.com>

;; Keywords: languages javascript
;; Last edit: 2010-02-12
;; Version: 1.01

;; javascript-pylint.el is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by the Free
;; Software Foundation; either version 2, or (at your option) any later
;; version.
;;
;; It is distributed in the hope that it will be useful, but WITHOUT ANY
;; WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
;; FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
;; details.
;;
;; You should have received a copy of the GNU General Public License along
;; with your copy of Emacs; see the file COPYING. If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Commentary:
;;
;; (autoload 'javascript-jshint "javascript-jshint")
;; (autoload 'jshint "javascript-jshint")
;;
;;; Code:

(defgroup javascript-jshint nil
  "Minor mode for running jshint"
  :prefix "javascript-jshint-"
  :group 'tools)

(defvar javascript-jshint-last-buffer nil
  "The most recent JSHINT buffer.
A JSHINT buffer becomes most recent when you select JSHINT mode in it.
Notice that using \\[next-error] or \\[compile-goto-error] modifies
`complation-last-buffer' rather than `javascript-jshint-last-buffer'.")

(defconst javascript-jshint-regexp-alist
  (let ((base "^\\(.*\\):\\([0-9]+\\):\s+\\(\\[%s.*\\)$"))
    (list
     (list (format base "[FE]") 1 2)
     (list (format base "[RWC]") 1 2 nil 1)))
  "Regexp used to match JSHINT hits. See `compilation-error-regexp-alist'.")

(defcustom javascript-jshint-options '("")
  "Options to pass to jshint"
  :type '(repeat string)
  :group 'javascript-jshint)

(defcustom javascript-jshint-command "jshint"
  "JSHINT command."
  :type '(file)
  :group 'javascript-jshint)

(defcustom javascript-jshint-ask-about-save nil
  "Non-nil means \\[javascript-jshint] asks which buffers to save before compiling.
Otherwise, it saves all modified buffers without asking."
  :type 'boolean
  :group 'javascript-jshint)

(define-compilation-mode javascript-jshint-mode "JSHINT"
  (setq javascript-jshint-last-buffer (current-buffer))
  (set (make-local-variable 'compilation-error-regexp-alist)
       javascript-jshint-regexp-alist)
  (set (make-local-variable 'compilation-disable-input) t))

(defvar javascript-jshint-mode-map
  (let ((map (make-sparse-keymap)))
    (set-keymap-parent map compilation-minor-mode-map)
    (define-key map " " 'scroll-up)
    (define-key map "\^?" 'scroll-down)
    (define-key map "\C-c\C-f" 'next-error-follow-minor-mode)

    (define-key map "\r" 'compile-goto-error) ;; ?
    (define-key map "n" 'next-error-no-select)
    (define-key map "p" 'previous-error-no-select)
    (define-key map "{" 'compilation-previous-file)
    (define-key map "}" 'compilation-next-file)
    (define-key map "\t" 'compilation-next-error)
    (define-key map [backtab] 'compilation-previous-error)
    map)
  "Keymap for JSHINT buffers.
`compilation-minor-mode-map' is a cdr of this.")

;;;###autoload
(defun javascript-jshint ()
  "Run JSHINT, and collect output in a buffer.
While jshint runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<javascript-jshint-mode-map>\\[compile-goto-error] in the grep \
output buffer, to go to the lines where jshint found matches."
  (interactive)

  (save-some-buffers (not javascript-jshint-ask-about-save) nil)
  (let* ((tramp (tramp-tramp-file-p (buffer-file-name)))
         (file (or (and tramp
                        (aref (tramp-dissect-file-name (buffer-file-name)) 3))
                   (buffer-file-name)))
         (command (mapconcat
                   'identity
                   (list javascript-jshint-command
                         (mapconcat 'identity javascript-jshint-options " ")
                         (comint-quote-filename file)) " ")))

    (compilation-start command 'javascript-jshint-mode)))

;;;###autoload
(defalias 'jshint 'javascript-jshint)

(provide 'javascript-jshint)
