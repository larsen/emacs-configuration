;;;
;;; larsen-env.el
;;;

(require 'helm)
(require 'helm-swoop)
(require 'rotate)

(add-to-list 'exec-path "~/.cabal/bin/")

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

(global-set-key (kbd "C-x C-o") 'rotate-layout)

(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-S-f") 'imenu) ;; use iMenu

;; (setq sml/no-confirm-load-theme t)
;; (sml/setup)

;; (key-chord-mode 1)

;; (defvar key-chord-two-keys-delay 0.00015)

;; (key-chord-define-global "xh"'helm-mini)
;; (key-chord-define-global "cs" 'helm-occur)
;; (key-chord-define-global "xo" 'switch-window)

(global-set-key (kbd "C-<f12>") 'slime-selector)

;; terminal
(global-set-key
 (kbd "C-c t")
 (lambda () (interactive) (ansi-term "/bin/bash")))

(global-set-key (kbd "C-c m c") 'mc/edit-lines)

(global-set-key (kbd "C-c e m") 'macrostep-mode)

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
