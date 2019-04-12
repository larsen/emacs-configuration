;;;
;;; larsen-orgmode.el
;;;

;; I have custom changes not yet merged into master
(add-to-list 'load-path "~/build/org-mode/lisp/")

(require 'org)
(require 'org-capture)
(require 'org-bullets)
(require 'cal-iso)
(require 'cl)
(require 'ox)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "emacs-elisp")))

;; Special functions to insert week-based object entries

(defun my-calendar-iso-day-to-gregorian (week-number week-day)
  "Return gregorian day corresponding to WEEK-NUMBER and WEEK-DAY.
WEEK-DAY is expressed as an integer in the range 0..6:
1 = Monday, 2 = Tuesday, ..., 0 = Sunday."
  (calendar-gregorian-from-absolute
   (calendar-iso-to-absolute (list week-number week-day 2019))))

(defun my-gregorian-date-as-string (date)
  (cl-destructuring-bind (month day year) date
  (format "%4d-%02d-%02d" year month day)))

(defun my-current-week-number ()
  "Return ISO8601 week number for today."
  (format-time-string "%V" (current-time)))

(defun my-week-heading (week-number)
  "Return a string representing the heading for WEEK-NUMBER todo entries subtree."
  (let ((week-begin-date (my-calendar-iso-day-to-gregorian week-number 1))
        (week-end-date (my-calendar-iso-day-to-gregorian week-number 5)))
    (format "Week %d (%s - %s)"
            week-number
            (my-gregorian-date-as-string week-begin-date)
            (my-gregorian-date-as-string week-end-date))))

(defun my-today-heading ()
  "Return a string representing the heading for today's todo entries subtree."
  (format-time-string "%A" (current-time)))

(org-babel-do-load-languages
      'org-babel-load-languages
      '((perl . t)
        (shell . t)
        (python . t)
        (sql . t)
        (gnuplot . t)
        (R . t)))

(defun my-insert-current-week-item (week-number)
  "Insert 1-week-worth structure for entering todo entries for WEEK-NUMBER."
  (interactive "P")
  (insert (format "* %s\n" (my-week-heading week-number)))
  (dolist (week-day-name '(Monday
                           Tuesday
                           Wednesday
                           Thursday
                           Friday
                           Saturday
                           Sunday))
     (insert (format "** %s\n" week-day-name))))

(defun my-org-set-item-deadline (week-number)
  (let ((week-end-date (my-calendar-iso-day-to-gregorian week-number 5)))
    (org-deadline nil (my-gregorian-date-as-string week-end-date))))

(defun my-org-set-tree-deadline (week-number)
  (interactive "P")
  (org-map-entries (lambda () (my-org-set-item-deadline week-number)) nil 'tree))

;; Experimental
;; a more natural way to use indirect buffers
;; not sure about the keybinding

(defun open-subtree-in-another-window ()
  "Open subtree at point into another window."
  (interactive)
  (org-tree-to-indirect-buffer)
  (windmove-right))

(defun my-find-today-heading ()
  (let ((m (org-find-olp `(,(my-week-heading
                             (string-to-number (my-current-week-number)))
                           ,(my-today-heading))
                         ;; In current buffer, because we're using file+function
                         t)))
    (set-buffer (marker-buffer m))
    (org-capture-put-target-region-and-position)
    (widen)
    (goto-char m)
    (set-marker m nil)))

(setq org-pretty-entities t
      org-ellipsis " ▹ " ;; folding symbol
      org-hide-emphasis-markers t
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t
      ;; show actually italicized text instead of /italicized text/
      org-agenda-block-separator ""
      org-log-done t
      org-log-into-drawer t
      org-return-follows-link t
      org-todo-keywords '((sequence "TODO(!)"
                                    "ANALYSED"
                                    "DELEGATED"
                                    "IN PROGRESS(!)"
                                    "|"
                                    "DONE(!)"
                                    "CANCELED(!)"))
      org-agenda-files (list "~/org/personal/"
                             "~/org/work/"
                             "~/org/work/idagio/")
      org-agenda-custom-commands '(("i" "Idagio TODO" tags-todo "idagio"
                                    ((org-agenda-files '("~/org/work/idagio/")))))
      system-time-locale "en_US.UTF-8"
      org-capture-templates `(("n" "Note" entry
                               (file "~/org/personal/notes.org")
                               "* %t\n%i" :immediate-finish t :empty-lines 1)
                              ("t" "Todo item" entry
                               (file+function "~/org/work/idagio/activities.org"
                                              my-find-today-heading)
                               "*** TODO %i%?"
                               :jump-to-captured t))
      org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 2)))
      org-refile-use-outline-path t
      org-outline-path-complete-in-steps nil
      org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate
      org-agenda-span 14
      org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar"
      ;; org-default-notes-file (concat org-directory "/notes.org")
 
      ;; See https://github.com/bruceravel/gnuplot-mode/issues/31
      gnuplot-help-xpm nil
      gnuplot-line-xpm nil
      gnuplot-region-xpm nil
      gnuplot-buffer-xpm nil
      gnuplot-doc-xpm nil)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(custom-set-variables
 '(org-confirm-babel-evaluate nil))

(add-to-list 'org-latex-classes
             '("tufte-handout"
               "\\documentclass{tufte-book}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(provide 'larsen-orgmode)
