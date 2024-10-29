;;; larsen-markdown.el -- Markdown setup

(use-package markdown-mode
  :ensure t
  :mode ("\\.markdown$" "\\.md$")
  :custom (markdown-command "/usr/bin/pandoc -s --self-contained -f markdown -t html5 --data-dir=. "))

(defun my-flymd-browser-function (url)
  (let ((browse-url-browser-function 'browse-url-firefox))
    (browse-url url)))
(setq flymd-browser-open-function 'my-flymd-browser-function)

(provide 'larsen-markdown)
