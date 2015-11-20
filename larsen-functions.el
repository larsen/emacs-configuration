;; ERC notifications

(defun osx-notify (title message)
  (start-process "osx-notify" nil "terminal-notifier" "-title" title "-message" message))

(defun my-erc-notify-hook (match-type nick message)
  (when (eq match-type 'current-nick)
    (unless (posix-string-match "^\\** *Users on #" message)
      (osx-notify (concat "ERC " (buffer-name (current-buffer)))
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

(provide 'larsen-functions)
