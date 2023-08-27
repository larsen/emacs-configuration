(use-package bind-key)

(bind-keys :prefix "C-c e"
           :prefix-map my-elisp-map
           ("m" . macrostep-mode)
           ("b" . eval-buffer))

(add-hook 'ielm-mode-hook
          (lambda () (paredit-mode t)))

(provide 'larsen-elisp)
