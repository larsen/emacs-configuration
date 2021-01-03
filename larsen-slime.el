(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

; (use-package 'slime)
(use-package slime-autoloads)
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
(add-hook 'lisp-mode-hook #'whitespace-mode)
(add-hook 'slime-repl-mode-hook
          (lambda () (paredit-mode t)))

;; (load "~/quicklisp/clhs-use-local.el" t)

(load "~/quicklisp/clhs-use-local.el" t)

(provide 'larsen-slime)

