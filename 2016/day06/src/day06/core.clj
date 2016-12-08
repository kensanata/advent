(ns day06.core
  (:gen-class)
  (:use [clojure.string :only [split join]])
  (:use [clojure.pprint :only [pprint]]))

(defn make-hashes
  [letters]
  (apply vector (map (fn [c] {}) letters)))

(defn read-lines
  []
  (map (fn [s] (split s #""))
       (line-seq (java.io.BufferedReader. *in*))))

(defn process-line
  [line hashes]
  (loop [[c & rest] line  
         hashes hashes
         i 0]
    (if c
      (recur rest
             (update-in hashes [i c] (fn [v] (if v (+ v 1) 1)))
             (+ i 1))
      hashes)))

(defn process
  ([lines] (process lines (make-hashes (first lines))))
  ([lines hashes]
   (if hashes
     (let [line (first lines)]
       (if line
         (recur (rest lines)
                (process-line line hashes))
         hashes)))))

(defn result
  [hashes]
  (println "Most common letters: "
           (join (map (fn [hash]
                        (first (first (sort-by val > hash))))
                      hashes)))
  (println "Least common letters:"
           (join (map (fn [hash]
                        (first (last (sort-by val > hash))))
                      hashes))))

(defn -main
  "I don't do a whole lot ... yet."
  [& args]
  (result (process (read-lines))))
