-------------------------
-- Super Computer Rack --
-------------------------
----- Ver 1.0 ---------
-----------------------
-- Initial Functions --
-----------------------
local S = super_computer.translator;

super_computer.super_computer_two_slots = appliances.appliance:new(
    {
      node_name_inactive = "super_computer:rack_two_slots",
      node_name_active = "super_computer:rack_two_slots_active",
      
      node_description = S("Super Computer"),
    	node_help = S("Energy demands on installed rack computers.").."\n"..S("Generate computing power in MFLOPS.").."\n"..S("Startup and Shutdown by punch."),
      
      input_stack_size = 0,
      have_input = false,
      use_stack_size = 2,
      use_stack = "slots",
      have_usage = false,
      output_stack_size = 0,
      have_output = false,
      
      supply_connect_sides = {"front","back","right","left"},
      
      have_control = true,
      
      sounds = {
        running = {
          sound = "super_computer_rack_running",
          sound_param = {max_hear_distance = 10, gain = 2},
          repeat_timer = 0,
        },
      },
    })

local super_computer_two_slots = super_computer.super_computer_two_slots

super_computer_two_slots:power_data_register(
  {
    ["LV_power"] = {
        get_demand = super_computer.super_computer.get_power_demand,
        run_speed = 1,
        disable = {"no_power"},
      },
    ["power_generators_power"] = {
        get_demand = super_computer.super_computer.get_power_demand,
        run_speed = 1,
        disable = {"no_power"},
      },
    ["no_power"] = {
      },
  })
super_computer_two_slots:control_data_register(
  {
    ["punch_control"] = {
      },
  })

--------------
-- Formspec --
--------------

local player_inv = "list[current_player;main;1.5,3;8,4;]";
if minetest.get_modpath("hades_core") then
  player_inv = "list[current_player;main;0.5,3;10,4;]";
end

function super_computer_two_slots:get_formspec(meta, production_percent, consumption_percent)
  return super_computer.super_computer.get_formspec(consumption_percent);
end

---------------
-- Callbacks --
---------------

function super_computer_two_slots:cb_allow_metadata_inventory_put(pos, listname, index, stack, player)
  return super_computer.super_computer.allow_metadata_inventory_put(pos, listname, index, stack, player)
end
function super_computer_two_slots:cb_on_metadata_inventory_put(pos, listname, index, stack, player)
end
function super_computer_two_slots:cb_on_metadata_inventory_take(pos, listname, index, stack, player)
  
  local meta = minetest.get_meta(pos)
  self:deactivate(pos, meta)
  local node = minetest.get_node(pos)
  node.name = "super_computer:rack_one_slot"
  minetest.swap_node(pos, node)
end

function super_computer_two_slots:cb_on_production(timer_step)
  super_computer.super_computer.on_production(self, timer_step)
end

function super_computer_two_slots:cb_waiting(pos, meta)
  super_computer.update_mflops_supply(self, pos, 0)
end

function super_computer_two_slots:cb_deactivate(pos, meta)
  super_computer.update_mflops_supply(self, pos, 0)
end

----------
-- Node --
----------

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
      -- slots
      {-0.3125,-0.25,-0.4375,0.3125,0.0625,0.3125},
      {-0.3125,0.125,-0.4375,0.3125,0.4375,0.3125},
    },
  }

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

local node_def = {
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {cracky = 2, mflops_computer = 1, not_in_creative_inventory = 1},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = node_sounds,
    drawtype = "mesh",
    mesh = "super_computer_two_slots.obj",
    use_texture_alpha = "clip",
    drop = "super_computer:rack",
    
    collision_box = rack_node_box,
    selection_box = rack_node_box,
 }

local node_inactive = {
    tiles = {
        "super_computer_rack.png",
        "super_computer_slots_y.png",
        "super_computer_slots_sides.png",
        "super_computer_slots_back.png",
        "super_computer_slot_1_panel.png",
        "super_computer_slot_1_panel.png",
    },
  }

local node_active = {
    tiles = {
        "super_computer_rack.png",
        "super_computer_slots_y.png",
        "super_computer_slots_sides.png",
        {
          image = "super_computer_slots_back_active.png",
          backface_culling = false,
          animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 0.4
          }
        },
        {
          image = "super_computer_slot_1_active.png",
          backface_culling = false,
          animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 2.1
          }
        },
        {
          image = "super_computer_slot_2_active.png",
          backface_culling = false,
          animation = {
            type = "vertical_frames",
            aspect_w = 16,
            aspect_h = 16,
            length = 1.9
          }
        }
    },
  }

super_computer_two_slots:register_nodes(node_def, node_inactive, node_active)

-------------------------
-- Recipe Registration --
-------------------------


