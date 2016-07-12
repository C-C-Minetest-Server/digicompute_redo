-- digiterm/os.lua
digiterm.os = {} -- init os table
local modpath = digiterm.modpath -- modpath pointer
local path = digiterm.datapath -- datapath pointer

-- [function] load os
function digiterm.os.load(os_name)
  if datalib.dofile(modpath.."/os/"..os_name..".lua") ~= true then
    if datalib.dofile(path.."/os/"..os_name.."/.lua") ~= true then
      -- print error
      digiterm.log(os_name.." os could not be found. Please place the OS file in "..modpath.."/os/ or "..path.."/os/ with extension '.lua'.", "error")
    end
  end
end

-- [function] set meta value
function digiterm.os.set(pos, key, value)
  local meta = minetest.get_meta({x = pos.x, y = pos.y, z = pos.z}) -- get meta
  meta:set_string(key, value) -- set value
  return true -- return true, successful
end

-- [function] get meta value
function digiterm.os.get(pos, key)
  local meta = minetest.get_meta({x = pos.x, y = pos.y, z = pos.z}) -- get meta
  local value = meta:get_string(key) -- get value
  return value -- return retrieved value
end

-- [function] refresh formspec
function digiterm.os.refresh(pos)
  local meta = minetest.get_meta(pos) -- get meta
  meta:set_string("formspec", digiterm.formspec_normal(meta:get_string("input"), meta:get_string("output")))
end