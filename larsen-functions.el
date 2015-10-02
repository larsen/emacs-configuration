(defun osx-notify (title message)
  (start-process "osx-notify" nil "terminal-notifier" "-title" title "-message" message))

(provide 'larsen-functions)
