local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local Data = require(ReplicatedStorage.Source.Game.GameData).server
local SittingSystem = require(ServerScriptService.Features.SittingSystem)

SittingSystem.Start()
