;;;
;;; larsen-orgmode.el
;;;

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq
 ;; org-startup-indented t
 ;; org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
 org-ellipsis "  " ;; folding symbol
 org-pretty-entities t
 org-hide-emphasis-markers t
 ;; show actually italicized text instead of /italicized text/
 org-agenda-block-separator ""
 org-fontify-whole-heading-line t
 org-fontify-done-headline t
 org-fontify-quote-and-verse-blocks t)

(defun my-org-confirm-babel-evaluate (lang body)
            (not (string= lang "emacs-elisp")))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-todo-keywords
      '((sequence "TODO(!)" "ANALYSED" "DELEGATED" "IN PROGRESS(!)" "|" "DONE(!)" "CANCELED(!)")))
(setq org-log-into-drawer t)

(setq org-return-follows-link t)

(setq org-agenda-files (list "~/org/personal/"
                             "~/org/work/"
                             "~/org/work/idagio/"))

(setq org-agenda-custom-commands 
      '(("i" "Idagio TODO" tags-todo "idagio"
         ((org-agenda-files '("~/org/work/idagio/"))))))

(custom-set-variables
 '(org-twbs-htmlize-output-type 'css)
 '(org-html-htmlize-output-type 'css))

(defvar personal-website-directory-prefix "~/Dropbox/stefanorodighiero.net/")
(defun personal-website-absolute-directory (directory)
  (concat personal-website-directory-prefix directory))

(defvar personal-website-remote-directory-prefix "/ssh:larsen@home:/srv/www/stefanorodighiero.net/")
(defun personal-website-remote-absolute-directory (directory)
  (concat personal-website-remote-directory-prefix directory))

(defvar personal-website-navigation-header
  "        <div id=\"header\">
            <div id=\"logo\">
                <a href=\"/\">stefanorodighiero.net</a>
            </div>
            <div id=\"navigation\">
                <a href=\"//stefanorodighiero.net/personal.html\">About</a>
                <a href=\"//stefanorodighiero.net/stream\">Stream</a>
            </div>
        </div>"  )

(setq org-publish-project-alist
      `(
        ("website" 
         :components ("website-pages" "website-images"))
        
        ("website-pages"
         :base-directory ,(personal-website-absolute-directory "/")
         :base-extension "org"
         :exclude "posts"
         :publishing-function org-html-publish-to-html
         :publishing-directory ,(personal-website-remote-absolute-directory "/")
         :recursive t
         :html-preamble ,personal-website-navigation-header
         )

        ("website-images"
         :base-directory ,(personal-website-absolute-directory "images/")
         :base-extension "png\\|jpg\\|JPG\\|gif"
         :publishing-function org-publish-attachment
         :recursive t
         :publishing-directory ,(personal-website-remote-absolute-directory "images/")
         )

        ("orgfiles" 
         :base-directory ,(personal-website-absolute-directory "wiki/")
         :base-extension "org"
         :publishing-directory ,(personal-website-remote-absolute-directory "wiki/")
         :publishing-function org-html-publish-to-html
         :recursive t
         :html-preamble ,personal-website-navigation-header
         )

        ("css"
         :base-directory ,(personal-website-absolute-directory "wiki/css/")
         :base-extension "css"
         :publishing-directory ,(personal-website-remote-absolute-directory "wiki/css/")
         :publishing-function org-publish-attachment
         )

        ("images"
         :base-directory ,(personal-website-absolute-directory "wiki/images/")
         :base-extension "png\\|jpg\\|JPG\\|gif"
         :publishing-directory ,(personal-website-remote-absolute-directory "wiki/images/")
         :publishing-function org-publish-attachment
         :recursive t
         )

        ("js"
         :base-directory ,(personal-website-absolute-directory "wiki/MathJax/")
         :base-extension "js"
         :recursive t
         :publishing-directory ,(personal-website-remote-absolute-directory "wiki/js/")
         :publishing-function org-publish-attachment
         )

        ("wiki" 
         :components ("orgfiles" "css" "js" "images"))

        ("stream-orgfiles"
         :base-directory ,(personal-website-absolute-directory "stream/")
         :base-extension "org"
         :publishing-directory ,(personal-website-remote-absolute-directory "stream/")
         :publishing-function org-html-publish-to-html
         :org-html-postamble nil
         :html-preamble ,personal-website-navigation-header
         )

        ("stream-images"
         :base-directory ,(personal-website-absolute-directory "stream/images/")
         :base-extension "png\\|jpg\\|JPG\\|gif\\|svg"
         :publishing-directory ,(personal-website-remote-absolute-directory "stream/images/")
         :publishing-function org-publish-attachment
         )

        ("stream" 
         :components ("stream-orgfiles" "stream-images")) ))

;; (setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(require 'org-capture)
(setq org-capture-templates
      `(("n" "Note" entry
         (file "~/org/personal/notes.org")
         "* %t\n%i" :immediate-finish t :empty-lines 1)
        ("t" "Todo item" entry
               (file+olp
                "~/org/work/idagio/activities.org"
                ,(my-week-heading
                 (string-to-number (my-current-week-number)))
                ,(my-today-heading))
               "*** TODO %i%?"
               :jump-to-captured t)))

(setq org-refile-targets (quote ((nil :maxlevel . 2)
                                 (org-agenda-files :maxlevel . 2))))
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

(setq org-agenda-span 14)

; Org Babel

(require 'ox)

(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")
(org-babel-do-load-languages
      'org-babel-load-languages
      '((perl . t)
        (shell . t)
        (python . t)
        (sql . t)
        (gnuplot . t)
        (R . t)))

;; See https://github.com/bruceravel/gnuplot-mode/issues/31
(setq gnuplot-help-xpm nil
      gnuplot-line-xpm nil
      gnuplot-region-xpm nil
      gnuplot-buffer-xpm nil
      gnuplot-doc-xpm nil)

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

;; Experimental
;; a more natural way to use indirect buffers
;; not sure about the keybinding

(defun open-subtree-in-another-window ()
  (interactive)
  (org-tree-to-indirect-buffer)
  (windmove-right))

;; Special functions to insert week-based object entries

(require 'cal-iso)
(require 'cl)
(setq system-time-locale "en_US.UTF-8")

(defun my-calendar-iso-day-to-gregorian (week-number week-day)
  "Given a week number and a week day (expressed as an integer in
the range 0..6 (1 = Monday, 2 = Tuesday, ..., 0 = Sunday), returns
the corresponding gregorian date"
  (calendar-gregorian-from-absolute
   (calendar-iso-to-absolute (list week-number week-day 2019))))

(defun my-gregorian-date-as-string (date)
  (cl-destructuring-bind (month day year) date
  (format "%4d-%02d-%02d" year month day)))

(defun my-current-week-number ()
  (format-time-string "%V" (current-time)))

(defun my-week-heading (week-number)
  (let ((week-begin-date (my-calendar-iso-day-to-gregorian week-number 1))
        (week-end-date (my-calendar-iso-day-to-gregorian week-number 5)))
    (format "Week %d (%s - %s)"
            week-number
            (my-gregorian-date-as-string week-begin-date)
            (my-gregorian-date-as-string week-end-date))))

(defun my-insert-current-week-item (week-number)
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

(provide 'larsen-orgmode)
