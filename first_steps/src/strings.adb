with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.strings.unbounded;
use Ada.strings.unbounded;

procedure strings is
   str1: Unbounded_string;
   str2: string(1..100) := (others => ' ');
begin
   put_line("Content of string 1: ");
   put_line(To_string(str1));
   str1 := to_unbounded_string("HalloHallo");
   put_line("Content of string 1: ");
   put_line(To_string(str1));
   str1 := to_unbounded_string("kafnsdjökajfkjadölfjalökfjdalöfjdlöfjölkjaölfjaldsfj");
   put_line("Content of string 1: ");
   put_line(To_string(str1));
end strings;

