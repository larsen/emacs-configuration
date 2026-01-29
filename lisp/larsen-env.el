;;;
;;; larsen-env.el
;;;

(use-package emacs
  :custom
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (read-extended-command-predicate #'command-completion-default-include-p)
  (scroll-step 1)
  (scroll-margin 3)
  (scroll-conservatively 10000)
  (show-paren-style 'expression)
  (tab-always-indent 'complete)
  (term-suppress-hard-newline t)
  (inhibit-startup-message t)
  (column-number-mode t)
  :config
  (setopt use-short-answers t)
  (dolist (mode '(scroll-bar-mode tool-bar-mode menu-bar-mode))
    (when (fboundp mode) (funcall mode -1)))
  (pixel-scroll-precision-mode)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (set-default 'indent-tabs-mode nil)
  (setq-default tab-width 2)
  (display-time-mode 1)
  (show-paren-mode 1)
  (global-auto-revert-mode 1)
  (global-hl-line-mode 1)
  (global-visual-line-mode 1)
  (global-font-lock-mode 1)
  (delete-selection-mode 1)
  (setq-default buffer-file-coding-system 'utf-8-unix)
  (add-to-list 'exec-path "~/.nvm/versions/node/v8.11.3/bin/")
  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  :bind (("M-o" . other-window)
         ("C-c e m" . macrostep-mode)
         ("C-c e r" . eval-and-replace)))

(use-package prog-mode
  :custom-face
  (font-lock-comment-face ((t (:inherit 'variable-pitch)))))

(use-package crux
  :ensure t)

(use-package recentf
  :config
  (recentf-mode))

(use-package sideline
  :custom
  (sideline-backends-right '(sideline-eglot)))

(use-package cl-lib)

(use-package golden-ratio
  :config
  (golden-ratio-mode))

(use-package rotate
  :ensure t
  :bind (("C-x C-o" . rotate-layout)))

(use-package switch-window
  :ensure t
  :bind (("C-x o" . switch-window)))

(use-package vterm
  :bind (("C-c t" . vterm)))

(use-package eyebrowse
  :ensure t
  :config
    (cl-loop for i from 1 upto 9
           do (define-key eyebrowse-mode-map
                          (kbd (format "M-%d" i))
                          `(lambda ()
                             (interactive)
                             (eyebrowse-switch-to-window-config ,i))))
  (eyebrowse-mode t))

(use-package multiple-cursors
  :ensure t
  :bind (("C-c m c" . mc/edit-lines)
         ("C-c m a" . mc/mark-all-like-this)
         ("C-c m n" . mc/mark-next-like-this)
         ("C-c m d" . mc/mark-all-dwim)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode))

(use-package minimap
  ;; :hook (prog-mode . minimap-mode)
  :custom (minimap-window-location 'right))

;; Package not available anymore
;; (use-package colorful-mode
;;   :custom (colorful-use-prefix t))

(use-package calendar
  :config
  ;; Week number in calendar
  (copy-face font-lock-constant-face 'calendar-iso-week-face)
  (set-face-attribute 'calendar-iso-week-face nil
                      :height 0.7)
  :custom
  (calendar-week-start-day 1)
  (calendar-intermonth-text '(propertize
                              (format "%2d"
                                      (car
                                       (calendar-iso-from-absolute
                                        (calendar-absolute-from-gregorian (list month day year)))))
                              'font-lock-face 'calendar-iso-week-face))
  (calendar-holidays (append holiday-general-holidays
                             holiday-local-holidays
                             holiday-other-holidays
                             holiday-christian-holidays
                             holiday-solar-holidays)))

(eval-after-load 'Term
  '(define-key term-mode-map (kbd "C-M-y") 'helm-mini))

(use-package hideshow
  :bind
  (("C-<return>" . hs-toggle-hiding)))

(use-package flymake
  :config
  ;; (define-fringe-bitmap 'my-flymake-error-bitmap
  ;;   (vector #b00000000
  ;;           #b00000000
  ;;           #b00011100
  ;;           #b00111110
  ;;           #b00111110
  ;;           #b00011100
  ;;           #b00000000
  ;;           #b00000000))
  (define-fringe-bitmap 'my-flymake-error-bitmap
    (vector #b00000000
            #b00011000
            #b00111100
            #b01111110
            #b01111110
            #b00111100
            #b00011000
            #b00000000))
  (setq flymake-error-bitmap '(my-flymake-error-bitmap compilation-error)))

(require 'forecast-configuration nil t)

(provide 'larsen-env)
