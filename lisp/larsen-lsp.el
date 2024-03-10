(use-package eglot
  :hook ((prog-mode . (lambda ()
                        (unless (derived-mode-p 'emacs-lisp-mode
                                                'lisp-mode
                                                'makefile-mode
                                                'snippet-mode)
                          (eglot-ensure))))))

(use-package eldoc-box
  :hook (eglot-managed-mode . eldoc-box-hover-at-point-mode)
  :after eglot
  :custom-face (eldoc-box-body ((t (:inherit 'variable-pitch :height 200))))
  :custom
  (eldoc-box-only-multi-line t)
  (eldoc-box-max-pixel-width 500))

(provide 'larsen-lsp)
