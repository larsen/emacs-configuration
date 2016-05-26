; (package-require 'dired+)
(require 'dired+)
(set-face-foreground 'diredp-file-name nil)
(setq-default diredp-hide-details-initially-flag nil)

; (setq dired-listing-switches "-lath")

(setq dired-dwim-target t)

(provide 'larsen-dired)
