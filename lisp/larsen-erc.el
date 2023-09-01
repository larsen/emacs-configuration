(load "~/.ercpass")

(use-package erc-image
  :config
  (erc-update-modules)
  (defalias 'notify
    (if (eq system-type 'darwin)
        (apply-partially 'osx-notify)
      (apply-partially 'linux-notify)))
  (defun my-erc-notify-hook (match-type nick message)
    (when (eq match-type 'current-nick)
      (unless (posix-string-match "^\\** *Users on #" message)
        (notify (concat "ERC " (buffer-name (current-buffer)))
                message))))
  (add-hook 'erc-text-matched-hook 'my-erc-notify-hook)
  :custom
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-fill-function 'erc-fill-static)
  (erc-fill-static-center 16)
  (erc-prompt (lambda () (concat "[" (buffer-name) "]"))))





; irc.libera.chat
; 6697

(provide 'larsen-erc)
