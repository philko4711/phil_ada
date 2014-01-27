with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

procedure swap_main is
   procedure swap(a, b: in out integer) is separate;
   a: integer := 99;
   b: integer := 5;
begin
   Put_Line("Content of a = ");
   Put(a);
   new_line;
   Put_Line("Content of b = ");
   Put(b);
   new_line;
   swap(a, b);
   Put_Line("Content of a = ");
   Put(a);
   new_line;
   Put_Line("Content of b = ");
   Put(b);
   new_line;
end swap_main;