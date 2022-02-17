(setq org-roam-v2-ack t)

(use-package org-roam)

(setq org-roam-directory "~/org/roam/")

(org-roam-setup)

(use-package websocket)
(add-to-list 'load-path "~/.emacs.d/private/org-roam-ui")
(use-package org-roam-ui)

(setq org-roam-ui-sync-theme t
      org-roam-ui-follow t
      org-roam-ui-update-on-save t
      org-roam-ui-open-on-start t)

(setq org-roam-mode-section-functions
      (list #'org-roam-reflinks-section
            #'org-roam-unlinked-references-section
            ))

(provide 'larsen-org-roam)
