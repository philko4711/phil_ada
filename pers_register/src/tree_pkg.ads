with Ada;
with person_pkg;
with pers_list;
use person_pkg;

package tree_pkg is
   type node is private;
   type node_ptr is private;
   function init(data: in person) return node_ptr;
   procedure input(var: in person; root: out node_ptr);
   procedure print_tree(root: in node_ptr);
	procedure search_tree_string(root: in node_ptr; list: out pers_list.list_elm_ptr; to_search: in string; data: in string);
  procedure search_tree_natural( root: in node_ptr; list: out pers_list.list_elm_ptr; to_search: in string; data: in natural);
private
   type node_ptr is access node;
   type node is record
      data: person_ptr;
      left: node_ptr := null;
      right: node_ptr := null;
   end record;
end tree_pkg;

