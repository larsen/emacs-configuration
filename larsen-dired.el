; (package-require 'dired+)

(use-package dired-x)
(use-package dired-avfs)
(use-package peep-dired)

(setq dired-listing-switches "-GFhlv --group-directories-first --time-style=long-iso"
      dired-dwim-target t
      dired-recursive-deletes 'always
      dired-recursive-copies 'always
      dired-deletion-confirmer 'y-or-n-p
      dired-clean-confirm-killing-deleted-buffers nil
      dired-clean-up-buffers-too nil)

(setq peep-dired-cleanup-on-disable t
      peep-dired-cleanup-eagerly nil
      peep-dired-ignored-extensions '("mkv" "iso" "mp4" "mp3" "zip" "tgz" "gz" "xz" "flac"))

;; Copied from https://github.com/IvanRave/emacs-config/blob/master/init.el
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
    (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

(setq dired-listing-switches
        "-GFhlv --group-directories-first --time-style=long-iso")

(setq peep-dired-cleanup-on-disable t)
(setq peep-dired-cleanup-eagerly nil)
(setq peep-dired-ignored-extensions
      '("mkv" "iso" "mp4" "mp3" "zip" "tgz" "gz" "xz" "flac"))

(provide 'larsen-dired)
