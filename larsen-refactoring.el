;; Functions to help Emacs Lisp refactoring

(defun insert-new-function-definition (function-name body)
  "Add a new function in the buffer, given a name and a body"
  (insert
   (with-output-to-string
     (progn (newline)
            (set-mark (point))
            (insert "(defun ")
            (insert function-name)
            (insert "()")
            (newline)
            (insert body)
            (insert ")")
            (newline)
            (indent-region (mark) (point))))))

(defun get-region ()
  "Captures and delete the region between mark and point"
  (filter-buffer-substring (mark) (point) 1))

(defun current-line-empty-p ()
  (save-excursion
    (beginning-of-line)
    (looking-at "[[:space:]]*$")))

(defun move-to-empty-point ()
  "Move point to the first point outside of a form, before the
current point"
  (while (current-line-empty-p) (previous-line)))

(defun create-new-function (function-name)
  "Creates a new function definition, given a selection. Removes
  the selection and replaces it with a call to the newly created function"
  (interactive "sFunction name: ")
  (let ((code (get-region)))
    (progn
      (save-excursion
        (progn
          (move-to-empty-point)
          (insert-new-function-definition function-name code)
          (newline)))
      (insert "(" function-name " )"))))

(provide 'larsen-refactoring)


