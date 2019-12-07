w =. ;: 1!:1 <'data'      NB. a boxed array of words, numbers and linefeeds
i =. 2 * i. (# w) % 2     NB. the indexes of the numbers
n =. ". > i { w    	  NB. the list of numbers, opened
fuel =. verb define
 (<. y % 3) - 2
)
+/ fuel n
