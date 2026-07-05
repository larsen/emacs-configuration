(use-package key-chord
  :custom
  (key-chord-two-keys-delay 0.05)
  :config
  (key-chord-define-global "//" 'isearch-forward)
  (key-chord-define-global ",," 'slime-selector)
  (key-chord-define-global "e-" (lambda () (interactive) (insert "€")))
  :init
  (key-chord-mode t))

(provide 'larsen-keychords)
