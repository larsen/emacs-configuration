(pdf-tools-install t)

;; I need to remove pdf-cache-prefetch-minor-mode from
;; pdf-tools-enabled-modes, to open PDF from the file manager (not
;; sure why it does not work otherwise, but it seems confirmed
;; experimentally.

;; Other parts of the configuration in:
;; /home/stefano/.local/share/applications/emacsclient.desktop
;;
;; - $ xdg-mime query default application/pdf
;;   emacsclient.desktop

;; ansi-term

;; See https://emacs.stackexchange.com/questions/39312/output-reflow-in-ansi-term

(setq pdf-tools-enabled-modes
      '(pdf-history-minor-mode
       pdf-isearch-minor-mode
       pdf-links-minor-mode
       pdf-misc-minor-mode
       pdf-outline-minor-mode
       pdf-misc-size-indication-minor-mode
       pdf-misc-menu-bar-minor-mode
       pdf-annot-minor-mode
       pdf-sync-minor-mode
       pdf-misc-context-menu-minor-mode
       ;; pdf-cache-prefetch-minor-mode
       pdf-occur-global-minor-mode
       ;; pdf-virtual-global-minor-mode
       ))
(setq-default pdf-view-display-size 'fit-page)

;; Taken from http://pragmaticemacs.com/emacs/even-more-pdf-tools-tweaks/

(add-hook 'pdf-view-mode-hook (lambda () (cua-mode 0)))

(define-key pdf-view-mode-map (kbd "t") 'pdf-annot-add-text-annotation)

(defun my/save-buffer-no-args ()
  (save-buffer))

(with-eval-after-load "pdf-annot"
  (define-key pdf-annot-edit-contents-minor-mode-map
    (kbd "C-<return>") 'pdf-annot-edit-contents-commit)
  ;; save after adding comment
  (advice-add 'pdf-annot-edit-contents-commit
              :after 'my/save-buffer-no-args))


;; From https://github.com/politza/pdf-tools/issues/338
;; Export pdf outline to org file
(defun pdf-outline-export-to-org ()
  " Export pdf outlines as org mode "
  (interactive)

  (let* ((pdf-buffer (current-buffer))
         (filename (file-name-sans-extension (buffer-name pdf-buffer)))
         (org-filename (concat filename ".org"))
         (outline-info (pdf-info-outline pdf-buffer)))

    ;; Insert outline heading
    (with-temp-buffer
      (org-mode)
      (insert (concat "#+TITLE: " filename "\n"))
      (when outline-info
        (dolist (item outline-info)
          (let ((title (assoc-default 'title item))
                (page (assoc-default 'page item))
                (level (assoc-default 'depth item)))
            (insert (format
                     "%s [[pdfview:%s.pdf::%s][%s]]\n"
                     (make-string level ?*)
                     (concat default-directory filename)
                     page title))
            (org-set-property "page" (number-to-string page))
            (org-todo 'todo)
            ))
        (write-file (concat default-directory org-filename))))))

(provide 'larsen-pdf-tools)
