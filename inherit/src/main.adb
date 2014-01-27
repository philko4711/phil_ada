with Ada;
with Ada.Integer_Text_IO;
with Ada.Text_io;
with Ada.float_Text_io;
use Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.float_Text_io;

with father;
with son;

procedure main is
   var: father.in_father := father.create(10);
   var2:son.in_son := son.create(20);
begin
   put_line("Father data: ");
   put(father.get_data(var));
   new_line;
   put_line("Son data: ");
   put(son.get_data(var2));
   new_line;
end main;
