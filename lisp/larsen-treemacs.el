(use-package treemacs
  :ensure t
  :defer t
  :bind (:map global-map
              ("C-x t t"   . treemacs-select-window)
              ("C-x t d"   . treemacs-select-directory))
  :config
  (treemacs-load-theme "Default")
  ;;   (treemacs-file-face                :inherit default)
  :custom-face
  (treemacs-root-face ((t (:inherit 'default :height 0.8))))
  (treemacs-file-face ((t (:inherit 'default :height 0.8))))
  (treemacs-root-face ((t (:inherit 'default :height 0.8))))
  (treemacs-window-background-face ((t (:inherit 'mode-line-inactive))))
  (treemacs-git-*-face ((t (:inherit 'default :height 0.8))))
  :custom
  (treemacs-is-never-other-window t)
  (treemacs-width 25))

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(provide 'larsen-treemacs)
