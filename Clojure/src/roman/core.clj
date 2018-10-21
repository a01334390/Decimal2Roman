(ns roman.core
  (:gen-class))

  (defn decimal2roman
    "This function transforms decimal years to roman numerals"
    [year]
  
    (def m "Roman values for thousands" '("" "M" "MM" "MMM" "MMMM" "MMMMM" "MMMMMM" "MMMMMMM" "MMMMMMMM" "MMMMMMMMM"))
    (def c "Roman values for hundreds" '("" "C" "CC" "CCC" "CD" "D" "DC" "DCC" "DCCC" "CM"))
    (def x "Roman values for tens" '("" "X" "XX" "XXX" "XL" "L" "LX" "LXX" "LXXX" "XC"))
    (def i "Roman values for ones" '("" "I" "II" "III" "IV" "V" "VI" "VII" "VIII" "IX"))
  
    (let [
      thousands (nth m (int (/ year 1000)))
      hundreds (nth c (int (/ (mod year 1000) 100)))
      tens (nth x (int (/ (mod year 100) 10)))
      ones (nth i (int (mod year 10)))
    ]
    (str thousands hundreds tens ones)
    )
  )

  (defn -main
    [& args]
    (println "Enter decimal number: ")
    (def query (Integer/parseInt (read-line)))
    (println (str "Decimal: " query " -> Roman: " (decimal2roman query)))
  )

