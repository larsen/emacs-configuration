(use-package org)

(custom-set-variables
 '(org-twbs-htmlize-output-type 'css)
 '(org-html-htmlize-output-type 'css))

(defvar personal-website-directory-prefix "~/www/stefanorodighiero.net/")
(defun personal-website-absolute-directory (directory)
  (concat personal-website-directory-prefix directory))

(defvar personal-website-remote-directory-prefix  "/ssh:larsen@home:/srv/www/stefanorodighiero.net/")
(defun personal-website-remote-absolute-directory (directory)
  (concat personal-website-remote-directory-prefix directory))

(defvar commonlisp-directory-prefix "~/www/commonlisp.it/")
(defun commonlisp-absolute-directory (directory)
  (concat commonlisp-directory-prefix directory))

(defvar commonlisp-remote-directory-prefix  "/ssh:larsen@home:/srv/www/commonlisp.it/")
(defun commonlisp-remote-absolute-directory (directory)
  (concat commonlisp-remote-directory-prefix directory))

(defvar personal-website-navigation-header
  "        <div id=\"header\">
            <div id=\"logo\">
                <a href=\"/\">stefanorodighiero.net</a>
            </div>
            <div id=\"navigation\">
                <a href=\"//stefanorodighiero.net/personal.html\">About</a>
                <a href=\"//stefanorodighiero.net/blog\">Blog</a>
            </div>
        </div>"  )

(defvar commonlisp-navigation-header
  "        <div id=\"header\">
            <div id=\"logo\">
                <a href=\"/\">commonlisp.it</a>
            </div>
            <div id=\"navigation\">
            </div>
        </div>"  )

(setq org-publish-project-alist
      `(
        ("website"
         :components ("website-pages" "website-images"))

        ("commonlisp-pages"
         :base-directory ,(commonlisp-absolute-directory "/")
         :base-extension "org"
         :publishing-function org-html-publish-to-html
         :publishing-directory ,(commonlisp-remote-absolute-directory "/")
         :html-preamble ,commonlisp-navigation-header
         )

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
         :base-extension "svg\\|png\\|jpg\\|JPG\\|gif"
         :publishing-function org-publish-attachment
         :recursive t
         :publishing-directory ,(personal-website-remote-absolute-directory "images/")
         )

        ("website-extras"
         :base-directory ,(personal-website-absolute-directory "/")
         :base-extension "gpx"
         :publishing-function org-publish-attachment
         :recursive t
         :publishing-directory ,(personal-website-remote-absolute-directory "/")
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

(require 'templatel)
(cl-defun template/map-gpx (map-id gpx-url &key (width 1000) (height 600))
  (assert (numberp width))
  (assert (numberp height))
  (templatel-render-file
   "~/www/stefanorodighiero.net/var/templates/map-gpx.jinja"
   `(("map_id" . ,map-id)
     ("gpx_url" . ,gpx-url)
     ("width" . ,(format "%dpx" width))
     ("height" . ,(format "%dpx" height)))))

(provide 'larsen-orgmode-website)
