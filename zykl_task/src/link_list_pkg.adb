with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;


package body link_list_pkg is
   function init(init_val: in integer) return list_elm_ptr is
      root: list_elm_ptr;
   begin
      root := new list_elm;
      root.all.data := init_val;
      root.all.next := null;
      return(root);
   end init;

   procedure push_back(root: out list_elm_ptr; val: in integer) is
      ptr: list_elm_ptr := root;
   begin
      while (ptr.all.next /= null) loop
         ptr := ptr.all.next;
      end loop;
      ptr.all.next := new list_elm;
      ptr.all.next.all.data := val;
      ptr.all.next.all.next := null;
   end push_back;

   procedure push_front(root: out list_elm_ptr; val: in integer) is
      ptr: list_elm_ptr :=null;
   begin
      ptr := new list_elm;
      ptr.all.data := val;
      ptr.all.next := root;
      root := ptr;
   end push_front;

   procedure insert(root: out list_elm_ptr; val: in integer) is
      ptr: list_elm_ptr := root;
      new_elem: list_elm_ptr := null;
   begin
      while(ptr.all.next.all.data < val) loop
         ptr := ptr.all.next;
         if(ptr.all.next = null) then
            exit;
         end if;
      end loop;
      new_elem := new list_elm;
      new_elem.all.data := val;
      if(ptr.all.next /= null) then
         new_elem.all.next := ptr.all.next;
      end if;
      if(ptr = root) then
         root := new_elem;
         end if;
      ptr.all.next := new_elem;
   end insert;

   procedure put(root: in list_elm_ptr) is
      ptr: list_elm_ptr := root;
   begin
      loop
         put(ptr.all.data, 3);
         put(" ");
         if (ptr.all.next = null) then
            exit;
         end if;
         ptr := ptr.all.next;
      end loop;
   end put;
end link_list_pkg;