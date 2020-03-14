(load "~/.ercpass")

(require 'erc-ring)
(erc-ring-mode)

(require 'erc-image)
;; (add-to-list 'erc-modules 'image)
;; (setq erc-image-inline-rescale 300)
(erc-update-modules)

(add-hook 'erc-text-matched-hook 'my-erc-notify-hook)

(setq erc-hide-list '("JOIN" "PART" "QUIT")
      erc-fill-function 'erc-fill-static
      erc-fill-static-center 16
      erc-prompt (lambda () (concat "[" (buffer-name) "]")))

(provide 'larsen-erc)
