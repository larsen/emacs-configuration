;;;
;;; larsen-orgmode.el
;;;

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-return-follows-link t)
(setq org-agenda-files (list "~/org/index.org"
                             "~/org/work.org"
                             "~/org/home.org"
                             "~/org/errand.org"
                             "~/org/report-2013q3.org"
                             "~/org/datascienza.com.org"
                             "~/org/stefanorodighiero.net.org"))

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

(provide 'larsen-orgmode)
