(setq org-my-anki-file "~/org/personal/anki.org")

(add-to-list 'org-capture-templates
             `("a" "Anki basic"
               entry
               (file+headline org-my-anki-file "Dispatch Shelf")
               "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Default\n:END:\n** Front\n%?\n** Back\n%x\n"))

(provide 'larsen-anki)
