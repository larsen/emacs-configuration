;;;
;;; Init.el
;;;

(dolist (mode '(scroll-bar-mode tool-bar-mode menu-bar-mode))
  (when (fboundp mode) (funcall mode -1)))
(setq scroll-margin 3)

;; Always ALWAYS use UTF-8
;; (borrowed from bodil's configuration)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)

;; Auto refresh buffers
(global-auto-revert-mode 1)

(require 'package)
(package-initialize)
(defun package-require (pkg)
  "Install a package PKG only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add .emacs.d to load-path
(defvar dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir t)

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
        larsen-iswitchb
        larsen-package
        larsen-spell
        larsen-clojure
        larsen-perl
        larsen-haskell
        larsen-markdown
        larsen-smarttab
        larsen-tramp
        larsen-helm
        larsen-ibuffer
        larsen-sql
        larsen-w3m
        ; larsen-keyfreq
        larsen-latex
        larsen-web-mode
        larsen-snippets
        larsen-auto-complete
        larsen-orgmode
        larsen-orgmode-website
        larsen-anki
        larsen-slime
        larsen-magit
        larsen-erc
        larsen-elfeed
        larsen-paredit
        larsen-functions
        larsen-elisp
        larsen-ruby
        larsen-python
        larsen-lsp
        larsen-refactoring
        larsen-theme
        larsen-mu4e
        larsen-eshell
        larsen-print
        larsen-keys
        ))

;; Now load other things
(dolist (file larsen-pkg-full)
  (message (pp file))
  (require file))

