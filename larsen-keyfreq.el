(require 'keyfreq)

(setq keyfreq-excluded-commands
      '(self-insert-command
        abort-recursive-edit
        forward-char
        backward-char
        previous-line
        next-line))

(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(provide 'larsen-keyfreq)
