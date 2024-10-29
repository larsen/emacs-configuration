(use-package yasnippet
  :ensure t
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas/indent-line nil)
  :config
  (yas-global-mode 1))

(provide 'larsen-snippets)
