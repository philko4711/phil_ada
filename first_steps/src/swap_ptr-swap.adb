separate(swap_ptr)

procedure swap(ptr1: in out int_ptr; ptr2: in out int_ptr) is
   var: int_ptr;
begin
   var := ptr1;
   ptr1 := ptr2;
   ptr2 := var;
end swap;
