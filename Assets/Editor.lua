--[[

	Editor File for Espressa Lite PSP a0.2
	----------------------------------
	Connects up every class and activates them.
	Main Script, provides drawing state.
	
	Create Date: 2020.06.07
	Last Edit: 2026.03.30

--]]

exit = false

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

dofile("Classes/CursorClass.lua")

function CurSetColor(cur, sel)
	if sel == 1 then
		cur.Color.R = 255
		cur.Color.G = 0
		cur.Color.B = 0
	elseif sel == 2 then
		cur.Color.R = 0
		cur.Color.G = 255
		cur.Color.B = 0
	elseif sel == 3 then
		cur.Color.R = 0
		cur.Color.G = 0
		cur.Color.B = 255
	elseif sel == 4 then
		cur.Color.R = 255
		cur.Color.G = 255
		cur.Color.B = 0
	elseif sel == 5 then
		cur.Color.R = 0
		cur.Color.G = 255
		cur.Color.B = 255
	elseif sel == 6 then
		cur.Color.R = 255
		cur.Color.G = 0
		cur.Color.B = 255
	elseif sel == 7 then -- rgb(204, 170, 255)
		cur.Color.R = 204
		cur.Color.G = 170
		cur.Color.B = 255
	elseif sel == 8 then -- rgb(170, 60, 255)
		cur.Color.R = 170
		cur.Color.G = 60
		cur.Color.B = 255
	elseif sel == 9 then -- rgb(130, 60, 0)
		cur.Color.R = 130
		cur.Color.G = 60
		cur.Color.B = 0
	elseif sel == 10 then -- rgb(255, 110, 0)
		cur.Color.R = 255
		cur.Color.G = 110
		cur.Color.B = 0
	elseif sel == 11 then -- rgb(240, 200, 185)
		cur.Color.R = 240
		cur.Color.G = 200
		cur.Color.B = 185
	elseif sel == 12 then -- rgb(20, 20, 60)
		cur.Color.R = 20
		cur.Color.G = 20
		cur.Color.B = 60
	elseif sel == 13 then -- rgb(0, 0, 0)
		cur.Color.R = 0
		cur.Color.G = 0
		cur.Color.B = 0
	elseif sel == 14 then -- rgb(95, 95, 95)
		cur.Color.R = 95
		cur.Color.G = 95
		cur.Color.B = 95
	elseif sel == 15 then -- rgb(180, 180, 180)
		cur.Color.R = 180
		cur.Color.G = 180
		cur.Color.B = 180
	end
	cur.Color.Main = Color.new(cur.Color.R, cur.Color.G, cur.Color.B)
end

Me = {
	Cursor = Cursor:new() -- first class implementation, wow!
}
Me.Cursor:SetDefault()

Canvas = Image.createEmpty(SYSTEM.SCREEN_WIDTH, SYSTEM.SCREEN_HEIGHT)
Canvas:fillRect(0, 0, SYSTEM.SCREEN_WIDTH, SYSTEM.SCREEN_HEIGHT, Color.new(255, 255, 255))

colselect = 1
CurSetColor(Me.Cursor, colselect)

ColPal = {
	Pal = Image.createEmpty(25, 25),
	X = 440,
	Y = 232,
	Pos = "Right-Down", -- "Right-Down", "Left-Down", "Right-Up", "Left-Up"
	ColBox = 60, -- 60 pixels of cursor collide area
	PosXY = {
		RightDownX1 = SYSTEM.SCREEN_WIDTH-25-15,
		RightDownY1 = SYSTEM.SCREEN_HEIGHT-25-15,
		RightDownX2 = SYSTEM.SCREEN_WIDTH+5,
		RightDownY2 = 232,

		LeftDownX1 = 0+15,
		LeftDownY1 = SYSTEM.SCREEN_HEIGHT-25-15,
		LeftDownX2 = 0-15-25,
		LeftDownY2 = SYSTEM.SCREEN_HEIGHT-25-15,

		RightUpX1 = 0,
		RightUpY1 = 0,
		RightUpX2 = 0,
		RightUpY2 = 0,

		LeftUpX1 = 0,
		LeftUpY1 = 0,
		LeftUpX2 = 0,
		LeftUpY2 = 0,
	},
	X1 = SYSTEM.SCREEN_WIDTH-25-15, -- Show X Position of the Palette (440)
	Y1 = SYSTEM.SCREEN_HEIGHT-25-15, -- Show Y Position of the Palette (232)
	X2 = SYSTEM.SCREEN_WIDTH+5, -- Hidden X Position of the Palette
	Y2 = 232, -- Hidden Y Position of the Palette
	Timer = Timer.new()
}
ColPal.Pal:fillRect(0, 0, 25, 25, Me.Cursor.Color.Main)

ColPalPan = Image.createEmpty(33, 33)
ColPalPan:fillRect(0, 0, 33, 33, Color.new(90, 90, 90))
ColPalPan:DrawAlpha(ColPal.X, ColPal.Y, Color.new(90, 90, 90), Color.new(255, 255, 255)) -- idk tf it does but it does something but i don't think it does what i need it to do so i dunnu :(

