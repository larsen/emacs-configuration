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

;; At the end of everythin I redefine `slime-push-definition-stack`
;; so that it uses xref-push-marker-stack when available.
;; This is because slime 2.27 presents a bug in Emacs 28.1+:
;; when using <M-.>, it raises an error
;; "Symbol’s value as variable is void: find-tag-marker-ring"
;; I found a patch here https://github.com/slime/slime/pull/650,
;; but it has yet to be merged and released
(defun slime-push-definition-stack ()
  "Add point to find-tag-marker-ring."
  (require 'etags)
  ;; (ring-insert find-tag-marker-ring (point-marker))
  (if (fboundp 'xref-push-marker-stack)
      (xref-push-marker-stack)
    (ring-insert find-tag-marker-ring (point-marker))))

(provide 'larsen-slime)
