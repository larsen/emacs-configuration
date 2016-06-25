;;;
;;; larsen-orgmode.el
;;;

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(defun my-org-confirm-babel-evaluate (lang body)
            (not (string= lang "emacs-elisp")))
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-todo-keywords
        '((sequence "TODO" "ANALYSED" "DELEGATED" "|" "DONE" "CANCELED")))

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
(custom-set-variables
 '(org-twbs-htmlize-output-type 'css))

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
                <a href=\"//stefanorodighiero.net/\">Home</a>
                <a href=\"//stefanorodighiero.net/personal.html\">About</a>
                <a href=\"//stefanorodighiero.net/stream\">Stream</a>
            </div>
        </div>"  )

(setq org-publish-project-alist
      `(
        ("website" 
         :components ("website-pages" "website-images"))
        
        ("website-pages"
         ;; :base-directory ,(personal-website-absolute-directory "")
         :base-directory "/home/larsen/www/stefanorodighiero.net/"
         :base-extension "org"
         :exclude "posts"
         :publishing-function org-twbs-publish-to-html
         :publishing-directory ,(personal-website-remote-absolute-directory "/")
         :recursive t
         :html-preamble ,personal-website-navigation-header
         )

        ("website-images"
         ;; :base-directory ,(personal-website-absolute-directory "")
         :base-directory "/home/larsen/www/stefanorodighiero.net/images/"
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
         :publishing-function org-twbs-publish-to-html
         :org-html-postamble nil
         :html-preamble ,personal-website-navigation-header
         )

        ("stream-images"
         :base-directory ,(personal-website-absolute-directory "stream/images/")
         :base-extension "png\\|jpg\\|JPG\\|gif\\|svg"
         :publishing-directory ,(personal-website-remote-absolute-directory "stream/images/")
         :publishing-function org-publish-attachment
         )

        ("stream-feed"
         :title "Stefano Rodighiero's stream"
         :base-directory ,(personal-website-absolute-directory "stream/")
         :base-extension "org"
         :html-link-home: "http://stefanorodighiero.net/stream/"
         :html-link-use-abs-url t
         :rss-extension "xml"
         :publishing-function (org-rss-publish-to-rss)
         :publishing-directory ,(personal-website-remote-absolute-directory "stream/")
         :table-of-contents nil
         )
        
        ("stream" 
         :components ("stream-orgfiles" "stream-images" "stream-feed")) ))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))
(setq org-agenda-span 14)

; Org Babel

(org-babel-do-load-languages
      'org-babel-load-languages
      '((perl . t)))

(provide 'larsen-orgmode)
