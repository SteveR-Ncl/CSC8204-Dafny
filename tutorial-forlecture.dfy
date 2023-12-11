/* 
  Dafny code - lecture version



 */

method Abs(x: int) returns (y: int)
  requires x <= 0
  ensures (y == -x)
{
     return -x; 
  
}

class sorting
{
  ghost function sorted(s: seq<int>): bool
  {
    forall i:int :: 0 <= i < |s|-1 ==> s[i] <= s[i+1]
  }

  function sort(s1: seq<int>): seq<int>
  ensures sorted(sort(s1)) &&
    forall x:int :: x in s1 ==> x in sort(s1)
}




method Divide(m: int, n: int) returns (q: int, r : int)
requires ((m >= 0) && (n > 0))
ensures ((m == q * n + r) && (r < n) && (r >= 0))
{
  q := 0;
	r := m;
	while r >= n 
    {
        q:= q + 1;
        r:= r - n;
    }
	

}






 //       invariant (m == q * n + r) && (r >= 0)
  







class myClass
{ 
  var field1: int
  var field2: int

  function f(a: int): int
  ensures f(a) > field1
}














/*
  Functions are also available and can be used in annotations. Note that names are case
  sensitive, so Abs (method) and abs (function) are different items.
 */

function abs(x: int): int
{
  if x < 0 then -x else x
}
