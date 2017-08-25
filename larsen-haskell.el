;;;
;;; larsen-haskell.el
;;;

(require 'haskell-mode)
(require 'intero)

(add-hook 'haskell-mode-hook 'intero-mode)

(provide 'larsen-haskell)
