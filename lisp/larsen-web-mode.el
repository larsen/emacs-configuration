(use-package web-mode
  :mode ("\\.html?\\'" "\\.hbs?\\'")
  :custom
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)
  (web-mode-enable-current-column-highlight t)
  (web-mode-enable-current-element-highlight nil)
  (web-mode-enable-control-block-indentation nil)
  (web-mode-style-padding 1)
  (web-mode-script-padding 1))

(add-hook 'web-mode-hook
      (lambda ()
        ;; short circuit js mode and just do everything in jsx-mode
        (if (equal web-mode-content-type "javascript")
            (web-mode-set-content-type "jsx")
          (message "now set to: %s" web-mode-content-type))))

(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))

(setq-default js2-basic-offset 2)
(setq js-indent-level 2)

(provide 'larsen-web-mode)
