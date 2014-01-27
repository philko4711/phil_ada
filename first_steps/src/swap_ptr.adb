with Ada;
with Ada.Integer_Text_IO;
with Ada.Text_io;
use Ada.Integer_Text_IO;
use Ada.Text_io;

procedure swap_ptr is
   type int_ptr is access integer;
   procedure swap(ptr1: in out int_ptr; ptr2: in out int_ptr) is separate;
   ptr1: int_ptr := new integer;
   ptr2: int_ptr := new integer;
begin
   ptr1.all := 5;
   ptr2.all := 10;
   Put_line("Content of ptr1 :");
   put(ptr1.all);
   new_line;
   Put_line("Content of ptr2 :");
   put(ptr2.all);
   new_line;
   swap(ptr1, ptr2);
   Put_line("After swap");
   Put_line("Content of ptr1 :");
   put(ptr1.all);
   new_line;
   Put_line("Content of ptr2 :");
   put(ptr2.all);
   new_line;
end swap_ptr;

