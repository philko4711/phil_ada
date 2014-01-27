with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.strings.unbounded;
use Ada.strings.unbounded;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with person_pkg;
with student_pkg;

procedure main is
   person: person_pkg.person;
   str_var: Unbounded_string;-- := (others => " ");
  -- student: student_pkg.student;
   mat_nbr: integer := 0;
begin
   person := person_pkg.generate(to_unbounded_string("Heini"));
   put_line("Content of person: ");
   person_pkg.put(person);


--     student_pkg.set(student, "Theo", 4711);
--     student_pkg.get(student, str_var, mat_nbr);
--     put_line("Content of student");
--     put_line("Name: " & To_string(str_var));
--     put("Matr. Nbr: ");
--     put(mat_nbr);
--     new_line;
end main;