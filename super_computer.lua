
local S = super_computer.translator

local rack_node_box = {
    type = "fixed",
    fixed = {
      {-0.4375,-0.3125,-0.4375,0.4375,-0.25,-0.375},
      {-0.4375,-0.25,-0.4375,-0.3125,0.5,-0.375},
      {0.3125,-0.25,-0.4375,0.4375,0.5,-0.375},
      {-0.3125,0.0625,-0.4375,0.3125,0.125,-0.375},
      {-0.3125,0.4375,-0.4375,0.3125,0.5,-0.375},
      {-0.375,-0.5,-0.375,-0.25,-0.25,-0.25},
      {0.25,-0.5,-0.375,0.375,-0.25,-0.25},
      {-0.4375,-0.3125,-0.375,-0.375,0.5,-0.3125},
      {-0.25,-0.3125,-0.375,-0.1875,-0.25,0.4375},
      {-0.0625,-0.3125,-0.375,0.0,-0.25,0.4375},
      {0.1875,-0.3125,-0.375,0.25,-0.25,0.4375},
      {0.375,-0.3125,-0.375,0.4375,0.5,-0.3125},
      {-0.25,0.0625,-0.375,-0.1875,0.125,0.4375},
      {-0.0625,0.0625,-0.375,0.0,0.125,0.4375},
      {0.1875,0.0625,-0.375,0.25,0.125,0.4375},
      {-0.25,0.4375,-0.375,-0.1875,0.5,0.4375},
      {-0.0625,0.4375,-0.375,0.0,0.5,0.4375},
      {0.1875,0.4375,-0.375,0.25,0.5,0.4375},
      {-0.4375,-0.3125,-0.3125,-0.375,-0.25,0.4375},
      {0.375,-0.3125,-0.3125,0.4375,-0.25,0.4375},
      {-0.4375,0.0625,-0.3125,-0.375,0.125,0.4375},
      {0.375,0.0625,-0.3125,0.4375,0.125,0.4375},
      {-0.4375,0.4375,-0.3125,-0.375,0.5,0.4375},
      {0.375,0.4375,-0.3125,0.4375,0.5,0.4375},
      {-0.375,-0.3125,-0.25,-0.25,-0.25,-0.1875},
      {-0.1875,-0.3125,-0.25,-0.0625,-0.25,-0.1875},
      {0.0,-0.3125,-0.25,0.1875,-0.25,-0.1875},
      {0.25,-0.3125,-0.25,0.375,-0.25,-0.1875},
      {-0.4375,-0.25,-0.25,-0.375,0.0625,-0.1875},
      {0.375,-0.25,-0.25,0.4375,0.0625,-0.1875},
      {-0.375,0.0625,-0.25,-0.25,0.125,-0.1875},
      {-0.1875,0.0625,-0.25,-0.0625,0.125,-0.1875},
      {0.0,0.0625,-0.25,0.1875,0.125,-0.1875},
      {0.25,0.0625,-0.25,0.375,0.125,-0.1875},
      {-0.4375,0.125,-0.25,-0.375,0.4375,-0.1875},
      {0.375,0.125,-0.25,0.4375,0.4375,-0.1875},
      {-0.375,0.4375,-0.25,-0.25,0.5,-0.1875},
      {-0.1875,0.4375,-0.25,-0.0625,0.5,-0.1875},
      {0.0,0.4375,-0.25,0.1875,0.5,-0.1875},
      {0.25,0.4375,-0.25,0.375,0.5,-0.1875},
      {-0.375,-0.3125,-0.0625,-0.25,-0.25,0.0},
      {-0.1875,-0.3125,-0.0625,-0.0625,-0.25,0.0},
      {0.0,-0.3125,-0.0625,0.1875,-0.25,0.0},
      {0.25,-0.3125,-0.0625,0.375,-0.25,0.0},
      {-0.4375,-0.25,-0.0625,-0.375,0.0625,0.0},
      {0.375,-0.25,-0.0625,0.4375,0.0625,0.0},
      {-0.375,0.0625,-0.0625,-0.25,0.125,0.0},
      {-0.1875,0.0625,-0.0625,-0.0625,0.125,0.0},
      {0.0,0.0625,-0.0625,0.1875,0.125,0.0},
      {0.25,0.0625,-0.0625,0.375,0.125,0.0},
      {-0.4375,0.125,-0.0625,-0.375,0.4375,0.0},
      {0.375,0.125,-0.0625,0.4375,0.4375,0.0},
      {-0.375,0.4375,-0.0625,-0.25,0.5,0.0},
      {-0.1875,0.4375,-0.0625,-0.0625,0.5,0.0},
      {0.0,0.4375,-0.0625,0.1875,0.5,0.0},
      {0.25,0.4375,-0.0625,0.375,0.5,0.0},
      {-0.375,-0.3125,0.1875,-0.25,-0.25,0.4375},
      {-0.1875,-0.3125,0.1875,-0.0625,-0.25,0.25},
      {0.0,-0.3125,0.1875,0.1875,-0.25,0.25},
      {0.25,-0.3125,0.1875,0.375,-0.25,0.4375},
      {-0.4375,-0.25,0.1875,-0.375,0.0625,0.25},
      {0.375,-0.25,0.1875,0.4375,0.0625,0.25},
      {-0.375,0.0625,0.1875,-0.25,0.125,0.25},
      {-0.1875,0.0625,0.1875,-0.0625,0.125,0.25},
      {0.0,0.0625,0.1875,0.1875,0.125,0.25},
      {0.25,0.0625,0.1875,0.375,0.125,0.25},
      {-0.4375,0.125,0.1875,-0.375,0.4375,0.25},
      {0.375,0.125,0.1875,0.4375,0.4375,0.25},
      {-0.375,0.4375,0.1875,-0.25,0.5,0.25},
      {-0.1875,0.4375,0.1875,-0.0625,0.5,0.25},
      {0.0,0.4375,0.1875,0.1875,0.5,0.25},
      {0.25,0.4375,0.1875,0.375,0.5,0.25},
      {-0.375,-0.5,0.25,-0.25,-0.3125,0.375},
      {0.25,-0.5,0.25,0.375,-0.3125,0.375},
      {-0.4375,-0.25,0.3125,-0.375,0.0625,0.4375},
      {0.375,-0.25,0.3125,0.4375,0.0625,0.4375},
      {-0.4375,0.125,0.3125,-0.375,0.4375,0.4375},
      {0.375,0.125,0.3125,0.4375,0.4375,0.4375},
      {-0.1875,-0.3125,0.375,-0.0625,-0.25,0.4375},
      {0.0,-0.3125,0.375,0.1875,-0.25,0.4375},
      {-0.375,-0.25,0.375,-0.3125,0.5,0.4375},
      {-0.25,-0.25,0.375,-0.1875,0.0625,0.4375},
      {-0.0625,-0.25,0.375,0.0,0.0625,0.4375},
      {0.1875,-0.25,0.375,0.25,0.0625,0.4375},
      {0.3125,-0.25,0.375,0.375,0.5,0.4375},
      {-0.3125,0.0625,0.375,-0.25,0.125,0.4375},
      {-0.1875,0.0625,0.375,-0.0625,0.125,0.4375},
      {0.0,0.0625,0.375,0.1875,0.125,0.4375},
      {0.25,0.0625,0.375,0.3125,0.125,0.4375},
      {-0.25,0.125,0.375,-0.1875,0.4375,0.4375},
      {-0.0625,0.125,0.375,0.0,0.4375,0.4375},
      {0.1875,0.125,0.375,0.25,0.4375,0.4375},
      {-0.3125,0.4375,0.375,-0.25,0.5,0.4375},
      {-0.1875,0.4375,0.375,-0.0625,0.5,0.4375},
      {0.0,0.4375,0.375,0.1875,0.5,0.4375},
      {0.25,0.4375,0.375,0.3125,0.5,0.4375},
    },
  }

