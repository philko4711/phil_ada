separate(main)

function input_nbr return complex is
   Var: complex;
begin
   Put_line("Enter real:");
   get(Var.real);
   Put_line("Enter imaginary:");
   get(Var.imag);
   return(Var);
end input_nbr;
