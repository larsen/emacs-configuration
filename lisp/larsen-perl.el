(let ((indent-level 2))
  (setq cperl-indent-level indent-level
        cperl-close-paren-offset (* -1 indent-level)
        cperl-continued-statement-offset indent-level
        cperl-indent-parens-as-block t
        cperl-tab-always-indent t
        cperl-indent-subs-specially nil))

(add-to-list 'auto-mode-alist '("\\.pl$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pm$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))

(defun my-open-module (module)
  (interactive (list (cperl-word-at-point)))
  (let* ((module-file (shell-command-to-string (format "perldoc -ml %s" module)))
         (module-file-normalized (replace-regexp-in-string "\\(\n*\\)$" "" module-file)))
    (if (not (string-match "^No module found" module-file))
        (find-file module-file-normalized)
      (message "No module found!"))))

(provide 'larsen-perl)
