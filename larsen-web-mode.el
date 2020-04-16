(use-package web-mode)

(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight nil)
(setq web-mode-enable-control-block-indentation nil)
(setq web-mode-style-padding 1)
(setq web-mode-script-padding 1)

(add-hook 'web-mode-hook
      (lambda ()
        ;; short circuit js mode and just do everything in jsx-mode
        (if (equal web-mode-content-type "javascript")
            (web-mode-set-content-type "jsx")
          (message "now set to: %s" web-mode-content-type))))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs?\\'" . web-mode))

(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))

(provide 'larsen-web-mode)
