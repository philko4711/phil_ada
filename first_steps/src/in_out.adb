with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

procedure in_out is
   buffer_size: constant integer := 2_000;
   type buffer_count is range 1..buffer_size;
   Str: String(1..2000);
   Cur_size: Integer := 1;
begin
   Get_Line(Str, Cur_size);
   output:
   declare
      loop_counter: integer := Cur_size;
   begin
      out_loop:
      loop
         Put(Str(loop_counter));
         loop_counter := loop_counter - 1;
         --if(loop_counter = 0) then
            exit out_loop when loop_counter = 0;
         --end if;
      end loop out_loop;
   end output;
end in_out;


