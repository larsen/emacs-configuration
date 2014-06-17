(set-default 'indent-tabs-mode nil)
(setq-default tab-width 2)

(require 'color-theme)
    
(color-theme-initialize)
(color-theme-solarized-dark)

(global-hl-line-mode 1) ; turn on highlighting current line
(global-linum-mode 1)
(global-visual-line-mode 1)
(global-font-lock-mode 1)
(delete-selection-mode 1) ; delete seleted text when typing
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression

(require 'anzu)
(global-anzu-mode 1)

(provide 'larsen-style)
