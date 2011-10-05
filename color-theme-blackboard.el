(defun color-theme-blackboard ()
  "Color theme by JD Huntington, based off the TextMate Blackboard theme, created 2008-11-27"
  (interactive)
  (color-theme-install
   '(color-theme-blackboard
     ((background-color . "#0C1021")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#A7A7A7")
      (foreground-color . "#F8F8F8")
      (mouse-color . "sienna1"))
     (default ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))
     (font-lock-builtin-face ((t (:foreground "#F8F8F8"))))
     (font-lock-comment-face ((t (:bold t :italic t :foreground "#0088FF"))))
     (font-lock-constant-face ((t (:foreground "#D8FA3C"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-function-name-face ((t (:foreground "#FF6400"))))
     (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-reference-face ((t (:foreground "SlateBlue"))))

     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))

     (font-lock-string-face ((t (:foreground "#61CE3C"))))
     (font-lock-type-face ((t (:foreground "#8DA6CE"))))
     (font-lock-variable-name-face ((t (:foreground "#FF6400"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))
     (gui-element ((t (:background "#D4D0C8" :foreground "black"))))
     (region ((t (:background "#253B76"))))
     (mode-line ((t (:background "grey75" :foreground "black"))))
     (highlight ((t (:background "#222222"))))
     (highline-face ((t (:background "SeaGreen"))))
     ;; diff mode
     (diff-added ((t (:foreground "#73d216"))))
     (diff-changed ((t (:foreground "#fcaf3e"))))
     (diff-removed ((t (:foreground "#ef2929"))))
     (diff-hunk-header ((t (:bold t))))
     (diff-function ((t (:foreground "#fcaf3e"))))
     (diff-header ((t (:background "#2e3436"))))
     (diff-file-header ((t (:foreground "#eeeeec"))))

     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (zmacs-region ((t (:background "snow" :foreground "ble")))))))

(defun color-theme-tango ()
  "A color theme based on Tango Palette."
  (interactive)
  (color-theme-install
   '(color-theme-tango
     ((background-color . "#2e3436")
      (background-mode . dark)
      (border-color . "#888a85")
      (cursor-color . "#fce94f")
      (foreground-color . "#eeeeec")
      (mouse-color . "#8ae234"))
     ((help-highlight-face . underline)
      (ibuffer-dired-buffer-face . font-lock-function-name-face)
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face . font-lock-type-face)
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face))
     (border ((t (:background "#888a85"))))
     (fringe ((t (:background "grey10"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#555753"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     (font-lock-comment-face ((t (:foreground "aquamarine"))))
     (font-lock-constant-face ((t (:foreground "#8ae234"))))
     (font-lock-doc-face ((t (:foreground "#888a85"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf" :bold t))))
     (font-lock-string-face ((t (:foreground "#ad7fa8" :italic t))))

     (font-lock-type-face ((t (:foreground "#8ae234" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
     (font-lock-warning-face ((t (:bold t :foreground "#f57900"))))
     (font-lock-function-name-face ((t (:foreground "#edd400" :bold t :italic t))))
     (comint-highlight-input ((t (:italic t :bold t))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
     (show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
     (show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))
     )))

;;;###autoload
(defun color-theme-cobalt ()
  "Color theme by Nick Ewing, based off the TextMate Cobalt theme, created 2010-04-16"
  (interactive)
  (color-theme-install
   '(color-theme-cobalt
     ((background-color . "#09223F")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#A7A7A7")
      (foreground-color . "#F8F8F8"))
     (default ((t (:background "#09223F" :foreground "white"))))
     (buffers-tab ((t (:background "#09223F" :foreground "white"))))
     (font-lock-builtin-face ((t (:foreground "#40FFB9"))))
     (font-lock-comment-face ((t (:foreground "#008AFF"))))
     (font-lock-constant-face ((t (:foreground "#FF518C"))))
     (font-lock-doc-face ((t (:foreground "#008AFF"))))
     (font-lock-function-name-face ((t (:foreground "#FFDD00"))))
     (font-lock-keyword-face ((t (:foreground "#FA9E18"))))
     (font-lock-preprocessor-face ((t (:foreground "#8090A2"))))
     (font-lock-reference-face ((t (:foreground "#CCCCCC"))))
     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
     (font-lock-string-face ((t (:foreground "#42D915"))))
     (font-lock-type-face ((t (:foreground "#FFEF79"))))
     (font-lock-variable-name-face ((t (:foreground "#CCCCCC"))))
     (font-lock-warning-face ((t (:foreground "Pink"))))
     (hl-line ((t (:background "#00162A"))))
     (linum ((t (:background "#111111" :foreground "#888888"
                 :underline nil))))
     (gui-element ((t (:background "#303030" :foreground "black"))))
     (region ((t (:background "#444444"))))
     (highlight ((t (:background "#26425D"))))
     (show-paren-match ((t (:background "#26425D"))))
     (show-paren-mismatch ((t (:background "#FF0000"))))
     (ecb-default-highlight-face ((t (:background "#26425D"))))
     (minibuffer-prompt ((t (:foreground "#008AFF"))))
     (modeline ((t (:background "#111111" :foreground "#888888"))))
     (modeline-inactive ((t (:background "#222222" :foreground "#888888"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (toolbar ((t (nil))))
     (ido-subdir ((t (:foreground "#008AFF"))))
     (ido-only-match ((t (:foreground "#42D915"))))
     (mumamo-background-chunk-major ((t (:background nil))))
     (mumamo-background-chunk-submode1 ((t (:background nil))))
     (underline ((nil (:underline nil)))))))

(defun color-theme-tm ()
  "Color theme by dngpng, created 2007-09-11."
  (interactive)
  (color-theme-install
   '(color-theme-tm
     ((background-color . "#111")
      (background-mode . dark)
      (border-color . "#111")
      (cursor-color . "yellow")
      (foreground-color . "#ddd")
      (mouse-color . "sienna1"))
     (default ((t (:background "#111" :foreground "#ddd"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t :slant italic))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#111" :foreground "#ddd"))))
     (font-lock-builtin-face ((t (:foreground "#dd7b3b"))))
     (font-lock-comment-face ((t (:foreground "#666" ))))
     (font-lock-constant-face ((t (:foreground "#99cf50"))))
     (font-lock-doc-string-face ((t (:foreground "#9b859d"))))
     (font-lock-function-name-face ((t (:foreground "#e9c062" :bold t))))
     (font-lock-keyword-face ((t (:foreground "#cf6a4c" :bold t))))
     (font-lock-preprocessor-face ((t (:foreground "#aeaeae"))))
     (font-lock-reference-face ((t (:foreground "8b98ab"))))
     (font-lock-string-face ((t (:foreground "#65b042"))))
     (font-lock-type-face ((t (:foreground "#c5af75"))))
     (font-lock-variable-name-face ((t (:foreground "#3387cc"))))
     (font-lock-warning-face ((t (:bold t :background "#420e09" :foreground "#eeeeee"))))
     (erc-current-nick-face ((t (:foreground "#aeaeae"))))
     (erc-default-face ((t (:foreground "#ddd"))))
     (erc-keyword-face ((t (:foreground "#cf6a4c"))))
     (erc-notice-face ((t (:foreground "#666"))))
     (erc-timestamp-face ((t (:foreground "#65b042"))))
     (erc-underline-face ((t (:foreground "c5af75"))))
     (nxml-attribute-local-name-face ((t (:foreground "#3387cc"))))
     (nxml-attribute-colon-face ((t (:foreground "#e28964"))))
     (nxml-attribute-prefix-face ((t (:foreground "#cf6a4c"))))
     (nxml-attribute-value-face ((t (:foreground "#65b042"))))
     (nxml-attribute-value-delimiter-face ((t (:foreground "#99cf50"))))
     (nxml-namespace-attribute-prefix-face ((t (:foreground "#9b859d"))))
     (nxml-comment-content-face ((t (:foreground "#666"))))
     (nxml-comment-delimiter-face ((t (:foreground "#333"))))
     (nxml-element-local-name-face ((t (:foreground "#e9c062"))))
     (nxml-markup-declaration-delimiter-face ((t (:foreground "#aeaeae"))))
     (nxml-namespace-attribute-xmlns-face ((t (:foreground "#8b98ab"))))
     (nxml-prolog-keyword-face ((t (:foreground "#c5af75"))))
     (nxml-prolog-literal-content-face ((t (:foreground "#dad085"))))
     (nxml-tag-delimiter-face ((t (:foreground "#cda869"))))
     (nxml-tag-slash-face ((t (:foreground "#cda869"))))
     (nxml-text-face ((t (:foreground "#ddd"))))
     (gui-element ((t (:background "#0e2231" :foreground "black"))))
     (highlight ((t (:bold t :slant italic))))
     (highline-face ((t (:background "#4a410d"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (mmm-default-submode-face ((t (:background "#111"))))
     (mode-line ((t (:background "#e6e5e4" :foreground "black"))))
     (primary-selection ((t (:background "#222"))))
     (region ((t (:background "#4a410d"))))
     (text-cursor ((t (:background "yellow" :foreground "black"))))
     (underline ((nil (:underline nil)))))))


(defun color-theme-tangotango ()
  "A color theme based on Tango Palette colors."
  ;; Color codes :
  ;; - blue : "dodger blue"
  ;; - yellow : "#edd400"
  ;; - green : "#6ac214"
  ;; - orange/red : "tomato"
  (interactive)
  (color-theme-install
   '(color-theme-tangotango
     ((background-color . "#2e3434")
      (background-mode . dark)
      (border-color . "#888a85")
      (cursor-color . "#fce94f")
      (foreground-color . "#eeeeec")
      (mouse-color . "#8ae234"))
     ((help-highlight-face . underline)
      (ibuffer-dired-buffer-face . font-lock-function-name-face)
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face . font-lock-type-face)
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face))
     (highlight ((t (:background "brown4" :foreground nil))))
     (border ((t (:background "#888a85"))))
     (fringe ((t (:background "grey10"))))
     (mode-line ((t (:foreground "#bbbbbc" :background "#222222" :box (:line-width 1 :color nil :style released-button)))))
     (mode-line-inactive ((t (:foreground "#bbbbbc" :background "#555753"))))
     (mode-line-buffer-id ((t (:bold t :foreground "orange" :background nil))))
     (region ((t (:background "dark slate blue"))))
     (link ((t (:underline t :foreground "dodger blue"))))
     (custom-link ((t (:inherit 'link))))
     (match ((t (:bold t :background "#e9b96e" :foreground "#2e3436"))))
     (tool-tips ((t (:inherit 'variable-pitch :foreground "black" :background "lightyellow"))))
     (tooltip ((t (:inherit 'variable-pitch :foreground "black" :background "lightyellow"))))
     (bold ((t (:bold t :underline nil :background nil))))
     (italic ((t (:italic t :underline nil :background nil))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     ;;(font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-comment-face ((t (:foreground "aquamarine"))))
     (font-lock-constant-face ((t (:foreground "#8ae234"))))
     (font-lock-doc-face ((t (:foreground "#888a85"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf" :bold t))))
     (font-lock-string-face ((t (:foreground "#ad7fa8" :italic t))))
     (font-lock-type-face ((t (:foreground "#8ae234" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "tomato"))))
     (font-lock-warning-face ((t (:bold t :foreground "#f57900"))))
     (font-lock-function-name-face ((t (:foreground "#edd400" :bold t))))
     (comint-highlight-input ((t (:italic t :bold t))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
     (show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
     (show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))
     (diary-face ((t (:bold t :foreground "IndianRed"))))
     (eshell-ls-clutter-face ((t (:bold t :foreground "DimGray"))))
     (eshell-ls-executable-face ((t (:bold t :foreground "Coral"))))
     (eshell-ls-missing-face ((t (:bold t :foreground "black"))))
     (eshell-ls-special-face ((t (:bold t :foreground "Gold"))))
     (eshell-ls-symlink-face ((t (:bold t :foreground "White"))))
     (widget-button ((t (:bold t))))
     (widget-mouse-face ((t (:bold t :foreground "white" :background "brown4"))))
     (widget-field ((t (:foreground "orange" :background "gray30"))))
     (widget-single-line-field ((t (:foreground "orange" :background "gray30"))))
     (custom-group-tag ((t (:bold t :foreground "#edd400" :height 1.3))))
     (custom-variable-tag ((t (:bold t :foreground "#edd400" :height 1.1))))
     (custom-face-tag ((t (:bold t :foreground "#edd400" :height 1.1))))
     (custom-state-face ((t (:foreground "#729fcf"))))
     (custom-button ((t (:box (:line-width 1 :style released-button) :background "grey50" :foreground "black"))))
     (custom-variable-button ((t (:inherit 'custom-button))))
     (custom-button-mouse ((t (:inherit 'custom-button :background "grey60"))))
     (custom-button-unraised ((t (:background "grey50" :foreground "black"))))
     (custom-button-mouse-unraised ((t (:inherit 'custom-button-unraised :background "grey60"))))
     (custom-button-pressed ((t (:inherit 'custom-button :box (:style pressed-button)))))
     (custom-button-mouse-pressed-unraised ((t (:inherit 'custom-button-unraised :background "grey60"))))
     (custom-documentation ((t (:italic t))))
     (message-cited-text ((t (:foreground "#edd400"))))
     (gnus-cite-face-1 ((t (:foreground "#ad7fa8"))))
     (gnus-cite-face-2 ((t (:foreground "sienna4"))))
     (gnus-cite-face-3 ((t (:foreground "khaki4"))))
     (gnus-cite-face-4 ((t (:foreground "PaleTurquoise4"))))
     (gnus-group-mail-1-empty-face ((t (:foreground "light cyan"))))
     (gnus-group-mail-1-face ((t (:bold t :foreground "light cyan"))))
     (gnus-group-mail-2-empty-face ((t (:foreground "turquoise"))))
     (gnus-group-mail-2-face ((t (:bold t :foreground "turquoise"))))
     (gnus-group-mail-3-empty-face ((t (:foreground "#729fcf"))))
     (gnus-group-mail-3-face ((t (:bold t :foreground "#edd400"))))
     (gnus-group-mail-low-empty-face ((t (:foreground "dodger blue"))))
     (gnus-group-mail-low-face ((t (:bold t :foreground "dodger blue"))))
     (gnus-group-news-1-empty-face ((t (:foreground "light cyan"))))
     (gnus-group-news-1-face ((t (:bold t :foreground "light cyan"))))
     (gnus-group-news-2-empty-face ((t (:foreground "turquoise"))))
     (gnus-group-news-2-face ((t (:bold t :foreground "turquoise"))))
     (gnus-group-news-3-empty-face ((t (:foreground "#729fcf"))))
     (gnus-group-news-3-face ((t (:bold t :foreground "#edd400"))))
     (gnus-group-news-low-empty-face ((t (:foreground "dodger blue"))))
     (gnus-group-news-low-face ((t (:bold t :foreground "dodger blue"))))
     (gnus-header-name-face ((t (:bold t :foreground "#729fcf"))))
     (gnus-header-from ((t (:bold t :foreground "#edd400"))))
     (gnus-header-subject ((t (:foreground "#edd400"))))
     (gnus-header-content ((t (:italic t :foreground "#8ae234"))))
     (gnus-header-newsgroups-face ((t (:italic t :bold t :foreground "LightSkyBlue3"))))
     (gnus-signature-face ((t (:italic t :foreground "dark grey"))))
     (gnus-summary-cancelled-face ((t (:background "black" :foreground "yellow"))))
     (gnus-summary-high-ancient-face ((t (:bold t :foreground "rotal blue"))))
     (gnus-summary-high-read-face ((t (:bold t :foreground "lime green"))))
     (gnus-summary-high-ticked-face ((t (:bold t :foreground "tomato"))))
     (gnus-summary-high-unread-face ((t (:bold t :foreground "white"))))
     (gnus-summary-low-ancient-face ((t (:italic t :foreground "lime green"))))
     (gnus-summary-low-read-face ((t (:italic t :foreground "royal blue"))))
     (gnus-summary-low-ticked-face ((t (:italic t :foreground "dark red"))))
     (gnus-summary-low-unread-face ((t (:italic t :foreground "white"))))
     (gnus-summary-normal-ancient-face ((t (:foreground "royal blue"))))
     (gnus-summary-normal-read-face ((t (:foreground "lime green"))))
     (gnus-summary-normal-ticked-face ((t (:foreground "indian red"))))
     (gnus-summary-normal-unread-face ((t (:foreground "white"))))
     (gnus-summary-selected ((t (:background "brown4" :foreground "white"))))
     (message-header-name-face ((t (:foreground "tomato"))))
     (message-header-newsgroups-face ((t (:italic t :bold t :foreground "LightSkyBlue3"))))
     (message-header-other-face ((t (:foreground "LightSkyBlue3"))))
     (message-header-xheader-face ((t (:foreground "DodgerBlue3"))))
     (message-header-subject ((t (:foreground "white"))))
     (message-header-to ((t (:foreground "white"))))
     (message-header-cc ((t (:foreground "white"))))
     (org-hide ((t (:foreground "#2e3436"))))
     (org-level-1 ((t (:bold t :foreground "dodger blue" :height 1.5))))
     (org-level-2 ((t (:bold nil :foreground "#edd400" :height 1.2))))
     (org-level-3 ((t (:bold t :foreground "#6ac214" :height 1.0))))
     (org-level-4 ((t (:bold nil :foreground "tomato" :height 1.0))))
     (org-date ((t (:underline t :foreground "magenta3"))))
     (org-footnote ((t (:underline t :foreground "magenta3"))))
     (org-link ((t (:foreground "skyblue2" :background "#2e3436"))))
     (org-special-keyword ((t (:foreground "brown"))))
     (org-verbatim ((t (:foreground "#eeeeec" :underline t :slant italic))))
     (org-block ((t (:foreground "#bbbbbc"))))
     (org-quote ((t (:inherit org-block :slant italic))))
     (org-verse ((t (:inherit org-block :slant italic))))
     (org-todo ((t (:bold t :foreground "Red"))))
     (org-done ((t (:bold t :foreground "ForestGreen"))))
     (org-agenda-structure ((t (:weight bold :foreground "tomato"))))
     (org-agenda-date ((t (:foreground "#6ac214"))))
     (org-agenda-date-weekend ((t (:weight normal :foreground "dodger blue"))))
     (org-agenda-date-today ((t (:weight bold :foreground "#edd400"))))
     (anything-header ((t (:bold t :background "grey15" :foreground "#edd400"))))
     (ess-jb-comment-face ((t (:background "#2e3436" :foreground "firebrick" :slant italic))))
     (ess-jb-hide-face ((t (:background "#2e3436" :foreground "#243436"))))
     (ess-jb-h1-face ((t (:height 1.6 :foreground "dodger blue" :slant normal))))
     (ess-jb-h2-face ((t (:height 1.4 :foreground "#6ac214" :slant normal))))
     (ess-jb-h3-face ((t (:height 1.2 :foreground "#edd400" :slant normal))))
     (ecb-default-highlight-face ((t (:background "#729fcf"))))
     (ecb-tag-header-face ((t (:background "#f57900"))))
)))

(provide 'color-theme-tangotango)

;;;###autoload
(defun color-theme-sanityinc-solarized (mode)
  (interactive "Sdark or light")
  ;; These are the Generic RGB equivalents of the "official" sRGB hex values
  (let* ((base03  "#042028")            ; (0.0159 0.1265 0.1597)
         (base02  "#0a2832")            ; (0.0394 0.1601 0.1983)
         (base01  "#465a61")            ; (0.2767 0.3567 0.3830)
         (base00  "#52676f")            ; (0.3244 0.4072 0.4385)
         (base0   "#708183")            ; (0.4406 0.5096 0.5169)
         (base1   "#81908f")            ; (0.5060 0.5649 0.5636)
         (base2   "#e9e2cb")            ; (0.9161 0.8900 0.7978)
         (base3   "#fcf4dc")            ; (0.9894 0.9579 0.8641)
         (yellow  "#a57705")            ; (0.6475 0.4675 0.0235)
         (orange  "#bd3612")            ; (0.7418 0.2133 0.0735)
         (red     "#c60007")            ; (0.7770 0.0000 0.0290)
         (magenta "#c61b6e")            ; (0.7774 0.1080 0.4352)
         (violet  "#5859b7")            ; (0.3479 0.3514 0.7179)
         (blue    "#2075c7")            ; (0.1275 0.4627 0.7823)
         (cyan    "#259185")            ; (0.1468 0.5708 0.5250)
         (green   "#728a05")            ; (0.4498 0.5412 0.0202)
         (foregrounds (list base1 base0 base00 base01))
         (backgrounds (list base03 base02))
         (contrast-backgrounds (list base3 base2)))
    (when (eq 'light mode)
      (rotatef backgrounds contrast-backgrounds)
      (setq foregrounds (reverse foregrounds)))
    (let ((background (first backgrounds))
          (alt-background (second backgrounds))
          (strong (first foregrounds))
          (normal (second foregrounds))
          (faint (third foregrounds))
          (faintest (fourth foregrounds))
          (contrast-background (second contrast-backgrounds)))
      (color-theme-install
       `(,(intern (concat "color-theme-sanityinc-solarized-" (symbol-name'light)))
         ((background-color . ,background)
          (background-mode . light)
          (border-color . ,normal)
          (cursor-color . ,magenta)
          (foreground-color . ,normal)
          (mouse-color . ,cyan))

         ;; Standard font lock faces
         (default ((t (nil))))
         (bold ((t (:bold t))))
         (bold-italic ((t (:italic t :bold t))))
         (underline ((t (:underline t))))
         (italic ((t (:italic t))))
         (font-lock-builtin-face ((t (:foreground ,violet))))
         (font-lock-comment-delimiter-face ((t (:foreground ,faintest :slant italic))))
         (font-lock-comment-face ((t (:foreground ,faint :slant italic))))
         (font-lock-constant-face ((t (:foreground ,violet))))
         (font-lock-doc-face ((t (:foreground ,magenta))))
         (font-lock-doc-string-face ((t (:foreground ,yellow))))
         (font-lock-function-name-face ((t (:foreground ,blue))))
         (font-lock-keyword-face ((t (:foreground ,green :bold t))))
         (font-lock-negation-char-face ((t (:foreground ,green))))
         (font-lock-preprocessor-face ((t (:foreground ,magenta))))
         (font-lock-regexp-grouping-backslash ((t (:foreground ,magenta))))
         (font-lock-regexp-grouping-construct ((t (:foreground ,violet))))
         (font-lock-string-face ((t (:foreground ,cyan))))
         (font-lock-type-face ((t (:foreground ,yellow))))
         (font-lock-variable-name-face ((t (:foreground ,yellow))))
         (font-lock-warning-face ((t (:bold t :foreground ,red))))
         (shadow ((t (:foreground ,(fourth foregrounds)))))

         ;; Flymake
         (flymake-warnline ((t (:underline ,orange :background ,background))))
         (flymake-errline ((t (:underline ,red :background ,background))))

         ;; Clojure errors
         (clojure-test-failure-face ((t (:background nil :inherit flymake-warnline))))
         (clojure-test-error-face ((t (:background nil :inherit flymake-errline))))
         (clojure-test-success-face ((t (:background nil :foreground nil :underline ,green))))

         ;; MMM-mode
         (mmm-code-submode-face ((t (:background ,alt-background))))
         (mmm-comment-submode-face ((t (:inherit font-lock-comment-face))))
         (mmm-output-submode-face ((t (:background ,alt-background))))

         ;; Search
         (match ((t (:foreground ,blue :background nil :inverse-video t))))
         (isearch ((t (:foreground ,yellow :background nil :inverse-video t))))
         (isearch-lazy-highlight-face ((t (:foreground ,cyan :inverse-video t))))
         (isearch-fail ((t (:background nil :inherit font-lock-warning-face :inverse-video t))))

         ;; IDO
         (ido-subdir ((t (:foreground ,magenta))))
         (ido-first-match ((t (:foreground ,yellow))))
         (ido-only-match ((t (:foreground ,green))))

         ;; Emacs interface
         (fringe ((t (:background ,alt-background))))
         (border ((t (:background ,alt-background))))
         (border-glyph ((t (nil))))
         (highlight ((t (:inverse-video nil :background ,alt-background))))
         (gui-element ((t (:background ,alt-background :foreground ,normal))))
         (mode-line ((t (:foreground nil :background ,alt-background :bold t
                                     :box (:line-width 1 :color ,normal)))))
         (mode-line-buffer-id ((t (:foreground ,magenta :background nil))))
         (mode-line-inactive ((t (:inherit mode-line
                                           :foreground ,faintest
                                           :background ,alt-background :weight normal
                                           :box (:line-width 1 :color ,normal)))))
         (mode-line-emphasis ((t (:foreground ,strong))))
         (mode-line-highlight ((t (:foreground ,magenta :box nil :weight bold))))
         (minibuffer-prompt ((t (:foreground ,blue))))
         (region ((t (:background ,contrast-background))))
         (secondary-selection ((t (:background ,alt-background))))

         (header-line ((t (:background nil :foreground ,strong :inherit nil))))
         (trailing-whitespace ((t (:inherit font-lock-warning-face :foreground nil :background nil :inverse-video t))))

         ;; Parenthesis matching
         (show-paren-match ((t (:background nil :foreground nil :inverse-video t))))
         (show-paren-mismatch ((t (:background ,magenta :foreground ,background))))

         (slime-highlight-edits-face ((t (:foreground ,strong))))

         (diff-added ((t (:foreground ,green))))
         (diff-changed ((t (:foreground ,violet))))
         (diff-removed ((t (:foreground ,orange))))
         (diff-header ((t (:foreground ,cyan :background nil))))
         (diff-file-header ((t (:foreground ,blue :background nil))))
         (diff-hunk-header ((t (:foreground ,magenta))))

         ;; Magit (a patch is pending in magit to make these standard upstream)
         (magit-item-highlight ((t (:inherit highlight :background nil))))
         (magit-diff-add ((t (:inherit diff-added :foreground nil))))
         (magit-diff-changed ((t (:inherit diff-changed :foreground nil))))
         (magit-diff-del ((t (:inherit diff-removed :foreground nil))))

         (link ((t (:foreground nil :underline t))))
         (widget-button ((t (:underline t))))

         ;; Stop outline-3 from inheriting font-lock-keyword-face, which we've made bold
         (outline-3 ((t (:inherit nil :foreground ,green))))

         (org-link ((t (:foreground ,blue :underline t))))
         (org-date ((t (:foreground ,blue :underline t))))
         (org-done ((t (:foreground ,green))))
         (org-todo ((t (:foreground ,red))))
         (org-special-keyword ((t (:foreground ,orange))))

         (org-document-title ((t (:foreground ,cyan))))
         (org-column ((t (:background ,alt-background))))
         (org-warning ((t (:bold t :foreground ,red))))

         (org-scheduled-previously ((t (:foreground ,orange))))

         (hl-sexp-face ((t (:background ,alt-background))))
         (highlight-80+ ((t (:background ,alt-background))))

         ;; Python-specific overrides
         (py-builtins-face ((t (:foreground ,orange :weight normal))))

         ;; Gnus
         (gnus-cite-1 ((t (:inherit outline-1 :foreground nil))))
         (gnus-cite-2 ((t (:inherit outline-2 :foreground nil))))
         (gnus-cite-3 ((t (:inherit outline-3 :foreground nil))))
         (gnus-cite-4 ((t (:inherit outline-4 :foreground nil))))
         (gnus-cite-5 ((t (:inherit outline-5 :foreground nil))))
         (gnus-cite-6 ((t (:inherit outline-6 :foreground nil))))
         (gnus-cite-7 ((t (:inherit outline-7 :foreground nil))))
         (gnus-cite-8 ((t (:inherit outline-8 :foreground nil))))
         ;; there are several more -cite- faces...
         (gnus-header-content ((t (:inherit header-line :foreground nil :background nil :bold nil))))
         (gnus-header-subject ((t (:inherit gnus-header-content :bold t :foreground ,yellow))))
         (gnus-header-from ((t (:inherit gnus-header-content :bold t :foreground ,orange))))
         (gnus-header-name ((t (:inherit header-line :foreground ,green :background nil))))
         (gnus-button ((t (:inherit link :foreground nil))))
         (gnus-signature ((t (:inherit font-lock-comment-face))))

         (gnus-summary-normal-unread ((t (:foreground ,strong :weight normal))))
         (gnus-summary-normal-read ((t (:foreground ,normal :weight normal))))
         (gnus-summary-low-unread ((t (:foreground ,faint :weight normal))))
         (gnus-summary-low-read ((t (:foreground ,faintest :weight normal))))
         (gnus-summary-high-unread ((t (:foreground ,yellow :weight normal))))
         (gnus-summary-high-read ((t (:foreground ,green :weight normal))))
         (gnus-summary-high-ancient ((t (:foreground ,green :weight normal))))

         (gnus-group-mail-low ((t (:foreground ,faintest))))
         (gnus-group-mail-low-empty ((t (:foreground ,faintest))))
         (gnus-group-mail-1 ((t (:foreground nil :weight normal :inherit outline-1))))
         (gnus-group-mail-2 ((t (:foreground nil :weight normal :inherit outline-2))))
         (gnus-group-mail-3 ((t (:foreground nil :weight normal :inherit outline-3))))
         (gnus-group-mail-4 ((t (:foreground nil :weight normal :inherit outline-4))))
         (gnus-group-mail-5 ((t (:foreground nil :weight normal :inherit outline-5))))
         (gnus-group-mail-6 ((t (:foreground nil :weight normal :inherit outline-6))))
         (gnus-group-mail-1-empty ((t (:inherit gnus-group-mail-1 :foreground ,faint))))
         (gnus-group-mail-2-empty ((t (:inherit gnus-group-mail-2 :foreground ,faint))))
         (gnus-group-mail-3-empty ((t (:inherit gnus-group-mail-3 :foreground ,faint))))
         (gnus-group-mail-4-empty ((t (:inherit gnus-group-mail-4 :foreground ,faint))))
         (gnus-group-mail-5-empty ((t (:inherit gnus-group-mail-5 :foreground ,faint))))
         (gnus-group-mail-6-empty ((t (:inherit gnus-group-mail-6 :foreground ,faint))))
         )))))

;;;###autoload
(defun color-theme-sanityinc-solarized-dark ()
  (interactive)
  (color-theme-sanityinc-solarized 'dark))

;;;###autoload
(defun color-theme-sanityinc-solarized-light ()
  (interactive)
  (color-theme-sanityinc-solarized 'light))


(provide 'color-theme-sanityinc-solarized)


; Tomorrow Theme
;;
;; Originally by Chris Kempson https://github.com/ChrisKempson/Tomorrow-Theme
;; Ported to GNU Emacs by Chris Charles

(require 'color-theme)

(defun color-theme-tomorrow-real (background current-line
selection foreground comment red orange yellow green aqua blue
purple cursor)
  "GNU Emacs port of Chris Kempson's Tomorrow theme. Port by Chris Charles."

    (color-theme-install
     `(color-theme-tomorrow-real
       ((background . ,background)
        (background-mode . dark)
        (border-color . ,cursor)
        (cursor-color . ,cursor)
        (foreground-color . ,foreground))

       ;; Built-in stuff (Emacs 23)
       (default ((t (:background ,background :foreground ,foreground))))
       (fringe ((t (:background ,current-line))))
       (minibuffer-prompt ((t (:foreground ,blue))))
       (mode-line ((t (:background ,current-line :foreground ,foreground))))
       (region ((t (:background ,selection))))

       ;; Font-lock stuff
       (font-lock-comment-face ((t (:foreground ,comment))))
       (font-lock-constant-face ((t (:foreground ,green))))
       (font-lock-doc-string-face ((t (:foreground ,comment))))
       (font-lock-function-name-face ((t (:foreground ,blue))))
       (font-lock-keyword-face ((t (:foreground ,purple))))
       (font-lock-string-face ((t (:foreground ,green))))
       (font-lock-type-face ((t (:foreground ,yellow))))
       (font-lock-variable-name-face ((t (:foreground ,red))))
       (font-lock-warning-face ((t (:foreground ,red))))

       ;; hl-line-mode
       (hl-line ((t (:background ,current-line))))

       ;; linum-mode
       (linum ((t (:background ,current-line :foreground ,foreground))))

       ;; org-mode
       (org-date ((t (:foreground ,purple))))
       (org-done ((t (:foreground ,green))))
       (org-hide ((t (:foreground ,current-line))))
       (org-link ((t (:foreground ,blue))))
       (org-todo ((t (:foreground ,red))))

       ;; show-paren-mode
       (show-paren-match-face ((t (:background ,blue :foreground ,current-line))))
       (show-paren-mismatch-face ((t (:background ,orange :foreground ,current-line)))))))

(defun color-theme-tomorrow ()
  "Base light Tomorrow theme."
  (interactive)
  (color-theme-tomorrow-real "#ffffff" "#e9efff" "#c5cce9" "#4d4d4c" "#8e908c"
                             "#c82829" "#f5871f" "#eab700" "#718c00" "#3e999f"
                             "#4271ae" "#8959a8" "#aeafad"))
(provide 'color-theme-tomorrow)

(defun color-theme-tomorrow-night ()
  "Dark Tomorrow theme."
  (interactive)
  (color-theme-tomorrow-real "#1d1f21" "#282a2e" "#373b41" "#c5c8c6" "#969896"
                             "#cc6666" "#de935f" "#f0c674" "#b5bd68" "#8abeb7"
                             "#81a2be" "#b294bb" "#aeafad"))
(provide 'color-theme-tomorrow-night)

(defun color-theme-tomorrow-night-eighties ()
  "Somewhat lighter dark Tomorrow theme."
  (interactive)
  (color-theme-tomorrow-real "#2d2d2d" "#393939" "#515151" "#cccccc" "#999999"
                             "#f2777a" "#f99157" "#ffcc66" "#99cc99" "#009999"
                             "#99cccc" "#cc99cc" "#cccccc"))
(provide 'color-theme-tomorrow-night-eighties)

(defun color-theme-tomorrow-night-blue ()
  "Dark Tomorrow theme with a blue background."
  (interactive)
  (color-theme-tomorrow-real "#002451" "#00346e" "#003f8e" "#ffffff" "#7285b7"
                             "#ff9da4" "#ffc58f" "#ffeead" "#d1f1a9" "#99ffff"
                             "#bbdaff" "#ebbbff" "#ffffff"))
(provide 'color-theme-tomorrow-night-blue)

(defun color-theme-tomorrow-night-bright ()
  "Dark Tomorrow theme with a brighter, higher-contrast look."
  (interactive)
  (color-theme-tomorrow-real "#000000" "#2a2a2a" "#424242" "#dedede" "#969896"
                             "#d54e53" "#e78c45" "#e7c547" "#b9ca4a" "#70c0b1"
                             "#7aa6da" "#c397d8" "#9f9f9f"))
(provide 'color-theme-tomorrow-night-bright)


(add-to-list 'color-themes
             '(color-theme-tomorrow
               "Tomorrow" "Chris Kempson (ported by Chris Charles)"))
(add-to-list 'color-themes
             '(color-theme-tomorrow-night
               "Tomorrow Night" "Chris Kempson (ported by Chris Charles)"))
(add-to-list 'color-themes
             '(color-theme-tomorrow-night-eighties
               "Tomorrow Night Eighties" "Chris Kempson (ported by Chris Charles)"))
(add-to-list 'color-themes
             '(color-theme-tomorrow-night-blue
               "Tomorrow Night Blue" "Chris Kempson (ported by Chris Charles)"))
(add-to-list 'color-themes
             '(color-theme-tomorrow-night-bright
               "Tomorrow Night Bright" "Chris Kempson (ported by Chris Charles)"))
