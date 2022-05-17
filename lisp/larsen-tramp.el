;;;
;;; larsen-tramp.el
;;;

(use-package tramp)
(setq tramp-default-method "ssh")
(add-to-list 'tramp-default-user-alist
             '("ssh" "home" "larsen"))
; local auto-saves to speed up things
(setq tramp-auto-save-directory "~/.emacs.d/tramp-autosave")

(provide 'larsen-tramp)
