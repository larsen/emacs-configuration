;;; larsen-python

(use-package elpy)
(use-package pyvenv)
(use-package blacken)
(use-package sphinx-doc)

(elpy-enable)

(setq elpy-rpc-backend "jedi"
      elpy-use-ipython t
      elpy-rpc-virtualenv-path "~/work/idagio/.venv37/"  ; or 'current?
      elpy-modules '(elpy-module-sane-defaults
                     elpy-module-company
                     elpy-module-eldoc
                     elpy-module-highlight-indentation
                     elpy-module-pyvenv
                     elpy-module-yasnippet
                     elpy-module-django))

(setq-default py-indent-offset 2)

(add-hook 'python-mode-hook 'blacken-mode)
(add-hook 'python-mode-hook  (lambda () (flycheck-mode -1)))
(add-hook 'python-mode-hook 'sphinx-doc-mode)


(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'larsen-python)
