with Ada;
with Ada.Integer_Text_IO;
with Ada.Text_io;
with Ada.float_Text_io;
use Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.float_Text_io;

package body complex is
   function "+"(a, b : cplx_data) return cplx_data is
      res: cplx_data;
   begin
      res.real := a.real + b.real;
      res.imag := a.imag + b.imag;
      return(res);
   end "+";
   function "-"(a, b : cplx_data) return cplx_data is
      res: cplx_data;
   begin
      res.real := a.real - b.real;
      res.imag := a.imag - b.imag;
      return(res);
   end "-";
   function gen_cplx(real, imag: float) return cplx_data is
      res: cplx_data;
   begin
      res.real := real;
      res.imag := imag;
      return(res);
   end gen_cplx;
   function get_real(Val: cplx_data) return float is
   begin
      return(Val.real);
   end get_real;
   function get_imag(Val: cplx_data) return float is
   begin
      return(Val.imag);
   end get_imag;
   procedure print_cplx(Val: in cplx_data) is
   begin
      Put("r ");
      put(Val.real);
      new_line;
      put("i ");
      put(Val.imag);
   end print_cplx;
   function input_nbr return cplx_data is
      Var: cplx_data;
   begin
      Put_line("Enter real:");
      get(Var.real);
      Put_line("Enter imaginary:");
      get(Var.imag);
      return(Var);
   end input_nbr;
   end complex;