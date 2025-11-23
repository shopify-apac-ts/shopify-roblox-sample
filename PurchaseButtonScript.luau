-- Wait for services
local CommerceService = game:GetService("CommerceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local purchaseEvent = ReplicatedStorage:WaitForChild("PurchaseCommerceProduct")

-- Get the button
local button = script.Parent  -- The TextButton this script is in

-- Your Commerce Product ID
local PRODUCT_ID = "COM-XXXXXXXXXXXX"  -- Your actual product ID

-- Handle button click
button.MouseButton1Click:Connect(function()
	local player = game.Players.LocalPlayer

	-- Option 1: Call directly from client (simpler)
	CommerceService:PromptCommerceProductPurchase(player, PRODUCT_ID)

	-- Option 2: Or fire to server (if you prefer server-side handling)
	-- purchaseEvent:FireServer(PRODUCT_ID)

	-- Optional: Disable button temporarily to prevent spam
	button.Active = false
	button.Text = "Processing..."

	-- Listen for when purchase flow completes
	local connection
	connection = CommerceService.PromptCommerceProductPurchaseFinished:Connect(function(promptedPlayer, productId)
		if promptedPlayer == player and productId == PRODUCT_ID then
			-- Purchase flow completed
			button.Active = true
			button.Text = "Buy Product"
			connection:Disconnect()
		end
	end)

	-- Re-enable after timeout (safety)
	wait(30)
	if button.Active == false then
		button.Active = true
		button.Text = "Buy Product"
		if connection then
			connection:Disconnect()
		end
	end
end)