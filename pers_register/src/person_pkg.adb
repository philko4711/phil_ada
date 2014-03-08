with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
use Ada.Strings.Maps.Constants;
use Ada.Strings.Fixed;

with utilities_pkg;


package body person_pkg is
   function ">"(a, b: in person) return boolean is
   begin
      --put_line("person_pkg.operator > (var)");
      --compare names
      if(Translate(a.name.all, Upper_Case_Map) = Translate(b.name.all, Upper_Case_Map)) then
         if(Translate(a.firstname.all, Upper_Case_Map) = Translate(b.firstname.all, Upper_Case_Map)) then
            if(a.birthyear = b.birthyear) then
               if(a.birthmonth = b.birthmonth) then
                  if(a.birthday = b.birthday) then
                     return(true);
                  elsif(a.birthday > b.birthday) then
                     return(true);
                  else
                     return(false);
                  end if;
               elsif(a.birthmonth > b.birthmonth) then
                  return(true);
               else
                  return(false);
               end if;
            elsif(a.birthyear > b.birthyear) then
               return (true);
            else
               return(false);
            end if;
         elsif(Translate(a.firstname.all, Upper_Case_Map) > Translate(b.firstname.all, Upper_Case_Map)) then
            return (true);
         else
            return(false);
         end if;
      elsif(Translate(a.name.all, Upper_Case_Map) > Translate(b.name.all, Upper_Case_Map)) then
         return(true);
      else
         return(false);
      end if;
   end ">";

   function ">"(a, b: in person_ptr) return boolean is
      ap: person := a.all;
      bp: person := b.all;
   begin
      --put_line("person_pkg.operator > (ptr)");
      return(ap > bp);
   end ">";

   function "="(a, b: in person) return boolean is
   begin
      if(Translate(a.name.all, Upper_Case_Map) = Translate(b.name.all, Upper_Case_Map)) then
         if(Translate(a.firstname.all, Upper_Case_Map) = Translate(b.firstname.all, Upper_Case_Map)) then
            if(a.birthyear = b.birthyear) then
               if(a.birthmonth = b.birthmonth) then
                  if(a.birthday = b.birthday) then
                     return(true);
                  else
                     return(false);
                  end if;
               else
                  return(false);
               end if;
            else
               return(false);
            end if;
         else
            return(false);
         end if;
      else
         return(false);
      end if;
   end "=";

   procedure set(var: out person) is
      strVar1, strVar2: string(1..100);
      last: natural := 0;
   begin
      --put_line("person_pkg.set");
      utilities_pkg.flush;
      put("Enter name: ");
      get_line(strVar1, last);
      utilities_pkg.flush;
      var.name := new string(1..last);
      var.name.all := strVar1(1..last);
      new_line;
      put("Enter first name: ");
      get_line(strVar2, last);
      utilities_pkg.flush;
      var.firstname := new string(1..last);
      var.firstname.all := strVar2(1..last);
      new_line;
      put("Enter birthyear: ");
      get(var.birthyear);
      utilities_pkg.flush;
      new_line;
      --skip_line;
      put("Enter birthmonth: ");
      get(var.birthmonth);
      utilities_pkg.flush;
      new_line;
      --skip_line;
      put("Enter birthday: ");
      get(var.birthday);
      utilities_pkg.flush;
      --skip_line;
   end set;

   procedure set(var: out person; source: in file_type) is
      strVar1: string(1..100);
      last: natural := 0;
   begin
      put_line("Entering new person:");
      get_line(source, strVar1, last);
      --put_line(strVar1(1..last));
      var.name := new string(1..last);
      var.name.all := strVar1(1..last);
      get_line(source, strVar1, last);
      --put_line(strVar1(1..last));
      var.firstname := new string(1..last);
      var.firstname.all := strVar1(1..last);

      get_line(source, strVar1, last);
      var.birthyear := Integer'Value(strVar1(1..last));
      --put(var.birthyear);
      --get(source, var.birthyear);
      --new_line;

      get_line(source, strVar1, last);
      var.birthmonth := Integer'Value(strVar1(1..last));
      --put(var.birthmonth);
      --get(source, var.birthmonth);
      --new_line;

      get_line(source, strVar1, last);
      var.birthday := Integer'Value(strVar1(1..last));
      --put(var.birthday);
      --new_line;

      --get(source, var.birthday);
      --put(var.birthday);


   end set;

   function init(var: in person) return person_ptr is
      pers: person_ptr := new person;
   begin
      --put_line("person_pkg.init");
      pers.all.name := new string(1..var.name'Last);
      pers.all.name.all := var.name.all;
      pers.all.firstname := new string(1..var.firstname'Last);
      pers.all.firstname.all := var.firstname.all;
      pers.all.birthyear := var.birthyear;
      pers.all.birthmonth := var.birthmonth;
      pers.all.birthday := var.birthday;
      return(pers);
   end init;

   procedure print(var: in person) is
   begin
      --put_line("person_pkg.print (var)");
      put_line("Name: " & var.name.all);
      put_line("First name: " & var.firstname.all);
      put("Birthdate: ");
      put(var.birthday,2);
      put(".");
      put(var.birthmonth,2);
      put(".");
      put(var.birthyear,4);
      new_line;
   end print;

   procedure print(var: in person_ptr) is
      per: person := var.all;
   begin
      --put_line("person_pkg.set (ptr)");
      print(per);
   end print;

   function get(var: in person_ptr) return person is
      per: person := var.all;
   begin
      --put_line("person_pkg.get");
      return(per);
   end get;
end person_pkg;