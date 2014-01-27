with Ada.strings.unbounded;
use Ada.strings.unbounded;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

package body student_pkg is
   procedure put(var: in student) is
   begin
      person_pkg.put(person_pkg.person(var));
      put(var.mat_nbr);
   end put;
   function generate(name: in unbounded_string; mat_nbr: in integer) return student is
      var: person := person_pkg.set(name);
      var2: student;
   begin
      var2 := student(var);
      var2.mat_nbr := mat_nbr;
      return(var2);
   end generate;
   procedure set_name(var: out student; name: unbounded_string) is
   begin
      person_pkg.set_name(person_pkg.person(var), name);
   end set_name;
   procedure set_matnbr(var: out student; mat_nbr: in integer) is
   begin
      var.mat_nbr := mat_nbr;
   end set_matnbr;


end student_pkg;