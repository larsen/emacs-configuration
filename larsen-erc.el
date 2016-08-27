(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(add-hook 'erc-text-matched-hook 'my-erc-notify-hook)

;; (setq erc-autojoin-channels-alist '(("freenode.net" "#emacs" "#erc")))

;; Make C-c RET (or C-c C-RET) send messages instead of RET. This has
;; been commented out to avoid confusing new users.
;; (define-key erc-mode-map (kbd "RET") nil)
;; (define-key erc-mode-map (kbd "C-c RET") 'erc-send-current-line)
;; (define-key erc-mode-map (kbd "C-c C-RET") 'erc-send-current-line)

(require 'erc-image)
(add-to-list 'erc-modules 'image)
(erc-update-modules)

(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 16)

(setq erc-prompt (lambda () (concat "[" (buffer-name) "]")))

(provide 'larsen-erc)
