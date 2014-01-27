separate(main)

procedure output(Val: in output_type) is
   package my_Enumeration_Io is new Enumeration_Io(output_type);
   use my_Enumeration_Io;
begin
   Put(Val);
   new_line;
exception
   when data_error =>
      Put_Line("Error");
      skip_line;
   when Constraint_Error =>
      Put_Line("Error");
end;
