;;; larsen-python

(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

(use-package python-ts-mode
  :ensure t
  :hook ((python-ts-mode . company-mode)))

(use-package python-black
  :hook (python-ts-mode . python-black-on-save-mode))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode t)

  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3"))))
  :custom-face
  (font-lock-comment-face ((t (:inherit 'variable-pitch :default-height 200)))))

(provide 'larsen-python)
