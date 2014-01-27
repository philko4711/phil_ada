with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

procedure stringfor IS
   Str : String (1..11);
   Last: Natural;
begin
   Str := "Hello World";
   Last := Str'Last;
   Put_Line(Str);
   Put("Number of signs in string: ");
   Put(Last);   --Ada.Integer_Text_IO.
   new_line(2);
   rev_string_loop:
   for i in reverse 1..Last loop
      Put(Str (i));
   end loop rev_string_loop;
end stringfor;
