with Ada;
with Ada.Text_io;
use Ada.Text_io;

with person_pkg;

package body tree_pkg is
   procedure input(var: in person; root: out node_ptr) is
   begin
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
      root := new node;
      root.all.data := person_pkg.init(data);
      root.left := null;
      root.right := null;
      return(root);
   end init;

	procedure search_tree_string(root: in node_ptr; list: out pers_list.list_elm_ptr; to_search: in string; data: in string) is
  compare_result: boolean := false;
  begin
      if(root /= null) then
         search_tree_string(root.left, list, to_search, data);
        if(to_search = "name") then 
          compare_result := person_pkg.findName(root.all.data, data);  
        elsif(to_search = "firstname") then
          compare_result := person_pkg.findFirstName(root.all.data, data);     
        else
          put_line("Error! Unknown datafield to search!");
        end if;
      if(compare_result = true) then
        pers_list.push_back(list, root.all.data);
      end if;
         search_tree_string(root.right, list, to_search, data);
      end if;
  end search_tree_string;

  procedure search_tree_natural(root: in node_ptr; list: out pers_list.list_elm_ptr; to_search: in string; data: in natural) is
    compare_result: boolean := false;
  begin
    if(root /= null) then
      search_tree_natural(root.left, list, to_search, data);
      if(to_search = "birthyear") then
        compare_result := person_pkg.findBirthYear(root.all.data, data);  
      elsif(to_search = "birthmonth") then
        compare_result := person_pkg.findBirthMonth(root.all.data, data);  
      elsif(to_search = "birthday") then
        compare_result := person_pkg.findBirthDay(root.all.data, data);  
      else
        put_line("Error! Unknown datafield to search!");
      end if;
      if(compare_result = true) then
        pers_list.push_back(list, root.all.data);
      end if;
      search_tree_natural(root.right, list, to_search, data);
    end if;
  end search_tree_natural;
end tree_pkg;



