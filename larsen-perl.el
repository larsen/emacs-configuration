(global-set-key (kbd "C-h P") 'cperl-perldoc-at-point)

(let ((indent-level 2))
  (setq cperl-indent-level indent-level
        cperl-close-paren-offset (* -1 indent-level)
        cperl-continued-statement-offset indent-level
        cperl-indent-parens-as-block t
        cperl-tab-always-indent t
        cperl-indent-subs-specially nil))

(add-to-list 'auto-mode-alist '("\\.p[lm]$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))

(provide 'larsen-perl)
