(require 'eglot)

(add-hook 'prog-mode-hook #'lsp)
(remove-hook 'lisp-mode-hook #'lsp)

(provide 'larsen-lsp)
