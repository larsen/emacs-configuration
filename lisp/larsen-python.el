;;; larsen-python

(use-package elpy
  :config (elpy-enable)
  :custom
  (elpy-rpc-backend "jedi")
  (elpy-use-ipython t)
  (elpy-rpc-virtualenv-path "~/work/idagio/.venv/")  ; or 'current?
  (elpy-modules '(elpy-module-sane-defaults
                  ; elpy-module-company
                  elpy-module-eldoc
                  elpy-module-highlight-indentation
                  elpy-module-pyvenv
                  elpy-module-yasnippet
                  elpy-module-django)))

(use-package pyvenv)

(use-package blacken
  :hook python-mode)

(use-package sphinx-doc)

(setq-default py-indent-offset 2)

(add-hook 'python-mode-hook  (lambda () (flycheck-mode -1)))
(add-hook 'python-mode-hook 'sphinx-doc-mode)

(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'larsen-python)
