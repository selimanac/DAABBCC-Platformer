local M={}
M.world = {}

M.collectable_count = 0 
M.life_count = 4
M.hero_id = 0
M.enemy_ids = 1


local hud = "/GUI#hud"
local world =  M.world
local sound_controller =  msg.url("main" , "/sound_fx", "SoundGate")

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

function M.play_sfx(sound_fx, fx_gain)
	local fx_gain = fx_gain or 1.0
	msg.post(sound_controller, "play_gated_sound", { soundcomponent = "/sound_fx#"..sound_fx, gain = fx_gain })
end

function M.reset( )
	M.world = {}
	world =  M.world
	M.collectable_count = 0 
	M.life_count = 4
	M.hero_id = 0
	M.enemy_ids = 1
end

function M.update_collectable()
	M.collectable_count =M.collectable_count + 1
	msg.post(hud, "set_collectable")
end	

function M.update_life()
	if M.life_count > 1 then
		M.life_count = M.life_count - 1
		msg.post(hud, "set_life")
	end
end

function M.enemy_id()
	M.enemy_ids = M.enemy_ids +1
end
return M
