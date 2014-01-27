with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

with gll_pkg;

procedure main is
   type pos_int is new integer range 1..integer'Last;
   package generic_linked_list is new gll_pkg(pos_int);
   use generic_linked_list;
   root: list_elm_ptr;
begin
   root := init(1);
end main;
