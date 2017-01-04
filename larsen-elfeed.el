(require 'elfeed)
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

(define-key elfeed-show-mode-map "l"
  (lambda ()
    (interactive)
    (elfeed-link-title elfeed-show-entry)))

(define-key elfeed-show-mode-map "D"
  (lambda ()
    (interactive)
    (shr-download-image)))

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

;; (require 'elfeed-goodies)
;; (elfeed-goodies/setup)

(provide 'larsen-elfeed)
