;;;
;;; larsen-orgmode.el
;;;

;; I have custom changes not yet merged into master
;; (add-to-list 'load-path "~/build/org-mode/lisp/")

(use-package org
  :mode ("\\.org$" . org-mode)
  :bind (("C-M-l" . open-subtree-in-another-window)
         ("C-c <right>" . open-subtree-in-another-window)
         ("C-c r" . org-refile)
         ("C-c l" . org-store-link))
  :custom
  (org-pretty-entities t)
  (org-ellipsis "…") ;; folding symbol

  (org-hide-emphasis-markers t)
  (org-fontify-whole-heading-line t)
  (org-fontify-done-headline t)
  (org-fontify-quote-and-verse-blocks t)
  (org-log-done t)
  (org-log-into-drawer t)
  (org-return-follows-link t)
  (org-export-backends '(md odt latex icalendar html ascii))
  (org-todo-keywords '((sequence "TODO(!)"
                                 "ANALYSED"
                                 "DELEGATED"
                                 "IN PROGRESS(!)"
                                 "|"
                                 "DONE(!)"
                                 "CANCELED(!)")))
  (system-time-locale "en_US.UTF-8")
  (org-my-anki-file "~/org/personal/anki.org")
  (org-refile-targets (quote ((nil :maxlevel . 2)
                              (org-agenda-files :maxlevel . 2)
                              (orgzly-files :level . 1))))
  (org-refile-use-outline-path 'file)
  (org-outline-path-complete-in-steps nil)
  (org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

      ;; I had to switch to openjdk version "1.8.0_212"
      ;; to make PlantUML's jar work.
      ;; To switch (on Ubuntu): sudo update-alternatives --config java

  (org-plantuml-jar-path "~/bin/plantuml.jar")
      ;; org-default-notes-file (concat org-directory "/notes.org")

      ;; See https://github.com/bruceravel/gnuplot-mode/issues/31

  (gnuplot-help-xpm nil)
  (gnuplot-line-xpm nil)
  (gnuplot-region-xpm nil)
  (gnuplot-buffer-xpm nil)
  (gnuplot-doc-xpm nil)
  (org-confirm-babel-evaluate nil))

(use-package org-capture
  :requires org
  :bind (("C-c c" . org-capture))
  :custom
  (org-capture-templates `(("n" "Note" entry
                            (file "~/org/personal/notes.org")
                            "* %t\n%i" :immediate-finish t :empty-lines 1)
                           ("N" "Note (interactive)" entry
                            (file "~/org/personal/notes.org")
                            "* %t\n%?" :empty-lines 1)
                           ("t" "Todo item" entry
                            (file "~/org/personal/todo.org")
                            "*** TODO %i%?\n     DEADLINE: <%(one-week-from-today)>"
                            :jump-to-captured t)
                           ("r" "Reading todo" entry
                            (file "~/Dropbox/orgzly/reading.org")
                            "*** TODO %i%?\n    %a")
                           ("a" "Anki basic"
                            entry
                            (file+headline org-my-anki-file "Dispatch Shelf")
                            "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Default\n:END:\n** Front\n%?\n** Back\n%x\n"))))

(use-package org-modern
  :hook (org-mode . org-modern-mode))

(use-package org-agenda
  :bind (("C-c a" . org-agenda))
  :custom
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-start-on-weekday nil)
  (org-agenda-start-day nil) ;; i.e. today
  (org-agenda-span 7)
  (org-agenda-files '("~/org/personal/"
                      "~/org/orgzly/errand.org"
                      "~/org/orgzly/work.org"
                      "~/org/work/")))

(use-package org-super-agenda
  :config (org-super-agenda-mode)
  :custom
  (org-super-agenda-groups
   '(;; Each group has an implicit boolean OR operator between its selectors.
     (:name "Due Today"
            :deadline today
            :time-grid t
            :order 2)
     (:name "Overdue"
            :deadline past
            :order 7)
     (:name "Meetings"
            :tag "meeting"
            :order 3)
     (:name "Soon"
            :deadline future
            :order 4)
     (:name "Personal"
            :tag "personal"
            :order 8))))

(use-package org-download
  :load-path "/home/stefano/.emacs.d/elpa/org-download-20220906.1929/")

(use-package ob-lisp)

(use-package ob-ditaa
  :requires org
  :custom
  (org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar"))

(use-package cal-iso)
(use-package ox)

(provide 'larsen-orgmode)
