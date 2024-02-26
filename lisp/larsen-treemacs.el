(use-package treemacs
  :ensure t
  :defer t
  :bind (:map global-map
              ("C-x t t"   . treemacs-select-window)
              ("C-x t d"   . treemacs-select-directory))
  :config
  (treemacs-load-theme "Default")
  :custom
  (treemacs-is-never-other-window t)
  (treemacs-text-scale 0.8))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(provide 'larsen-treemacs)
