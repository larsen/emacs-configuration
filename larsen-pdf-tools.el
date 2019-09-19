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
    (kbd "<return>") 'pdf-annot-edit-contents-commit)
  ;; save after adding comment
  (advice-add 'pdf-annot-edit-contents-commit
              :after 'my/save-buffer-no-args)))

(provide 'larsen-pdf-tools)
