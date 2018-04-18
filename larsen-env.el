;;;
;;; larsen-env.el
;;;

(require 'helm)
(require 'helm-swoop)
(require 'rotate)
(require 'nlinum)
(require 'whole-line-or-region)

(set-default 'indent-tabs-mode nil)
(setq-default tab-width 2)

(global-hl-line-mode 1) ; turn on highlighting current line
(nlinum-mode)
(global-visual-line-mode 1)
(global-font-lock-mode 1)
(delete-selection-mode 1) ; delete seleted text when typing
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression

(whole-line-or-region-mode)

;; scrolling in a more Vim-like fashion
(setq scroll-step            1
      scroll-conservatively  10000)

; Not sure why I need this
(setq ansi-term-color-vector
  [term term-color-black term-color-red term-color-green term-color-yellow 
    term-color-blue term-color-magenta term-color-cyan term-color-white])

(add-to-list 'exec-path "~/.cabal/bin/")

(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))

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

;; (setq sml/no-confirm-load-theme t)
;; (sml/setup)

(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))

(display-time-mode 1)

(setq calendar-week-start-day 1)

;; Week number in calendar
(copy-face font-lock-constant-face 'calendar-iso-week-face)
(set-face-attribute 'calendar-iso-week-face nil
                    :height 0.7)
(setq calendar-intermonth-text
      '(propertize
        (format "%2d"
                (car
                 (calendar-iso-from-absolute
                  (calendar-absolute-from-gregorian (list month day year)))))
        'font-lock-face 'calendar-iso-week-face))

;; JS2mode
(setq-default js2-basic-offset 2)

;; Projectile
;; (projectile-global-mode)

(eyebrowse-mode t)

(pdf-tools-install)

(provide 'larsen-env)
