(use-package vertico
  :custom
  (vertico-scroll-margin 0) ;; Different scroll margin
  (vertico-count 15) ;; Show more candidates
  :init
  (vertico-mode)
  :bind (:map vertico-map
         ("<left>" . vertico-directory-up)
         ("<right>" . vertico-directory-enter)))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :init
  (nerd-icons-completion-mode))

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

(use-package consult
  :bind (("C-c h" . consult-buffer)
         ("<s-escape>" . consult-buffer)
         ("<f13>" . consult-buffer)
         ("C-M-y" . consult-buffer)
         ("<print>" . consult-buffer)
         ("<f6>" . consult-ripgrep)
         ("C-<f6>" . consult-ripgrep)))

(provide 'larsen-vertico)
