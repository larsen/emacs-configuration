(use-package clojure-mode)
(use-package clj-refactor)

; (add-to-list 'auto-mode-alist '("\\.cljs?$" . paredit-mode))
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))

(setq cider-repl-use-pretty-printing t)
(setq cider-prompt-for-symbol nil)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'cider-stacktrace-mode-hook
          (lambda ()
            (set (make-local-variable 'comment-start) ";;")
            (set (make-local-variable 'comment-end) "\n")))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(provide 'larsen-clojure)
