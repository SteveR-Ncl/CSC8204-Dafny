/* 
  First example of Dafny code

  In vscode, with the dafny plugin installed, code should be syntax highlighted
  with a "tick" mark in the left hand column alongside the method header.

  Changing the "ensures" postcondition to "0 <= x" should change the tick to a cross,
  and highlight the code which leads to the postcondition not being satisfied.

 */

method Abs(x: int) returns (y: int)
  ensures 0 <= y
{
  if x<0
    { return - x; }
  else
    { return x; }

}

/*
  Functions are also available and can be used in annotations. Note that names are case
  sensitive, so Abs (method) and abs (function) are different items.
 */

function abs(x: int): int
{
  if x < 0 then -x else x
}

/*
  A method in Dafny can return more than one variable. The example below
  returns two integer variables. There are 2 postconditions - but are they proven?
 */
method MultipleReturns(x: int, y: int) returns (more: int, less: int)
  ensures less < x
  ensures x < more
{
  more := x + y;
  less := x - y;
}