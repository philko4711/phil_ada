with Ada.Text_io;
use Ada.Text_io;

package body pers_list is

function init return list_elm_ptr is
      root: list_elm_ptr;
   begin
      root := new list_elm;
      root.all.data := null;
      root.all.next := null;
      return(root);
   end init;

   procedure push_back(root: out list_elm_ptr; val: in person_ptr) is
      ptr: list_elm_ptr := root;
   begin
      if(root.all.data = null) then
        root.all.data := val;
      else
        while (ptr.all.next /= null) loop
          ptr := ptr.all.next;
        end loop;
        ptr.all.next := new list_elm;
        ptr.all.next.all.data := val;
        ptr.all.next.all.next := null;
      end if;
   end push_back;

   procedure push_front(root: out list_elm_ptr; val: in person_ptr) is
      ptr: list_elm_ptr :=null;
   begin
      ptr := new list_elm;
      ptr.all.data := val;
      ptr.all.next := root;
      root := ptr;
   end push_front;

   procedure printList(root: in list_elm_ptr) is
      ptr: list_elm_ptr := root;
   begin
      loop
         new_line;
         new_line;
         person_pkg.print(ptr.all.data);
         if (ptr.all.next = null) then
            exit;
         end if;
         ptr := ptr.all.next;
      end loop;
   end printList;

  function empty(root: in list_elm_ptr) return boolean is
  begin
    if(root.all.data = null) then
      return(true);
    else
      return(false);
    end if;
  end empty;

end pers_list;
