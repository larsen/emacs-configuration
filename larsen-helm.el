(add-to-list 'load-path (concat dotfiles-dir "site-lisp/helm"))
(require 'helm-config)

(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)

(provide 'larsen-helm)
