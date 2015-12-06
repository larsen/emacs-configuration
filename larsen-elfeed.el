(setq-default elfeed-search-filter "@1-week-ago +unread")

(load "elfeed-subscriptions")

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

(define-key elfeed-search-mode-map "l"
  (lambda ()
    (interactive)
    (elfeed-link-title elfeed-show-entry)))


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

(provide 'larsen-elfeed)
