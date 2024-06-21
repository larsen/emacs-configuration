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
  (org-roam-mode-section-functions (list #'org-roam-reflinks-section
                                         #'org-roam-unlinked-references-section))
  :config
  (org-roam-setup))

(use-package org-roam-ui
  :after org-roam
  :requires (org-roam websocket)
  :load-path "~/.emacs.d/private/org-roam-ui"
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t)
  (org-roam-ui-open-on-start nil))

;;; Utility functions to get content for the blog
;;; - TODO there's still some manual work to do after calling
;;;   my/paste-org-roam-node, should be automated
;;; - TODO does it do something funny with footnotes?

(defun my/remove-org-roam-links (buffer-as-string)
  (replace-regexp-in-string
   "\\[\\[id:.*\\]\\[\\(.*\\)\\]\\]" "\\1" buffer-as-string))

(defun my/paste-org-roam-node (initial-input &key no-links)
  (interactive)
  (let* ((file (org-roam-node-file (org-roam-node-read initial-input)))
         (raw-buffer (with-current-buffer (find-file-noselect file)
                       (goto-char (point-min))
                       (buffer-string))))
    (if no-links (my/remove-org-roam-links raw-buffer)
      raw-buffer)))

(provide 'larsen-org-roam)
