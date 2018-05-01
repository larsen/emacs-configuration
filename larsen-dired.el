; (package-require 'dired+)

(setq dired-listing-switches "-lath")

(setq dired-dwim-target t)

(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

(provide 'larsen-dired)
