--[[
	Name: Random Group User
	Description: Returns a random UserID and Username based on a group.
	Author: Hoofer

	Notes:
	This has to be handled on the server as only the server can use HTTP requests.
	This means you can use a RemoteFunction to parse data from the server to client.
	Examples provided :)
]]

local module = {}
local http = game:GetService("HttpService")

module.getRandomUser = function(groupID)
	local info = http:GetAsync("https://groups.rprxy.xyz/v1/groups/" .. groupID .. "/users?sortOrder=Asc&limit=100")
	local data = http:JSONDecode(info)["data"]
	local amt = #data
	local person = data[math.random(1,amt)]
	return {name = person.user.username, id = person.user.userId}	
end

return module
