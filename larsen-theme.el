;;;
;;; larsen-theme.el
;;;

(set-face-attribute 'default nil
                    :family "DejaVu Sans Mono"
                    :height 120) 

(set-face-attribute 'font-lock-comment-face nil
                    :family "DejaVu Serif"
                    :height 1.1)

(set-face-attribute 'font-lock-doc-face nil
                    :family "DejaVu Serif"
                    :height 1.1)

;; No splash screen
(setq inhibit-startup-message t)

;; Show column numbers in modeline
(setq column-number-mode t)

;; Set custom theme path
;; (setq custom-theme-directory (concat dotfiles-dir "themes"))
;; (dolist
;;     (path (directory-files custom-theme-directory t "\\w+"))
;;   (when (file-directory-p path)
;;     (add-to-list 'custom-theme-load-path path)))

;; (load-theme 'bubbleberry t)
;; (load-theme 'danneskjold t)
(load-theme 'zerodark t)
(zerodark-setup-modeline-format)

(defun switch-theme (theme)
  (interactive
   (list
    (intern (completing-read "Switch to custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (dolist (curr custom-enabled-themes) (disable-theme curr))
  (load-theme theme))


(provide 'larsen-theme)
