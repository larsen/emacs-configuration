;; I like to have all key combinations defined
;; in a single place.

(defun my-global-set-keys (keys)
  "Utility to set a define a set of keybindings in one place"
  (dolist (combo keys)
    (when combo
      (global-set-key (car combo) (cadr combo)))))

(defun larsen-keys ()
  (append
   ;; Generic personal environment bindings. There are likely
   ;; to be always availble
   (when (featurep 'larsen-env)
     `((,(kbd "M-o") other-window)
       (,(kbd "C-c t") (lambda () (interactive) (vterm)))
       (,(kbd "C-c e m") macrostep-moode)
       (,(kbd "C-c e r") eval-and-replace)
       (,(kbd "C-c SPC") ace-jump-mode)))

   ;; TAB special behaviour
   (when (featurep 'larsen-smarttab)
     `((,(kbd "TAB") smart-tab)))

   (when (featurep 'larsen-slime)
     `((,(kbd "<f2>") slime-hyperspec-lookup)
       (,(kbd "C-<f12>") slime-selector)
       (,(kbd "<f12>") slime-selector)))

   (when (featurep 'larsen-perl)
     `((,(kbd "C-h P") cperl-perldoc-at-point)))

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
