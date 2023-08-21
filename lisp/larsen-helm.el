(use-package helm
  :init (helm-mode 1)
  :custom
  (helm-ff-lynx-style-map t)
  (helm-buffer-max-length 60))

(use-package helm-swoop)
(use-package helm-config)
(use-package helm-projectile)
(use-package helm-ag)

(provide 'larsen-helm)
