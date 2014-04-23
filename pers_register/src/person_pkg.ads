with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.strings.unbounded;
use Ada.strings.unbounded;

package person_pkg is
  type str_ptr is access string;
  type person is private;
  type person_ptr is access person;
  function ">"(a, b: in person) return boolean;
  function ">"(a, b: in person_ptr) return boolean;
  function "="(a, b: in person) return boolean;
  procedure set(var: out person);
  procedure set(var: out person; source: in file_type);
  function init(var: in person) return person_ptr;
  procedure print(var: in person);
  procedure print(var: in person_ptr);
  function get(var: in person_ptr) return person;
  function findName(pers: in person_ptr; name: in string) return boolean;
  function findFirstname(pers: in person_ptr; name: in string) return boolean;
  function findBirthYear(pers: in person_ptr; birthyear: in natural) return boolean;
  function findBirthMonth(pers: in person_ptr; birthmonth: in natural) return boolean;
  function findBirthDay(pers: in person_ptr; birthday: in natural) return boolean;

private
   type person is record
      name: str_ptr;
      firstname: str_ptr;
      birthyear: natural;
      birthmonth: natural;
      birthday: natural;
   end record;
end person_pkg;


