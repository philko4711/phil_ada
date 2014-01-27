with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

package body list_pkg is
   function init return list is
      var: list;
   begin
      var.list_dt := (others => 0);
      return(var);
   end init;
   procedure push_back(var: out list; val: in integer) is
   begin
      if(var.ctr >= var.buffer_size) then
         raise constraint_error;
      end if;
      var.ctr := var.ctr + 1;
      var.list_dt(var.ctr) := val;
   end push_back;

   procedure push_front(var: out list; val: in integer) is
      var_arry: list_data(1..1000) := (others => 0);
   begin
      if(var.ctr >= var.buffer_size) then
         raise constraint_error;
      end if;
      var_arry(1) := val;
      var_arry(2..1000) := var.list_dt(1..999);
      var.list_dt := var_arry;
      var.ctr := var.ctr + 1;
   end push_front;

   procedure insert(var: out list; val: in integer) is
      var_arry: list_data(1..1000) := (others => 0);
      index: natural := 1;
   begin
      if(var.ctr >= var.buffer_size) then
         raise constraint_error;
      end if;
      while var.list_dt(index) < val loop     --insert behind the next smaller element
         index:= index + 1;
         if(index = var.ctr) then
            exit;
         end if;
      end loop;
      put("The calculated index is ");
      put(index);
      new_line;
      var_arry(1..index) := var.list_dt(1..index);
      index:= index + 1; --insert behind
      var_arry(index) := val;
      --index:= index + 1;
      var_arry((index + 1)..1000) := var.list_dt(index..999);
      var.list_dt := var_arry;
      var.ctr := var.ctr + 1;
   end insert;

   procedure put(var: out list) is
   begin
      for i in 1..var.ctr loop
         put(var.list_dt(i), 4);
         put(" ");
      end loop;
   end put;
end list_pkg;






