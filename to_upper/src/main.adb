with Ada;
with Ada.Text_io;
with Ada.Characters.handling;
use Ada.Text_io;
use Ada.Characters.handling;


procedure main is
  char: character := 'E';
begin
	put_line("Enter character");
  get_immediate(char);
  new_line;
  put("Input was   ");
  put(char);
  new_line;
  put_line("Toupper resolved in    ");
  put(To_upper(char));
  new_line;
end main;
