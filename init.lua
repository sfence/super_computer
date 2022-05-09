
super_computer = {
    translator = minetest.get_translator("super_computer")
  }

local modpath = minetest.get_modpath(minetest.get_current_modname());

super_computer.have_laptop = (minetest.get_modpath("laptop")~=nil);

dofile(modpath.."/functions.lua");

dofile(modpath.."/mflops_supply.lua");

dofile(modpath.."/super_computer.lua");
dofile(modpath.."/super_computer_one_slot.lua");
dofile(modpath.."/super_computer_two_slots.lua");

dofile(modpath.."/craftitems.lua");
dofile(modpath.."/crafting.lua");

