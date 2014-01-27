package father is
   type in_father is private;
   function create(init_val: in integer) return in_father;
   function get_data(var: in in_father) return integer;
private
   type in_father is record
      fa_data: integer := 0;
   end record;
end father;
