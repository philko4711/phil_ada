package list_pkg is
   type list is private;
   type list_ptr is access list;
   type list_data;
   type list_data is array (integer range <>) of integer;
   function init return list;
   procedure push_back(var: out list; val: in integer);
   procedure push_front(var: out list; val: in integer);
   procedure insert(var: out list; val: in integer);
   procedure put(var: out list);
private
   type list is record
      buffer_size: integer := 1000;
      list_dt: list_data(1..1000);
      ctr: natural := 0;
   end record;
end list_pkg;


