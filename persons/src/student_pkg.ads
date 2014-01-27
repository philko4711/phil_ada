with Ada.strings.unbounded;
use Ada.strings.unbounded;

with person_pkg;
package student_pkg is
   type student is new person_pkg.person with private;
   overriding
   procedure put(var: in student);
   overriding
   function generate(name: in unbounded_string; mat_nbr: in integer) return student;
   procedure set_name(var: out student; name: unbounded_string);
   procedure set_matnbr(var: out student; mat_nbr: in integer);
private
   type student is new person_pkg.person with record
      mat_nbr: integer;
   end record;
end student_pkg;


