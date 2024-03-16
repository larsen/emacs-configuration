;;;
;;; larsen-theme.el
;;;

(defvar larsen/system-font
  ;; "IBM Plex Mono"
  "Iosevka")

(use-package unicode-fonts
   :ensure t
   :config
   (unicode-fonts-setup))

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

;; (zerodark-setup-modeline-format)
;; (load-theme 'constant t)
;; (load-theme 'doom-tomorrow-night t)
;; (load-theme 'ef-maris-light t)
(load-theme 'gruber-darker-theme t)
;; (load-theme 'doom-opera t)

;; (use-package 'org-beautify-theme)
;; (load-theme 'org-beautify-theme)

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :config (doom-modeline-mode 1)
  :custom
  (doom-modeline-buffer-file-name-style 'auto)
  (doom-modeline-height 10)
  (inhibit-compacting-font-caches t)
  (doom-modeline-bar-width 1)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-unicode-fallback nil)
  (doom-modeline-minor-modes t)
  (doom-modeline-enable-word-count t)
  (doom-modeline-continuous-word-count-modes '(text-mode rst-mode org-mode))
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-env-version t)
  (doom-modeline-github nil)
  (doom-modeline-lsp t)
  (doom-modeline-irc t)
  (doom-modeline-irc-stylize 'identity))

;; (doom-themes-neotree-config)
;; (doom-themes-visual-bell-config)
;; (doom-themes-org-config)

;; (doom-modeline-def-modeline 'pdf
;;   '(bar pdf-pages window-number matches buffer-info)
;;   '(compilation  misc-info major-mode process vcs time))


(defun switch-theme (theme)
  (interactive
   (list
    (intern (completing-read "Switch to custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (dolist (curr custom-enabled-themes) (disable-theme curr))
  (load-theme theme))

(defface larsen-yafolding-hidden-face
  '()
  "Face for folded blocks"
  :group 'yafolding)

(advice-add 'yafolding-hide-element :before
            (lambda ()
              (let* ((beg (line-beginning-position))
                     (end (line-end-position))
                     (new-overlay (make-overlay beg end)))
                (overlay-put new-overlay 'category "yafolding")
                (overlay-put new-overlay 'face 'larsen-yafolding-hidden-face))))

(set-face-attribute 'larsen-yafolding-hidden-face nil
                    :background "teal"
                    :foreground "black"
                    :underline t)

(provide 'larsen-theme)