super_computer.super_computer = {}

local player_inv = "list[current_player;main;1.5,3.5;8,4;]";
if minetest.get_modpath("hades_core") then
  player_inv = "list[current_player;main;0.5,3.5;10,4;]";
end

function super_computer.super_computer.get_formspec(consumption_percent)
  local progress = "";
  
  progress = "image[3.6,2.2;5.5,0.95;appliances_consumption_progress_bar.png^[transformR270]]";
  if consumption_percent then
    progress = "image[3.6,2.2;5.5,0.95;appliances_consumption_progress_bar.png^[lowpart:" ..
            (consumption_percent) ..
            ":appliances_consumption_progress_bar_full.png^[transformR270]]";
  end
  
  
  
  local formspec =  "formspec_version[3]" .. "size[12.75,9]" ..
                    "background[-1.25,-1.25;15,10;appliances_appliance_formspec.png]" ..
                    progress..
                    player_inv ..
                    "list[context;slots;5.75,0;1,2;]"..
                    "listring[current_player;main]" ..
                    "listring[context;slots]" ..
                    "listring[current_player;main]";
  return formspec;
end

function super_computer.super_computer.allow_metadata_inventory_put(pos, listname, index, stack, player)
  local meta = minetest.get_meta(pos)
  local inv = meta:get_inventory()
  local on_index = inv:get_stack(listname, index)
  if on_index:get_count()>0 then
  end
  local def = stack:get_definition() 
  if def and def._mflops then
    return 1
  end
  return 0
