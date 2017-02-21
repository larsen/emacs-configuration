(package-require 'yasnippet)
(require 'yasnippet)

(setq yas-dont-activate nil)
(add-hook 'term-mode-hook (lambda()
        (setq yas-dont-activate t)))

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;(define-key yas-minor-mode-map (kbd "<tab>") nil)
;(define-key yas-minor-mode-map (kbd "TAB") nil)
;(define-key yas-minor-mode-map (kbd "[?\C-\t]") 'yas-expand)

(provide 'larsen-snippets)
