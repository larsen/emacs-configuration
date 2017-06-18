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

(require 'cl)
(require 'filenotify)
(require 'webjump)
(defun get-webjump-sites ()
  (let ((regex "\\[\\[\\(.*\\)\\]\\[\\(.*\\)\\]\\]"))
    (with-current-buffer (find-file-noselect "~/Dropbox/stefanorodighiero.net/links.org")
      (loop for i in (org-map-entries 'org-entry-properties nil 'file)
            for item-string = (cdr (assoc "ITEM" i))
            if (and (not (null item-string))
                    (string-match regex item-string))
            collect `(,(match-string 2 item-string) . ,(match-string 1 item-string))))))

(defun update-webjump-sites ()
  (interactive)
  (setq webjump-sites (get-webjump-sites)))

(global-set-key (kbd "C-c j") 'webjump)

;; plumbing for file-notify
(defun cb/update-webjump-sites (event)
  (update-webjump-sites))

(file-notify-add-watch "~/www/stefanorodighiero.net/links.org"
                       '(change)
                       #'cb/update-webjump-sites)


;; uzbl interface (experimental)

(defun my-socat (message socket)
  (shell-command
   (format "echo '%s' | socat - unix-connect:%s" message socket)))

(defun my-uzbl-socket ()
  (first (sort 
          (directory-files "/tmp" t "uzbl_socket")
          (lambda (a b)
            (time-less-p (nth 5 (file-attributes a))
                         (nth 5 (file-attributes b)))))))

(defun my-uzbl-open-in-new-tab (uri &optional new-window)
  (let ((socket (my-uzbl-socket)))
    (when socket
      (my-socat (format "event NEW_TAB %s" uri)
                socket))))

(setq browse-url-browser-function 'my-uzbl-open-in-new-tab
      browse-url-generic-program "uzbl-tabbed")

(provide 'larsen-functions)

