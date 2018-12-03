(var claims "
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
")
(var map {})
(var overlap {})
(var ids {})
(each [id x y dx dy (string.gmatch claims "#(%d+) @ (%d+),(%d+): (%d+)x(%d+)")]
  (tset ids id true)
  (for [i x (+ x dx -1)]
    (for [j y (+ y dy -1)]
      (let [coordinates (.. i "," j)]
        (if (. map coordinates)
            (do
              (tset overlap (. map coordinates) true)
              (tset overlap id true))
            (tset map coordinates id))))))

(each [id seen (pairs ids)]
  (when (not (. overlap id))
    (print id)))
