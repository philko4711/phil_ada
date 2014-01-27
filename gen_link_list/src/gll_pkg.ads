generic
   type ITEM is range <>;
package gll_pkg is
   type list_elm is private;
   type list_elm_ptr is private;
   function init(init_val: in ITEM) return list_elm_ptr;
   procedure push_back(root: out list_elm_ptr; val: in ITEM);
   procedure push_front(root: out list_elm_ptr; val: in ITEM);
   procedure insert(root: out list_elm_ptr; val: in ITEM);
   procedure put(root: in list_elm_ptr);
private
   type list_elm_ptr is access list_elm;
   type list_elm is record
      data: ITEM := 0;
      next: list_elm_ptr := null;
   end record;
end gll_pkg;
