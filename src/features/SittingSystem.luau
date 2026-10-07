local SittingSystem = {}

local ProximityPromptService = game:GetService("ProximityPromptService")

local function setupSeat(obj)
	if not obj:IsA("Seat") then
		return
	end

	print("Found Seat", obj:GetFullName())

	if obj:FindFirstChildOfClass("ProximityPrompt") then
		return
	end

	local prompt = Instance.new("ProximityPrompt")
	prompt.Name = "SitPrompt"
	prompt.ActionText = "Sit"
	prompt.ObjectText = "Seat"
	prompt.MaxActivationDistance = 8
	prompt.HoldDuration = 1
	prompt.KeyboardKeyCode = "E"
	prompt.RequiresLineOfSight = false
	prompt.Parent = obj

	print("Created Prompt", prompt:GetFullName())
end

function SittingSystem.Start()
	for _, obj in workspace:GetDescendants() do
		setupSeat(obj)
	end

	workspace.DescendantAdded:Connect(setupSeat)

	ProximityPromptService.PromptTriggered:Connect(function(prompt, player)
		if prompt.Name ~= "SitPrompt" then
			return
		end

		local seat = prompt.Parent

		if not seat:IsA("Seat") then
			return
		end

		if seat.Occupant then
			return
		end

		local char = player.Character

		if not char then
			return
		end

		local humanoid = char:FindFirstChildOfClass("Humanoid")
		if humanoid then
			seat:Sit(humanoid)
		end
	end)
end

return SittingSystem
