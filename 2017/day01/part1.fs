
variable sum

: add 2dup = if sum @ + sum ! else drop then ;

\ note: order is not important?
\ 2 2 1 1 addall 3 ok

: addall
  0 sum !
  dup >r
  begin
    add
    depth 2 <
  until
  r> add
  drop
  sum ? ;

