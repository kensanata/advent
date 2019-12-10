NB. read data from the file and convert into a list of numbers
w =. ;: 1!:1 <'original'
o =: ". > ((#w) $ 1 0) # w

NB. this steps through the "program" (currently there are three
NB. opcodes defined: 1 and 2 take three arguments each, 99 takes no
NB. argument ands the computation.
step =: dyad define
select. y { x
case. 1 do.
  a =. ((y+1){x){x
  b =. ((y+2){x){x
  c =. ((y+3){x)
  n =: (a + b) c } x
  n step y+4
case. 2 do.
  a =. ((y+1){x){x
  b =. ((y+2){x){x
  c =. ((y+3){x)
  n =: (a * b) c } x
  n step y+4
case. 99 do.
  0 { x
end.
)

NB. This computes the solution for part 1 of the challenge.
o step 0

NB. This "adapts" the program by allowing me to replace the second and
NB. third number.
fix =. 1 2 }

NB. Example:
66 77 fix o

NB. I need a function that can call step for all sorts of "fixed"
NB. programs:
try =. 4 : '((x, y) fix o) step 0'

NB. Example (same result as above)
12 try 2

NB. Now let's find all the pairs between 0 and 99 where the result is
NB. 19690720:
19690720=.try/~i.100
