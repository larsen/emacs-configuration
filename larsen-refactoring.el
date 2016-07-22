;; Functions to help Emacs Lisp refactoring

(defun insert-new-function (function-name body)
  (insert (pp `(defun ,function-name ,body))))

(defun get-region ()
  (buffer-substring-no-properties (mark) (point)))

(defun create-new-function (function-name)
  (interactive "sFunction name: ")
  (insert-new-function function-name
                       (eval (get-region))))

(provide 'larsen-refactoring)


