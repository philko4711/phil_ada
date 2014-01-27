with Ada;
with Ada.strings.unbounded;
use Ada.strings.unbounded;

package person_pkg is
   type str_ptr is access string;
   type person is private;
   type person_ptr is private;
   function ">"(a, b: in person) return boolean;
   function ">"(a, b: in person_ptr) return boolean;
   function "="(a, b: in person) return boolean;
   procedure set(var: out person);
   function init(var: in person) return person_ptr;
   procedure print(var: in person);
   procedure print(var: in person_ptr);
   function get(var: in person_ptr) return person;
private
   type person is record
      name: str_ptr;
      firstname: str_ptr;
      birthyear: natural;
      birthmonth: natural;
      birthday: natural;
   end record;
   type person_ptr is access person;
end person_pkg;


