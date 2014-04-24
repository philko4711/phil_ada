with Ada;
with Ada.Text_io;
use Ada.Text_io;

--Package for input functions with exception handling
package input_pkg is
	--Function to read string from keyboard. Last contains the length of the string, succ is false in case of an exception
	procedure get_string(str: out string; last: out natural; succ: out boolean);
	--Function to read string from a file. Last contains the length of the string, succ is false in case of an exception
	procedure get_string(str: out string; source: in file_type; last: out natural; succ: out boolean);
  --Function to read a character from keyboard.
	procedure get_char(chr: out character; succ: out boolean);
	--Function to read a natural from Keyboard. Succ is false in case of an exception
	procedure get_nat(nat: out natural; succ: out boolean);
	--Function to read a natural from a file. Succ is false in case of an exception
	procedure get_nat(nat: out natural; source: in file_type; succ: out boolean);
end input_pkg;
