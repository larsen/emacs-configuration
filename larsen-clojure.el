(require 'clojure-mode)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.cljs?$" . paredit-mode))

(setq cider-repl-use-pretty-printing t)
(setq cider-prompt-for-symbol nil)

(provide 'larsen-clojure)
