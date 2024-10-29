(use-package company
  :ensure t
  :config
  (global-company-mode)
  :custom
  (company-selection-wrap-around t)
  (company-idle-delay (lambda () (if (company-in-string-or-comment) nil 0.2)))
  (company-minimum-prefix-length 1)
  ; (company-global-modes '(not erc-mode message-mode eshell-mode))
  :bind (:map global-map
              ("C-c y" . company-yasnippet)
              ("C-c C-/" . company-jedi)))

(provide 'larsen-company)
