;;; larsen-flycheck.el --- Flycheck configuration

(use-package flycheck
  :hook elpy-mode
  :config
  (global-flycheck-mode 1)
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (side            . bottom)
                 (reusable-frames . visible)
                 (window-height   . 0.33))))

(provide 'larsen-flycheck)
