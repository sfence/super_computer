
local S = super_computer.translator

function super_computer.register_rack_computer(rack_name, rack_def)
  minetest.register_craftitem(rack_name.."_nofan", {
      description = string.format(S("Rack computer with cpu %s without fans"), rack_def.cpu),
      _tt_help = S("Combine this with fans, to fix it."),
      inventory_image = rack_def.inventory_image,
      max_stack = 1,
    })
  local mflops = rack_def.mflops
  local tt_help = ""
  if mflops.max_mflops<1000 then
    tt_help = string.format(S("Computing power %s - %s MFLOPS."),mflops.min_mflops, mflops.max_mflops)
  elseif mflops.max_mflops<1000000 then
    tt_help = string.format(S("Computing power %s - %s GFLOPS."),mflops.min_mflops/1000, mflops.max_mflops/1000)
  else
    tt_help = string.format(S("Computing power %s - %s TFLOPS."),mflops.min_mflops/1000000, mflops.max_mflops/1000000)
  end
  tt_help = string.format(S("Connect to power %s - %s EU (LV)."), mflops.base_power, mflops.base_power+mflops.per_mflop_power*(mflops.max_mflops-mflops.min_mflops)).."\n"..tt_help
  minetest.register_tool(rack_name, {
      description = string.format(S("Rack computer with cpu %s"), rack_def.cpu),
      _tt_help = tt_help,
      inventory_image = rack_def.inventory_image,
      max_stack = 1,
      _mflops = mflops,
    })
end

function super_computer.update_mflops_supply(self, pos, mflops)
  local side_data = {};
  local total_demand = 0;
  for _,side in pairs(self.supply_connect_sides) do
    local side_pos = appliances.get_side_pos(pos, side);
    local side_node = minetest.get_node(side_pos);
    local side_def = minetest.registered_nodes[side_node.name];
    if side_def and side_def._mflops_connect_sides then
      if appliances.is_connected_to(side_pos, pos, side_def._mflops_connect_sides) then
        local meta = minetest.get_meta(side_pos);
        local demand = meta:get_int("mflops_demand") or 0
        if (demand>0) then
          total_demand = total_demand + demand;
          table.insert(side_data, {meta=meta,demand=demand});
        else
          meta:set_int("mflops_input", 0)
        end
      end
    end
  end
  
  if (total_demand>0) then
    local part = mflops/total_demand;
    
    for _,side in pairs(side_data) do
      side.meta:set_int("mflops_input", math.floor(side.demand*part))
    end
  end
  
  return total_demand
end

