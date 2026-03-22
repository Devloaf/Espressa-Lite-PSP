--[[

	Editor File for Espressa Lite PSP 0.1
	----------------------------------
	Connects up every class and activates them.
	Main Script, provides drawing state.
	
	Create Date: 2020.06.07
	Last Edit: 2026.03.22

--]]

exit = false

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

-- will be a class later...
Cursor = {
	img = nil,
	X = nil,
	Y = nil,
	Hotspot = {
		X = 0,
		Y = 0
	},
	Color = {
		Main = Color.new(0, 0, 0),
		R = 0,
		G = 0,
		B = 0
	},
	W = nil,
	H = nil,
	SPD = 48
}

-- don't shame me for this please, it is the first version, i'll clean up the mess i promise
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
	elseif sel == 12 then -- rgb(45, 20, 75)
		cur.Color.R = 45
		cur.Color.G = 20
		cur.Color.B = 75
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

Cursor.img = Image.load("Resources/ToolPack/"..Config.ToolPack.."/Pencil.png")
Cursor.X = 220
Cursor.Y = 150
Cursor.W = Cursor.img:width()
Cursor.H = Cursor.img:height()
Cursor.Hotspot.X = Cursor.Hotspot.X - Cursor.W / 2
Cursor.Hotspot.Y = Cursor.Hotspot.Y - Cursor.H / 2

-- only one brush type? are you serious??!?!???!
function Draw(cur, color)
	Canvas:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, cur.X + 1 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
	Canvas:drawLine(cur.X + 2 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 2 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
	Canvas:drawLine(cur.X + 3 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 3 + cur.Hotspot.X, cur.Y + 11 + cur.Hotspot.Y, color)
	
	Canvas:fillRect(cur.X + 4 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, 2, 11, color)
	Canvas:fillRect(cur.X + 6 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, 3, 13, color)
	Canvas:fillRect(cur.X + 9 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, 2, 11, color)
	
	Canvas:drawLine(cur.X + 11 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 11 + cur.Hotspot.X, cur.Y + 11 + cur.Hotspot.Y, color)
	Canvas:drawLine(cur.X + 12 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 12 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
	Canvas:drawLine(cur.X + 13 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, cur.X + 13 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
end

Canvas = Image.createEmpty(480, 272)
Canvas:fillRect(0, 0, 480, 272, Color.new(255, 255, 255))

colselect = 1
CurSetColor(Cursor, colselect)

ColorPalette = Image.createEmpty(25, 25)
ColorPalette:fillRect(0, 0, 25, 25, Cursor.Color.Main)
ColorPaletteTimer = Timer.new()

while true do
	checkPad()

	screen:clear(Color.new(0,0,0))
	screen:blit(0, 0, Canvas)
	
	--screen:print(5, 5, "color = "..colselect, Color.new(0, 0, 0))
	--screen:print(5, 25, "a", Color.new(0, 0, 0))
	--screen:print(5, 45, "a", Color.new(0, 0, 0))
	--screen:print(5, 65, "a", Color.new(0, 0, 0))

	-- Time output debug (to check if i'm not delusional about the date)
	--time = os.time()
	--dateString = os.date("%c", time)
	--screen:print(5, 25, dateString, Color.new(0,0,0))

	if ColorPaletteTimer:time() > 0 then
		screen:blit(480-25-15, 272-25-15, ColorPalette)
		if ColorPaletteTimer:time() >= 750 then
			ColorPaletteTimer:stop()
			ColorPaletteTimer:reset()
		end
	end
	
	if pressed.right or pressed.left then
		ColorPaletteTimer:reset()
		ColorPaletteTimer:start()
		if pressed.right then
			if colselect < 15 then
				colselect = colselect + 1
			else
				colselect = 1
			end
		end
		if pressed.left then
			if colselect > 1 then
				colselect = colselect - 1
			else
				colselect = 15
			end
		end
		CurSetColor(Cursor, colselect)
		ColorPalette:fillRect(0, 0, 25, 25, Cursor.Color.Main)
	end

	

	screen:blit(Cursor.X, Cursor.Y, Cursor.img)
	if pad:select() then
		Canvas:save("Workspace/"..getDateStr_YYYY_MM_DD().."_"..getTimeStr_HH_MM_SS()..".png")
	end

	

	dx = pad:analogX()
	if math.abs(dx) > 32 then
		if Cursor.X > 480 then Cursor.X = 480 elseif Cursor.X < 0 then Cursor.X = 0
		else
			Cursor.X = Cursor.X + dx / Cursor.SPD
		end
	end
	dy = pad:analogY()
	if math.abs(dy) > 32 then
		if Cursor.Y > 272 then Cursor.Y = 272 elseif Cursor.Y < 0 then Cursor.Y = 0
		else
			Cursor.Y = Cursor.Y + dy / Cursor.SPD
		end
	end

	if pad:l() then
		Draw(Cursor, Color.new(255, 255, 255))
		-- you thought it was an eraser? and it was just painting white :pensive:
	elseif pad:r() then
		Draw(Cursor, Cursor.Color.Main)
	end
	
	if pad:start() then exit = true end
	if exit then break end
	-- sometimes you just don't question

	screen.flip()
	screen.waitVblankStart()
end