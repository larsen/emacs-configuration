;;;
;;; Init.el
;;;

(require 'package)
(setq package-archives '(("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)

;; Add .emacs.d to load-path
(defvar dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))
;; (add-to-list 'load-path dotfiles-dir t)
(add-to-list 'load-path "~/.emacs.d/lisp")

(dolist (p '("~/bin"
             "/usr/local/bin"
             "/usr/bin"
             "~/.local/bin"))
  (add-to-list 'exec-path p))

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
    larsen-spell
    larsen-markdown
    larsen-company
    larsen-tramp
    larsen-ivy
    larsen-ibuffer
    larsen-treemacs
    larsen-snippets

    ;; Programming languages support
    larsen-lsp
                                        ; larsen-treesitter
    larsen-paredit
    larsen-elisp
                                        ; larsen-python
    larsen-slime
    larsen-clojure
    larsen-racket
    larsen-perl
    larsen-sql

    larsen-w3m
    larsen-hledger

    larsen-latex
    larsen-orgmode
    larsen-orgmode-functions            ; in this order
    larsen-orgmode-website
    larsen-org-blog
    larsen-org-roam
    larsen-magit
    larsen-elfeed
    larsen-functions
    larsen-theme
    larsen-fontaine
    larsen-pulsar
    larsen-eshell
    larsen-print
    larsen-menu
    larsen-keys))

;; Now load other things
(dolist (file larsen-pkg-full)
  (message (pp file))
  (require file))
(put 'downcase-region 'disabled nil)
