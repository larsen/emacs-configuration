(use-package paredit
  :ensure t
  :hook
  (emacs-lisp-mode . enable-paredit-mode)
  (lisp-mode . enable-paredit-mode)
  (lisp-interaction-mode . enable-paredit-mode)
  (slime-repl-mode . enable-paredit-mode)
  (sly-repl-mode . enable-paredit-mode)
  (scheme-mode . enable-paredit-mode)
  (clojure-mode . enable-paredit-mode)
  (ielm-mode . enable-paredit-mode)
  (eval-expression-minibuffer-setup . enable-paredit-mode))

(provide 'larsen-paredit)
