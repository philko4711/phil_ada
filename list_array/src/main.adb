with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

with list_pkg;

procedure main is
   list: list_pkg.list := list_pkg.init;
   dir: boolean := false;
begin

   for i in 1..10 loop
      list_pkg.push_front(list, i);
      list_pkg.put(list);
      new_line;
   end loop;
   for i in 1..10 loop
      list_pkg.push_back(list, i);
      list_pkg.put(list);
      new_line;
   end loop;
   list_pkg.insert(list, 99);
   list_pkg.put(list);
   new_line;
   list_pkg.insert(list, 1);
   list_pkg.put(list);
   new_line;
end main;

