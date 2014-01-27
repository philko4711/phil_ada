separate(main)

procedure print_cplx(Val: in complex) is
begin
   Put("r ");
   put(Val.real);
   new_line;
   put("i ");
   put(Val.imag);
end print_cplx;

