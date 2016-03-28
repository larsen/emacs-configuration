(add-to-list 'load-path (concat dotfiles-dir "site-lisp/helm"))

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-c h") 'helm-mini)

(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'larsen-helm)
