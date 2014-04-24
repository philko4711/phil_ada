with Ada;
with Ada.Text_io;
with Ada.Characters.handling;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
use Ada.Text_io;
use Ada.Strings.Maps.Constants;
use Ada.Characters.handling;

with person_pkg;

with pers_list;

with search_pkg;

with utilities_pkg;

with tree_pkg;

with input_pkg;

procedure main is
   procedure new_page is
   begin
      for i in 1..100 loop
        new_line;
      end loop;
   end new_page;
   pers1: person_pkg.person;
   tree: tree_pkg.node_ptr;
   choice: character;
   data_file: Ada.Text_IO.File_Type;
   list: pers_list.list_elm_ptr := pers_list.init;
   str_var: string(1..1000);
   nat_var: natural := 0;
   year_var: natural := 0;
   last: natural := 0;
	 succ: boolean := false;
	 pers_succ: boolean := false;
begin
   --init tree with 8 persons from data file
   Ada.Text_IO.Open (File => data_file,
                     Mode => Ada.Text_IO.In_File,
                     Name => "input.txt");
   person_pkg.set(pers1, data_file, succ);
	 if(succ = true) then
	   tree := tree_pkg.init(pers1);
		 else
			 put_line("Error datafile corrupt -> abort");	
       close(data_file);
			 return;
	 end if;
   loop
			succ := false;
      exit when end_of_file(data_file);
      person_pkg.set(pers1, data_file, succ);
		 if(succ = true) then
		   tree_pkg.input(pers1, tree);
		 else
			 put_line("Error datafile corrupt -> abort");	
	 		 close(data_file);
			 return;
		 end if;     
   end loop;
	 close(data_file);

	 --main loop
   new_page;
   main_loop:
   loop
			succ := false;
			--main menu
      put_line("Enter choice:");
      put_line("   (E)nter new person");
      put_line("   (S)earch person");
      put_line("   (P)rint tree");
      put_line("   (Q)uit");
			input_pkg.get_char(choice, succ);

			if(succ = true) then
	 	    choice := To_upper(choice);
      	choice_loop:
      	loop
         	case choice is

         		when 'E' =>
							pers_succ := false;
							person_pkg.set(pers1, pers_succ);
          	  if(pers_succ = true) then
	          	  tree_pkg.input(pers1, tree);
							end if;
            exit choice_loop;

         		when 'S' =>
						  succ := false;
							--search menu
              put_line("Search person by:");
              put_line("   (N)ame");
              put_line("   (F)irstname");
              put_line("   Birth(Y)ear");
              put_line("   Birth(M)onth");
              put_line("   Birth(D)ay");
							input_pkg.get_char(choice, succ);
						
							if(succ = true) then	
	 	            choice := To_upper(choice);
  	            case choice is
  	              when 'N' => 
  	                put_line("Enter search name");
										input_pkg.get_string(str_var, last, succ);
										if(succ = true) then
	  	                list := search_pkg.findNames(tree, str_var(1..last));
										else
											put_line("Input error");
											exit choice_loop;
										end if;

  	              when 'F' =>
  	                put_line("Enter search firstname");
										input_pkg.get_string(str_var, last, succ);
										if(succ = true) then
	  	                list := search_pkg.findNames(tree, str_var(1..last));
										else
											put_line("Input error");
											exit choice_loop;
										end if;
  	                list := search_pkg.findFirstNames(tree, str_var(1..last));

  	              when 'Y' =>
  	                put_line("Enter search birthyear");
										input_pkg.get_nat(nat_var, succ);
										if(succ = true) then
		                  list := search_pkg.findBirthYears(tree, nat_var);
										else
											put_line("Input error");
											exit choice_loop;
										end if;

  	              when 'M' =>
  	                put_line("Enter search birthmonth");
										input_pkg.get_nat(nat_var, succ);
										if(succ = true) then
		                  list := search_pkg.findBirthMonths(tree, nat_var);
										else
											put_line("Input error");
											exit choice_loop;
										end if;

  	              when 'D' =>
  	                put_line("Enter search birthday");
										input_pkg.get_nat(nat_var, succ);
										if(succ = true) then
  		                list := search_pkg.findBirthDays(tree, nat_var);
										else
											put_line("Input error");
											exit choice_loop;
										end if;

                	when others =>
                  	put_line("Illegal Command");
                	end case;

                	if(pers_list.empty(list) = false) then
                  	put_line("Found data in: ");
                 	 pers_list.printList(list);
                	else
                  	put_line("Nothing found!");    
                	end if;

									new_line(2);
            	exit choice_loop;
						end if;

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
		end if;
   end loop main_loop;
end main;
