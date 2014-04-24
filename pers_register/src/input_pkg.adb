with utilities_pkg;

package body input_pkg is

procedure get_string(str: out string; last: out natural; succ: out boolean) is
	begin
		input_block:
		begin
			get_line(str, last);
			succ := true;
      utilities_pkg.flush;
			exception
				when data_error =>
         Put_line("Error input");
         skip_line;   --empty buffer
      	when constraint_error =>
         put_line("Error");
			succ := false;
		end input_block;
	end get_string;

procedure get_string(str: out string; source: in file_type; last: out natural; succ: out boolean) is
	begin
		input_block:
		begin
			get_line(source, str, last);
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
      utilities_pkg.flush;
			exception
				when data_error =>
         Put_line("Error input");
         skip_line;   --empty buffer
      	when constraint_error =>
         put_line("Error");
			succ := false;
		end input_block;
	end get_nat;

	procedure get_nat(nat: out natural; source: in file_type; succ: out boolean) is
		str: string(1..1000);
		last: natural := 0;
	begin
		input_block:
		begin
			get_line(source, str, last);
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
