
(use-package bind-key)

(bind-keys :prefix "C-c e"
           :prefix-map my-elisp-map
           ("b" . eval-buffer))

(provide 'larsen-elisp)
