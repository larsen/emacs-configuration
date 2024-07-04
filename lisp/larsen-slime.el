
;; I want to copy stuff from here at some point
;; https://github.com/muyinliu/.emacs.d/blob/ac848ee99eea91faba822731c796af352fbe8191/lisp/init-slime.el


;; Let's keep around the original slime-helper.el
;; (load (expand-file-name "~/.quicklisp/slime-helper.el"))

(load (expand-file-name "~/.quicklisp/slime-helper.el"))

(use-package slime-autoloads)

(use-package slime
  :after slime-autoloads
  :hook (lisp-mode . slime-mode)
  :bind (("<f2>" . slime-hyperspec-lookup)
         ("C-<f12>" . slime-selector)
         ("<f12>" . slime-selector))
  :custom
  (inferior-lisp-program "sbcl")
  (slime-lisp-implementations '(("sbcl" ("sbcl" "--dynamic-space-size" "8192"))))
  :config
  (load "~/.quicklisp/clhs-use-local.el" t)
  (slime-setup '(;; slime-fancy

                 ;; This contrib implements a Lisp Listener along with some niceties like
                 ;; a persistent history and various \"shortcut\" commands.  Nothing here
                 ;; depends on comint.el; I/O is multiplexed over SLIME's socket.
                 slime-repl

                 ;; ILISP style Compound Prefix Completion.
                 ;; https://www.quicklisp.org/beta/UNOFFICIAL/docs/slime/doc/Compound-Completion.html
                 slime-c-p-c

                 ;; Editing commands without server interaction.
                 slime-editing-commands

                 ;; Fancy inspector for CLOS objects.
                 slime-fancy-inspector

                 ;; Enhanced version of slime-trace capable of tracing local functions,
                 ;; methods, setf functions, and other entities supported by specific
                 ;; swank:swank-toggle-trace backends. Invoke via C-c C-t.
                 slime-fancy-trace

                 ;; Imitate Emacs' *scratch* buffer
                 slime-scratch

                 ;; Provide an interfactive trace dialog buffer for managing and
                 ;; inspecting details of traced functions. Invoke this dialog with C-c T.
                 slime-trace-dialog

                 ;; Imitate LispM presentations.
                 slime-presentations

                 ;; ASDF support
                 slime-asdf

                 ;; Filename translations for tramp
                 slime-tramp

                 ;; interfacing `slime-cl-indent' and SLIME.
                 slime-indentation

                 ;; Highlight edited, i.e. not yet compiled, code.
                 slime-highlight-edits))

  (setf slime-mode-hook '(slime-trace-dialog-enable
                          slime-add-easy-menu
                          slime-setup-first-change-hook ; slime-autodoc--on
                          ))

  (add-hook 'lisp-mode-hook #'whitespace-mode)
  (add-hook 'slime-repl-mode-hook
            (lambda () (paredit-mode t)))

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
      (ring-insert find-tag-marker-ring (point-marker)))))

(provide 'larsen-slime)