ColPalCheckCol = function(cur, cpal)
	if cpal.Pos == "Right-Down" then
		if cur.X > SYSTEM.SCREEN_WIDTH - cpal.ColBox and cur.Y > SYSTEM.SCREEN_HEIGHT - cpal.ColBox then
			cpal.Pos = "Left-Down"
			cpal.X1 = cpal.PosXY.LeftDownX1
			cpal.Y1 = cpal.PosXY.LeftDownY1
			cpal.X2 = cpal.PosXY.LeftDownX2
			cpal.Y2 = cpal.PosXY.LeftDownY2
			cpal.X = cpal.X1
			cpal.Y = cpal.Y1
			if cpal.animData ~= nil then cpal.animData.destX = cpal.X2 end
			if cpal.animData ~= nil then cpal.animData.destY = cpal.Y2 end
		end
	elseif cpal.Pos == "Left-Down" then
        if cur.X < 0 + cpal.ColBox and cur.Y > SYSTEM.SCREEN_HEIGHT - cpal.ColBox then
			cpal.Pos = "Right-Down"
			cpal.X1 = cpal.PosXY.RightDownX1
			cpal.Y1 = cpal.PosXY.RightDownY1
			cpal.X2 = cpal.PosXY.RightDownX2
			cpal.Y2 = cpal.PosXY.RightDownY2
			cpal.X = cpal.X1
			cpal.Y = cpal.Y1
			if cpal.animData ~= nil then cpal.animData.destX = cpal.X2 end
			if cpal.animData ~= nil then cpal.animData.destY = cpal.Y2 end
		end
	end
	
end

DEBUG = false
FPS = 0
Tick = 0
FPSTimer = Timer.new()
FPSTimer:start()

while true do
	checkPad()

	if FPSTimer:time() >= 1000 then
		FPSTimer:reset()
		FPS = Tick
		Tick = 0
	end
	Tick = Tick + 1

	screen:clear(Color.new(0,0,0))
	screen:blit(0, 0, Canvas)
	
	if DEBUG then
		screen:print(5, 5, "FPS: "..FPS, Color.new(0, 0, 0))
		screen:print(5, 20, "PalX "..ColPal.X, Color.new(0, 0, 0))
		screen:print(5, 35, "PalY "..ColPal.Y, Color.new(0, 0, 0))
		screen:print(5, 50, "PalPos "..ColPal.Pos, Color.new(0, 0, 0))
		screen:print(5, 65, "Brush "..Me.Cursor.BrushSize, Color.new(0, 0, 0))
		
	end
	
	screen:blit(ColPal.X-4, ColPal.Y-4, ColPalPan)
	screen:blit(ColPal.X, ColPal.Y, ColPal.Pal)
	if ColPal.Timer:time() > 0 then
		-- used to display here but it stops displaying colpal once the timer is off and you see no animation, fix later, add some timer space for StartAnimation()
		if ColPal.Timer:time() >= 750 then
			ColPal.Timer:stop()
			ColPal.Timer:reset()
			StartAnimation(ColPal, "Ease In-Out", 350, ColPal.X2, ColPal.Y2)
		end
	end

	ColPalCheckCol(Me.Cursor, ColPal)
	UpdateAnimation(ColPal)
	
	if pressed.right or pressed.left then
		ColPal.Timer:reset()
		ColPal.Timer:start()
		StartAnimation(ColPal, "Ease In-Out", 350, ColPal.X1, ColPal.Y1)
		if pressed.right then
			if colselect < 15 then colselect = colselect + 1 else colselect = 1 end
		elseif pressed.left then
			if colselect > 1 then colselect = colselect - 1 else colselect = 15 end
		end
		CurSetColor(Me.Cursor, colselect)
		ColPal.Pal:fillRect(0, 0, 25, 25, Me.Cursor.Color.Main)
	end

	if pressed.up then
		if Me.Cursor.BrushSize < 7 then Me.Cursor.BrushSize = Me.Cursor.BrushSize + 1 else Me.Cursor.BrushSize = 1 end
	elseif pressed.down then
		if Me.Cursor.BrushSize > 1 then Me.Cursor.BrushSize = Me.Cursor.BrushSize - 1 else Me.Cursor.BrushSize = 7 end
	end
	
	Me.Cursor:Init(Canvas, Me.Cursor.Color.Main)
	
	if pad:select() then
		if DEBUG then
			screen:save("Workspace/"..CONST.CurDateFULLPLAIN.."_"..getTimeStr_HH_MM_SS()..".png")
		else
			Canvas:save("Workspace/"..CONST.CurDateFULLPLAIN.."_"..getTimeStr_HH_MM_SS()..".png")
		end
	end
	
	if pad:start() then exit = true end
	if exit then break end
	if pressed.triangle and DEBUG then DEBUG = false elseif pressed.triangle and DEBUG == false then DEBUG = true end
	-- sometimes you just don't question

	screen.flip()
	screen.waitVblankStart()
end