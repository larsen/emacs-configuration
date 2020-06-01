;;; a2ps-multibyte.el --- print buffers with a2ps even when they are encoded in utf-8

;; Copyright (C) 2012-2014 François Févotte

;; Large parts of this file come from a2ps-print.el in the a2ps package
;;   (http://www.gnu.org/software/a2ps/)
;;   (C) Bruce Ingalls

;; Author:  François Févotte <fevotte@gmail.com>
;; URL:     https://github.com/ffevotte/a2ps-multibyte.el
;; Version: 0.1

;; This file is NOT part of Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


;;; Commentary:

;; If you make improvements to this code or have suggestions, please do not
;; hesitate to fork the repository or submit bug reports on github.  The
;; repository is at:
;;
;;     https://github.com/ffevotte/a2ps-multibyte.el

;;; Code:

;;;###autoload
(defgroup a2ps nil
  "Pretty-printing buffers using a2ps."
  :group 'external)

;;;###autoload
(defcustom a2ps-switches nil
  "List of extra command-line switches for a2ps when it is invoked."
  :group 'a2ps
  :type '(repeat string))

;;;###autoload
(defcustom a2ps-command "a2ps"
  "Path to the a2ps command."
  :group 'a2ps
  :type 'string)

;;;###autoload
(defcustom a2ps-encoding 'iso-8859-15-unix
  "Encoding charset to use for a2ps."
  :group 'a2ps
  :type 'coding-system)

;;;###autoload
(defun a2ps-buffer (argp)
  "Print buffer contents as with Unix command `a2ps'.
`a2ps-switches' is a list of extra command-line switches to pass
to a2ps.

With a prefix argument, interactively ask for extra switches."
  (interactive "P")
  (a2ps-region-1 (point-min) (point-max) argp "buffer"))

;;;###autoload
(defun a2ps-region (start end argp)
    "Print region contents as with Unix command `a2ps'.
`a2ps-switches' is a list of extra command-line switches to pass
to a2ps.

With a prefix argument, interactively ask for extra switches."
  (interactive "r\nP")
  (a2ps-region-1 start end argp "region"))

(defun a2ps-region-1 (start end argp type)
  (let* ((buffer    (current-buffer))
         (doc-name  (buffer-name))
         (suffix    (if buffer-file-name
                        (let ((i (string-match "\\.[^./]*$" buffer-file-name)))
                          (if i
                              (substring buffer-file-name i)
                            ""))
                      ""))
         (filename  (make-temp-file "emacs-a2ps." nil suffix))
         (switches  a2ps-switches))
    (when argp
      (setq switches (append switches (split-string (read-string "switches: ")))))
    (find-file filename)
    (insert-buffer-substring buffer start end)
    (run-hooks 'a2ps-filter-functions)

    ;; Try hard to make emacs use the specified encoding
    ;;
    ;;   The `auto-coding-alist' variable takes priority over everything else, including 'coding:'
    ;;   tags in the file.
    (set (make-local-variable 'auto-coding-alist)
         (list (cons ".*" a2ps-encoding)))
    (set (make-local-variable 'make-backup-files)
         nil)
    (save-buffer)

    ;; Actually call a2ps
    (apply 'call-process
           (nconc (list "env" nil "*a2ps*" nil "LANG=C" a2ps-command
                        (concat "--center-title=" doc-name)
                        (concat "--footer=(Emacs " type ")")
                        ;"-o" "/tmp/a2ps-test.ps" ;; Uncomment for debugging purposes
                        filename)
                  switches))
    (kill-buffer)
    (delete-file filename)))

(provide 'a2ps-multibyte)

;;; a2ps-multibyte.el ends here
