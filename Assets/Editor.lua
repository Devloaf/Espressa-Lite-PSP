--[[

	Editor
	----------------------------------
	Connects up every class and activates them.
	Main Script, provides drawing state.
	
	Create Date: 2020.06.07
	Last Edit: 2026.05.01

--]]

exit = false

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

dofile("Classes/CursorClass.lua")
dofile("Classes/PaletteClass.lua")

function CurSetColor(cur, sel)
	cur.Color.Main = Me.Palette.CurPal[1][sel].c
end

Me = {
	Cursor = CreateCursor:new(),
	Palette = CreatePalette:new()
}

Me.Cursor:SetDefault()
Me.Palette:SetDefault()

Canvas = Image.createEmpty(SYSTEM.SCREEN_WIDTH, SYSTEM.SCREEN_HEIGHT)
Canvas:fillRect(0, 0, SYSTEM.SCREEN_WIDTH, SYSTEM.SCREEN_HEIGHT, Color.new(255, 255, 255))

colselect = 1
CurSetColor(Me.Cursor, colselect)

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
		screen:print(5, 5, "b"..CONST.Build.." FPS: "..FPS, Color.new(0, 0, 0))
		screen:print(5, 20, "Col: "..colselect..", Size: "..Me.Cursor.BrushSize..", SPD: "..Me.Cursor.SPD, Color.new(0, 0, 0))
		screen:print(5, 35, "Mov: "..Bool(Me.Cursor.Moving)..", PxlMov: "..Bool(Me.Cursor.PixelMoved), Color.new(0, 0, 0))
		--screen:print(5, 50, "Pal X: "..Me.Palette.X..", Y: "..Me.Palette.Y, Color.new(0, 0, 0))
		--screen:print(5, 65, " ", Color.new(0, 0, 0))
	end
	
	Me.Palette:InitDraw(colselect)
	if Me.Palette.Timer:time() > 0 then
		-- used to display here but it stops displaying colpal once the timer is off and you see no animation, fix later, add some timer space for StartAnimation()
		if Me.Palette.Timer:time() >= 750 then
			Me.Palette.Timer:stop()
			Me.Palette.Timer:reset()
			StartAnimation(Me.Palette, "Ease In", 350, Me.Palette.X2, Me.Palette.Y2)
		end
	end

	UpdateAnimation(Me.Palette)
	
	if pressed.right or pressed.left then
		Me.Palette.Timer:reset()
		Me.Palette.Timer:start()
		StartAnimation(Me.Palette, "Ease Out", 350, Me.Palette.X1, Me.Palette.Y1)
		if pressed.right then
			if colselect < 18 then colselect = colselect + 1 else colselect = 1 end
		elseif pressed.left then
			if colselect > 1 then colselect = colselect - 1 else colselect = 18 end
		end
		CurSetColor(Me.Cursor, colselect)
	end

	if pressed.up then
		if Me.Cursor.BrushSize < 50 then Me.Cursor.BrushSize = Me.Cursor.BrushSize + 1 else Me.Cursor.BrushSize = 1 end
	elseif pressed.down then
		if Me.Cursor.BrushSize > 1 then Me.Cursor.BrushSize = Me.Cursor.BrushSize - 1 else Me.Cursor.BrushSize = 50 end
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

	screen.flip()
	screen.waitVblankStart()
end