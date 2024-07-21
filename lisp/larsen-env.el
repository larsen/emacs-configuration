;;;
;;; larsen-env.el
;;;

(use-package rotate
  :bind (("C-x C-o" . rotate-layout)))

(use-package switch-window
  :bind (("C-x o" . switch-window)))

(use-package eyebrowse
  :config
    (cl-loop for i from 1 upto 9
           do (define-key eyebrowse-mode-map
                          (kbd (format "M-%d" i))
                          `(lambda ()
                             (interactive)
                             (eyebrowse-switch-to-window-config ,i))))
  (eyebrowse-mode t))

(use-package projectile
  :custom
  (projectile-sort-order 'recently-active)
  :config
  (projectile-mode))

(use-package multiple-cursors
  :bind (("C-c m c" . mc/edit-lines)
         ("C-c m a" . mc/mark-all-like-this)
         ("C-c m n" . mc/mark-next-like-this)
         ("C-S-<mouse-1>" . mc/add-cursor-on-click)))

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package editorconfig
  :config (editorconfig-mode 1))

(use-package display-line-numbers
  :hook prog-mode-hook
  :custom
  (display-line-numbers-width-start t))

(use-package yafolding
  :hook prog-mode-hook)

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
  (calendar-holidays (append holiday-general-holidays holiday-local-holidays
                             holiday-other-holidays holiday-christian-holidays
                             holiday-islamic-holidays holiday-oriental-holidays
                             holiday-solar-holidays)))

(use-package crux)
(use-package cl-lib)

(set-default 'indent-tabs-mode nil)
(setq-default tab-width 2)

(dolist (mode '(scroll-bar-mode tool-bar-mode menu-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
(setq scroll-margin 3)

;; Always ALWAYS use UTF-8
;; (borrowed from bodil's configuration)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

(global-hl-line-mode 1) ; turn on highlighting current line
(global-visual-line-mode 1)
(global-font-lock-mode 1)
(delete-selection-mode 1) ; delete seleted text when typing
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression

; (whole-line-or-region-mode)

;; scrolling in a more Vim-like fashion
(setq scroll-step            1
      scroll-conservatively  10000)

(pixel-scroll-precision-mode)


(add-to-list 'exec-path "~/.cabal/bin/")
(add-to-list 'exec-path "~/.nvm/versions/node/v8.11.3/bin/")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Transpose (rotate if multiple) windows
(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(display-time-mode 1)


;; JS2mode
(setq-default js2-basic-offset 2)

;; (edwin-mode t)

(setq term-suppress-hard-newline t)

(eval-after-load 'Term
  '(define-key term-mode-map (kbd "C-M-y") 'helm-mini))

(require 'forecast-configuration nil t)

(nyan-mode)

(provide 'larsen-env)
