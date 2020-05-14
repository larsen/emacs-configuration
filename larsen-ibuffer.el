(use-package ibuffer)
(use-package ibuffer-git)
(use-package ibuffer-projectile)

(setq ibuffer-saved-filter-groups
      '(("default"
         ("Dired" (mode . dired-mode))
         ("Perl" (mode . cperl-mode))
         ("Python" (mode . python-mode))
         ("Org" (mode . org-mode))
         ("Lisp" (or (mode . lisp-mode)
                     (name . "slime")))
         ("Emacs Lisp" (or (mode . emacs-lisp-mode)
                           (name . "^\\*ielm\\*$")))
         ("System" (or (name . "^\\*scratch\\*$")
                       (name . "^\\*Messages\\*$"))))))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
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
