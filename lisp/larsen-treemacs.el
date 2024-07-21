(use-package treemacs
  :ensure t
  :defer t
  :bind (:map global-map
              ("C-x t t"   . treemacs-select-window)
              ("C-x t d"   . treemacs-select-directory))
  :custom-face
  (treemacs-window-background-face ((t (:inherit 'mode-line-inactive))))
  :custom
  (treemacs-is-never-other-window t)
  (treemacs-space-between-root-nodes nil)
  (treemacs-width 25))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package lsp-treemacs
  :after treemacs)

(provide 'larsen-treemacs)
