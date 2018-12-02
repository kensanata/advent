(do
  (var sum 0)
  (var seen {})
  (var done? false)
  (while (not done?)
    (each [num (string.gmatch "+1, -2, +3, +1" "[-+]%d+")]
      (set sum (+ sum num))
      ;; (print "sum" sum "seen" seen.sum)
      (if (. seen sum)
          (do
            (when (not done?)
              (print sum))
            ;; sadly this doesn't break immediately
            (set done? true))
          (tset seen sum true)))))
