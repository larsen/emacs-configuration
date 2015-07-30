;;;
;;; larsen-orgmode.el
;;;

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-todo-keywords
        '((sequence "TODO" "ANALYSED" "DELEGATED" "DONE")))

(setq org-return-follows-link t)
;(setq org-agenda-files (list "~/org/index.org"
;                             "~/org/work.org"
;                             "~/org/home.org"
;                             "~/org/errand.org"
;                             "~/org/report-2013q3.org"
;                             "~/org/datascienza.com.org"
;                             "~/org/stefanorodighiero.net.org"
;                             "~/org/mxm-*.org"))

(setq org-agenda-files (file-expand-wildcards "~/org"))

(setq org-publish-project-alist
      '(("orgfiles"
         :base-directory "~/src/stefanorodighiero.net/wiki/"
         :base-extension "org"
         :publishing-directory "/ssh:larsen@home:/srv/www/stefanorodighiero.net/wiki/"
         :publishing-function org-html-publish-to-html
         ; :with-toc nil
         )

        ("css"
         :base-directory "~/src/stefanorodighiero.net/wiki/css/"
         :base-extension "css"
         :publishing-directory "/ssh:larsen@home:/srv/www/stefanorodighiero.net/wiki/css/"
         :publishing-function org-publish-attachment
         )

        ("js"
         :base-directory "~/src/stefanorodighiero.net/wiki/MathJax/"
         :base-extension "js"
         :recursive t
         :publishing-directory "/ssh:larsen@home:/srv/www/stefanorodighiero.net/wiki/js/"
         :publishing-function org-publish-attachment
         )

        ("wiki" 
         :components ("orgfiles" "css" "js"))))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)

(setq org-agenda-span 30)

; Org Babel

(org-babel-do-load-languages
      'org-babel-load-languages
      '((perl . t)))

(provide 'larsen-orgmode)