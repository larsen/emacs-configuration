;;;
;;; Init.el
;;;

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(defvar dotfiles-dir (file-name-directory
                      (or (buffer-file-name) load-file-name)))

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name (concat dotfiles-dir "bak")))))

(add-to-list 'load-path "~/.emacs.d/lisp")

(dolist (p '("~/bin"
             "/usr/local/bin"
             "/usr/bin"
             "~/.local/bin"))
  (add-to-list 'exec-path p))

(setq custom-file "~/.emacs-custom.el")
(load custom-file)

(setq auth-sources '("~/.authinfo"))

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
    larsen-sql

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
    larsen-fontaine
    larsen-theme
    larsen-pulsar
    larsen-print
    larsen-menu
    larsen-keys))

(dolist (file larsen-pkg-full)
  (message (pp file))
  (require file))
(put 'downcase-region 'disabled nil)
(put 'list-threads 'disabled nil)
