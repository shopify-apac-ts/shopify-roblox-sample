# Roblox Studio sample script of embedding Shopify checkout to experiences


## Prerequisits 
1. Creare a Roblox account from [here](https://www.roblox.com/)
2. Verify your email, age with ID, and fill the business info, etc. in [creator hub](https://create.roblox.com/) to be eligible to selling products following [this page](https://create.roblox.com/docs/production/monetization/commerce-products)
3. Install [Shopify Roblox sales channel](https://apps.shopify.com/roblox) to your Shopify store
4. Connect your Roblox account and select products to import to Roblox and sync them. 👉[screenshot](../../wiki#sales-channel-app-settings)
5. Install [Roblox Studio](https://create.roblox.com/docs/tutorials/curriculums/studio/install-studio) desktop application (Windows or Mac OS) to your computer and login with the same account aobve.
6. Go back to [creator hub](https://create.roblox.com/) to create an experience (virtual space like a game where you engage players and sell your profucts) with Roblox Studio above. You can use the default sample experiece instead of scratch built one.
7. Go to the experiece manage page in [creator hub](https://create.roblox.com/) and commerce product creation. The menu path is like `Creations / ${YOUR_EXPERIENCE_NAME} / Monetization / Commerce /Create Products`.
8. Create and submit commerce products with imported products through Shopify sales channel above. 👉[screenshot](../../wiki#creator-hub-settings)
9. The status will be `pending` and it will be `approved` within a day or more. 
10. Turn the products `on sale` in the same page.
11. Now you are ready to sell Shopify products in your Roblox experience!🎉


You should read the following pages for more details.
- [Shopify Roblox sales channel help](https://help.shopify.com/en/manual/online-sales-channels/roblox)
- [Roblox Commerce Products](https://create.roblox.com/docs/production/monetization/commerce-products)
- [Roblox Commerce Service dev. doc](https://create.roblox.com/docs/reference/engine/classes/CommerceService)


## How to embed your Shopify checkout to your experience (game)
Once you create an experinece, **you have to create your custom object to navigate to your checkout flow with Roblox API**, which requires you to learn and catch up basic Roblox game creation skills with coding. 


This sample uses the default sample experience given by Roblox Studio and render a simple checkout button on the upper area of screen to navigate players to Shopify checkoout flow.


### 1. Create the server script
1. Open Roblox Studio
2. In Explorer, find ServerScriptService
3. Right-click ServerScriptService -> Insert Object -> Script
4. Rename it to "CommerceHandler"
5. Copy the entire code of [Commercehandler.luau](./CommerceHandler.luau) in this sample to paste them to the script above
6. Replace `"COM-XXXXXXXXXXXX"` with your actual produtct id shown up in `step 7. in Prerequisits` 👉[screenshot](../../wiki#roblox-studio-implementation)


### 2. Create the checkout button
1. In Explorer, find StarterGui
2. Right-click StarterGui -> Insert Object -> ScreenGui
3. Right-click your ScreenGui -> Insert Object -> Frame
4. Rename it to "PurchaseFrame"
5. Right-click your Frame -> Insert Object -> TextButton
6. Rename it to "PurchaseButton"
7. Modify the GUI location, size, text and background colors, caption, etc. in Properties of each object 👉[screenshot](../../wiki#roblox-studio-implementation)


### 3. Add the local script to the button
1. Right-click your TextButton above -> Insert Object -> LocalScript
2. Rename it to "PurchaseButtonScript"
3. Copy the entire code of [PurchaseButtonScript.luau](./PurchaseButtonScript.luau) in this sample to paste them to the script above
4. Replace `"COM-XXXXXXXXXXXX"` with your actual produtct id the same as [Commercehandler.luau](./CommerceHandler.luau)  specified 👉[screenshot](../../wiki#roblox-studio-implementation)


### 4. Test and debug
1. Click the play button to test the game and click the checkout button shown up in the screen which shows Shopify checkout.


### 5. Publish the experience to Roblox
1. Click File -> Publish to Roblox and you can play it in real [Roblox](https://roblox.com/) world!👍
2. You have to install **Roblox client app (not Studio)** for iOS / Android / Desktop to play your experience (browser play is not supported) 👉[video](../../wiki#real-roblox-playing-with-shopify-checkout)


## Demo
- You can check all screenshots and demo video in [Wiki](../../wiki)



## TIPS
- **As of Nov. 2025, only US players can buy Shopify products in Roblox**, but you can buy yourself products in yourself experiences even though you are not US account. If non US buyers other than you try to buy your products, Roblox shows message to block it.  👉[screenshot](../../wiki#blocking-message-for-non-eligible-players) 
- You can customize Roblox product details page and integrate with **Shopify Metafields**. Check [their devlopment page](https://create.roblox.com/docs/production/monetization/commerce-products).

