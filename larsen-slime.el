(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-2.14/")

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))

(provide 'larsen-slime)


