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

with pers_list;
--use pers_list;

with search_pkg;

with utilities_pkg;

with tree_pkg;

procedure main is
   function anal_choice(choice: in character) return character is separate;
   procedure new_page is
   begin
      for i in 1..100 loop
        new_line;
      end loop;
   end new_page;
   pers1, pers2: person_pkg.person;
   persPtr: person_pkg.person_ptr;
   tree: tree_pkg.node_ptr;
   choice: character;
   data_file: Ada.Text_IO.File_Type;
   list: pers_list.list_elm_ptr := pers_list.init;
   str_var: string(1..1000);
   nat_var: natural := 0;
   year_var: natural := 0;
   last: natural := 0;
begin
   --init tree with 8 persons
   Ada.Text_IO.Open (File => data_file,
                     Mode => Ada.Text_IO.In_File,
                     Name => "input.txt");
   person_pkg.set(pers1, data_file);
   tree := tree_pkg.init(pers1);
   persPtr := person_pkg.init(pers1);
   loop
      exit when end_of_file(data_file);
      person_pkg.set(pers1, data_file);
      tree_pkg.input(pers1, tree);
   end loop;
   new_page;
   main_loop:
   loop
      put_line("Enter choice:");
      put_line("   (E)nter new person");
      put_line("   (S)earch person");
      put_line("   (P)rint tree");
      put_line("   (Q)uit");
      get_immediate(choice);
 	    choice := To_upper(choice);
      choice_loop:
      loop
         case choice is
         when 'E' =>
            person_pkg.set(pers1);
            tree_pkg.input(pers1, tree);
            exit choice_loop;
         when 'S' =>
              put_line("Search person by:");
              put_line("   (N)ame");
              put_line("   (F)irstname");
              put_line("   Birth(Y)ear");
              put_line("   Birth(M)onth");
              put_line("   Birth(D)ay");
              get_immediate(choice);
 	            choice := To_upper(choice);
              case choice is
                when 'N' => 
                  put_line("Enter search name");
                  get_line(str_var, last);
                  list := search_pkg.findNames(tree, str_var(1..last));
                when 'F' =>
                  put_line("Enter search firstname");
                  get_line(str_var, last);
                  list := search_pkg.findFirstNames(tree, str_var(1..last));
                when 'Y' =>
                  put_line("Enter search birthyear");
                  get_line(str_var, last);
                  nat_var := Integer'Value(str_var(1..last));
                  list := search_pkg.findBirthYears(tree, nat_var);
                when 'M' =>
                  put_line("Enter search birthmonth");
                  get_line(str_var, last);
                  nat_var := Integer'Value(str_var(1..last));
                  list := search_pkg.findBirthMonths(tree, nat_var);
                when 'D' =>
                  put_line("Enter search birthday");
                  get_line(str_var, last);
                  nat_var := Integer'Value(str_var(1..last));
                  list := search_pkg.findBirthDays(tree, nat_var);
                when others =>
                  put_line("Illegal Command");
                end case;
                if(pers_list.empty(list) = false) then
                  put_line("Found data in: ");
                  pers_list.printList(list);
                else
                  put_line("Nothing found!");    
                end if;
            exit choice_loop;
         when 'P' =>
            tree_pkg.print_tree(tree);
            exit choice_loop;
         when 'Q' =>
            exit main_loop;
         when others =>
            put_line("Illegal command");
            exit choice_loop;
         end case;
      end loop choice_loop;
   end loop main_loop;
   close(data_file);
end main;
