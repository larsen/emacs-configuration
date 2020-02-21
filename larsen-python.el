;;; larsen-python
;;; Loads elpy

(require 'elpy)

(elpy-enable)

(setq elpy-rpc-backend "jedi")

(setq-default py-indent-offset 2)

(add-hook 'python-mode-hook 'blacken-mode)
(add-hook 'python-mode-hook  (lambda () (flycheck-mode -1)))

;; (setq elpy-rpc-virtualenv-path 'current)
(setq elpy-rpc-virtualenv-path "~/work/idagio/.venv37/")

(when (load "flycheck" t t)
  ; (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(provide 'larsen-python)
