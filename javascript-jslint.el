;; Copyright (c)  2011 Joseph Hanson <jrh0090@gmail.com>

;; Author: Joseph Hanson <jrh0090@gmail.com

;; Keywords: languages python
;; Last edit: 2010-02-12
;; Version: 1.01

;; javascript-jslint.el is free software; you can redistribute it and/or modify it
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
;; (autoload 'javascript-jslint "javascript-jslint")
;; (autoload 'jslint "javascript-jslint")
;;
;;; Code:

(defgroup javascript-jslint nil
  "Minor mode for running pylint"
  :prefix "javascript-jslint-"
  :group 'tools)

(defvar javascript-jslint-last-buffer nil
  "The most recent JSLINT buffer.
A JSLINT buffer becomes most recent when you select JSLINT mode in it.
Notice that using \\[next-error] or \\[compile-goto-error] modifies
`complation-last-buffer' rather than `javascript-jslint-last-buffer'.")

;; "^\\([a-zA-Z.0-9_/-]+\\):\\([0-9]+\\):\\([0-9]+\\)"))
(defcustom javascript-jslint-regexp-alist
  (let ((base "^Lint at line \\([0-9]+\\)"))
    base)
  "Regexp used to match JSLINT hits. See `compilation-error-regexp-alist'.")

(defcustom javascript-jslint-options '("" "")
  "Options to pass to pylint.py"
  :type '(repeat string)
  :group 'javascript-jslint)

(defcustom javascript-jslint-command "java org.mozilla.javascript.tools.shell.Main ~/Library/JSLint/jslint.js"
  "JSLINT command."
  :type '(file)
  :group 'javascript-jslint)

(defcustom javascript-jslint-ask-about-save nil
  "Non-nil means \\[javascript-jslint] asks which buffers to save before compiling.
Otherwise, it saves all modified buffers without asking."
  :type 'boolean
  :group 'javascript-jslint)

(define-compilation-mode javascript-jslint-mode "JSLINT"
  (setq javascript-jslint-last-buffer (current-buffer))
  (set (make-local-variable 'compilation-error-regexp-alist)
       javascript-jslint-regexp-alist)
  (set (make-local-variable 'compilation-disable-input) t))

(defvar javascript-jslint-mode-map
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
  "Keymap for JSLINT buffers.
`compilation-minor-mode-map' is a cdr of this.")

;;;###autoload
(defun javascript-jslint ()
  "Run JSLINT, and collect output in a buffer.
While jslint runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<javascript-jslint-mode-map>\\[compile-goto-error] in the grep \
output buffer, to go to the lines where pylint found matches."
  (interactive)

  (save-some-buffers (not javascript-jslint-ask-about-save) nil)
  (let* ((tramp (tramp-tramp-file-p (buffer-file-name)))
         (file (or (and tramp
                        (aref (tramp-dissect-file-name (buffer-file-name)) 3))
                   (buffer-file-name)))
         (command (mapconcat
                   'identity
                   (list javascript-jslint-command
                         (mapconcat 'identity javascript-jslint-options " ")
                         (comint-quote-filename file)) " ")))

    (compilation-start command 'javascript-jslint-mode)))

;;;###autoload
(defalias 'jslint 'javascript-jslint)

(provide 'javascript-jslint)
