
package body father is
   function create(init_val: in integer) return in_father is
      var: in_father;
   begin
      var.fa_data := init_val;
      return(var);
      end create;
   function get_data(var: in in_father) return integer is
   begin
      return(var.fa_data);
   end get_data;
end father;


