(use-package org)

(custom-set-variables
 '(org-twbs-htmlize-output-type 'css)
 '(org-html-htmlize-output-type 'css))

(defvar personal-website-directory-prefix "~/www/stefanorodighiero.net/")
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

(provide 'larsen-orgmode-website)
