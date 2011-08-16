(defn string* [n m]
  (sort (seq (.toString (* n m)))))

(defn works? [n]
  ; seems like this could be DRYed up
  (= (string* n 1) (string* n 2) (string* n 3) (string* n 4) (string* n 5) (string* n 6)))

(defn check [r]
  (loop [nums r]
    (let [n (first nums)]
      (if (works? n)
        ; seems like this could be DRYed up
        (println n " works! (" (* n 2) (* n 3) (* n 4) (* n 5) (* n 6) ")")
        (recur (rest nums))))))

(check (range 1 Double/POSITIVE_INFINITY))
