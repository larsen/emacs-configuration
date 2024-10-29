;;;
;;; larsen-tramp.el
;;;

(use-package tramp
  :ensure t
  :custom
  (tramp-default-method "ssh")
  ; local auto-saves to speed up things
  (tramp-auto-save-directory "~/.emacs.d/tramp-autosave")
  :config
  (add-to-list 'tramp-default-user-alist
               '("ssh" "home" "larsen")))

(provide 'larsen-tramp)
