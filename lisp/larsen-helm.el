(use-package helm
  :init (helm-mode 1)
  :bind (("C-c h" . helm-mini)
         ("<s-escape>" . helm-mini)
         ("<f13>" . helm-mini)
         ("C-M-y" . helm-mini)
         ("<print>" . helm-mini)
         ("M-x" . helm-M-x)
         ("C-c s" . helm-swoop)
         ("C-c C-s" . helm-swoop-projectile)
         ("C-c v" . helm-show-kill-ring)
         ("C-x C-f" . helm-find-files))
  :custom
  (helm-ff-lynx-style-map t)
  (helm-buffer-max-length 60))

(use-package helm-swoop :requires helm)
(use-package helm-config :requires helm)
(use-package helm-projectile :requires helm)
(use-package helm-ag :requires helm)

(provide 'larsen-helm)
