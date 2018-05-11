;;;
;;; larsen-theme.el
;;;

(set-face-attribute 'default nil
                    :family "Courier 10 Pitch"
                    :height 140)

(set-face-attribute 'font-lock-comment-face nil
                    :family "IBM Plex Mono"
                    :height 0.8
                    :slant 'italic)

(set-face-attribute 'font-lock-doc-face nil
                    :family "IBM Plex Mono"
                    :height 0.8
                    :slant 'italic)

(defun increase-text-scale-in-buffer-group (major-mode-name)
  "Increment text scale for all buffers matching a give major mode name"
  (interactive
   (list (intern (completing-read
                  "Select major mode from the list: "
                  (remove-duplicates (mapcar (lambda (b)
                                               (buffer-local-value
                                                'major-mode (get-buffer b)))
                                             (buffer-list)))))))
  (cl-loop for buffer in (buffer-list)
           when (string= (buffer-local-value
                          'major-mode (get-buffer buffer))
                         major-mode-name)
           do (with-current-buffer buffer
                (text-scale-increase 1))))

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
