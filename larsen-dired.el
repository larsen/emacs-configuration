; (package-require 'dired+)

(require 'dired-avfs)

(setq dired-listing-switches "-lath")

(setq dired-dwim-target t)

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

(provide 'larsen-dired)
