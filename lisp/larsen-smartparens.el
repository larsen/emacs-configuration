(use-package smartparens
  :ensure t
  :hook (clojure-ts-mode)
  :bind (("C-<right>" . sp-forward-slurp-sexp)
         ("C-<left>" . sp-forward-barf-sexp)
         ("C-M-t" . sp-transpose-sexp))
  :config
  ;; load default config
  (require 'smartparens-config))

(provide 'larsen-smartparens)
