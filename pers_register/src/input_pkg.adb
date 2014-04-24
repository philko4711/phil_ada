with Ada;
with Ada.Text_io;
use Ada.Text_io;

package body input_pkg is

procedure get_string(str: out string; last: out natural; succ: out boolean) is
	begin
		input_block:
		begin
			get_line(str, last);
			succ := true;
			exception
				when data_error =>
         Put_line("Error input");
         skip_line;   --empty buffer
      	when constraint_error =>
         put_line("Error");
			succ := false;
		end input_block;
	end get_string;

	procedure get_char(chr: out character; succ: out boolean) is
	begin
		input_block:
		begin
      get_immediate(chr);
			succ := true;
			exception
				when data_error =>
         Put_line("Error input");
         skip_line;   --empty buffer
      	when constraint_error =>
         put_line("Error");
			succ := false;
		end input_block;
	end get_char;

	procedure get_nat(nat: out natural; succ: out boolean) is
		str: string(1..1000);
		last: natural := 0;
	begin
		input_block:
		begin
			get_line(str, last);
      nat := Integer'Value(str(1..last));
			succ := true;
			exception
				when data_error =>
         Put_line("Error input");
         skip_line;   --empty buffer
      	when constraint_error =>
         put_line("Error");
			succ := false;
		end input_block;
	end get_nat;
end input_pkg;
