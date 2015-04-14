(TeX-add-style-hook "usefulmath"
 (lambda ()
    (TeX-add-symbols
     '("shmath" 3))
    (TeX-run-style-hooks
     "array"
     "longtable"
     "booktabs"
     "mathpazo"
     "amsmath"
     "latex2e"
     "art10"
     "article"
     "operands")))

