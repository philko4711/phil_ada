with Ada;
with pers_list;
with tree_pkg;

package search_pkg is
	function findNames(tree: in tree_pkg.node_ptr; name: in string) return pers_list.list_elm_ptr;   --toDo: Rename all with findByName 
	function findFirstNames(tree: in tree_pkg.node_ptr; firstname: in string) return pers_list.list_elm_ptr;
	function findBirthYears(tree: in tree_pkg.node_ptr; birthyear: in natural) return pers_list.list_elm_ptr;
	function findBirthMonths(tree: in tree_pkg.node_ptr; birthmonth: in natural) return pers_list.list_elm_ptr;
	function findBirthDays(tree: in tree_pkg.node_ptr; birthday: in natural) return pers_list.list_elm_ptr;
  function findAges(tree: in tree_pkg.node_ptr; age: in natural) return pers_list.list_elm_ptr;
end search_pkg;
