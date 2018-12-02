(do
  (var sum 0)
  (each [num (string.gmatch "+1, -2, +3, +1" "[-+]%d+")]
    (set sum (+ sum num)))
  (print sum))
