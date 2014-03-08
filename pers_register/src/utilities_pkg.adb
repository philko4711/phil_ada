with Ada;
with Ada.Text_io;
use Ada.Text_io;

package body utilities_pkg is
   procedure flush is
      c: Character;
      more: boolean := true;
   begin
      loop
         get_immediate(c, more);
         put("flushes ");
         if(End_Of_Line) then
            put("new line");
         else
            put(c);
         end if;
         new_line;
         exit when not more;
      end loop;
   end flush;
end utilities_pkg;