--[[

	Function File for Espressa Lite PSP 0.1
	----------------------------------
	Loads useful functions and global variables
	
	Create Date: 2024.02.20
	Last Edit: 2026.03.22

--]]

CONST = {
	AppName = "Espressa Lite for PSP",
	Version = "0.1", State = "Alpha", Build = nil,
	Date = "2026.03.22",
	Author = "c4thead",
	
	ScreenshotsDir = "Screenshots",
	DrawingsDir = "Exports",
	RecordFiles = "Recorders",
	SaveFormat = ".png",
	PrjFormat = ".epr", -- Espressa Lite PSP Project File
	RecFormat = "erc", -- Espressa Lite PSP Recorder File
	
	FontSize = 11,
	
	Default = {
		Style = "EspressaOriginals_Light",
		ToolPack = "Espressimistic"
	}
	
}



-- Default Colors Pack
Col = {
	Black = Color.new(0	,0	,0),
	White = Color.new(255	,255	,255),
	
	Red = Color.new(255	,0	,0),
	Green = Color.new(0	,255	,0),
	Blue = Color.new(0	,0	,255),
	Yellow = Color.new(255	,255	,0)
}

function getTimeStr_HH_MM_SS()
	time = os.time()
	dateString = os.date("%c", time)
	dateFields = os.date("*t", time)

	hour = dateFields.hour
	if hour < 10 then hour = "0"..hour end
	min = dateFields.min
	if min < 10 then min = "0"..min end
	sec = dateFields.sec
	if sec < 10 then sec = "0"..sec end

	return tostring(hour..""..min..""..sec)
end

function getDateStr_YYYY_MM_DD()
	time = os.time()
    Year = os.date("%Y", time)
    Month = os.date("%m", time)
    Day = os.date("%d", time)
	return string.format("%04d%02d%02d", Year, Month, Day)
end
-- That ^ didn't get me anywhere unfortunately, waiting for the engine dev to respond to my issue on github :pray:


-- Again, thx to Ex, this is what i wouldn't come to without his help:
bool = nil
padOld = {}

pressed = {
	right = false,
	left = false,
	up = false,
	down = false,
	cross = false,
	circle = false,
	square = false,
	triangle = false,
	r = false,
	l = false,
	start = false,
	select = false
}

function checkPad()
	pad = Controls.read()
	for _,fName in ipairs({
		"right",
		"left",
		"up",
		"down",
		"cross",
		"circle",
		"square",
		"triangle",
		"r",
		"l",
		"start",
		"select"
	}) do
		local bool = pad[fName](pad)
		
		if bool and not padOld[fName] then
			pressed[fName] = true
		else
			pressed[fName] = false
		end
		
		padOld[fName] = bool;
	end
end




-- stolen from here: https://forums.ps2dev.org/viewtopic.php?f=21&t=5336 (Creating Masks... Alpha Value)
-- (another one) - https://forums.ps2dev.org/viewtopic.php?f=21&t=5374
function Image:DrawAlpha(X, Y, MaskColour, BGColour)
  if MaskColour then
    if not X then X = 0 end
    if not Y then Y = 0 end
    imgAlpha = Image.createEmpty(self:width(), self:height())
    for YPos=0,self:width()-1 do
     for XPos=0,self:height()-1 do
      color = self:pixel(XPos,YPos)
      rgb = color:colors()
      if rgb.a == 0 then
        if BGColour then screen:fillRect(XPos,YPos,1,1,BGColour) end
      else
        imgAlpha:fillRect(XPos,YPos,1,1,MaskColour)
      end
     end
    end
    screen:blit(X, Y, imgAlpha)
  end
end


-- test this later:
--imgStar = Image.load("Star.PNG")
--imgStar:DrawAlpha(0,0,Color.new(200,0,0,200))




-- Image.createEmpty(480, 272) - Can we create a bigger image?
-- 512x512 is max
-- https://forums.ps2dev.org/viewtopic.php?f=21&t=5307