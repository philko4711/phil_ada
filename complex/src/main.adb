with Ada;
with Ada.Integer_Text_IO;
with Ada.Text_io;
with Ada.float_Text_io;
use Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.float_Text_io;


procedure main is
   type complex is record
      real: float := 0.0;
      imag: float := 0.0;
   end record;
   type operators is(P, M);
   procedure print_cplx(Val: in complex) is separate;
   procedure print_oprt(Val: in operators) is separate;
   function input_nbr return complex is separate;
   function input_oprt return operators is separate;
   function "+"(a, b : complex) return complex is
      res: complex;
   begin
      res.real := a.real + b.real;
      res.imag := a.imag + b.imag;
      return(res);
   end "+";
   function "-"(a, b : complex) return complex is
      res: complex;
   begin
      res.real := a.real - b.real;
      res.imag := a.imag - b.imag;
      return(res);
   end "-";
   cplx1: complex;
   cplx2: complex;
   result: complex;
   oprt: operators;
begin
   put_line("Put in first complex number:");
   cplx1 := input_nbr;
   put_line("Put in desired operator:");
   oprt := input_oprt;
   put_line("Put in second number:");
   cplx2 := input_nbr;

   case oprt is
      when P =>
         result := cplx1 + cplx2;
      when M =>
         result := cplx1 - cplx2;
      when others =>
         put_line("This can never happen!");
   end case;

   new_line;
   print_cplx(cplx1);
   new_line;
   print_oprt(oprt);
   new_line;
   print_cplx(cplx2);
   new_line;
   put("=");
   new_line;
   print_cplx(result);
   new_line;

end main;


