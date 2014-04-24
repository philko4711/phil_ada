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
         exit when not more;
      end loop;
   end flush;
end utilities_pkg;
