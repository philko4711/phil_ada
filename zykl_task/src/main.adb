with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.strings.unbounded;
use Ada.strings.unbounded;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;

with link_list_pkg;

procedure main is
   task cycl_task;
   task body cycl_task is
      list_root: link_list_pkg.list_elm_ptr;
      number: integer := 0;
   begin
      put("Enter number: ");
      get(number);
      new_line;
      list_root := link_list_pkg.init(number);
      loop
         put("Enter number: ");
         get(number);
         new_line;
         --link_list_pkg.insert(list_root, number);
         link_list_pkg.push_back(list_root, number);
         link_list_pkg.put(list_root);
         new_line;
      end loop;
   end cycl_task;
begin
   loop
      put_line("This is in main");
      delay 5.0;
   end loop;
end main;
