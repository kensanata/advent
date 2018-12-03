(var claims "
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
")
(var map {})
(each [id x y dx dy (string.gmatch claims "#(%d+) @ (%d+),(%d+): (%d+)x(%d+)")]
  (for [i x (+ x dx -1)]
    (for [j y (+ y dy -1)]
      (let [coordinates (.. i "," j)]
        (tset map coordinates (+ 1 (or (. map coordinates) 0)))))))

(var overlap 0)
(each [coordinates value (pairs map)]
  (when (> value 1)
    (set overlap (+ 1 overlap))))
(print overlap)
