with Ada;
with Ada.Text_io;
use Ada.Text_io;
with Ada.strings.unbounded;
use Ada.strings.unbounded;

procedure strings is
   str1: Unbounded_string;
   str2: string(1..100) := (others => ' ');
 function str_cmp(a,b: in string) return boolean is
      upa: string := Translate(a, Upper_Case_Map);
      upb: string := Translate(b, Upper_Case_Map);
      last: natural := 0;
      ctr: natural := 0;
   begin
      if(upa'Last > upb'Last) then
         last := upb'Last;
      else
         last := upa'Last;
      end if;

      for i in 1..last loop
         if(upa(i) < upb(i)) then
            put(upa(i));
            put(" < ");
            put(upb(i));
            new_line;
            return(true);
         elsif (upa(i) > upb(i)) then
            put(upa(i));
            put(" > ");
            put(upb(i));
            new_line;
            return(false);
         else
            ctr := ctr + 1;
         end if;
      end loop;
      if(upa'Last > upb'Last) then
         return(false);
      else
         return(true);
      end if;
   end str_cmp;
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

