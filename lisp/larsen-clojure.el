(use-package clojure-mode
  :mode ("\\.clj$" . clojure-mode)
  :hook (clojure-mode . paredit-mode)
  :custom
  (cider-repl-use-pretty-printing t)
  (cider-prompt-for-symbol nil))

(use-package clojurescript-mode
  :mode ("\\.cljs$" . clojurescript-mode))

(use-package clj-refactor
  :custom
  (cljr-warn-on-eval t))

(use-package cider
  :ensure t)

(provide 'larsen-clojure)
