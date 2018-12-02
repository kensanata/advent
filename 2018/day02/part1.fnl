(do
  (var doubles 0)
  (var triples 0)
  (each [id (string.gmatch "
abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab
" "%a+")]
    (var letters {})
    (each [letter (string.gmatch id "%a")]
      (if (. letters letter)
          (tset letters letter (+ 1 (. letters letter)))
          (tset letters letter 1)))
    (var doubles? false)
    (var triples? false)
    (each [letter count (pairs letters)]
      (when (and (= count 2) (not doubles?))
        (set doubles (+ 1 doubles))
        (set doubles? true))
      (when (and (= count 3) (not triples?))
        (set triples (+ 1 triples))
        (set triples? true))))
  (print (* doubles triples)))
      
         
