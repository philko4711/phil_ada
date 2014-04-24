with Ada;
with pers_list;
with tree_pkg;

--Package to search persons by parameters in the binary tree
package search_pkg is
	--Function to find persons by their name return linked list with persons
	function findNames(tree: in tree_pkg.node_ptr; name: in string) return pers_list.list_elm_ptr; 
	--Function to find persons by their firstname return linked list with persons
	function findFirstNames(tree: in tree_pkg.node_ptr; firstname: in string) return pers_list.list_elm_ptr;
	--Function to find persons by their birthyear return linked list with persons
	function findBirthYears(tree: in tree_pkg.node_ptr; birthyear: in natural) return pers_list.list_elm_ptr;
	----Function to find persons by their birthmonth return linked list with persons
	function findBirthMonths(tree: in tree_pkg.node_ptr; birthmonth: in natural) return pers_list.list_elm_ptr;
	--Function to find persons by their birthday return linked list with persons
	function findBirthDays(tree: in tree_pkg.node_ptr; birthday: in natural) return pers_list.list_elm_ptr;
end search_pkg;
