(setq TeX-PDF-mode t)
(setq Tex-auto-save t)
(setq TeX-parse-self t)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-view-program-list '("zathura" "zathura %o"))
(setq TeX-view-program-selection '((output-pdf "zathura")))
(setq TeX-source-correlate-method 'synctex)
(setq LaTeX-command "latex -synctex=1")

(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(provide 'larsen-latex)
