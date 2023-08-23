(use-package dired
  :custom
  (dired-listing-switches "-aGFhlS --group-directories-first --time-style=long-iso")
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

(use-package peep-dired
  :custom
  (peep-dired-cleanup-on-disable t)
  (peep-dired-cleanup-eagerly nil)
  (peep-dired-ignored-extensions '("mkv" "iso" "mp4" "mp3" "zip" "tgz" "gz" "xz" "flac")))

(use-package dired-x :requires dired)
(use-package dired-avfs :requires dired)

(use-package diff-hl
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

(provide 'larsen-dired)
