with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
use Ada.Strings.Maps.Constants;
use Ada.Strings.Fixed;

with input_pkg;
with utilities_pkg;


package body person_pkg is
   function ">"(a, b: in person) return boolean is
   begin
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

	procedure set(var: out person; succ: out boolean) is
      strVar1: string(1..100);
      last: natural := 0;
   begin
      put("Enter name: ");
			succ := false;
			input_pkg.get_string(strVar1, last, succ);
			if(succ /= true) then
				put_line("Input error");
				return;
			end if;
      var.name := new string(1..last);
      var.name.all := strVar1(1..last);
      new_line;
			succ := false;
      put("Enter first name: ");
			input_pkg.get_string(strVar1, last, succ);
			if(succ /= true) then
				put_line("Input error");
				return;
			end if;
      var.firstname := new string(1..last);
      var.firstname.all := strVar1(1..last);
      new_line;
			succ := false;
      put("Enter birthyear: ");
		  input_pkg.get_nat(var.birthyear, succ);
			if(succ /= true) then
				put_line("Input error");
				return;
			end if;
      new_line;
			succ := false;
      put("Enter birthmonth: ");
		  input_pkg.get_nat(var.birthmonth, succ);
			if(succ /= true) then
				put_line("Input error");
				return;
			end if;
      new_line;
			succ := false;
      put("Enter birthday: ");
		  input_pkg.get_nat(var.birthday, succ);
			if(succ /= true) then
				put_line("Input error");
				return;
			end if;
   end set;

   procedure set(var: out person; source: in file_type; succ: out boolean) is
      strVar1: string(1..100);
      last: natural := 0;
   begin
			input_pkg.get_string(strVar1, source, last, succ);
			if(succ /= true) then
				put_line("Input error name");
				return;
			end if;
      var.name := new string(1..last);
      var.name.all := strVar1(1..last);
			succ := false;
			input_pkg.get_string(strVar1, source, last, succ);
			if(succ /= true) then
				put_line("Input error firstname");
				return;
			end if;
      var.firstname := new string(1..last);
      var.firstname.all := strVar1(1..last);
			succ := false;
			input_pkg.get_nat(var.birthyear, source, succ);
			if(succ /= true) then
				put_line("Input error year");
				return;
			end if;
			succ := false;
			input_pkg.get_nat(var.birthmonth, source, succ);
			if(succ /= true) then
				put_line("Input error month");
				return;
			end if;
			succ := false;
			input_pkg.get_nat(var.birthday, source, succ);
			if(succ /= true) then
				put_line("Input error day");
				return;
			end if;
   end set;

   function init(var: in person) return person_ptr is
      pers: person_ptr := new person;
   begin
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
      print(per);
   end print;

   function get(var: in person_ptr) return person is
      per: person := var.all;
   begin
      return(per);
   end get;

  function findName(pers: in person_ptr; name: in string) return boolean is
	begin
		if(Translate(pers.all.name.all, Upper_Case_Map) = Translate(name, Upper_Case_Map)) then
			return(true);
		else
			return(false);
		end if;
	end findName;

  function findFirstname(pers: in person_ptr; name: in string) return boolean is   --toDo: change variable name to firstname
  begin
    if(Translate(pers.all.firstname.all, Upper_Case_Map) = Translate(name, Upper_Case_Map)) then
      return(true);
    else
      return(false);
    end if;
  end findFirstname;

  function findBirthYear(pers: in person_ptr; birthyear: in natural) return boolean is
	begin
    if(pers.all.birthyear = birthyear) then
      return(true);
    else
      return(false);
    end if;
  end findBirthYear;

  function findBirthMonth(pers: in person_ptr; birthmonth: in natural) return boolean is
  begin
    if(pers.all.birthmonth = birthmonth) then
      return(true);
    else
      return(false);
    end if;
  end findBirthMonth;
    
  function findBirthDay(pers: in person_ptr; birthday: in natural) return boolean is
  begin
    if(pers.all.birthday = birthday) then
      return(true);
    else
      return(false);
    end if;
  end findBirthDay;

end person_pkg;
