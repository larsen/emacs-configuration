(add-to-list 'load-path (concat dotfiles-dir "site-lisp/helm"))

(require 'helm-config)
(helm-mode 1)

(dolist (keyb '("C-c h"                 ; normally used
                "<s-escape>"            ; 
                "<f13>"                 ; for CODE keyboard
                "C-M-y"                 ; for Atreus keyboard
                "<print>"               ;
                ))
  (global-set-key (kbd keyb) 'helm-mini))

(global-set-key (kbd "C-c s") 'helm-swoop)
(global-set-key (kbd "C-c C-s") 'helm-multi-swoop-projectile)
(global-set-key (kbd "C-c v") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'larsen-helm)
