with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
use Ada.Strings.Maps.Constants;
use Ada.Strings.Fixed;

with person_pkg;
use person_pkg;

with tree_pkg;

procedure main is
   pers1, pers2: person_pkg.person;
   str1: string := "alten";
   str2: string := "altenteil";
   --     str3: string(1..100);
   ptr: person_pkg.person_ptr;
   ptr2 : person_pkg.person_ptr;
   tree: tree_pkg.node_ptr;
   function str_cmp(a,b: in string) return boolean is
      upa: string := Translate(a, Upper_Case_Map);
      upb: string := Translate(b, Upper_Case_Map);
      last: natural := 0;
      ctr: natural := 0;
   begin
      if(upa'Last > upb'Last) then
         last := upb'Last;
      else
         last := upa'Last;
      end if;

      for i in 1..last loop
         if(upa(i) < upb(i)) then
            put(upa(i));
            put(" < ");
            put(upb(i));
            new_line;
            return(true);
         elsif (upa(i) > upb(i)) then
            put(upa(i));
            put(" > ");
            put(upb(i));
            new_line;
            return(false);
         else
            ctr := ctr + 1;
         end if;
      end loop;
      if(upa'Last > upb'Last) then
         return(false);
      else
         return(true);
      end if;
   end str_cmp;
begin
   person_pkg.set(pers1);
   tree := tree_pkg.init(pers1);
   for i in 1..8 loop
      person_pkg.set(pers1);
      tree_pkg.input(pers1, tree);
      tree_pkg.print_tree(tree);
   end loop;



--        if(pers1 > pers2) then
--           person_pkg.print(pers2);
--           new_line;
--           person_pkg.print(pers1);
--           new_line;
--        else
--           person_pkg.print(pers1);
--           new_line;
--           person_pkg.print(pers2);
--           new_line;
--     end if;
--     put_line("The new init method");
--     ptr := person_pkg.init(pers1);
--     ptr2 := person_pkg.init(pers2);
--     if(ptr > ptr2) then
--        person_pkg.print(ptr2);
--        new_line;
--        person_pkg.print(ptr);
--        new_line;
--     else
--        person_pkg.print(ptr);
--        new_line;
--        person_pkg.print(ptr2);
--        new_line;
--        end if;
--     if(str_cmp(str1, str2)) then
--        put_line(str1);
--        put_line(str2);
--     else
--        put_line(str2);
--        put_line(str1);
--     end if;
--
--     if(str1 < str2) then
--        put_line(str1);
--        put_line(str2);
--     else
--        put_line(str2);
--        put_line(str1);
--     end if;

   --     if(Translate(str1, Upper_Case_Map) < Translate(str2, Upper_Case_Map)) then
   --        put_line("String1 before string2");
   --     else
   --        put_line("String2 before string1");
   --     end if;
   --     str3(1..str1'Last) := Ada.Strings.Fixed.Translate(str1, Ada.Strings.Maps.Constants.Upper_Case_Map);
   --     new_line;
   --     for i in 1..str1'Last loop
   --        put(str3(i));
   --     end loop;
   --  new_line;

end main;
