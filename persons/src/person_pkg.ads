with Ada.strings.unbounded;
use Ada.strings.unbounded;

package person_pkg is
   type person is tagged private;
   procedure put(var: in person);
   function generate(name: in unbounded_string) return person;
   procedure set_name(var: out person; name: in unbounded_string);
private
   type person is tagged record
      name: Unbounded_string;
   end record;
end person_pkg;
