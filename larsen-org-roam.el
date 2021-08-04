(setq org-roam-v2-ack t)

(use-package org-roam)
(use-package org-roam-buffer)

(setq org-roam-directory "~/org/roam/")

(org-roam-setup)

(use-package websocket)
(add-to-list 'load-path "~/.emacs.d/private/org-roam-ui")
(use-package org-roam-ui)

(provide 'larsen-org-roam)
