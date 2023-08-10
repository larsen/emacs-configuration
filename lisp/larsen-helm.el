(use-package helm-config)
(use-package helm-projectile)
(use-package helm-ag)

(custom-set-variables '(helm-ff-lynx-style-map t))

(helm-mode 1)
(setq helm-buffer-max-length 60)

(provide 'larsen-helm)
