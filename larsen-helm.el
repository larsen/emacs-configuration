(add-to-list 'load-path (concat dotfiles-dir "site-lisp/helm"))

(require 'helm-config)
(helm-mode 1)

(provide 'larsen-helm)
