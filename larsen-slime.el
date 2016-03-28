(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-2.14/")

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))

(global-set-key [(f2)] 'slime-hyperspec-lookup) 

; (load "~/quicklisp/clhs-use-local.el" t)
(load "/home/larsen/quicklisp/clhs-use-local.el" t)

(provide 'larsen-slime)


