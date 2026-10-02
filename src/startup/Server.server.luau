local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Packages.DataService).server
local DataTemplate = require(ReplicatedStorage.Path.To.DataTemplate)

DataService:init({
	template = DataTemplate,
})
