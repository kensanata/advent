(var s "dabAcCaCBAcCcaDA")
(var result {})
(for [x 1 26];; A to Z
  (let [p (.. "[" (string.char (+ x 64) (+ x 96)) "]")]
    (var s (string.gsub s p ""))
    (var changes? true)
    (while changes?
      (set changes? false)
      (var i (# s))
      (while (>= i 2)
        (var a (string.byte s (- i 1)))
        (var b (string.byte s i))
        ;; A is 65, a is 97
        (when (= 32 (math.abs (- b a)))
          (set changes? true)
          (set s (.. (string.sub s 1 (- i 2))
                     (string.sub s (+ 1 i) (# s))))
          (set i (- i 1)))
        (set i (- i 1))))
    (table.insert result (# s))))

(var pos nil)
(var len (# s))
(each [i n (ipairs result)]
  (when (< n len)
    (set pos i)
    (set len n)))
(print (string.char (+ 64 pos)) len)
