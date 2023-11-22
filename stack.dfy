/* 
  Simple integer stack

  Sequences are unbound datatypes, stack can be 
  modelled as a specialised sequence with a maximum 
  size.
  
*/
const stackMax := 40

type intStack = s: seq<int> | |s| <= stackMax

predicate isEmpty(s: intStack)
{
    |s| == 0
}

function push(s: intStack, x: int): intStack
requires |s| < stackMax
ensures |push(s,x)| == |s| + 1
{
    s + [x]
}

function pop(s: intStack): intStack
requires !isEmpty(s)
ensures |pop(s)| == |s| - 1
{
   s[..|s|-1] 
}

function top(s: intStack): int
requires !isEmpty(s)
{
   s[|s|-1] 
}

method testStack(n: nat)
{
  var s: intStack := [20, 30, 15, 40, 60, 100, 80];

  assert pop(push(s,100)) == s;
  assert push(pop(s),top(s)) == s;

  assert exists e: int :: 0 <= e < |s| && s[e] > 70;
  assert forall e: int :: 0 <= e < |s| ==> s[e] > 5;

  assert forall xs: intStack :: !isEmpty(xs) ==> (push(pop(xs),top(xs))) == xs;

}
