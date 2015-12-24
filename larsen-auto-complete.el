(add-to-list 'load-path "~/.emacs.d/site-lisp")

(require 'auto-complete)
(require 'auto-complete-config)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/ac-dict")
(ac-config-default)
(setq ac-auto-start t)

(provide 'larsen-auto-complete)
