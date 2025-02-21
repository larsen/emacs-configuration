;; I like to have all key combinations defined
;; in a single place.

(defun my-global-set-keys (keys)
  "Utility to set a define a set of keybindings in one place"
  (dolist (combo keys)
    (when combo
      (global-set-key (car combo) (cadr combo)))))

(defun larsen-keys ()
  (append

   (when (featurep 'larsen-functions)
     `((,(kbd "M-<f1>") toggle-split-layout)
       (,(kbd "C-c j") webjump)))

   (when (featurep 'larsen-print)
     `((,(kbd "M-<print>") a2ps-buffer)))))

(my-global-set-keys (larsen-keys))

(provide 'larsen-keys)
