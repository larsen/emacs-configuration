;; ERC notifications

(defun linux-notify (title &optional message)
  (start-process "linux-notify" nil "notify-send"
                 "-i" "/usr/local/share/emacs/25.0.92/etc/images/icons/hicolor/48x48/apps/emacs.png" title message))

(defun osx-notify (title &optional message)
  (start-process "osx-notify" nil "terminal-notifier" "-title" title "-message" message))

(defalias 'notify
  (if (eq system-type 'darwin)
      (apply-partially 'osx-notify)
    (apply-partially 'linux-notify)))

(defun my-erc-notify-hook (match-type nick message)
  (when (eq match-type 'current-nick)
    (unless (posix-string-match "^\\** *Users on #" message)
      (notify (concat "ERC " (buffer-name (current-buffer)))
       message))))

;; Windows layout

(defun change-split-type (split-fn &optional arg)
  "Change 3 window style from horizontal to vertical and vice-versa"
  (let ((bufList (mapcar 'window-buffer (window-list))))
    (select-window (get-largest-window))
    (funcall split-fn arg)
    (mapcar* 'set-window-buffer (window-list) bufList)))

(defun change-split-type-2 (&optional arg)
  "Changes splitting from vertical to horizontal and vice-versa"
  (interactive "P")
  (let ((split-type (lambda (&optional arg)
                      (delete-other-windows-internal)
                      (if arg (split-window-vertically)
                        (split-window-horizontally)))))
    (change-split-type split-type arg)))

(defvar *larsen/split-layout-type* t)

(defun toggle-split-layout ()
  (interactive)
  (progn (change-split-type-2 *larsen/split-layout-type*)
         (if *larsen/split-layout-type*
             (setq *larsen/split-layout-type* nil)
           (setq *larsen/split-layout-type* t))))

(global-set-key (kbd "M-<f1>") 'toggle-split-layout)


;; from https://github.com/magnars/.emacs.d/blob/master/defuns/file-defuns.el

(defun find-or-create-file-at-point-other-window ()
  "Guesses what parts of the buffer under point is a file name and opens it."
  (interactive)
  (find-file-other-window (file-name-at-point)))

(defun file-name-at-point ()
  (save-excursion
    (let* ((file-name-regexp "[./a-zA-Z0-9\-_~]")
           (start (progn
                    (while (looking-back file-name-regexp)
                      (forward-char -1))
                    (point)))
           (end (progn
                  (while (looking-at file-name-regexp)
                    (forward-char 1))
                  (point))))
      (buffer-substring start end))))


;; utility to use with shr (eww, elfeed entry view, ...)

(require 'f)
;; (defun shr-download-image ()
;;   "Downloads to /tmp the image under point"
;;   (interactive)
;;   (let ((url (get-text-property (point) 'image-url)))
;;     (if (not url)
;;         (message "No image under point!")
;;       (url-retrieve url
;;                     (lambda (cbargs)
;;                       (progn (
;;                               (re-search-forward "\r?\n\r?\n")
;;                               (write-region
;;                                (point) (point-max)
;;                                (concat "~/Pictures/elfeed/"
;;                                        (f-filename
;;                                         (url-filename
;;                                          (url-generic-parse-url
;;                                           (plist-get cbargs 'image-url)))))))))
;;                     '(image-url url)))))

(defun shr-download-image ()
  "Downloads the image under point"
  (interactive)
  (let ((url (get-text-property (point) 'image-url)))
    (if (not url)
        (message "No image under point!")
      (url-copy-file url (expand-file-name (url-file-nondirectory url)
                                           "~/Pictures/elfeed/")))))

;; Generic function to get JSON data from a URI

(require 'json)
(defun get-json-data (url)
  (with-current-buffer
      (url-retrieve-synchronously url)
    (goto-char (+ 1 url-http-end-of-headers))
    (json-read-object)))


;; (defun get-webjump-sites ()
;;   (with-current-buffer (get-file-buffer "~/Dropbox/stefanorodighiero.net/links.org")
;;     (delq nil
;;           (mapcar
;;            (lambda (i)
;;              (let ((item-string (cdr (assoc "ITEM" i)))
;;                    (regex "\\[\\[\\(.*\\)\\]\\[\\(.*\\)\\]\\]"))
;;                (if (posix-string-match regex item-string)
;;                    `(,(match-string 2 item-string) . ,(match-string 1 item-string)))))
;;            (org-map-entries 'org-entry-properties nil 'file)))))

(require 'cl)
(require 'webjump)
(defun get-webjump-sites ()
  (let ((regex "\\[\\[\\(.*\\)\\]\\[\\(.*\\)\\]\\]"))
    (with-current-buffer (get-file-buffer "~/Dropbox/stefanorodighiero.net/links.org")
      (loop for i in (org-map-entries 'org-entry-properties nil 'file)
            for item-string = (cdr (assoc "ITEM" i))
            if (string-match regex item-string)
            collect `(,(match-string 2 item-string) . ,(match-string 1 item-string))))))

(setq webjump-sites
      (append (get-webjump-sites) webjump-sample-sites))

(global-set-key (kbd "C-c j") 'webjump)

(provide 'larsen-functions)

