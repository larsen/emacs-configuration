(use-package elfeed
  :ensure t
  :config
  (setq-default elfeed-search-filter "@1-week-ago +unread -clutter")
  (load "elfeed-subscriptions")
  (defun elfeed-link-title (entry)
    "Copy the entry title and URL as org link to the clipboard."
    (interactive)
    (let* ((link (elfeed-entry-link entry))
           (title (elfeed-entry-title entry))
           (titlelink (concat "[[" link "][" title "]]")))
      (when titlelink
        (kill-new titlelink)
        (x-set-selection 'PRIMARY titlelink)
        (message "Yanked: %s" titlelink))))

  (defun elfeed-db-get-all-tags ()
    "Return a list of all tags currently in the database."
    (let ((table (make-hash-table :test 'eq)))
      (with-elfeed-db-visit (e _)
        (dolist (tag (elfeed-entry-tags e))
          (setf (gethash tag table) tag)))
      (let ((tags ()))
        (maphash (lambda (k _) (push k tags)) table)
        (cl-sort tags #'string< :key #'symbol-name))))

  (defun elfeed-helm-tags ()
    (interactive)
    (helm :sources '(((name . "elfeed tags")
                      (volatile)
                      (elfeed-db-get-all-tags)))))
  :custom
  (url-queue-timeout 30)
  (elfeed-use-curl t)
  (shr-width 80)
  :custom-face
  (interesting-elfeed-entry ((t :foreground "#f77")) "interesting elfeed entry")
  (personal-elfeed-entry ((t :foreground "#3C913C")) "personal elfeed entry")
  :bind (:map elfeed-show-mode-map
              ("l" . (lambda ()
                       (interactive)
                       (elfeed-link-title elfeed-show-entry)))
              ("f" . (lambda ()
                       (interactive)
                       (message "Original feed: %s" (elfeed-entry-feed elfeed-show-entry))))
              ("D" . (lambda ()
                       (interactive)
                       (shr-download-image)))
              ("b" . (lambda (&optional use-generic-p)
                       (interactive "P")
                       (split-window-right)
                       (let ((link (elfeed-entry-link elfeed-show-entry)))
                         (when link
                           (message "Sent to browser: %s" link)
                           (if use-generic-p
                               (browse-url-generic link)
                             (browse-url link))))))))

(use-package elfeed-webkit
  :ensure
  :bind (:map elfeed-show-mode-map
              ("%" . elfeed-webkit-toggle)))

(provide 'larsen-elfeed)
