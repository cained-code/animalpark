local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DataServiceTyped = require(ReplicatedStorage.Packages.DataServiceTyped)

local template = {
	currency = 0,
	inventory = {
		fishingrod = false,
	},
}

return DataServiceTyped({
	template = template,
})
