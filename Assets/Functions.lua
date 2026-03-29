--[[

	Function File for Espressa Lite PSP a0.2
	----------------------------------
	Loads useful functions and global variables
	
	Create Date: 2024.02.20
	Last Edit: 2026.03.30

--]]

CONST = {
	AppName = "Espressa Lite for PSP",
	Version = "0.2", State = "Alpha", Build = nil,
	Date = {
		Year = 2026,
		Month = 3,
		Day = 30,
		FULL = nil, -- for YYYY.MM.DD
        FULLPLAIN = nil -- for YYYYMMDD
	},
    CurDateFULLPLAIN = "20260330", -- for using in taking saves (you're free to modify this value the way you want but i know you won't because it's too much effort)
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

SYSTEM = {
    SCREEN_WIDTH = 480,
    SCREEN_HEIGHT = 272
}

-- baking the YYYY.MM.DD into Date.FULL
CONST.Date.FULL = CONST.Date.Year
if CONST.Date.Month < 10 then CONST.Date.FULL = CONST.Date.FULL..".".."0"..CONST.Date.Month else CONST.Date.FULL = CONST.Date.FULL.."."..CONST.Date.Month end
if CONST.Date.Day < 10 then CONST.Date.FULL = CONST.Date.FULL..".".."0"..CONST.Date.Day else CONST.Date.FULL = CONST.Date.FULL.."."..CONST.Date.Day end

CONST.Date.FULLPLAIN = CONST.Date.Year
if CONST.Date.Month < 10 then CONST.Date.FULLPLAIN = CONST.Date.FULLPLAIN.."0"..CONST.Date.Month else CONST.Date.FULLPLAIN = CONST.Date.FULLPLAIN..CONST.Date.Month end
if CONST.Date.Day < 10 then CONST.Date.FULLPLAIN = CONST.Date.FULLPLAIN.."0"..CONST.Date.Day else CONST.Date.FULLPLAIN = CONST.Date.FULLPLAIN..CONST.Date.Day end



-- totally not generated through ChatGPT 5 because i am a shit of a programmer but hey it works
function StartAnimation(obj, anim, dur, destX, destY, startAlpha, endAlpha)
    local STEPS = 50

    if dur / STEPS < 5 then
        STEPS = math.floor(dur / 5)
        if STEPS < 1 then STEPS = 1 end
    end

    if startAlpha == nil then
        if anim == "Fade In" then startAlpha = 0
        else startAlpha = obj.alpha or 255 end
    end

    if endAlpha == nil then
        if anim == "Fade Out" then endAlpha = 0
        else endAlpha = startAlpha end
    end

    obj.animData = {
        timer = Timer.new(),
        step = 0,
        steps = STEPS,

        startX = obj.X,
        startY = obj.Y,
        destX = destX,
        destY = destY,

        startAlpha = startAlpha,
        endAlpha = endAlpha,

        lastProgress = 0,
        type = anim,
        duration = dur
    }
end

function UpdateAnimation(obj)
    if obj.animData == nil then return false end

    local data = obj.animData
    local time = data.timer:time()

    for i = data.step + 1, data.steps do
        if time >= (data.duration / data.steps) * i then
            data.step = i

            local progress = i / data.steps

            -- Easing
            if data.type == "Ease In" then
                progress = progress * progress

            elseif data.type == "Ease Out" then
                progress = 1 - (1 - progress) * (1 - progress)

            elseif data.type == "Ease In-Out" or data.type == "Fade In" or data.type == "Fade Out" then
                progress = progress * progress * (3 - 2 * progress)
            end

            local delta = progress - data.lastProgress
            data.lastProgress = progress

            obj.X = obj.X + (data.destX - data.startX) * delta
            obj.Y = obj.Y + (data.destY - data.startY) * delta
            obj.alpha = (obj.alpha or data.startAlpha) + (data.endAlpha - data.startAlpha) * delta
        end
    end

    -- Finish
    if data.step >= data.steps then
        obj.X = data.destX
        obj.Y = data.destY
        obj.alpha = data.endAlpha

        data.timer:stop()
        data.timer:reset()
        obj.animData = nil

        return true
    end

    return false
end

-- combined doesn't work the way i need, maybe i'll get rid of it later
function Animate(obj, anim, dur, destX, destY, startAlpha, endAlpha)
    if obj.animData == nil then
        StartAnimation(obj, anim, dur, destX, destY, startAlpha, endAlpha)
    end
    return UpdateAnimation(obj)
end

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
-- That ^ didn't get me anywhere unfortunately, still waiting for the engine dev to respond to my issue on github :pray:


-- Thanks to Ex for this "pressed" button state
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