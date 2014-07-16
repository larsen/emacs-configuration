(require 'yasnippet)

(yas-global-mode 1)

;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)
;; (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)

(global-set-key (read-kbd-macro "<C-tab>") 'yas-expand)

(provide 'larsen-snippets)
