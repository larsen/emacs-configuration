(package-require 'bind-key)

(bind-keys :prefix "C-c e"
           :prefix-map my-elisp-map
           ("m" . macrostep-mode)
           ("b" . eval-buffer))

(provide 'larsen-elisp)
