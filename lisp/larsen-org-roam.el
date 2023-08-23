(use-package org-roam
  :bind (("C-c m f" . org-roam-node-find)
         ("<f7>" . org-roam-node-find)
         ("C-c m i" . org-roam-node-insert)
         ("C-c m b" . org-roam-buffer-toggle)
         ("C-c m t" . org-roam-tag-add))
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/roam/")
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t)
  (org-roam-ui-open-on-start t)
  :config
  (org-roam-setup))

(use-package org-roam-ui
  :requires (org-roam websocket)
  :load-path "~/.emacs.d/private/org-roam-ui"
  :custom
  (org-roam-mode-section-functions (list #'org-roam-reflinks-section
                                         #'org-roam-unlinked-references-section
                                         )))

(provide 'larsen-org-roam)
