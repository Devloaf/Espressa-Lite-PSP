CreateCursor = {
	new = function()
		local o = {
			img = nil,
            Cursors = nil,
            X = nil,
            Y = nil,
            Hotspot = {
                X = nil,
                Y = nil
            },
            Color = {
                Main = nil,
                R = nil,
                G = nil,
                B = nil,

                SelX = nil,
                SelY = nil
            },
            W = nil,
            H = nil,
            SPD = nil, -- the more the value, the slower
            BrushSize = nil,
            Type = nil, -- Square or Circle
            AnalogHeldX = nil,
            AnalogHeldY = nil,
            PixelMoved = nil,
            img_Unlocker = nil,


            
            SetDefault = function(self)
                self.Cursors = {
                    Pencil = Image.load("Resources/ToolPack/"..Config.ToolPack.."/Pencil.png"),
                    Brush = Image.load("Resources/ToolPack/"..Config.ToolPack.."/Brush.png"),
                    Eraser = Image.load("Resources/ToolPack/"..Config.ToolPack.."/Eraser.png"),
                    Filling = Image.load("Resources/ToolPack/"..Config.ToolPack.."/Fill.png")
                }
                self.img = self.Cursors.Pencil
                self.img_Unlocker = Image.load("Resources/ToolPack/"..Config.ToolPack.."/Icon/Unlocker.png")
                self.X = 220
                self.Y = 150
                self.W = self.img:width()
                self.H = self.img:height()
                self.Hotspot.X = 0 - self.W / 2
                self.Hotspot.Y = 0 - self.H / 2
                self.Color.Main = Color.new(0, 0, 0)
                self.Color.R = 0
                self.Color.G = 0
                self.Color.B = 0
                self.Color.SelX = 1
                self.Color.SelY = 1
                self.SPD = 64 -- 64 - 96 - 128
                self.BrushSize = 7
                self.Type = "Circle"
                -- self.AnalogHeldX = false
                -- self.AnalogHeldY = false
                self.PixelMoved = false
			end,
            


            Draw = function(self, canvs, col)
                --local cx = self.X + self.Hotspot.X
                --local cy = self.Y + self.Hotspot.Y
                local cx = self.X
                local cy = self.Y
                if self.Type == "Circle" then
                    drawCircleOutlineDotted(screen, cx, cy, self.BrushSize, Color.new(0, 0, 0))
                    --drawCircleOutline(screen, cx, cy, self.BrushSize, col)
                    --drawCircleOutline(screen, cx, cy, self.BrushSize+1, Color.new(0, 0, 0))
                elseif self.Type == "Square" then
                    drawSquareOutlineDotted(screen, cx, cy, self.BrushSize, Color.new(0, 0, 0))
                    --drawSquareOutline(screen, cx, cy, self.BrushSize, col)
                    --drawSquareOutline(screen, cx, cy, self.BrushSize+2, Color.new(0, 0, 0))
                end


                if pad:l() then
                    --self:Draw(canvs, Color.new(255, 255, 255))
                    if self.Type == "Circle" then
                        drawFilledCircle(canvs, cx, cy, self.BrushSize, Color.new(255, 255, 255))
                        if pressed.l then self.img = self.Cursors.Brush end
                    elseif self.Type == "Square" then
                        drawFilledSquare(canvs, cx, cy, self.BrushSize, Color.new(255, 255, 255))
                        if pressed.l then self.img = self.Cursors.Pencil end
                    end

                    if pressed.l then
                        self.img = self.Cursors.Eraser
                    end
                elseif pad:r() then
                    if self.Type == "Circle" then
                        drawFilledCircle(canvs, cx, cy, self.BrushSize, col)
                        if pressed.r then self.img = self.Cursors.Brush end
                    elseif self.Type == "Square" then
                        drawFilledSquare(canvs, cx, cy, self.BrushSize, col)
                        if pressed.r then self.img = self.Cursors.Pencil end
                    end
                end
            end,



            Init = function(self, canvs, col)
                --screen:blit(self.X, self.Y, self.img)
                
                if pad:l() or pad:r() then
                    screen:drawLine(self.X, self.Y, self.X, self.Y, Color.new(0, 0, 0))
                else
                    screen:drawLine(self.X-2, self.Y, self.X+2, self.Y, Color.new(0, 0, 0))
                    screen:drawLine(self.X, self.Y-2, self.X, self.Y+2, Color.new(0, 0, 0))
                end
                
                self.Draw(self, canvs, col)

                if pressed.square then
                    if self.Type == "Square" then
                        self.Type = "Circle"
                    elseif self.Type == "Circle" then
                        self.Type = "Square"
                    end
                end


                if pressed.cross then
                    if self.SPD == 64 then
                        self.SPD = 192
                    elseif self.SPD == 192 then
                        self.SPD = 256
                    elseif self.SPD == 256 then
                        self.SPD = 384
                    elseif self.SPD == 384 then
                        self.SPD = "PixelMove"
                        self.PixelMoved = true
                    elseif self.SPD == "PixelMove" then
                        self.SPD = 64
                        self.PixelMoved = false
                    end
                end
                

                local threshold = 32
                local dx = pad:analogX()
                local dy = pad:analogY()

                -- =====================
                -- PIXEL MOVE MODE
                -- =====================
                if self.SPD == "PixelMove" then

                    -- X AXIS
                    if math.abs(dx) > threshold then
                        if not self.AnalogHeldX then
                            if dx > 0 then
                                self.X = self.X + 1
                            else
                                self.X = self.X - 1
                            end
                            self.AnalogHeldX = true
                        end
                    else
                        self.AnalogHeldX = false
                    end
                    
                    if self.SPD == "PixelMove" and not pad:circle() then
                        if pressed.right then self.X = self.X + 1 end
                        if pressed.left then self.X = self.X - 1 end
                    end

                    -- Y AXIS
                    if math.abs(dy) > threshold then
                        if not self.AnalogHeldY then
                            if dy > 0 then
                                self.Y = self.Y + 1
                            else
                                self.Y = self.Y - 1
                            end
                            self.AnalogHeldY = true
                        end
                    else
                        self.AnalogHeldY = false
                    end

                    if self.SPD == "PixelMove" and not pad:circle() then
                        if pressed.down then self.Y = self.Y + 1 end
                        if pressed.up then self.Y = self.Y - 1 end
                    end

                -- =====================
                -- NORMAL ANALOG MODE
                -- =====================
                else

                    -- X movement
                    if math.abs(dx) > threshold then
                        self.X = self.X + dx / self.SPD
                    end

                    -- Y movement
                    if math.abs(dy) > threshold then
                        self.Y = self.Y + dy / self.SPD
                    end

                end
            
                if self.X > SYSTEM.SCREEN_WIDTH then self.X = SYSTEM.SCREEN_WIDTH end
                if self.X < 0 then self.X = 0 end

                if self.Y > SYSTEM.SCREEN_HEIGHT then self.Y = SYSTEM.SCREEN_HEIGHT end
                if self.Y < 0 then self.Y = 0 end

                if Me.Cursor.SPD ~= "PixelMove" or Me.Cursor.SPD == "PixelMove" and pad:circle() then
                    if pressed.up then
                        if self.BrushSize < 50 then self.BrushSize = self.BrushSize + 1 else self.BrushSize = 1 end
                    elseif pressed.down then
                        if self.BrushSize > 1 then self.BrushSize = self.BrushSize - 1 else self.BrushSize = 50 end
                    end
                end

            end,

        }
		return o
	end
}