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
     `((,(kbd "C-x C-o") rotate-layout)
       (,(kbd "C-x o") switch-window)
       (,(kbd "C-S-f") switch-layoout)
       (,(kbd "C-c t") (lambda () (interactive) (ansi-term "/bin/bash")))
       (,(kbd "C-c m c") mc/edit-lines)
       (,(kbd "C-c e m") macrostep-mode)
       (,(kbd "C-c m a") mc/mark-all-like-this)))

   ;; TAB special behaviour
   (when (featurep 'larsen-smarttab)
     `((,(kbd "TAB") smart-tab)))

   ;; Helm related
   (when (featurep 'larsen-helm)
     `((,(kbd "C-c h") helm-mini)
       (,(kbd "<s-escape>") helm-mini)
       (,(kbd "<f13>") helm-mini)
       (,(kbd "C-M-y") helm-mini)
       (,(kbd "<print>") helm-mini)
       (,(kbd "M-x") helm-M-x)

       (,(kbd "C-c s") helm-swoop)
       (,(kbd "C-c C-s") helm-swoop-projectile)
       (,(kbd "C-c v") helm-show-kill-ring)
       (,(kbd "C-x C-f") helm-find-files)))

   ;; A couple of options to activate a feature
   ;; roughly inspired to how Scrivener works
   (when (featurep 'larsen-orgmode)
     `((,(kbd "C-M-l") open-subtree-in-another-window)
       (,(kbd "C-c <right>") open-subtree-in-another-window)))

   (when (featurep 'larsen-slime)
     `((,(kbd "<f2>") slime-hyperspec-lookup)
       (,(kbd "C-<f12>") slime-selector)))

   (when (featurep 'larsen-magit)
     `((,(kbd "C-x g") magit-status)))

   (when (featurep 'larsen-perl)
     `((,(kbd "C-h P") cperl-perldoc-at-point)))
   
   (when (featurep 'larsen-functions)
     `((,(kbd "M-<f1>") toggle-split-layout)
       (,(kbd "C-c j") webjump)))
   ))

(my-global-set-keys (larsen-keys))

(provide 'larsen-keys)
