Player = {}
Player.__index = Player

function Player.new ()
	local newPlayer = {
		scores = {},
		lastScore = 0,
		highScore = 0
	}
	return setmetatable (newPlayer, Player)

end
