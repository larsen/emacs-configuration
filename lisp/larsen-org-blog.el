(require 'org-static-blog)

(setq org-static-blog-publish-title "Stefano Rodighiero — Stream")
(setq org-static-blog-publish-url "https://stefanorodighiero.net/blog/")
(setq org-static-blog-publish-directory "/home/stefano/www/stefanorodighiero.net/blog/")
(setq org-static-blog-posts-directory "/home/stefano/www/stefanorodighiero.net/blog/posts/")
(setq org-static-blog-drafts-directory "/home/stefano/www/stefanorodighiero.net/blog/drafts/")
(setq org-static-blog-enable-tags t)
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)
(setq org-static-blog-use-preview t)
(setq org-static-blog-preview-date-first-p t)

;; This header is inserted into the <head> section of every page:
;;   (you will need to create the style sheet at
;;    ~/projects/blog/static/style.css
;;    and the favicon at
;;    ~/projects/blog/static/favicon.ico)
(setq org-static-blog-page-header
      "<meta name=\"author\" content=\"Stefano Rodighiero\">
<meta name=\"referrer\" content=\"no-referrer\">
<link href=\"/css/notes.css\" rel=\"stylesheet\" type=\"text/css\" />
<link rel=\"icon\" href=\"static/favicon.ico\">")

;; This preamble is inserted at the beginning of the <body> of every page:
;;   This particular HTML creates a <div> with a simple linked headline
(setq org-static-blog-page-preamble personal-website-navigation-header)

;; this postamble is inserted at the end of the <body> of every page:
;;   this particular html creates a <div> with a link to the archive page
;;   and a licensing stub.
(setq org-static-blog-page-postamble "")

;; this html code is inserted into the index page between the preamble and
;;   the blog posts
(setq org-static-blog-index-front-matter
"<h1> blog </h1>\n")

(provide 'larsen-org-blog)
