with person_pkg;
use person_pkg;

package pers_list is
   type list_elm is private;
   type list_elm_ptr is private;
   function init return list_elm_ptr;
   procedure push_back(root: out list_elm_ptr; val: in person_ptr);
   procedure push_front(root: out list_elm_ptr; val: in person_ptr);
   procedure printList(root: in list_elm_ptr);
	 function empty(root: in list_elm_ptr) return boolean; 
  private
    type list_elm_ptr is access list_elm;
    type list_elm is record
      data: person_ptr;
      next: list_elm_ptr := null;
    end record;
end pers_list;
