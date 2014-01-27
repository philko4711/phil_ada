separate(main)

procedure print_oprt(Val: in operators) is
   package my_Enumeration_Io is new Enumeration_Io(operators);
   use my_Enumeration_Io;
begin
   put(Val);
exception
   when data_error =>
      Put_Line("Error");
      skip_line;
   when Constraint_Error =>
      Put_Line("Error");
end print_oprt;


