(ns day06.core-test
  (:require [clojure.test :refer :all]
            [day06.core :refer :all]))

(deftest basic-test
  (testing "make-hashes"
    (is (= (make-hashes '[a k e x])
           '[{} {} {} {}])))
  (testing "processing of characters"
    (is (= (process-line '[a k e x] '[{} {} {} {}])
           '[{a 1} {k 1} {e 1} {x 1}])))
  (testing "processing of lines"
    (is (= (process '([a k e x] [a l f x] [b l e y]))
           '[{a 2, b 1} {k 1, l 2} {e 2, f 1} {x 2, y 1}]))))
