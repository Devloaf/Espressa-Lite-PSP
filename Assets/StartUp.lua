--[[

	StartUp File for Espressa Lite PSP 0.1
	----------------------------------
	Starts everything to set up the enviroment and etc.
	
	Create Date: 2020.06.07
	Last Edit: 2026.03.22

--]]



dofile("Functions.lua")

-- don't touch this, i made it so that i can detect how many times i launched the app after i made some changes, this is how i calculate the builds even tho it's really not what build actually means (i'm sorry)
indev = false
BuildCFG = io.open("Data/Build.cfg", "r")
CONST.Build = tonumber(BuildCFG:read())
BuildCFG:close()
if indev then
	CONST.Build = CONST.Build + 1

	BuildCFG = io.open("Data/Build.cfg", "w")
	BuildCFG:write(CONST.Build)
	BuildCFG:close()
end

-- https://forums.ps2dev.org/viewtopic.php?f=21&t=5386
-- There used to be a write of the Date and Time to DATE.TXT somewhere

-- Configs
dofile("Data/Config.cfg")

-- Starting a Main Script
dofile("Menu.lua")

--exit()
error("Exit an app via PS button, thanks")