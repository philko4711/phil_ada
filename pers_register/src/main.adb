with Ada;
with Ada.Text_io;
with Ada.Characters.handling;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
use Ada.Text_io;
use Ada.Strings.Maps.Constants;
use Ada.Characters.handling;

with person_pkg;
use person_pkg;

with utilities_pkg;

with tree_pkg;

procedure main is
   function anal_choice(choice: in character) return character is separate;
   pers1, pers2: person_pkg.person;
   tree: tree_pkg.node_ptr;
   choice: character;
   data_file: Ada.Text_IO.File_Type;
begin
   --init tree with 8 persons
   Ada.Text_IO.Open (File => data_file,
                     Mode => Ada.Text_IO.In_File,
                     Name => "input.txt");
   person_pkg.set(pers1, data_file);
   tree := tree_pkg.init(pers1);
   loop
      exit when end_of_file(data_file);
      person_pkg.set(pers1, data_file);
      tree_pkg.input(pers1, tree);
   end loop;
   main_loop:
   loop
      put_line("Enter choice:");
      put_line("   (E)nter new person");
      put_line("   (S)earch person");
      put_line("   (P)rint tree");
      put_line("   (Q)uit");
      get_immediate(choice);
 	    choice := To_upper(choice);
      --utilities_pkg.flush;
      --Skip_Line;
      --choice := anal_choice(choice);
      choice_loop:
      loop
         case choice is
         when 'E' =>
            person_pkg.set(pers1);
            tree_pkg.input(pers1, tree);
            exit choice_loop;
            when 'S' =>
            put_line("Searching");
            exit choice_loop;
            when 'P' =>
            tree_pkg.print_tree(tree);
            exit choice_loop;
            when 'Q' =>
            exit main_loop;
            when others =>
            put_line("Please enter the right character");
            exit choice_loop;
         end case;
      end loop choice_loop;
   end loop main_loop;
   close(data_file);
end main;
