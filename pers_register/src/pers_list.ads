with person_pkg;
use person_pkg;

--Package which implements a linked list for persons
package pers_list is
   type list_elm is private;
   type list_elm_ptr is private;
	 --inits the list with an empty element
   function init return list_elm_ptr;
	 --Add an element at the back
   procedure push_back(root: out list_elm_ptr; val: in person_ptr);
	 --Add an element at the front
   procedure push_front(root: out list_elm_ptr; val: in person_ptr);
	 --Print all person stored in the list front to back
   procedure printList(root: in list_elm_ptr);
	 --Detect whether list is empty
	 function empty(root: in list_elm_ptr) return boolean; 
  private
    type list_elm_ptr is access list_elm;
    type list_elm is record
      data: person_ptr;
      next: list_elm_ptr := null;
    end record;
end pers_list;
