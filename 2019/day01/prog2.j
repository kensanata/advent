w =. ;: 1!:1 <'data'      NB. a boxed array of words, numbers and linefeeds
i =. 2 * i. (# w) % 2     NB. the indexes of the numbers
n =. ". > i { w    	  NB. the list of numbers, opened

fuel =. 3 : '(<. y % 3) - 2'

3 : 0''
  assert. 2 -: fuel 14
  assert. 654 -: fuel 1969
  assert. 656 -: +/ fuel 14 1969
)

total =. 3 : 0
0 total y
:
f =. fuel y
if. f <= 0 do. x else. x + f total f end.
)

3 : 0''
  assert. 2 -: total 14
  assert. 966 -: total 1969
  assert. 968 -: +/ > total each 14 1969
)

+/ > total each n
