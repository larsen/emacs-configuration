(use-package company
  :config
  (global-company-mode)
  :custom
  (company-selection-wrap-around t)
  (company-idle-delay (lambda () (if (company-in-string-or-comment) nil 0.3)))
  ; (company-global-modes '(not erc-mode message-mode eshell-mode))
  :bind (:map global-map
              ("C-c y" . company-yasnippet)))

(provide 'larsen-company)
