(use-package eglot
  :hook ((prog-mode . (lambda ()
                        (unless (derived-mode-p 'emacs-lisp-mode
                                                'lisp-mode
                                                'makefile-mode
                                                'snippet-mode)
                          (eglot-ensure))))))

(use-package eldoc-box
  :hook (eglot-managed-mode . eldoc-box-hover-mode)
  :after eglot)

(provide 'larsen-lsp)
