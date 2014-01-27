with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.strings.unbounded;
use Ada.strings.unbounded;

package body person_pkg is
   procedure put(var: in person) is
   begin
      put(to_string(var.name));
   end put;
   function generate(name: in unbounded_string) return person is
      var: person;
   begin
      var.name := name;
      return(var);
   end generate;
   procedure set_name(var: out person; name: in unbounded_string) is
   begin
      var.name := name;
   end set_name;
end person_pkg;

