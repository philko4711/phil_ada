with person_pkg;
use person_pkg;

package tree_pkg is
   type node is private;
   type node_ptr is private;
   function init(data: in person) return node_ptr;
   procedure input(var: in person; root: out node_ptr);
   procedure print_tree(root: in node_ptr);
private
   type node_ptr is access node;
   type node is record
      data: person_ptr;
      left: node_ptr := null;
      right: node_ptr := null;
   end record;
end tree_pkg;

