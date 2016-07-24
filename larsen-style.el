(package-require 'nlinum)

(set-default 'indent-tabs-mode nil)
(setq-default tab-width 2)

(global-hl-line-mode 1) ; turn on highlighting current line
(nlinum-mode)
(global-visual-line-mode 1)
(global-font-lock-mode 1)
(delete-selection-mode 1) ; delete seleted text when typing
(show-paren-mode 1) ; turn on paren match highlighting
(setq show-paren-style 'expression) ; highlight entire bracket expression

; Not sure why I need this
(setq ansi-term-color-vector
  [term term-color-black term-color-red term-color-green term-color-yellow 
    term-color-blue term-color-magenta term-color-cyan term-color-white])

(provide 'larsen-style)

