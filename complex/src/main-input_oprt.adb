separate(main)

function input_oprt return operators is
   package my_Enumeration_Io is new Enumeration_Io(operators);
   use my_Enumeration_Io;
   operator: operators;
begin
   input_loop:
   loop
      input_block:
      begin
         get(operator);
         return(operator);
      exception
         when data_error =>
            Put_line("Error");
            skip_line;
         when constraint_error =>
            Put_line("Error");
      end input_block;
   end loop input_loop;
end input_oprt;


