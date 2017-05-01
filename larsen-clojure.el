(require 'clojure-mode)

(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
(add-to-list 'auto-mode-alist '("\\.cljs$" . clojurescript-mode))
(add-to-list 'auto-mode-alist '("\\.cljs?$" . paredit-mode))

(provide 'larsen-clojure)
