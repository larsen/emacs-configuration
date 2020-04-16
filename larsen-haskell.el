;;;
;;; larsen-haskell.el
;;;

(use-package haskell-mode)
(use-package intero)

(add-hook 'haskell-mode-hook 'intero-mode)

(provide 'larsen-haskell)
