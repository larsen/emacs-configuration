(load "~/.ercpass")

(use-package erc-image)
(erc-update-modules)

(add-hook 'erc-text-matched-hook 'my-erc-notify-hook)

(setq erc-hide-list '("JOIN" "PART" "QUIT")
      erc-fill-function 'erc-fill-static
      erc-fill-static-center 16
      erc-prompt (lambda () (concat "[" (buffer-name) "]")))


; irc.libera.chat
; 6697

(provide 'larsen-erc)
