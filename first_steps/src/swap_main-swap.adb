separate (swap_main)

procedure swap(a, b: in out integer) is
   var: integer := 0;
begin
   var := a;
   a := b;
   b := var;
end swap;

