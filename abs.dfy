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
