(use-package jira
  :config
  (setq jira-api-version 3)
  (setq jira-issues-table-fields '(:key :assignee-name :progress-percent :status-name :summary)))

(provide 'larsen-jira)
