(use-package org-agenda
  :bind (("C-c a" . org-agenda))
  :custom
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-include-diary t)
  (org-agenda-start-on-weekday nil)
  (org-agenda-start-day nil) ;; i.e. today
  (org-agenda-span 2)
  (org-agenda-files '("~/org/personal/"
                      "~/org/orgzly/errand.org"
                      "~/org/orgzly/work.org"
                      "~/org/work/tourlane/activities.org"))
  :custom-face
  (org-agenda-date ((t (:inherit 'fixed-pitch :height 200))))
  (org-agenda-date-today ((t (:inherit 'fixed-pitch :height 200)))))

(use-package org-super-agenda
  :ensure t
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

(provide 'larsen-orgmode-agenda)
