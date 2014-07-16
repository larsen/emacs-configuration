;;;
;;; larsen-haskell.el
;;;

(require 'haskell-mode)

; Too slow?
; (autoload 'ghc-init "ghc" nil t)
; (add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(setq auto-mode-alist (cons '("\.hs$" . haskell-mode) auto-mode-alist))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(provide 'larsen-haskell)
