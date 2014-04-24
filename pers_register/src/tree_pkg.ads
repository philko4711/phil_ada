with Ada;
with person_pkg;
with pers_list;
use person_pkg;

--Package that implents a binary tree for persons.
package tree_pkg is
   type node is private;
   type node_ptr is private;
 	--Function to init the tree
   function init(data: in person) return node_ptr;
	--Recursive function to add a new person. Person is sorted automatically at the right position
   procedure input(var: in person; root: out node_ptr);
	--Recursive function to print the tree in the correct order
   procedure print_tree(root: in node_ptr);
  --Recursive function to search a string in the tree
	procedure search_tree_string(root: in node_ptr; list: out pers_list.list_elm_ptr; to_search: in string; data: in string);
  --Recursive function to search a natural in the tree
  procedure search_tree_natural( root: in node_ptr; list: out pers_list.list_elm_ptr; to_search: in string; data: in natural);
private
   type node_ptr is access node;
   type node is record
      data: person_ptr;
      left: node_ptr := null;
      right: node_ptr := null;
   end record;
end tree_pkg;

