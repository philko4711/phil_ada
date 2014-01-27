with Ada;
with Ada.Text_io;
use Ada.Text_io;

procedure main is
   type input_type is (M, R, C);
   type output_type is (MONEY, COFEE, NOPE);
   type state is (IDLE, WORKING);
   function input return input_type is separate;
   procedure output(Val: in output_type) is separate;
   current_input: input_type := M;
   current_state: state := IDLE;
begin
   main_loop:
   loop
      current_input := input;
   CASE current_state is
      when IDLE =>
         if(current_input = M) then
            Put_Line("Thanks for your order. Please press (C)hoice for Coffee or (R)eturn to return money");
            current_state := WORKING;
         else
            output(NOPE);
         end if;
      when WORKING =>
         if(current_input = C) then
            Put_Line("Something hot for you...");
            output(COFEE);
            current_state := IDLE;
         elsif (current_input = R) then
            Put_Line("Changed your mind? You little Fuck??");
            output(MONEY);
            current_state := IDLE;
         else
            output(MONEY);
            end if;
      end case;
   end loop main_loop;
end main;
