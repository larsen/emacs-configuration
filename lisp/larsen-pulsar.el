(use-package pulsar
  :ensure t
  :custom
  (pulsar-pulse t)
  (pulsar-delay 0.055)
  (pulsar-iterations 10)
  (pulsar-face 'pulsar-yellow)
  (pulsar-highlight-face 'pulsar-yellow)
  :config
  (pulsar-global-mode 1))
