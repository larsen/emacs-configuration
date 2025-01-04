(use-package ibuffer
  :ensure t
  :bind (("C-x C-b" . ibuffer))
  :custom
  (ibuffer-saved-filter-groups '(("default"
                                  ("Dired" (mode . dired-mode))
                                  ("Perl" (mode . cperl-mode))
                                  ("Python" (mode . python-mode))
                                  ("Org" (mode . org-mode))
                                  ("Magit" (mode . magit))
                                  ("Clojure" (mode . clojure-mode))
                                  ("Lisp" (or (mode . lisp-mode)
                                              (name . "slime")))
                                  ("Emacs Lisp" (or (mode . emacs-lisp-mode)
                                                    (name . "^\\*ielm\\*$")))
                                  ("ERC" (mode . erc-mode))
                                  ("SQL" (mode . sql-mode))
                                  ("PDF" (mode . pdf-view-mode))
                                  ("Terraform" (mode . terraform-mode))
                                  ("System" (or (name . "^\\*scratch\\*$")
                                                (name . "^\\*Messages\\*$")
                                                (name . "^\\*Process list\\*$"))))))
  (ibuffer-formats '((mark modified read-only " "
                           (name 28 28 :left :elide)
                           " "
                           (size 9 -1 :right)
                           " "
                           (mode 16 16 :left :elide)
                           " "
                           (git-status 8 8 :left)
                           " "
                           project-relative-file)))
  :config
  (add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default"))))

(use-package ibuffer-git
  :ensure t
  :requires ibuffer)

(use-package ibuffer-projectile
  :ensure t
  :requires ibuffer)



(provide 'larsen-ibuffer)
