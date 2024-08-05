(use-package org-static-blog
  :ensure t
  :custom
  (org-static-blog-publish-title "Stefano Rodighiero — Stream")
  (org-static-blog-publish-url "https://stefanorodighiero.net/blog/")
  (org-static-blog-publish-directory "/home/stefano/www/stefanorodighiero.net/blog/")
  (org-static-blog-posts-directory "/home/stefano/www/stefanorodighiero.net/blog/posts/")
  (org-static-blog-drafts-directory "/home/stefano/www/stefanorodighiero.net/blog/drafts/")
  (org-static-blog-enable-tags t)
  (org-export-with-toc nil)
  (org-export-with-section-numbers nil)
  (org-static-blog-use-preview nil)
  (org-static-blog-preview-date-first-p t)
;; This header is inserted into the <head> section of every page:
;;   (you will need to create the style sheet at
;;    ~/projects/blog/static/style.css
;;    and the favicon at
;;    ~/projects/blog/static/favicon.ico)
  (org-static-blog-page-header
   "<meta name=\"author\" content=\"Stefano Rodighiero\">
<meta name=\"referrer\" content=\"no-referrer\">
<link href=\"/css/notes.css\" rel=\"stylesheet\" type=\"text/css\" />
<script type=\"text/javascript\"
             src=\"https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-AMS-MML_HTMLorMML\">
           </script>
           <script type=\"text/x-mathjax-config\">
             MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'],['\\\\(','\\\\)']]}});
           </script>
<link rel=\"me\" href=\"https://mastodon.social/@eslr\" />
<link rel=\"icon\" href=\"static/favicon.ico\">")
  ;; This preamble is inserted at the beginning of the <body> of every page:
  ;;   This particular HTML creates a <div> with a simple linked headline
  (org-static-blog-page-preamble personal-website-navigation-header)

  ;; this postamble is inserted at the end of the <body> of every page:
  ;;   this particular html creates a <div> with a link to the archive page
  ;;   and a licensing stub.
  (org-static-blog-page-postamble "")

  (org-static-blog-post-preamble-text "<div class\"blog-post\">")
  (org-static-blog-post-postamble-text "</div>")
  ;; this html code is inserted into the index page between the preamble and
  ;;   the blog posts
  (org-static-blog-index-front-matter "<h1> blog </h1>\n"))

;; Redefining a function because there are no templates
;; Should probably be an advice

(defun org-static-blog-get-preview (post-filename)
  "Get title, date, tags from POST-FILENAME and get the first paragraph from the rendered HTML.
If the HTML body contains multiple paragraphs, include only the first paragraph,
and display an ellipsis.
Preamble and Postamble are excluded, too."
  (with-temp-buffer
    (insert-file-contents (org-static-blog-matching-publish-filename post-filename))
    (let ((post-title (org-static-blog-get-title post-filename))
          (post-date (org-static-blog-get-date post-filename))
          (post-taglist (org-static-blog-post-taglist post-filename))
          (post-ellipsis "")
          (preview-region (org-static-blog--preview-region)))
      (when (and preview-region (search-forward "<p>" nil t))
        (setq post-ellipsis
              (concat (when org-static-blog-preview-link-p
                        (format "<a href=\"%s\">"
                                (org-static-blog-get-post-url post-filename)))
                      org-static-blog-preview-ellipsis
                      (when org-static-blog-preview-link-p "</a>\n"))))
      ;; Put the substrings together.
      (let ((title-link
             (format "<h2 class=\"post-title\"><a href=\"%s\">%s</a></h2>"
                     (org-static-blog-get-post-url post-filename) post-title))
            (date-link
             (format-time-string (concat "<div class=\"post-date\">"
                                         (org-static-blog-gettext 'date-format)
                                         "</div>")
                                 post-date)))
        (concat
         "<div class=\"post-preview\">"
         (if org-static-blog-preview-date-first-p
             (concat date-link title-link)
           (concat title-link date-link))
         preview-region
         post-ellipsis
         (format "<div class=\"taglist\">%s</div>" post-taglist)
         "</div>")))))

(provide 'larsen-org-blog)
