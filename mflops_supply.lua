
-- register mflops supply 

local mflops_supply = {
    have_supply = function (self, supply_data, pos, meta)
        local mflops_input = meta:get_int("mflops_input");
        if (mflops_input>0) then
          local demand = supply_data.demand or supply_data.get_demand(self, pos, meta)
          local coef = mflops_input/demand
          meta:set_int("mflops_input", 0)
          return supply_data.run_speed*math.min(coef, 1.0);
        end
        return 0;
      end,
    activate = function (self, supply_data, pos, meta)
        local demand = supply_data.demand or supply_data.get_demand(self, pos, meta)
        meta:set_int("mflops_demand", demand)
      end,
    deactivate = function (self, supply_data, pos, meta)
        meta:set_int("mflops_demand", 0)
      end,
    running = function (self, supply_data, pos, meta)
        local demand = supply_data.demand or supply_data.get_demand(self, pos, meta)
        meta:set_int("mflops_demand", supply_data.demand)
      end,
    waiting = function (self, supply_data, pos, meta)
        local demand = supply_data.demand or supply_data.get_demand(self, pos, meta)
        meta:set_int("mflops_demand", supply_data.demand)
      end,
    update_node_def = function(self, power_data, node_def)
        node_def.groups.mflops_powered = 1;
        node_def._mflops_connect_sides = self.supply_connect_sides;
      end,
  }
appliances.add_supply("super_computer_mflops_supply", mflops_supply)

-- abm function
--[[
minetest.register_abm({
    label = "Check MFLOPS powered appliances",
    nodenames = {"group:mflops_powered"},
    interval = 1,
    chance = 1,
    action = function(pos, node)
      local node_def = minetest.registered_nodes[node.name]
      for _,side in pairs(node_def._mflops_connect_sides) do
        local side_pos = appliances.get_side_pos(pos, node, side);
        local side_node = minetest.get_node(side_pos);
        if minetest.get_item_group(side_node.name, "mflops_computer")>0 then
          return
        end
      end
      local meta = minetest.get_meta(pos)
      meta:set_int("mflops_input", 0)
    end,
 })
--]]

