(add-to-list 'load-path (concat dotfiles-dir "site-lisp/helm"))

(use-package helm-config)

(custom-set-variables '(helm-ff-lynx-style-map t))
(helm-mode 1)

(provide 'larsen-helm)
