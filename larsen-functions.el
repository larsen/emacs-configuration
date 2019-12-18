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
  "Change splitting from vertical to horizontal and vice-versa"
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


;; https://www.emacswiki.org/emacs/UnfillParagraph

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))


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
    (json-read)))


;; Webjump configuration

(require 'cl)
(require 'filenotify)
(require 'webjump)

(defun get-link-and-description-from-entry (entry)
  "Given a 'org-mode' ENTRY possibly bearing a URL, return a pair link and description."
  (let ((regex "\\[\\[\\(.*\\)\\]\\[\\(.*\\)\\]\\]")
        (item-string (cdr (assoc "ITEM" entry))))
    (when (not (null item-string))
      (when (string-match regex item-string)
        `(,(match-string 2 item-string) . ,(match-string 1 item-string))))))

(defun get-webjump-sites ()
  "Scan through my list of external links and return a list of pairs <link,description>."
  (let ((regex "\\[\\[\\(.*\\)\\]\\[\\(.*\\)\\]\\]"))
    (with-current-buffer
        (find-file-noselect "~/Dropbox/stefanorodighiero.net/links.org")
      (loop for entry in (org-map-entries 'org-entry-properties nil 'file)
            collect (get-link-and-description-from-entry entry)))))

(defun update-webjump-sites ()
  "Update webjumb-sites using my local list of bookmarks as a 'org-mode' document."
  (interactive)
  (setq webjump-sites (get-webjump-sites)))

;; plumbing for file-notify
(defun cb/update-webjump-sites (event)
  "Callback function to connect change EVENT (not used) to #'update-webjump-sites."
  (update-webjump-sites))

(file-notify-add-watch "~/www/stefanorodighiero.net/links.org"
                       '(change)
                       #'cb/update-webjump-sites)

;; Initialize webjump sites when we are starting Emacs
(update-webjump-sites)

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

(setq browse-url-browser-function 'eww-browse-url
      browse-url-generic-program "chromium-browser")

;; dired util
;; from https://www.bennee.com/~alex/blog/2018/04/07/working-with-dired/

(defun my-dired-frame (directory)
  "Open up a dired frame on DIRECTORY which closes on exit."
  (interactive)
  (switch-to-buffer (dired directory))
  (split-window-right)
  (local-set-key
   (kbd "TAB")
   (lambda ()
     (interactive)
     (switch-window)))
  (local-set-key
   (kbd "C-x C-c")
   (lambda ()
     (interactive)
     (kill-this-buffer)
     (delete-frame))))

;; https://emacsredux.com/blog/2013/06/21/eval-and-replace/

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))


;; Caveman args list parsing
(defun arg-resolver (arg-properties idx)
  (cond ((eq :default (car arg-properties))
         `(or (nth ,idx command-line-args)
              ,(cadr arg-properties)))
        ((eq :mandatory (car arg-properties))
         `(or (nth ,idx command-line-args)
              (error (or ,(cadr arg-properties)
                         "Undefined error"))))
        (t (nth idx command-line-args))))

(defmacro with-positional-args (arglist &rest body)
  "Execute the forms in BODY after lexically binding command line
arguments in order, according to what is specified in ARGLIST.
ARGLIST is the list of variables that will be bound to the
corresponding command line argument."
  `(let ,(loop for a in arglist
               for idx from 3
               collect (let ((arg-name (car a))
                             (arg-properties (cdr a)))
                         `(,arg-name ,(arg-resolver
                                       arg-properties idx))))
     ,@body))


;; Some PDF utils

(defun annotation-contents (annot)
  "Return the text content in ANNOT. Newlines are converted to
spaces."
  (replace-regexp-in-string "\n" " " (cdr (assoc 'contents annot))))

(defun get-all-annotations (file)
  "Return all annotations saved in FILE, as a concatenation of
their contents."
  (let* ((annots (with-current-buffer (find-file file)
                   (pdf-view-mode)
                   (pdf-annot-getannots nil nil))))
    (mapconcat 'annotation-contents annots " ")))

(provide 'larsen-functions)
