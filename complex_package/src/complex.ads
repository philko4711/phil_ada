package complex is
   type cplx_data is private;
   function "+"(a, b : cplx_data) return cplx_data;
   function "-"(a, b : cplx_data) return cplx_data;
   function gen_cplx(real, imag: float) return cplx_data;
   function get_real(Val: cplx_data) return float;
   function get_imag(Val: cplx_data) return float;
   procedure print_cplx(Val: in cplx_data);
   function input_nbr return cplx_data;
private
   type cplx_data is record
      real: float := 0.0;
      imag: float := 0.0;
   end record;
end complex;




