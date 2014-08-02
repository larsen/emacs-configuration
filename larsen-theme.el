;;;
;;; larsen-theme.el
;;;

(package-require 'powerline)

; (custom-set-variables
;   '(custom-enabled-themes (quote (deeper-blue))))

(set-face-attribute 'default nil :family "Monaco" :height 100)

;; No splash screen
(setq inhibit-startup-message t)

;; Show column numbers in modeline
(setq column-number-mode t)

;; Set custom theme path
(setq custom-theme-directory (concat dotfiles-dir "themes"))
(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(load-theme 'ritchie t)

; (powerline-center-theme)

(provide 'larsen-theme)
