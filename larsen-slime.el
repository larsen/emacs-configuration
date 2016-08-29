; (add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-2.14/")

(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-v2.17/")
(setq inferior-lisp-program "/usr/bin/sbcl")

; (require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'lisp-mode-hook #'paredit-mode)

;; (load "~/quicklisp/clhs-use-local.el" t)

(load "/home/larsen/quicklisp/clhs-use-local.el" t)
(global-set-key [(f2)] 'slime-hyperspec-lookup) 

(provide 'larsen-slime)


