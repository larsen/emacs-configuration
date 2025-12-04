
(use-package sly
  :ensure t
  :commands (sly)
  :custom
  (inferior-lisp-program "sbcl")
  (sly-lisp-implementations '(("sbcl" ("sbcl" "--dynamic-space-size" "8192")))))

(provide 'larsen-sly)
