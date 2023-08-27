;;;
;;; Init.el
;;;

(require 'package)
(package-initialize)

;; Add .emacs.d to load-path
(defvar dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
;; (add-to-list 'load-path dotfiles-dir t)
(add-to-list 'load-path "~/.emacs.d/lisp")

(add-to-list 'exec-path "~/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'exec-path "~/.local/bin")

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

(defvar larsen-pkg-full
      '(
        larsen-env
        larsen-pdf-tools
        larsen-dired
        larsen-flycheck
        larsen-package
        larsen-spell
        larsen-clojure
        larsen-perl
        larsen-haskell
        ;; larsen-markdown
        larsen-smarttab
        larsen-tramp
        larsen-helm
        larsen-ibuffer
        larsen-sql
        larsen-w3m
        ;; larsen-keyfreq
        larsen-latex
        ;; larsen-web-mode
        larsen-snippets
        ; larsen-auto-complete
        larsen-orgmode
        larsen-orgmode-website
        larsen-org-roam
        ; larsen-anki
        larsen-slime
        larsen-magit
        ;larsen-erc
        larsen-elfeed
        larsen-paredit
        larsen-functions
        larsen-elisp
        ;larsen-ruby
        larsen-python
        ; larsen-lsp
        ;larsen-refactoring
        larsen-theme
        larsen-mu4e
        larsen-eshell
        larsen-print
        larsen-menu
        larsen-keys
        ))

;; Now load other things
(dolist (file larsen-pkg-full)
  (message (pp file))
  (require file))
(put 'downcase-region 'disabled nil)
