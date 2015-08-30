;;;
;;; larsen-env.el
;;;

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

(global-set-key (kbd "C-x C-o") 'rotate-windows)

(global-set-key (kbd "C-x o") 'switch-window)
(global-set-key (kbd "C-S-f") 'imenu) ;; use iMenu

(global-set-key (kbd "<s-escape>") 'helm-mini)
(global-set-key (kbd "C-c o") 'helm-occur)
(global-set-key (kbd "C-c s") 'helm-swoop)

;; (key-chord-mode 1)

;; (defvar key-chord-two-keys-delay 0.00015)

;; (key-chord-define-global "xh"'helm-mini)
;; (key-chord-define-global "cs" 'helm-occur)
;; (key-chord-define-global "xo" 'switch-window)

(global-set-key (kbd "<f13>") 'helm-mini) ; on Code keyboard
(global-set-key (kbd "C-M-y") 'helm-mini) ; on Atreus
(global-set-key (kbd "<print>") 'helm-mini)

;; terminal
(global-set-key
 (kbd "C-c t")
 (lambda () (interactive) (ansi-term "/bin/bash")))


(require 'project-explorer)
(setq-default pe/width 28)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Open project explorer with swipe from left margin
(global-set-key
 (kbd "<left-margin> <drag-mouse-1>")
 (lambda () (interactive)
   (-if-let (win (car (-keep 'get-buffer-window (pe/get-project-explorer-buffers))))
       (delete-window win)
     (project-explorer-open))))

(display-time-mode 1)

(provide 'larsen-env)
