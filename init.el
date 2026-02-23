;;;
;;; Init.el
;;;

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("non-gnu" . "https://elpa.nongnu.org/nongnu/index.html")
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
(load custom-file nil :nomessage)

(setq auth-sources '("~/.authinfo"))

(defvar larsen-pkg-full
  '(
    larsen-env
    larsen-ai
    larsen-pdf-tools
    larsen-dired
    larsen-flycheck
    larsen-spell
    larsen-markdown
    larsen-corfu
    larsen-tramp
    larsen-vertico
    larsen-buffer
    larsen-snippets
    larsen-fringes

    ;; Programming languages support
    larsen-python
    larsen-lsp
    larsen-treesitter
    larsen-paredit
    larsen-smartparens
    larsen-elisp
    ;; larsen-sly
    larsen-slime
    larsen-clojure
    larsen-sql

    larsen-hledger

    larsen-latex
    larsen-orgmode
    larsen-orgmode-functions            ; in this order
    larsen-orgmode-agenda
    larsen-orgmode-website
    larsen-org-blog
    larsen-org-roam

    larsen-magit
    larsen-elfeed
    larsen-functions
    larsen-fontaine
    larsen-pulsar
    larsen-print
    larsen-menu
    larsen-theme
    larsen-treemacs
    larsen-keys
    larsen-keychords))

(dolist (file larsen-pkg-full)
  (princ "." 'external-debugging-output)
  (require file))
