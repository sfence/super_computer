
local S = super_computer.translator

-- rack cube pc / cpu_65536
-- rack kodiag pc / ziram c6 
-- rack workstation / interlink d75a
-- rack fruit zero / interlink jetcore

super_computer.register_rack_computer("super_computer:rack_65536", {
    cpu = "65536",
    inventory_image = "super_computer_rack_pc.png",
    mflops = {
      min_mflops = 10, 
      max_mflops = 20,
      critical_fan_state = 0.5,
      no_fan_item = "super_computer:rack_65536_nofan",
      base_power = 100,
      per_mflop_power = 5, -- up to 150
    },
  })

super_computer.register_rack_computer("super_computer:rack_ziram_c6", {
    cpu = "Ziram c6",
    inventory_image = "super_computer_rack_pc.png",
    mflops = {
      min_mflops = 1, 
      max_mflops = 2,
      critical_fan_state = 0.5,
      no_fan_item = "super_computer:rack_ziram_c6_nofan",
      base_power = 75,
      per_mflop_power = 25, -- ip to 100
    },
  })

super_computer.register_rack_computer("super_computer:rack_d75a", {
    cpu = "d75a",
    inventory_image = "super_computer_rack_pc.png",
    mflops = {
      min_mflops = 100, 
      max_mflops = 1000,
      critical_fan_state = 0.5,
      no_fan_item = "super_computer:rack_d75a_nofan",
      base_power = 160,
      per_mflop_power = 0.1, -- up to 250
    },
  })

super_computer.register_rack_computer("super_computer:rack_jetcore", {
    cpu = "JetCore",
    inventory_image = "super_computer_rack_pc.png",
    mflops = {
      min_mflops = 10000, 
      max_mflops = 50000,
      critical_fan_state = 0.5,
      no_fan_item = "super_computer:rack_jetcore_nofan",
      base_power = 200,
      per_mflop_power = 0.0025, -- up to 300
    },
  })

--[[
minetest.register_craftitem("super_computer:rack__nofan", {
    description = S("Rack computer with cpu").." ",
    _tt_help = S("Combine this with fans, to fix it."),
    inventory_image = "super_computer_rack_pc.png",
    max_stack = 1,
  })

minetest.register_craftitem("super_computer:rack_", {
    description = S("Rack computer with cpu %s without fans"),
    _tt_help = S("Computing power").."  -  MFLOPS.",
    inventory_image = "super_computer_rack_pc.png",
    max_stack = 1,
    _mflops = {
      min_mflops = 1, 
      max_mflops = 1,
      critical_fan_state = 0.5,
      no_fan_item = "super_computer:rack__nofan",
      base_power = ,
      per_mflop_power = , -- up to 
    },
  })
--]]

