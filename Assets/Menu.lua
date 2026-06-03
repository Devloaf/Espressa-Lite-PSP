--[[

	Menu
	----------------------------------
	The menu for the application
	
	Create Date: 2020.06.07
	Last Edit: 2026.06.03

--]]

Splash = Image.load("Resources/Style/"..Config.Theme.."/Splash.png")
SmallWindow = Image.load("Resources/Style/"..Config.Theme.."/SmallWindow.png")
Alpha = Image.load("Resources/Style/"..Config.Theme.."/Alpha.png")
CanvasWidth = 480
CanvasHeight = 272

mMenu = 1 -- 1 = main, 2 = canvas selector

while true do
	checkPad()
	screen:clear(Color.new(255,255,255))

	screen:blit(0, 0, Splash)

	if mMenu == 1 then

		screen:print(190, 215, "Press [ X ] to Create new Canvas", Color.new(0,0,0))
		
		if pressed.cross then mMenu = 2 end

	elseif mMenu == 2 then
		screen:blit(0, 0, Alpha)
		screen:blit(142, 64, SmallWindow)

		screen:print(167, 84, "Creating new Canvas", Color.new(0,0,0))
		screen:print(200, 152, "Width: "..CanvasWidth, Color.new(0,0,0))
		screen:print(200, 172, "Height: "..CanvasHeight, Color.new(0,0,0))

		if pressed.left then
			if CanvasWidth > 1 then
				CanvasWidth = CanvasWidth - 1
			end
		elseif pressed.right then
			if CanvasWidth < 480 then
				CanvasWidth = CanvasWidth + 1
			end
		end
		if pressed.down then
			if CanvasHeight > 1 then
				CanvasHeight = CanvasHeight - 1
			end
		elseif pressed.up then
			if CanvasHeight < 272 then
				CanvasHeight = CanvasHeight + 1
			end
		end

		if pressed.cross then

			if CanvasWidth <= 480 and CanvasWidth >= 1 then
				if CanvasHeight <= 272 and CanvasHeight >= 1 then
					mMenu = 1
					dofile("Editor.lua")
				end
			else
				screen:print(185, 185, "Cannot create with selected dimensions", Color.new(255,0,0))
			end
		elseif pressed.circle then
			mMenu = 1
		end
	end

	screen:print(5, 5, CONST.AppName.." "..CONST.State.." "..CONST.Version..", Build "..CONST.Build, Color.new(0,0,0))
	screen:print(5, 20, "By "..CONST.Author.." on "..CONST.Date.FULL, Color.new(0,0,0))

	screen:print(5, 260, getFreeMem("KB") .. " KB free", Color.new(0,0,0))
	if pad:select() then screen:save("Workspace/"..CONST.CurDateFULLPLAIN.."_"..getTimeStr_HH_MM_SS()..".png") end
	
	
	screen.flip()
	screen.waitVblankStart()
end