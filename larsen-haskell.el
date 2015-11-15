;;;
;;; larsen-haskell.el
;;;

(require 'haskell-mode)

; Too slow?
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-init "/Applications/ghc-7.10.2.app/Contents/bin/ghc")

(setq auto-mode-alist (cons '("\.hs$" . haskell-mode) auto-mode-alist))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

(provide 'larsen-haskell)
