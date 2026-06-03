--[[

	Editor
	----------------------------------
	Connects up every class and activates them.
	Main Script, provides drawing state.
	
	Create Date: 2020.06.07
	Last Edit: 2026.05.23

--]]

exit = false

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------

dofile("Classes/CursorClass.lua")
dofile("Classes/PaletteClass.lua")
dofile("Classes/CanvasClass.lua")

Me = {
	Cursor = CreateCursor:new(),
	Palette = CreatePalette:new(),
	Canvas = CreateCanvas:new()
}

Me.Cursor:SetDefault()
Me.Palette:SetDefault()
Me.Canvas:SetDefault()
Me.Canvas.W = CanvasWidth
Me.Canvas.H = CanvasHeight
Me.Canvas.Layer[1] = Image.createEmpty(Me.Canvas.W, Me.Canvas.H)
Me.Canvas.Layer[1]:fillRect(0, 0, CanvasWidth, CanvasHeight, Color.new(255, 255, 255))
Me.Canvas:SetTransparentLayerDefaults()

-- colselect = 1
Me.Cursor.Color.Main = Me.Palette.CurPal[1][Me.Cursor.Color.SelX].c

maxcolors = 0
for i, v in pairs(Me.Palette.CurPal[1] or {}) do
	if type(i) == "number" and type(v) == "table" and v.c ~= nil then
		if i > maxcolors then
			maxcolors = i
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
	if Me.Canvas.BlitTransparent then
		screen:blit(0, 0, Me.Canvas.TransparentLayer)
	end
	Me.Canvas:InitDraw()
	
	if DEBUG then
		screen:print(5, 5, "b"..CONST.Build.." FPS: "..FPS, Color.new(0, 0, 0))
		screen:print(5, 20, "Size: "..Me.Cursor.BrushSize..", SPD: "..Me.Cursor.SPD, Color.new(0, 0, 0))
		--screen:print(5, 35, "", Color.new(0, 0, 0))
		--screen:print(5, 50, "CanW: "..Me.Canvas.W.." CanH: "..Me.Canvas.H, Color.new(0, 0, 0))
		--screen:print(5, 65, " ", Color.new(0, 0, 0))
	end
	
	Me.Palette:InitDraw(Me.Cursor.Color.SelX)
	if Me.Palette.Timer:time() > 0 then
		-- used to display here but it stops displaying colpal once the timer is off and you see no animation, fix later, add some timer space for StartAnimation()
		if Me.Palette.Timer:time() >= 750 then
			Me.Palette.Timer:stop()
			Me.Palette.Timer:reset()
			StartAnimation(Me.Palette, "Ease In", 350, Me.Palette.X2, Me.Palette.Y2)
		end
	end

	UpdateAnimation(Me.Palette)
	
	if Me.Cursor.SPD == "PixelMove" and pad:circle() then
		screen:blit(464, 0, Me.Cursor.img_Unlocker)
	end

	-- Changing color Quick
	if Me.Cursor.SPD ~= "PixelMove" or Me.Cursor.SPD == "PixelMove" and pad:circle() then
		if pressed.right or pressed.left then
			Me.Palette.Timer:reset()
			Me.Palette.Timer:start()
			StartAnimation(Me.Palette, "Ease Out", 350, Me.Palette.X1, Me.Palette.Y1)
			if pressed.right then
				if Me.Cursor.Color.SelX < maxcolors then Me.Cursor.Color.SelX = Me.Cursor.Color.SelX + 1 else Me.Cursor.Color.SelX = 1 end
			elseif pressed.left then
				if Me.Cursor.Color.SelX > 1 then Me.Cursor.Color.SelX = Me.Cursor.Color.SelX - 1 else Me.Cursor.Color.SelX = maxcolors end
			end
			Me.Cursor.Color.Main = Me.Palette.CurPal[1][Me.Cursor.Color.SelX].c
		end
	end
	
	Me.Cursor:Init(Me.Canvas.Layer[1], Me.Cursor.Color.Main)
	
	if pad:select() then
		if DEBUG then
			screen:save("Workspace/"..CONST.CurDateFULLPLAIN.."_"..getTimeStr_HH_MM_SS()..".png")
		else
			Me.Canvas.Layer[1]:save("Workspace/"..CONST.CurDateFULLPLAIN.."_"..getTimeStr_HH_MM_SS()..".png")
		end
	end
	
	if pad:start() then exit = true end
	if exit then break end
	if pressed.triangle and DEBUG then DEBUG = false elseif pressed.triangle and DEBUG == false then DEBUG = true end

	screen.flip()
	screen.waitVblankStart()
end