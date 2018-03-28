(require 'sql)

(eval-after-load "sql"
  (load-library "sql-indent"))

(require 'cl)
(require 'cl-loop)

;; Gets PG connections details from ~/.pgpass file
(setq sql-connection-alist
      (with-current-buffer (find-file-noselect "~/.pgpass")
        (let ((lines (split-string (buffer-string) "\n" t)))
          (when lines
            (loop for l in lines
                  collect (destructuring-bind
                              (host port db user password) (split-string l ":" nil)
                            `(,db (sql-product 'postgres)
                                  (sql-port ,(string-to-number port))
                                  (sql-server ,host)
                                  (sql-user ,user)
                                  (sql-database ,db))))))))

(setq sql-mysql-program "/usr/local/mysql/bin/mysql")
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
(provide 'larsen-sql)
