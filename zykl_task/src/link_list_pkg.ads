package link_list_pkg is
   type list_elm is private;
   type list_elm_ptr is private;
   function init(init_val: in integer) return list_elm_ptr;
   procedure push_back(root: out list_elm_ptr; val: in integer);
   procedure push_front(root: out list_elm_ptr; val: in integer);
   procedure insert(root: out list_elm_ptr; val: in integer);
   procedure put(root: in list_elm_ptr);
private
   type list_elm_ptr is access list_elm;
   type list_elm is record
      data: natural := 0;
      next: list_elm_ptr := null;
   end record;
end link_list_pkg;

