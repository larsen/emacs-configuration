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

(key-chord-mode t)
(setq key-chord-two-keys-delay 0.05)
(key-chord-define-global ",," 'slime-selector)
(key-chord-define-global "//" 'isearch-forward)
(key-chord-define-global "hh" 'helm-mini)
(key-chord-define-global "jj" 'ace-jump-mode)
(key-chord-define-global "ww" 'switch-window)

(provide 'larsen-keys)
