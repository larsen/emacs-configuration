(use-package ivy
  :init
  (ivy-mode t)
  :bind (("C-c h" . ivy-switch-buffer)
         ("<s-escape>" . ivy-switch-buffer)
         ("<f13>" . ivy-switch-buffer)
         ("C-M-y" . ivy-switch-buffer)
         ("<print>" . ivy-switch-buffer)
         ; ("C-c v" . helm-show-kill-ring)
         ("C-s" . swiper-isearch)
         ("C-c s" . swiper)
         :map ivy-minibuffer-map
         ("<left>" . counsel-up-directory)
         ("<right>" . counsel-down-directory))
  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d) ")
  (ivi-display-style 'fancy))

(use-package smex
  :ensure t)

(use-package counsel
  :after smex
  :bind (("M-x" . counsel-M-x)
	       ("C-x C-f" . counsel-find-file))
  :config
  (counsel-mode t))

(use-package prescient)
(use-package ivy-prescient
  :config
  (ivy-prescient-mode t))

(use-package counsel-projectile
  :bind (("<f6>" . counsel-projectile-ag)))

(use-package ivy-rich
  :after counsel
  :init (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(provide 'larsen-ivy)
