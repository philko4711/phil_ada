package body search_pkg is
	function findNames(tree: in tree_pkg.node_ptr; name: in string) return pers_list.list_elm_ptr is
    list: pers_list.list_elm_ptr := pers_list.init;
	begin
    tree_pkg.search_tree_string(tree, list, "name", name);
    return(list);
	end findNames;

	function findFirstNames(tree: in tree_pkg.node_ptr; firstname: in string) return pers_list.list_elm_ptr is
   list: pers_list.list_elm_ptr := pers_list.init;
	begin
    tree_pkg.search_tree_string(tree, list, "firstname", firstname);
    return(list);
	end findFirstNames;

	function findBirthYears(tree: in tree_pkg.node_ptr; birthyear: in natural) return pers_list.list_elm_ptr is
    list: pers_list.list_elm_ptr := pers_list.init;
	begin
    tree_pkg.search_tree_natural(tree, list, "birthyear", birthyear);
    return(list);
	end findBirthYears;

	function findBirthMonths(tree: in tree_pkg.node_ptr; birthmonth: in natural) return pers_list.list_elm_ptr is
    list: pers_list.list_elm_ptr := pers_list.init;
	begin
    tree_pkg.search_tree_natural(tree, list, "birthmonth", birthmonth);
    return(list);
  end findBirthMonths;

	function findBirthDays(tree: in tree_pkg.node_ptr; birthday: in natural) return pers_list.list_elm_ptr is
    list: pers_list.list_elm_ptr := pers_list.init;
  begin
    tree_pkg.search_tree_natural(tree, list, "birthday", birthday);
    return(list);
  end findBirthDays;

end search_pkg;
