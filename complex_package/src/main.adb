with Ada;
with Ada.Integer_Text_IO;
with Ada.Text_io;
with Ada.float_Text_io;
use Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.float_Text_io;

with complex;
use complex;

procedure main is
   type operators is(P, M);
   function input_oprt return operators is separate;
   cplx1: cplx_data := gen_cplx(1.0, 1.0);
   cplx2: cplx_data := gen_cplx(2.0, 2.0);
   result: cplx_data;
   oprt: operators;
begin
   put_line("Main");
   put_line("var1:");
   cplx1 := input_nbr;
   new_line;
   put_line("Put in desired operator:");
   oprt := input_oprt;
   put_line("var2:");
   cplx2 := input_nbr;
   new_line;

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
   if(oprt = P) then
      put('+');
   elsif(oprt = M) then
      put('-');
   else
      put("Shit");
   end if;
   new_line;
   print_cplx(cplx2);
   new_line;
   put("=");
   new_line;
   print_cplx(result);
   new_line;
end main;
