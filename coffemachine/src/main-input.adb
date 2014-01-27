separate(main)

function input return input_type is
   package my_Enumeration_Io is new Enumeration_Io(input_type);
   use my_Enumeration_Io;
   input : input_type;
begin
   input_loop:
   loop
      input_block:
      begin
      get(input);
      return(input);
   exception
      when data_error =>
         Put_line("Error input");
         skip_line;   --empty buffer
      when constraint_error =>
            put_line("Error");
      end input_block;
   end loop input_loop;
end input;
