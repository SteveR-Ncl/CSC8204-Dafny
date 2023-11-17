method Abs(x: int) returns (y: int)
  ensures 0 <= y
{
ifx<0
{ return −x; }
else
{ return x; }
}
