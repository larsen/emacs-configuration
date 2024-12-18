(use-package eglot
  :ensure t
  :hook ((prog-mode . (lambda ()
                        (unless (derived-mode-p 'emacs-lisp-mode
                                                'lisp-mode
                                                'makefile-mode
                                                'snippet-mode
                                                'sql-mode)
                          (eglot-ensure)))))
  :config
  (add-to-list 'eglot-server-programs '(python-ts-mode . ("pylsp"))))

(use-package eldoc-box
  :ensure t
  :after eglot
  :hook (eglot-managed-mode . eldoc-box-hover-mode)
  :custom-face (eldoc-box-body ((t (:inherit 'variable-pitch :height 150))))
  :custom
  (eldoc-box-only-multi-line t)
  (eldoc-box-max-pixel-width 500))

(provide 'larsen-lsp)
