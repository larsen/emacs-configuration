(use-package elfeed
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

(setq-default elfeed-search-filter "@1-week-ago +unread -clutter")
(setq url-queue-timeout 30)
(setq elfeed-use-curl t)

;; (setq browse-url-browser-function 'eww-browse-url)

(load "elfeed-subscriptions")

(setq shr-width 80)

(defface interesting-elfeed-entry
  '((t :foreground "#f77"))
  "interesting elfeed entry")

(push '(interesting interesting-elfeed-entry)
      elfeed-search-face-alist)

(defface personal-elfeed-entry
  '((t :foreground "#3C913C"))
  "personal elfeed entry")

(push '(personal personal-elfeed-entry)
      elfeed-search-face-alist)

;; From http://heikkil.github.io/blog/2015/05/09/notes-from-elfeed-entries/

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


;; (defun my-elfeed-show-entry (buff)
;;   (popwin:popup-buffer buff
;;                        :position 'right
;;                        :width 0.5
;;                        :dedicated t
;;                        :stick t))

;; (defun my-elfeed-kill-buffer ()
;;   (interactive)
;;   (let ((window (get-buffer-window (get-buffer "*elfeed-entry*"))))
;;     (kill-buffer (get-buffer "*elfeed-entry*"))
;;     (delete-window window)))

;; (setq-default elfeed-show-entry-switch #'my-elfeed-show-entry
;;               elfeed-show-entry-delete #'my-elfeed-kill-buffer)

;; Found in the upstream repo
;; https://github.com/skeeto/elfeed/commit/d773794ae8a24048aac4a5e3146a884b4b4cdd63
;; TODO Test & Fix

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

;; (use-package 'elfeed-goodies)
;; (elfeed-goodies/setup)

(use-package elfeed-webkit
  :ensure
  :bind (:map elfeed-show-mode-map
              ("%" . elfeed-webkit-toggle)))

(provide 'larsen-elfeed)
