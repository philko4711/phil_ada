with Ada;
with Ada.Text_io;
use Ada.Text_io;

with person_pkg;

package body tree_pkg is
   procedure input(var: in person; root: out node_ptr) is
   begin
      --put_line("tree_pkg.input");
      if(var > person_pkg.get(root.data)) then
         if(root.right = null) then
            root.right := init(var);
         else
            input(var, root.right);
         end if;
      else
         if(root.left = null) then
            root.left := init(var);
         else
            input(var, root.left);
         end if;
      end if;
   end input;

   procedure print_tree(root: in node_ptr) is
   begin
      --put_line("tree_pkg.print_tree");
      if(root /= null) then
         print_tree(root.left);
         person_pkg.print(root.data);
         new_line(2);
         print_tree(root.right);
      end if;
   end print_tree;

   function init(data: in person) return node_ptr is
      root: node_ptr := null;
   begin
      --put_line("tree_pkg.init");
      put_line("init");
      root := new node;
      root.all.data := person_pkg.init(data);
      root.left := null;
      root.right := null;
      return(root);
   end init;
end tree_pkg;