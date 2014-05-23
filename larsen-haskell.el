;;;
;;; larsen-haskell.el
;;;

(package-require 'haskell-mode)

; Too slow?
; (autoload 'ghc-init "ghc" nil t)
; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(provide 'larsen-haskell)
