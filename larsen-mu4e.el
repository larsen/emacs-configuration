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

      mu4e-show-images t
      mu4e-bookmarks '((:name "Unread messages"
                              :query "flag:unread AND NOT flag:trashed"
                              :key ?u)
                       (:name "Unread messages (no ML)"
                              :query "flag:unread AND NOT flag:trashed AND NOT flag:list"
                              :key ?m)
                       (:name "Today's messages"
                              :query "date:today..now"
                              :key ?t)
                       (:name "Last 7 days"
                              :query "date:7d..now"
                              :hide-unread t
                              :key ?w)
                       (:name "Messages with images"
                              :query "mime:image/*"
                              :key ?p)))

;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(use-package mu4e-alert :ensure t)
(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)

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
