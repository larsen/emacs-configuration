;;; larsen-python

(use-package python-black
  :hook (python-ts-mode . python-black-on-save-mode))

(use-package pyvenv
  :ensure t
  :custom
  (python-interpreter "python3")
  :config
  (pyvenv-mode t)

  ;; Set correct Python interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter (concat pyvenv-virtual-env "bin/python3")))))
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python3")))))

(provide 'larsen-python)
