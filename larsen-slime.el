; (add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-2.14/")

(add-to-list 'load-path "~/quicklisp/dists/quicklisp/software/slime-v2.20/")
(setq inferior-lisp-program "/usr/bin/sbcl")

; (require 'slime)
(require 'slime-autoloads)
(slime-setup '(;; slime-fancy
               slime-repl
               slime-c-p-c
               slime-editing-commands
               slime-fancy-inspector
               slime-fancy-trace
               slime-scratch
               slime-trace-dialog
               slime-presentations
               
               slime-asdf
               slime-tramp
               slime-indentation))

; (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))


(setf slime-mode-hook
      '(slime-trace-dialog-enable
       ; slime-autodoc--on
       slime-add-easy-menu
       slime-setup-first-change-hook))

(add-hook 'lisp-mode-hook #'paredit-mode)

;; (load "~/quicklisp/clhs-use-local.el" t)

(load "~/quicklisp/clhs-use-local.el" t)

(provide 'larsen-slime)

