;;;
;;; larsen-smarttab.el
;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smart Tab
;; Borrowed from snippets at
;; http://www.emacswiki.org/emacs/TabCompletion
;; TODO: Take a look at https://github.com/genehack/smart-tab

(defvar smart-tab-using-hippie-expand t
  "turn this on if you want to use hippie-expand completion.")

(defun smart-tab (prefix)
  "Needs `transient-mark-mode' to be on. This smart tab is
  minibuffer compliant: it acts as usual in the minibuffer.

  In all other buffers: if PREFIX is \\[universal-argument], calls
  `smart-indent'. Else if point is at the end of a symbol,
  expands it. Else calls `smart-indent'."
  (interactive "P")
  (cl-labels ((smart-tab-must-expand (&optional prefix)
                                  (unless (or (consp prefix)
                                              mark-active)
                                    (looking-at "\\_>"))))
    (cond ((minibufferp)
           (minibuffer-complete))
          ((smart-tab-must-expand prefix)
           (if smart-tab-using-hippie-expand
               (hippie-expand prefix)
             (dabbrev-expand prefix)))
          ((smart-indent)))))

(defun smart-indent ()
  "Indents region if mark is active, or current line otherwise."
  (interactive)
  (if mark-active
    (indent-region (region-beginning)
                   (region-end))
    (indent-for-tab-command)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'larsen-smarttab)
