generic
   type ITEM is access record;
package gen_rec_pkg is
   function acc return ITEM;
end gen_rec_pkg;