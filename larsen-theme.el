;;;
;;; larsen-theme.el
;;;

(defvar larsen/system-font
  ;; "IBM Plex Mono"
  "Iosevka")

(let ((font
       (or "Iosevka Term"
           larsen/system-font)))
  (set-face-attribute 'default nil
                      :family font
                      :height 120)
  (set-face-attribute 'mode-line nil
                      :family font
                      :height 100)
  ;; FIXME should it not inherit from 'mode-line?
  (set-face-attribute 'mode-line-inactive nil
                      :height 120)
  (set-face-attribute 'font-lock-comment-face nil
                      :family font
                      :height 1.0
                      :slant 'italic)
  (set-face-attribute 'font-lock-doc-face nil
                      :family font
                      :height 1.0
                      :slant 'italic)
  (set-face-attribute 'variable-pitch nil
                      :family "Literata eBook"
                      :height 0.95
                      :slant 'normal)
  (set-face-attribute 'org-ellipsis nil
                      :underline nil)
  (set-face-attribute 'flycheck-fringe-error nil
                      :background "black"
                      :foreground "yellow"
                      :inverse-video nil
                      :weight 'bold)
  (set-face-attribute 'flycheck-fringe-warning nil
                      :background "black"
                      :foreground "orange"
                      :inverse-video nil
                      :weight 'bold)
  (set-face-attribute 'flycheck-fringe-info nil
                      :background "black"
                      :foreground "green"
                      :inverse-video nil
                      :weight 'bold)
  (set-face-attribute 'org-block-begin-line nil
                      :background "dim gray"
                      :foreground "gainsboro"))

(defun increase-text-scale-in-buffer-group (major-mode-name)
  "Increment text scale for all buffers matching a given major-mode-name."
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

; (zerodark-setup-modeline-format)
; (load-theme 'constant t)
(load-theme 'doom-tomorrow-night t)

; (use-package 'org-beautify-theme)
; (load-theme 'org-beautify-theme)

(doom-modeline-mode)
(doom-themes-neotree-config)
(doom-themes-visual-bell-config)
(doom-themes-org-config)
(setq doom-modeline-icon t
      doom-modeline-height 10
      doom-modeline-buffer-file-name-style 'relative-to-project)

(defun switch-theme (theme)
  (interactive
   (list
    (intern (completing-read "Switch to custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (dolist (curr custom-enabled-themes) (disable-theme curr))
  (load-theme theme))


(provide 'larsen-theme)
