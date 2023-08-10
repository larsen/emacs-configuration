;;;
;;; larsen-orgmode.el
;;;

;; I have custom changes not yet merged into master
;; (add-to-list 'load-path "~/build/org-mode/lisp/")

(use-package org)
(use-package org-capture)
(use-package org-bullets)
(use-package org-agenda)
(use-package org-super-agenda)
(use-package org-download)
(use-package ob-ditaa)
(use-package cal-iso)
(use-package cl)
(use-package ox)

(add-to-list 'load-path "/home/stefano/.emacs.d/elpa/org-download-20220906.1929/")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "emacs-elisp")))

;; Special functions to insert week-based object entries

(defun current-year ()
  (nth 5 (decode-time (current-time))))

(defun my-calendar-iso-day-to-gregorian (week-number week-day)
  "Return gregorian day corresponding to WEEK-NUMBER and WEEK-DAY.
WEEK-DAY is expressed as an integer in the range 0..6:
1 = Monday, 2 = Tuesday, ..., 0 = Sunday."
  (calendar-gregorian-from-absolute
   (calendar-iso-to-absolute (list week-number week-day (current-year)))))

(defun my-gregorian-date-as-string (date)
  (cl-destructuring-bind (month day year) date
  (format "%4d-%02d-%02d" year month day)))

(defun my-current-week-number ()
  "Return ISO8601 week number for today."
  (format-time-string "%V" (current-time)))

(defvar day-properties-string ":PROPERTIES:\n:COLUMNS: %25ITEM %TAGS %PRIORITY %TODO\n:END:")

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

(defun one-week-from-today ()
  (format-time-string "%Y-%m-%d"
                    (+ (time-convert nil 'integer)
                       (* 3600 24 7))))

(org-babel-do-load-languages
      'org-babel-load-languages
      '((perl . t)
        (shell . t)
        (python . t)
        (sql . t)
        (sqlite . t)
        (gnuplot . t)
        (R . t)
        (plantuml . t)
        (http . t)
        (lisp . t)
        (dot . t)))

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
     (insert (format "** %s\n%s\n" week-day-name day-properties-string))))

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

(defun my-org-jump-to-today ()
  "Move cursor to the heading corresponding to today."
  (interactive)
  (my-find-today-heading))

(defun orgzly-files ()
  (file-expand-wildcards "~/Dropbox/orgzly/*.org"))

(setq org-pretty-entities t
      org-ellipsis " ▹ " ;; folding symbol
      org-hide-emphasis-markers t
      org-fontify-whole-heading-line t
      org-fontify-done-headline t
      org-fontify-quote-and-verse-blocks t
      ;; show actually italicized text instead of /italicized text/
      org-log-done t
      org-log-into-drawer t
      org-return-follows-link t
      org-export-backends '(md odt latex icalendar html ascii)
      org-todo-keywords '((sequence "TODO(!)"
                                    "ANALYSED"
                                    "DELEGATED"
                                    "IN PROGRESS(!)"
                                    "|"
                                    "DONE(!)"
                                    "CANCELED(!)"))
      system-time-locale "en_US.UTF-8"
      org-my-anki-file "~/org/personal/anki.org"
      org-capture-templates `(("n" "Note" entry
                               (file "~/org/personal/notes.org")
                               "* %t\n%i" :immediate-finish t :empty-lines 1)
                              ("N" "Note (interactive)" entry
                               (file "~/org/personal/notes.org")
                               "* %t\n%?" :empty-lines 1)
                              ("t" "Todo item" entry
                               (file+function "~/org/work/idagio/activities.org"
                                              my-find-today-heading)
                               "*** TODO %i%?\n     DEADLINE: <%(one-week-from-today)>"
                               :jump-to-captured t)
                              ("c" "Dev todo" entry
                               (file+function "~/org/work/idagio/activities.org"
                                              my-find-today-heading)
                               "*** TODO %i%?\n    %a")
                              ("r" "Reading todo" entry
                               (file "~/Dropbox/orgzly/reading.org")
                               "*** TODO %i%?\n    %a")
                              ("a" "Anki basic"
                               entry
                               (file+headline org-my-anki-file "Dispatch Shelf")
                               "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Default\n:END:\n** Front\n%?\n** Back\n%x\n"))

      org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 2)
                                 (orgzly-files :level . 1)))
      org-refile-use-outline-path 'file
      org-outline-path-complete-in-steps nil
      org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate
      org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar"

      ;; I had to switch to openjdk version "1.8.0_212"
      ;; to make PlantUML's jar work.
      ;; To switch (on Ubuntu): sudo update-alternatives --config java
      org-plantuml-jar-path "~/bin/plantuml.jar"
      ;; org-default-notes-file (concat org-directory "/notes.org")

      ;; See https://github.com/bruceravel/gnuplot-mode/issues/31
      gnuplot-help-xpm nil
      gnuplot-line-xpm nil
      gnuplot-region-xpm nil
      gnuplot-buffer-xpm nil
      gnuplot-doc-xpm nil
      org-confirm-babel-evaluate nil)

(setq
 org-agenda-skip-deadline-if-done t
 org-agenda-start-on-weekday nil
 org-agenda-start-day nil ;; i.e. today
 org-agenda-span 7
 org-agenda-files '("~/org/personal/"
                    "~/org/work/"
                    "~/org/work/idagio/activities.org")
 org-agenda-custom-commands '(("i" "Idagio TODO" tags-todo "idagio"
                               ((org-agenda-files '("~/org/work/idagio/"))))
                              ("w" "Weekly Agenda"
                               ((agenda "" ((org-super-agenda-groups
                                             '((:name "Today" :scheduled today))))))))
 org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Today"  ; Optionally specify section name
                :time-grid t  ; Items that appear on the time grid
                :todo "TODAY")  ; Items that have this TODO keyword
         (:name "Due Today"
                :deadline today
                :order 2)
         (:name "Meetings"
                :tag "meeting"
                :order 3)
         (:name "Sprint"
                :tag "sprint"
                :order 3)
         (:name "Soon"
                :deadline future
                :order 4)
         (:name "Overdue"
                :deadline past
                :order 7)))

(org-super-agenda-mode)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-to-list 'org-latex-classes
             '("tufte-handout"
               "\\documentclass{tufte-book}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


(setq-default org-download-method 'attach ;; Screenshots are stored in data/ directory by ID. Easier to manage
              org-download-heading-lvl nil
              org-download-delete-image-after-download t
              org-download-screenshot-method "echo"
              org-download-screenshot-file "/tmp/screenshot.png"
              org-download-image-org-width 800
              ;; Don't annotate
              org-download-annotate-function (lambda (link) ""))

;; My customized org-download to incorporate flameshot gui Workaround to setup flameshot, which enables annotation.
;; In flameshot, set filename as "screenshot", and the command as "flameshot gui -p /tmp", so that we always ends up
;; with /tmp/screenshot.png. Nullify org-download-screenshot-method by setting it to `echo', so that essentially we
;; are only calling (org-download-image org-download-screenshot-file).
(defun my-org-download-screenshot ()
  "Capture screenshot and insert the resulting file.
The screenshot tool is determined by `org-download-screenshot-method'."
  (interactive)
  (let ((tmp-file "/tmp/screenshot.png"))
    (delete-file tmp-file)
    (call-process-shell-command "flameshot gui -p /tmp/")
    ;; Because flameshot exit immediately, keep polling to check file existence
    (while (not (file-exists-p tmp-file))
      (sleep-for 2))
    (org-download-image tmp-file)))
(global-set-key (kbd "<C-print>") 'my-org-download-screenshot)

(provide 'larsen-orgmode)
