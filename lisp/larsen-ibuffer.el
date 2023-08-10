(use-package ibuffer)
(use-package ibuffer-git)
(use-package ibuffer-projectile)

(setq ibuffer-saved-filter-groups
      '(("default"
         ("Dired" (mode . dired-mode))
         ("Perl" (mode . cperl-mode))
         ("Python" (mode . python-mode))
         ("Org" (mode . org-mode))
         ("Magit" (mode . magit))
         ("Lisp" (or (mode . lisp-mode)
                     (name . "slime")))
         ("Emacs Lisp" (or (mode . emacs-lisp-mode)
                           (name . "^\\*ielm\\*$")))
         ("ERC" (mode . erc-mode))
         ("SQL" (mode . sql-mode))
         ("Helm" (mode . helm-major-mode))
         ("PDF" (mode . pdf-view-mode))
         ("System" (or (name . "^\\*scratch\\*$")
                       (name . "^\\*Messages\\*$")
                       (name . "^\\*Process list\\*$"))))))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 28 28 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              (git-status 8 8 :left)
              " "
              project-relative-file)))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'larsen-ibuffer)
