(use-package paredit
  :hook
  (emacs-lisp-mode . enable-paredit-mode)
  (lisp-mode . enable-paredit-mode)
  (lisp-interaction-mode . enable-paredit-mode)
  (slime-repl-mode . enable-paredit-mode)
  (scheme-mode . enable-paredit-mode)
  (clojure-mode . enable-paredit-mode))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)

(provide 'larsen-paredit)
