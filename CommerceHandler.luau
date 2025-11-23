local CommerceService = game:GetService("CommerceService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Your Commerce Product IDs (from Creator Hub)
local COMMERCE_PRODUCTS = {
	PRODUCT_1 = "COM-XXXXXXXXXXXX",  -- Your actual product ID
	-- Add more products as needed
	-- PRODUCT_2 = "COM-xxxxxxxxxxxxxxxxx",
}

-- Create RemoteEvent for client-server communication
local purchaseEvent = Instance.new("RemoteEvent")
purchaseEvent.Name = "PurchaseCommerceProduct"
purchaseEvent.Parent = ReplicatedStorage

-- Handle purchase requests from client
purchaseEvent.OnServerEvent:Connect(function(player, productId)
	-- Verify product ID
	local isValidProduct = false
	for _, id in pairs(COMMERCE_PRODUCTS) do
		if id == productId then
			isValidProduct = true
			break
		end
	end

	if isValidProduct then
		print("Received purchase request from", player.Name, "for product ID:", productId)
		-- Prompt the Commerce product purchase
		CommerceService:PromptCommerceProductPurchase(player, productId)
	else
		warn("Invalid product ID:", productId, "from player:", player.Name)
	end
end)

-- Handle when purchase prompt finishes
CommerceService.PromptCommerceProductPurchaseFinished:Connect(function(player, productId)
	print("Purchase flow completed for player:", player.Name, "Product ID:", productId)

	-- Note: This event fires when the purchase interface closes,
	-- but does NOT confirm a successful purchase.
	-- You may need to verify the purchase through other means
	-- or use MarketplaceService.ProcessReceipt if virtual items are bundled
end)

-- Optional: Handle virtual items if your Commerce product includes them
-- Commerce products with bundled virtual items may still use MarketplaceService.ProcessReceipt
MarketplaceService.ProcessReceipt = function(receiptInfo)
	local player = game.Players:GetPlayerByUserId(receiptInfo.PlayerId)

	if not player then
		return Enum.ProductPurchaseDecision.NotProcessedYet
	end

	local productId = receiptInfo.ProductId

	-- Check if this is a Commerce product with virtual items
	-- You'll need to match the product ID format
	print("Processing receipt for player:", player.Name)
	print("Product ID:", productId)

	-- Handle virtual item grants here if your Commerce product includes them
	-- TODO: Add your reward logic here

	return Enum.ProductPurchaseDecision.PurchaseGranted
end