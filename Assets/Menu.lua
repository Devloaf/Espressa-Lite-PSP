--[[

	Menu File for Espressa Lite PSP a0.2
	----------------------------------
	The menu for the application
	
	Create Date: 2020.06.07
	Last Edit: 2026.03.30

--]]

Splash = Image.load("Resources/Style/"..Config.Theme.."/Splash.png")

while true do
	pad = Controls.read()
	screen:clear(Color.new(255,255,255))

	screen:blit(0, 0, Splash)

	screen:print(5, 5, CONST.AppName.." "..CONST.State.." "..CONST.Version..", Build "..CONST.Build, Color.new(0,0,0))
	screen:print(5, 20, "By "..CONST.Author.." on "..CONST.Date.FULL, Color.new(0,0,0))
	screen:print(5, 260, System.getFreeMemory() / 1024 / 1024 .. " MB free", Color.new(0,0,0))

	screen:print(260, 220, "Press [ X ] to Start", Color.new(0,0,0))

	if pad:select() then screen:save("Workspace/"..CONST.CurDateFULLPLAIN.."_"..getTimeStr_HH_MM_SS()..".png") end
	if pad:cross() then dofile("Editor.lua") end
	
	screen.flip()
	screen.waitVblankStart()
end