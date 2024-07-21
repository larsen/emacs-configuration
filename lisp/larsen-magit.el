(use-package magit
  :bind (("C-x g" . magit-status))
  :config
  ;; from http://whattheemacsd.com/setup-magit.el-01.html
  ;; full screen magit-status

  (defadvice magit-status (around magit-fullscreen activate)
    (window-configuration-to-register :magit-fullscreen)
    ad-do-it
    (delete-other-windows))

  (defun magit-quit-session ()
    "Restores the previous window configuration and kills the magit buffer"
    (interactive)
    (kill-buffer)
    (jump-to-register :magit-fullscreen))

  (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  :custom
  (magit-save-repository-buffers 'dontask))


(use-package magit-todos
  :demand t
  :after magit
  :custom
  (hl-todo-keyword-faces '(("KLUDGE" . "#d0bf8f")
                           ("HACK" . "#d0bf8f")
                           ("TODO" . "#D98C32")
                           ("FIXME" . "#EF681F")
                           ("WTF" . "#F8240E")))
  (magit-todos-keywords-list (mapcar #'car hl-todo-keyword-faces))
  (magit-todos-auto-group-items 50)
  (magit-todos-exclude-globs '(".git/" "docs/"))
  :config
  (magit-todos-mode t))

(provide 'larsen-magit)
