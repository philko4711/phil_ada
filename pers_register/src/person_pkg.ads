with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.strings.unbounded;
use Ada.strings.unbounded;

--Package for data of persons
package person_pkg is
  type str_ptr is access string;
  type person is private;
  type person_ptr is access person;
	--Operator to sort persons in the binary tree
  function ">"(a, b: in person) return boolean;
	--Operator to sort persons in the binary tree
  function ">"(a, b: in person_ptr) return boolean;
	--Operator to sort persons in the binary tree
  function "="(a, b: in person) return boolean;
	--Function to create a person. Input is keyboard
  procedure set(var: out person; succ: out boolean);
	--Function to create a person. Input is file
  procedure set(var: out person; source: in file_type; succ: out boolean);
	--Function to create a ptr to a person
  function init(var: in person) return person_ptr;
	--Function to print person on the screen
  procedure print(var: in person);
	--Function to print person on the screen
  procedure print(var: in person_ptr);
	--Function to access a person ptr
  function get(var: in person_ptr) return person;
	--Function to compare a string to the name stored in a person
  function findName(pers: in person_ptr; name: in string) return boolean;
	--Function to compare a string to the firstname stored in a person
  function findFirstname(pers: in person_ptr; name: in string) return boolean;
	--Function to compare a natural to the birthyear stored in a person
  function findBirthYear(pers: in person_ptr; birthyear: in natural) return boolean;
	--Function to compare a natural to the birthmonth stored in a person
  function findBirthMonth(pers: in person_ptr; birthmonth: in natural) return boolean;
	--Function to compare a natural to the birthday stored in a person
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


