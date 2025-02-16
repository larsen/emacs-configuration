;;;
;;; larsen-theme.el
;;;

(use-package unicode-fonts
   :ensure t
   :config
   (unicode-fonts-setup))

;; No splash screen
(setq inhibit-startup-message t)

;; Show column numbers in modeline
(setq column-number-mode t)

;; Some themes I like:
;; - modus-operandi
;; - danneskjold
;; - gruber-darker
;; - doom-opera-light
;; - doom-tomorrow-night
;; - constant
;; - leuven

(push "~/.emacs.d/lisp/themes/" custom-theme-load-path)
(load-theme 'doom-tomorrow-night t)

(use-package nerd-icons
  :ensure t)

(use-package minions
  :ensure t
  :config (minions-mode t))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode 1)
  :init
  :custom
  (doom-modeline-buffer-file-name-style 'auto)
  (doom-modeline-height 25)
  (inhibit-compacting-font-caches t)
  (doom-modeline-bar-width 1)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-unicode-fallback t)
  (doom-modeline-minor-modes t)
  (doom-modeline-enable-word-count t)
  (doom-modeline-continuous-word-count-modes '(text-mode rst-mode org-mode))
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-env-version t)
  (doom-modeline-github nil)
  (doom-modeline-lsp t)
  (doom-modeline-irc nil)
  :custom-face
  (mode-line ((t (:family "FreeSans" :height 0.98))))
  (mode-line-active ((t (:family "FreeSans" :height 0.97))))
  (mode-line-inactive ((t (:family "FreeSans" :height 0.97)))))

(use-package spacious-padding
  :ensure t
  :config (spacious-padding-mode 1)
  :custom spacious-padding-widths
	'( :internal-border-width 8
     :header-line-width 4
     :mode-line-width 6
     :tab-width 4
     :right-divider-width 8
     :scroll-bar-width 0
     :fringe-width 8)
)
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

(set-face-attribute 'larsen-yafolding-hidden-face nil
                    :background "yellow"
                    :foreground "black"
                    :underline t)

(advice-add 'yafolding-hide-element :before
            (lambda ()
              (let* ((beg (line-beginning-position))
                     (end (line-end-position))
                     (new-overlay (make-overlay beg end)))
                (overlay-put new-overlay 'category "yafolding")
                (overlay-put new-overlay 'face 'larsen-yafolding-hidden-face))))

(provide 'larsen-theme)