end

local function get_power_demand (stack, part)
  local def = stack:get_definition()
  if def and def._mflops then
    local mflops = def._mflops
    return mflops.base_power + math.ceil(mflops.per_mflop_power*part*(mflops.max_mflops-mflops.min_mflops))
  end
  return 0
end

function super_computer.super_computer.get_power_demand(self, pos, meta)
  local inv = meta:get_inventory()
  local part = meta:get_float("demand_part")
  local slot_1 = inv:get_stack(self.use_stack, 1)
  local slot_2 = inv:get_stack(self.use_stack, 2)
  local demand_1 = get_power_demand(slot_1, part)
  local demand_2 = get_power_demand(slot_2, part)
  return demand_1 + demand_2
end

function super_computer.super_computer.need_wait(self, timer_step)
  -- use_input, use_usage, need_wait
  local slot_1 = timer_step.inv:get_stack(self.use_stack, 1)
  local slot_2 = timer_step.inv:get_stack(self.use_stack, 2)
  local def_1 = slot_1:get_definition()
  local def_2 = slot_2:get_definition()
  if      ((def_1==nil) or (def_1._mflops==nil))
      and ((def_2==nil) or (def_2._mflops==nil)) then
    return nil, nil, true;
  end
  
  -- check for supply connection
  if (self.need_supply) then
    local supply_speed = self:have_supply(timer_step.pos, timer_step.meta)
    if (supply_speed<=0) then
      return use_input, use_usage, true;
    end
    if use_input then
      use_input = table.copy(use_input)
      use_input.consumption_step_size = use_input.consumption_step_size*supply_speed
    end
    if use_usage then
      use_usage = table.copy(use_usage)
      use_usage.production_step_size = use_usage.production_step_size*supply_speed
    end
  end
  
  -- check for control
  if (self.have_control) then
    return use_input, use_usage, self:control_wait(timer_step);
  end
  
  return use_input, use_usage, false;
end

local function get_mflops (stack, part)
  local def = stack:get_definition()
  local mflops = {
    actual = 0,
    min = 0,
    max = 0,
  }
  if def and def._mflops then
    mflops.min = def._mflops.min_mflops
    mflops.max = def._mflops.max_mflops
    local wear = stack:get_wear()
    local coef = 1
    local critical_state = 65536*(1-def._mflops.critical_fan_state)
    if wear>critical_state then
      coef = 0.1+0.9*((wear-critical_state)/(65536-critical_state))
    end
    mflops.actual = math.ceil((mflops.min + part*(mflops.max-mflops.min))*coef)
    mflops.no_fan_item = def._mflops.no_fan_item
  end
  return mflops
