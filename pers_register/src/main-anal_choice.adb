separate(main)
function anal_choice(choice: in character) return character is
   ret_val: character;
begin
--     if(not ((choice >= 'A') and (choice <= 'Z')) and not ((choice >= 'a') and (choice <= 'z'))) then
--        raise data_error;
--     end if;
--     if((choice >= 'a') and (choice <= 'z')) then
--        ret_val := choice - ' ';
--     else
--        ret_val := choice;
--     end if;
   return(ret_val);
end anal_choice;


