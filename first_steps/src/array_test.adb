with Ada;
with Ada.Text_io;
with Ada.Integer_Text_IO;
use Ada.Text_io;
use Ada.Integer_Text_IO;

procedure array_test is
   emp_arr: array(0..9) of integer := (others => 0);
   ful_arr: array(0..9) of integer := (2 | 9 => 1, others => 9);
   type arr_index is range 0..9;
   type Odarr is array(arr_index) of integer;
   type Tdarr is array(arr_index) of Odarr;
   horny_arra: Tdarr := (others => (others => 0));
   type vector is array(integer range <>) of integer;
   type tdvector is array(integer range <>, integer range <>) of integer;
   ultra_arr: tdvector(0..9, 0..16) := (others => (others => 0));
   ctr: integer := 0;
begin
   Put_Line("Empty array:");
   new_line;
   for i in 0..9 loop
      Put(emp_arr(i));
   end loop;
   new_line;
   Put_Line("Full array:");
   new_line;
   for i in 0..9 loop
      Put(ful_arr(i));
   end loop;
   new_line;
   horny_arra(0)(0) := 1899;
   Put_Line("Element 0 0: ");
   Put(horny_arra(0)(0));
   Put(horny_arra(0)(9));
   Put(ultra_arr(0, 0));
   new_line;
   Put_Line("Fill 1D array");
   for i in emp_arr'First..emp_arr'Last loop
      emp_arr(i) := i;
   end loop;
   Put_Line("Filled 1D array:");
   new_line;
   for i in 0..9 loop
      Put(emp_arr(i));
   end loop;
   new_line;
   Put_Line("data of horny array:");
   new_line;
   Put_line("Number of rows:");
   Put(horny_arra'Length);
   new_line;
   Put_line("Number of cols:");
   Put(horny_arra(horny_arra'First)'Length);
   new_line;
   Put_Line("Fill 2D array:");
   for i in horny_arra'First..horny_arra'Last loop
      for j in horny_arra(i)'First..horny_arra(i)'Last loop
         horny_arra(i)(j) := ctr;
         ctr := ctr + 1;
         end loop;
   end loop;
   new_line;
   Put_Line("Filled 2D array:");
   new_line;
   for i in horny_arra'First..horny_arra'Last loop
      for j in horny_arra(i)'First..horny_arra(i)'Last loop
         put(horny_arra(i)(j),3);
      end loop;
      new_line;
   end loop;
   new_line;
   Put_line("Data of standard 2D array");
   Put_line("Rows");
   Put(ultra_arr'Length(1));
   new_line;
   Put_line("Cols:");
   Put(ultra_arr'Length(2));
   new_line;
   Put_line("Fill standard 2D array");
   ctr := 0;
   for i in ultra_arr'First(1)..ultra_arr'Last(1) loop
      for j in ultra_arr'First(2)..ultra_arr'Last(2) loop
         ultra_arr(i, j) := ctr;
         ctr := ctr + 1;
      end loop;
   end loop;
   Put_Line("Filled Standard 2D array:");
   new_line;
   for i in ultra_arr'First(1)..ultra_arr'Last(1) loop
      for j in ultra_arr'First(2)..ultra_arr'Last(2) loop
         put(ultra_arr(i, j),3);
      end loop;
      new_line;
   end loop;
   --Put_Line("Hier schepperts");
   --Put(ultra_arr'Length(3));
end array_test;

