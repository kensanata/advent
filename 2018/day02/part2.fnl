(do
  (var candidates {})
  (each [id (string.gmatch "
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
" "%a+")]
    (let [len (string.len id)]
      (for [i 1 (- len 1)]
        (let [s (.. (string.sub id 0 (- i 1))
                    (string.sub id (+ i 1)))]
          (when (and (. candidates s)
                     (not (= id (. candidates s))))
            (print "A " id)
            (print "B " (. candidates s))
            (print "> " s))
          (tset candidates s id))))))
