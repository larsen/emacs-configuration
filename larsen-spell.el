(setq-default ispell-program-name "/usr/bin/aspell")
(setq-default ispell-list-command "list")

(add-hook 'markdown-mode-hook 'flyspell-mode)

(provide 'larsen-spell)
