(use-package key-chord
  :custom
  (key-chord-two-keys-delay 0.05)
  :config
  (key-chord-define-global "//" 'isearch-forward)
  (key-chord-define-global "hh" 'helm-mini)
  (key-chord-define-global "jj" 'ace-jump-mode)
  (key-chord-define-global "ww" 'switch-window)
  :init
  (key-chord-mode t))

(provide 'larsen-keychords)
