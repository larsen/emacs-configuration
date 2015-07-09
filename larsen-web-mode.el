(require 'web-mode)

(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-control-block-indentation nil)
(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs?\\'" . web-mode))

(provide 'larsen-web-mode)
