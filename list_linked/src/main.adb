with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

with link_list_pkg;

procedure main is
   root: link_list_pkg.list_elm_ptr;
begin
   root := link_list_pkg.init(100);
   link_list_pkg.push_back(root, 10);
   link_list_pkg.push_back(root, 20);
   link_list_pkg.push_back(root, 30);
   link_list_pkg.push_front(root, 99);
   link_list_pkg.push_front(root, 97);
   link_list_pkg.insert(root, 107);
   link_list_pkg.insert(root, 2);
   link_list_pkg.push_front(root, 20);
   link_list_pkg.put(root);
   end main;