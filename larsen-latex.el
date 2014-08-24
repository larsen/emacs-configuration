(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

(setq
 TeX-view-program-list '(("open" "open %o"))
; TeX-view-program-selection '((output-pdf "open"))
; TeX-source-correlate-method 'synctex
; LaTeX-command "latex -synctex=1")
)

(getenv "PATH")
(setenv "PATH"
        (concat
         "/usr/texbin" ":" (getenv "PATH")))

(setenv "PATH"
        (concat
         "/usr/local/Cellar/ghostscript/9.14/bin/" ":" (getenv "PATH")))

(setq exec-path (append exec-path '("/usr/local/Cellar/ghostscript/9.14/bin/")))

(provide 'larsen-latex)
