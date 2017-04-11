(require 'clojure-mode)

(add-to-list 'auto-mode-alist '("\\.cljs?$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs?$" . paredit-mode))

(provide 'larsen-clojure)
