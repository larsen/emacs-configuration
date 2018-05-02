(require 'sql)
(require 'sqlup-mode)

(eval-after-load "sql"
  (load-library "sql-indent"))

(add-hook 'sql-mode-hook '(lambda () (setq tab-width 4 indent-tabs-mode t)))

;; Capitalize keywords in SQL mode
(add-hook 'sql-mode-hook 'sqlup-mode)
;; Capitalize keywords in an interactive session (e.g. psql)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;; Set a global keyword to use sqlup on a region
(global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)

(require 'cl)

;; Gets PG connections details from ~/.pgpass file
(setq sql-connection-alist
      (with-current-buffer (find-file-noselect "~/.pgpass")
        (let ((lines (split-string (buffer-string) "\n" t)))
          (when lines
            (loop for l in lines
                  collect (destructuring-bind
                              (host port db user password) (split-string l ":" nil)
                            `(,(format "%s-%s" host db) ; label is host + db name
                              (sql-product 'postgres)
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
