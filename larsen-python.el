;;; larsen-python
;;; Loads elpy

(require 'elpy)

(elpy-enable)

(setq elpy-rpc-backend "jedi")

(setq-default py-indent-offset 2)

(provide 'larsen-python)
