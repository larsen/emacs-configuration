;; ; (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20140821.38/snippets")
;; (add-to-list 'load-path "/Users/larsen/.emacs.d/elpa/yasnippet-20140821.38/snippets")

(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;; (define-key yas-minor-mode-map (kbd "<tab>") nil)
;; (define-key yas-minor-mode-map (kbd "TAB") nil)
;; (define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)

(global-set-key (read-kbd-macro "<C-tab>") 'yas-expand)

(provide 'larsen-snippets)
