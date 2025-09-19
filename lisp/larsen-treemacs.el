(use-package treemacs
  :ensure t
  :defer t
  :bind (:map global-map
              ("C-x t t" . treemacs-select-window)
              ("C-x t d" . treemacs-select-directory))
  :custom-face
  (treemacs-window-background-face
   ((t (:background ,(face-attribute 'mode-line-inactive :background nil t)))))
  :custom
  (treemacs-is-never-other-window t)
  (treemacs-space-between-root-nodes nil)
  (treemacs-width 25))

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package lsp-treemacs
  :after treemacs)

(provide 'larsen-treemacs)
