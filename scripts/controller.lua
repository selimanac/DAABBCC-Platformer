local M={}

M.world = {}

M.sub_world = {}

local world =  M.world


function M.addRect(_name, _position,_size,_type)
	local _id = daabbcc.insertRect(_name, _position.x , _position.y, _size.x, _size.y)
	local sub_table_name = _type.."s"
	if world[sub_table_name] == nil then
		world[sub_table_name] = {}
	end
	table.insert(world[sub_table_name],#world[sub_table_name] + 1 , {treeID = _id, position = _position, size = _size, type =_type}  )
	return _id
end

function M.updateRect(_name, _size, _position,_id)
	daabbcc.updateRect(_name,_id, _position.x , _position.y, _size.x, _size.y)
end

function M.removeFromTree(_name,_id)
	table.remove(M.world, _id)
	daabbcc.removeAABB("particles",_id)
end

return M
