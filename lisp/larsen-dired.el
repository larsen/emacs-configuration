(use-package dired
  :custom
  ;; TODO Review the params, not compatible with macOS?
  ;; (dired-listing-switches "-lagGhS --group-directories-first --time-style=long-iso")
  (dired-dwim-target t)
  (dired-recursive-deletes 'always)
  (dired-recursive-copies 'always)
  (dired-deletion-confirmer 'y-or-n-p)
  (dired-clean-confirm-killing-deleted-buffers nil)
  (dired-clean-up-buffers-too nil)
  (dired-guess-shell-alist-user '(("\\.pdf\\'" "evince")
                                  ("\\.jpg\\'" "feh")
                                  ("\\.gpx\\'" "viking")
                                  ("\\.kml\\'" "viking"))))

(use-package dired-preview
  :ensure t
  :requires dired
  :custom
  (dired-preview-ignored-extensions-regexp
   (concat "\\.\\("
           (mapconcat 'symbol-name '(mkv iso mp4 mp3 zip tgz gz xz flac)
                      "\\|")
           "\\)"))
  :bind (("C-c d p" . dired-preview-mode)))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind (:map dired-mode-map
              ("<tab>" . dired-subtree-toggle))
  :custom
  (dired-subtree-use-background nil))

(use-package dired-x
  :requires dired)

(use-package dired-avfs :requires dired)

(use-package all-the-icons-dired
  :ensure t
  :diminish
  all-the-icons-dired-mode
  :hook
  (dired-mode . all-the-icons-dired-mode))

(use-package diff-hl
  :ensure t
  :requires dired
  :hook (dired-mode-hook . diff-hl-dired-mode))

;; Useful combo
;; Ctrl-u s -- interactively change the 'dired-listing-switches

;; Copied from https://github.com/IvanRave/emacs-config/blob/master/init.el
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))



(defun my/advice-remove-all (function)
  "Remove every advice-function from FUNCTION."
  (advice-mapc
   (lambda (advice-function properties-alist)
     (advice-remove function
                    advice-function))
   function))

(my/advice-remove-all 'image-dired-format-properties-string)



(defun my/image-size (file)
  (with-temp-buffer
    (call-process "identify" nil t nil "-format" "%wx%h" file )
    (buffer-string)))

(defun my/image-dired-enrich-properties (orig-fun buf file image-count props comment)
  (let ((orig-str (apply orig-fun (list  buf file image-count props comment)))
        (size (my/image-size file)))
    (concat orig-str " " size)))

(advice-add 'image-dired-format-properties-string :around #'my/image-dired-enrich-properties)

(defun my/resize-image (file size)
  "Resize the image in FILE to the specified SIZE (interpreted as a percentage). "
  (call-process "magick" nil t nil file "-resize" (format "%d%%" size) file))

(defun image-dired-thumbnail-resize-image ()
  "Resize the image at point. The size is specified at the prompt as a percentage of the original size."
  (interactive nil image-dired-thumbnail-mode)
  (if (not (image-dired-image-at-point-p))
      (message "No thumbnail at point")
    (let* ((file (image-dired-original-file-name))
           (defdir default-directory))
      (with-temp-buffer
        (setq default-directory defdir)
        (if (eq 0 (my/resize-image file (read-number "New size (%): " 50)))
            (message "Successfully resized image")
          (error "Could not resize image: %s"
                 (string-replace "\n" "" (buffer-string))))))))


;; (keymap-set image-dired-thumbnail-mode-map "Z" 'image-dired-thumbnail-resize-image)

(provide 'larsen-dired)