end

function super_computer.super_computer.on_production(self, timer_step)
  local part = timer_step.meta:get_float("demand_part")
  local slot_1 = timer_step.inv:get_stack(self.use_stack, 1)
  local slot_2 = timer_step.inv:get_stack(self.use_stack, 2)
  local mflops_1 = get_mflops(slot_1, part)
  local mflops_2 = get_mflops(slot_2, part)
  local mflops = mflops_1.actual + mflops_2.actual
  local total_mflops = super_computer.update_mflops_supply(self, timer_step.pos, mflops)
  local target_mflops = mflops
  if total_mflops<mflops then
    if mflops>(mflops_1.min+mflops_2.min) then
      target_mflops = math.max(total_mflops, mflops_1.min+mflops_2.min)
    end
  elseif total_mflops>mflops then
    if mflops<(mflops_1.max+mflops_2.max) then
      target_mflops = math.min(total_mflops, mflops_1.max+mflops_2.max)
    end
  end
  if target_mflops~=mflops then
    local min_mflops = mflops_1.min+mflops_2.min
    local max_mflops = mflops_1.max+mflops_2.max
    
    local part = 0
    if target_mflops>min_mflops then
      part = (target_mflops-min_mflops)/(max_mflops-min_mflops)
    end
    
    timer_step.meta:set_float("demand_part", part)
  end
  
  -- add wear
  if mflops_1.no_fan_item then
    slot_1:add_wear(math.floor(1.5+2*part))
    if slot_1:get_count()==0 then
      timer_step.inv:set_stack(self.use_stack, 1, ItemStack(mflops_1.no_fan_item))
    else
      timer_step.inv:set_stack(self.use_stack, 1, slot_1)
    end
  end
  if mflops_2.no_fan_item then
    slot_2:add_wear(math.floor(1.5+2*part))
    if slot_2:get_count()==0 then
      timer_step.inv:set_stack(self.use_stack, 2, ItemStack(mflops_2.no_fan_item))
    else
      timer_step.inv:set_stack(self.use_stack, 2, slot_2)
    end
  end
end

local node_sounds = nil
if minetest.get_modpath("default") then
  node_sounds = default.node_sound_metal_defaults()
end
if minetest.get_modpath("hades_sounds") then
  node_sounds = hades_sounds.node_sound_metal_defaults()
end
if minetest.get_modpath("sounds") then
  node_sounds = sounds.node_metal()
end

minetest.register_node("super_computer:rack", {
    description = S("Super Computer Empty Rack"),
    _tt_help = S("Punch me with server computer."),
    paramtype = "light",
    paramtype2 = "facedir",
    is_group_content = false,
    drawtype = "mesh",
    mesh = "super_computer_rack.obj",
    tiles = {"super_computer_rack.png"},
    collision_box = rack_node_box,
    selection_box = rack_node_box,
    groups = {cracky = 2, technic_machine = 1, technic_lv = 1},
    connect_sides = {"back"},
    sounds = node_sounds,
    
    on_construct = function (pos, node)
      local meta = minetest.get_meta(pos)
      local inv = meta:get_inventory()
      inv:set_size("slots", 2)
      meta:set_string("formspec", super_computer.super_computer.get_formspec(0))
    end,
    allow_metadata_inventory_put = super_computer.super_computer.allow_metadata_inventory_put,
    on_metadata_inventory_put = function (pos)
      local node = minetest.get_node(pos)
      node.name = "super_computer:rack_one_slot"
      minetest.swap_node(pos, node)
    end,
    
    technic_on_disable = function(pos, node)
      local meta = minetest.get_meta(pos)
      meta:set_string("infotext", S("Super Computer"))
    end,
  })
--]]

if appliances.have_technic then
  technic.register_machine("LV", "super_computer:rack", technic.receiver)
end

