(do
  (var sum 0)
  (var seen {})
  (while true
    (each [num (string.gmatch "+1, -2, +3, +1" "[-+]%d+")]
      (set sum (+ sum num))
      ;; (print "sum" sum "seen" seen.sum)
      (if (. seen sum)
          (do
            (print sum)
            ;; no break from the while/each loop
            (os.exit))
          (tset seen sum true)))))
