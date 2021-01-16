(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e" t)
(use-package mu4e)

(setq mail-user-agent 'mu4e-user-agent
      mu4e-get-mail-command "mbsync -a"
      mu4e-update-interval (* 10 60)
         
      mu4e-maildir "~/Mail"
      mu4e-drafts-folder "/[Gmail]/Drafts"
      mu4e-sent-messages-behavior 'delete
      ;; (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
      mu4e-refile-folder "/[Gmail]/All Mail"
      mu4e-trash-folder  "/[Gmail]/Trash"
      mu4e-split-view 'vertical
      mu4e-headers-visible-columns 100
      user-mail-address "stefano.rodighiero@gmail.com"

      mu4e-show-images t)

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; (setq mu4e-bookmarks
;;   '(("flag:unread AND NOT flag:trashed" "Unread messages"      ?i)
;;     ("date:today..now"                  "Today's messages"     ?t)
;;     ("date:today..now AND flag:unread AND NOT flag:trashed" "Today's Unread messages"     ?u)
;;     ("date:7d..now"                     "Last 7 days"          ?w)
;;     ("mime:image/*"                     "Messages with images" ?p)))

;; (use-package mu4e-alert
;;   :ensure t
;;   :after mu4e
;;   :init
;;   (setq mu4e-alert-interesting-mail-query
;;     (concat "flag:unread maildir:/[Gmail]/Inbox"))
;;   (mu4e-alert-enable-mode-line-display)
;;   (defun gjstein-refresh-mu4e-alert-mode-line ()
;;     (interactive)
;;     (mu4e~proc-kill)
;;     (mu4e-alert-enable-mode-line-display))
;;   (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line))

(require 'smtpmail)
(setq message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 "stefano.rodighiero@gmail.com" nil))
   smtpmail-default-smtp-server "smtp.gmail.com"
   smtpmail-smtp-server "smtp.gmail.com"
   smtpmail-smtp-service 587)

(provide 'larsen-mu4e)
