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
  (org-refile-targets (quote ((nil :maxlevel . 2)
                              (org-agenda-files :maxlevel . 2))))
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
  (org-confirm-babel-evaluate nil)
  ; (org-format-latex-options (plist-put org-format-latex-options :scale 2.0))
  )

(use-package org-mouse :after org)

(use-package org-appear :ensure t
  :init
  (setq org-appear-delay 0.2)
  :hook
  org-mode)

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
                            (file+function "~/org/work/tourlane/activities.org"
                                           my-find-today-heading)
                            "*** TODO %i%?\n     DEADLINE: <%(one-week-from-today)>"
                            :jump-to-captured t)

                           ("r" "Reading todo" entry
                            (file "~/Dropbox/orgzly/reading.org")
                            "*** TODO %i%?\n    %a"))))

(use-package org-modern
  :ensure t
  :hook (org-mode . org-modern-mode)
  :custom
  (org-modern-block-indent t)
  (org-startup-indented t))

(use-package bug-reference
  :requires org
  :hook org-mode
  :custom
  (bug-reference-bug-regexp "\\b\\(\\([A-Za-z][A-Za-z0-9]\\{1,10\\}-[0-9]+\\)\\)")
  (bug-reference-url-format "https://tourlane.atlassian.net/browse/%s"))

(use-package org-download
  :load-path "/home/stefano/.emacs.d/elpa/org-download-20220906.1929/")

(use-package ob-lisp)

(use-package ob-ditaa
  :requires org
  :custom
  (org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar"))

(use-package cal-iso)
(use-package ox)



;; From https://github.com/NapoleonWils0n/fedora-dotfiles

;; org-mode insert image as file link from the clipboard
(defun org-mode--image-yank-handler (type image)
  (let ((file (read-file-name (format "Save %s image to: " type))))
    (when (file-directory-p file)
      (user-error "%s is a directory" file))
    (when (and (file-exists-p file)
               (not (yes-or-no-p (format "%s exists; overwrite?" file))))
      (user-error "%s exists" emacs-lisp-compilation-parse-errors-filename-function))
    (with-temp-buffer
      (set-buffer-multibyte nil)
      (insert image)
      (write-region (point-min) (point-max) file))
    (insert (format "[[file:%s]]\n" (file-relative-name file)))))

(yank-media-handler "image/.*" #'org-mode--image-yank-handler)

(with-eval-after-load 'org
  (setq yank-media--registered-handlers '(("image/.*" . #'org-mode--image-yank-handler))))



(provide 'larsen-orgmode)
