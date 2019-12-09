w =. ;: 1!:1 <'original'
n =: ". > ((#w) $ 1 0) # w

step =: verb define
select. y { n
case. 1 do.
  a =. ((y+1){n){n
  b =. ((y+2){n){n
  c =. ((y+3){n)
  n =: (a + b) c } n
  step y+4
case. 2 do.
  a =. ((y+1){n){n
  b =. ((y+2){n){n
  c =. ((y+3){n)
  n =: (a * b) c } n
  step y+4
case. 99 do.
  0 { n
end.
)

step 0
