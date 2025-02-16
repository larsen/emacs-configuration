(use-package fontaine
  :ensure t
  :custom
  (fontaine-presets '((regular :default-height 100)
                      (large :default-weight regular
                             :default-height 160)
                      (medium :default-height 130
                              :default-weigh semilight)
                      (variable :default-family "EB Garamond"
                                 :default-height 180)
                      (t :default-family "Iosevka"
                         :default-weight regular
                         :default-height 100
                         :fixed-pitch-family nil
                         :fixed-pitch-weight nil
                         :fixed-pitch-height 1.0
                         :fixed-pitch-serif-family nil
                         :fixed-pitch-serif-weight nil
                         :fixed-pitch-serif-height 1.0
                         :variable-pitch-family "EB Garamond"
                         :variable-pitch-weight nil
                         :variable-pitch-height 1.3
                         :bold-family nil
                         :bold-weight bold
                         :italic-family nil
                         :italic-slant italic
                         :line-spacing nil)))
  :config
  (fontaine-set-preset 'large))

(provide 'larsen-fontaine)
