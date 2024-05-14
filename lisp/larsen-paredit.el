(use-package paredit
  :hook ((emacs-lisp-mode lisp-mode lisp-interaction-mode scheme-mode clojure-mode) . enable-paredit-mode))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)

(provide 'larsen-paredit)
