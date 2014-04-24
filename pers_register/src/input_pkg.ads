package input_pkg is
	procedure get_string(str: out string; last: out natural; succ: out boolean);
	procedure get_char(chr: out character; succ: out boolean);
	procedure get_nat(nat: out natural; succ: out boolean);
end input_pkg;
