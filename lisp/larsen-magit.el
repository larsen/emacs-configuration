(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status))
  :custom
  (magit-save-repository-buffers 'dontask))

(use-package magit-todos
  :ensure t
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
