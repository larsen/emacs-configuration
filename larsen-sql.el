(require 'sql)
(require 'sqlup-mode)

;; emacs-sql-indent was installed from github's repo
;; using quelpa

;; (package-initialize)
;; (if (require 'quelpa nil t)
;;     (quelpa-self-upgrade)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
;;     (eval-buffer)))

;; (quelpa '(emacs-sql-indent
;;           :fetcher github
;;           :repo "alex-hhh/emacs-sql-indent"))

;; When in sql-mode, activate emacs-sql-indent
(add-hook 'sql-mode-hook 'sqlind-minor-mode)
;; and capitalize keywords in SQL mode
(add-hook 'sql-mode-hook 'sqlup-mode)

;; Capitalize keywords in an interactive session (e.g. psql)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;; Set a global keyword to use sqlup on a region
(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)

(require 'cl)
(require 'filenotify)

(defun is-comment? (line)
  "Return t if LINE is a comment (it starts with #)."
  (when (string-match "^#" line)
    t))

(defun get-connection-alist (filename)
  "Gets PG connections details from ~/.pgpass file (FILENAME)."
  (with-current-buffer (find-file-noselect filename)
        (let ((lines (split-string (buffer-string) "\n" t)))
          (when lines
            (loop for l in lines
                  when (not (is-comment? l))
                  collect (destructuring-bind
                              (host port db user password) (split-string l ":" nil)
                            `(,(format "%s-%s" host db) ; label is host + db name
                              (sql-product 'postgres)
                              (sql-port ,(string-to-number port))
                              (sql-server ,host)
                              (sql-user ,user)
                              (sql-database ,db))))))))

(setq sql-connection-alist (get-connection-alist "~/.pgpass"))

(setq sql-mysql-program "/usr/local/mysql/bin/mysql")

(file-notify-add-watch "~/.pgpass"
                       '(change)
                       (lambda (evt) (get-connection-alist "~/.pgpass")))

(defun my/get-connection-dsn (connection-name)
  "Return a DSN given a CONNECTION-NAME."
  (interactive (list
                (completing-read "Enter connection name "
                                 sql-connection-alist)))
  (let* ((connection-details (cdr (assoc connection-name sql-connection-alist)))
         (connection-dsn
          (format "postgresql://%s:PASSWORD@%s:%d/%s"
                  (car (cdr (assoc 'sql-user connection-details)))
                  (car (cdr (assoc 'sql-server connection-details)))
                  (car (cdr (assoc 'sql-port connection-details)))
                  (car (cdr (assoc 'sql-database connection-details))))))
    (kill-new connection-dsn)
    (message (format "DSN %s copied to kill-ring" connection-dsn))))


(defun my/get-connection-dblink (connection-name)
  "Return a dblink string given a CONNECTION-NAME."
  (interactive (list
                (completing-read "Enter connection name "
                                 sql-connection-alist)))
  (let* ((connection-details (cdr (assoc connection-name sql-connection-alist)))
         (connection-dsn
          (format "dbname=%s\nhost=%s\nport=%s\nuser=%s\npassword=PASSWORD"
                  (car (cdr (assoc 'sql-database connection-details)))
                  (car (cdr (assoc 'sql-server connection-details)))
                  (car (cdr (assoc 'sql-port connection-details)))
                  (car (cdr (assoc 'sql-user connection-details))))))
    (kill-new connection-dsn)
    (message (format "dblink string %s copied to kill-ring" connection-dsn))))


(defun my-sql-save-history-hook ()
  (let ((lval 'sql-input-ring-file-name)
        (rval 'sql-product))
    (if (symbol-value rval)
        (let ((filename 
               (concat "~/.emacs.d/sql/"
                       (symbol-name (symbol-value rval))
                       "-history.sql")))
          (set (make-local-variable lval) filename))
      (error
       (format "SQL history will not be saved because %s is nil"
               (symbol-name rval))))))
 
(add-hook 'sql-interactive-mode-hook 'my-sql-save-history-hook)

(setq sql-sqlite-program "sqlite3")
(setq sql-send-terminator t)

(provide 'larsen-sql)
