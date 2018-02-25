local M={}

M.world = {}
local world =  M.world


function M.addRect(_name, _position,_size,_type, _go_name, _sprite_url)
	local _id = daabbcc.insertRect(_name, _position.x , _position.y, _size.x, _size.y)
	local sub_table_name = _type.."s"
	if world[sub_table_name] == nil then
		world[sub_table_name] = {}
	end
	table.insert(world[sub_table_name],_id , {treeID = _id, position = _position, size = _size, type =_type,name = _go_name, sprite = _sprite_url}  )
	return _id
end

function M.updateRect(_name, _id, _position, _size)
	daabbcc.updateRect(_name,_id, _position.x , _position.y, _size.x, _size.y)
end

function M.removeFromTree(_name,_id)
	table.remove(M.world, _id)
	daabbcc.removeAABB("particles",_id)
end

return M
