(use-package fontaine
  :ensure t
  :custom
  (fontaine-presets '((regular :default-height 100)
                      (large :default-weight semilight
                             :default-height 140
                             :bold-weight extrabold)
                      (medium :default-height 130
                              :default-weigh semilight)
                      (t :default-family "Iosevka"
                         :default-weight regular
                         :default-height 100
                         :fixed-pitch-family nil
                         :fixed-pitch-weight nil
                         :fixed-pitch-height 1.0
                         :fixed-pitch-serif-family nil
                         :fixed-pitch-serif-weight nil
                         :fixed-pitch-serif-height 1.0
                         :variable-pitch-family "Literata eBook"
                         :variable-pitch-weight nil
                         :variable-pitch-height 1.0
                         :bold-family nil
                         :bold-weight bold
                         :italic-family nil
                         :italic-slant italic
                         :line-spacing nil)))
  :config
  (fontaine-set-preset 'large))

(provide 'larsen-fontaine)
