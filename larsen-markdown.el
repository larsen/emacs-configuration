;;; larsen-markdown.el -- Markdown setup

(package-require 'markdown-mode)

(setq-default markdown-command "/usr/bin/pandoc -S -s --self-contained -f markdown -t html5 --data-dir=. ")

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'larsen-markdown)
