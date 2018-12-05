(var records "
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
")
(var re "%[%d%d%d%d%-%d%d%-%d%d %d%d:(%d%d)%] ([^%c]+)")

;; First, sort the input
(var lines {})
(each [line (string.gmatch records "([^%c]+)")]
  (table.insert lines line))
(table.sort lines)

;; Next, parse all the data. We need to find who slept the most
;; minutes, and we need to count the minutes they preferred to sleep
;; through.
(var minutes {})
(var count {})
(var id nil)
(var sleep false)
(var from nil)
(each [i line (ipairs lines)]
  (let [(minute event) (string.match line re)]
    (let [n (string.match event "Guard #(%d+)")]
      (if n
          (set id n)
          (do
            ;; some safety testing
            (when (or (and (string.match event "falls asleep") sleep)
                      (and (string.match event "wakes up") (not sleep)))
              (print "Bork!" minute event sleep))
            (set sleep (not sleep))
            (if sleep
                (set from minute)
                (do
                  ;; remember who slept the most minutes
                  (tset minutes id (+ (or (. minutes id) 0) (- minute from)))
                  ;; (print "adding" id from minute (- minute from) (. minutes id))
                  ;; count the minutes the slept through
                  (let [t (or (. count id) {})]
                    (for [i from (- minute 1)]
                      (tset t i (+ 1 (or (. t i) 0))))
                    (tset count id t)))))))))
  
;; find the guard with the most minutes of sleep
(var sleepy nil)
(var max-minutes 0)
(each [id mins (pairs minutes)]
  (when (> mins max-minutes)
    (set sleepy id)
    (set max-minutes mins)))

;; (print "most minutes asleep" sleepy max-minutes)

(let [t (. count sleepy)]
  (var m 0)
  (var n 0)
  (each [minute times (pairs t)]
    (when (> times n)
      (set n times)
      (set m minute)))
  ;; (print m n sleepy)
  (print (* m sleepy)))
