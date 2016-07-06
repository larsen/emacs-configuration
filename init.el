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

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; If there is a tab, make it the size of 2 spaces
(setq-default tab-width 2)

;; Auto refresh buffers
(global-auto-revert-mode 1)

(require 'package)
(package-initialize)
(defun package-require (pkg)
  "Install a package only if it's not already installed."
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;; Always ask for y/n keypress instead of typing out 'yes' or 'no'
(defalias 'yes-or-no-p 'y-or-n-p)

;; Add .emacs.d to load-path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(add-to-list 'exec-path "~/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/bin")

(custom-set-variables
 '(browse-url-browser-function (quote eww-browse-url))
 '(org-support-shift-select (quote always)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

(setq larsen-pkg-full
      '(
        larsen-env
        larsen-dired
        larsen-theme
        larsen-style
        larsen-iswitchb
        larsen-package
        larsen-auto-complete
        larsen-spell
        larsen-perl
        larsen-clojure
        ; larsen-haskell
        larsen-markdown
        larsen-smarttab
        larsen-tramp
        larsen-helm
        larsen-sql
        larsen-w3m
        ; larsen-keyfreq
        larsen-latex
        larsen-web-mode
        larsen-snippets
        larsen-orgmode
        larsen-slime
        larsen-magit
        larsen-erc
        larsen-elfeed
        larsen-paredit
        larsen-functions
        ))

;; Now load other things
(dolist (file larsen-pkg-full)
  (message (pp file))
  (require file))

