Cursor = {
	new = function()
		local o = {
			img = nil,
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
                B = nil
            },
            W = nil,
            H = nil,
            SPD = nil, -- the more the value, the slower
            BrushSize = nil,


            
            SetDefault = function(self)
				self.img = Image.load("Resources/ToolPack/"..Config.ToolPack.."/Pencil.png")
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
                self.SPD = 48
                self.BrushSize = 7
			end,
            


            Draw = function(self, canvs, col)
                if self.BrushSize == 1 then
                    canvs:drawLine(self.X + 2 + self.Hotspot.X, self.Y + 1 + self.Hotspot.Y, self.X + 2 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, col)
		            canvs:drawLine(self.X + 1 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 3 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, col)
                elseif self.BrushSize == 2 then
                    canvs:fillRect(self.X + 2 + self.Hotspot.X, self.Y + 1 + self.Hotspot.Y, 3, 5, col)
		            canvs:drawLine(self.X + 1 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 1 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, col)
		            canvs:drawLine(self.X + 5 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 5 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, col)
                elseif self.BrushSize == 3 then
                    canvs:drawLine(self.X + 1 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 1 + self.Hotspot.X, self.Y + 5 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 2 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 2 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, col)
                    
                    canvs:fillRect(self.X + 3 + self.Hotspot.X, self.Y + 1 + self.Hotspot.Y, 3, 7, col)
                    
                    canvs:drawLine(self.X + 6 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 6 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 7 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 7 + self.Hotspot.X, self.Y + 5 + self.Hotspot.Y, col)
                elseif self.BrushSize == 4 then
                    canvs:drawLine(self.X + 1 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 1 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 2 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 2 + self.Hotspot.X, self.Y + 7 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 3 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 3 + self.Hotspot.X, self.Y + 8 + self.Hotspot.Y, col)
                    
                    canvs:fillRect(self.X + 4 + self.Hotspot.X, self.Y + 1 + self.Hotspot.Y, 3, 9, col)
                    
                    canvs:drawLine(self.X + 7 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 7 + self.Hotspot.X, self.Y + 8 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 8 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 8 + self.Hotspot.X, self.Y + 7 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 9 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 9 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, col)
                elseif self.BrushSize == 5 then
                    canvs:drawLine(self.X + 1 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 1 + self.Hotspot.X, self.Y + 8 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 2 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 2 + self.Hotspot.X, self.Y + 9 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 3 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 3 + self.Hotspot.X, self.Y + 10 + self.Hotspot.Y, col)
                    
                    canvs:fillRect(self.X + 4 + self.Hotspot.X, self.Y + 1 + self.Hotspot.Y, 5, 11, col)
                    
                    canvs:drawLine(self.X + 9 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, self.X + 9 + self.Hotspot.X, self.Y + 10 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 10 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 10 + self.Hotspot.X, self.Y + 9 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 11 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 11 + self.Hotspot.X, self.Y + 8 + self.Hotspot.Y, col)
                elseif self.BrushSize == 6 then
                    canvs:drawLine(self.X + 1 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, self.X + 1 + self.Hotspot.X, self.Y + 8 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 2 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 2 + self.Hotspot.X, self.Y + 10 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 3 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 3 + self.Hotspot.X, self.Y + 11 + self.Hotspot.Y, col)
                    
                    canvs:fillRect(self.X + 4 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, 2, 11, col)
                    canvs:fillRect(self.X + 6 + self.Hotspot.X, self.Y + 1 + self.Hotspot.Y, 3, 13, col)
                    canvs:fillRect(self.X + 9 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, 2, 11, col)
                    
                    canvs:drawLine(self.X + 11 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 11 + self.Hotspot.X, self.Y + 11 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 12 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 12 + self.Hotspot.X, self.Y + 10 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 13 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, self.X + 13 + self.Hotspot.X, self.Y + 8 + self.Hotspot.Y, col)
                elseif self.BrushSize == 7 then
                    canvs:drawLine(self.X + 1 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, self.X + 1 + self.Hotspot.X, self.Y + 10 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 2 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 2 + self.Hotspot.X, self.Y + 12 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 3 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 3 + self.Hotspot.X, self.Y + 13 + self.Hotspot.Y, col)
                    
                    canvs:fillRect(self.X + 4 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, 2, 13, col)
                    canvs:fillRect(self.X + 6 + self.Hotspot.X, self.Y + 1 + self.Hotspot.Y, 5, 15, col)
                    canvs:fillRect(self.X + 11 + self.Hotspot.X, self.Y + 2 + self.Hotspot.Y, 2, 13, col)
                    
                    canvs:drawLine(self.X + 13 + self.Hotspot.X, self.Y + 3 + self.Hotspot.Y, self.X + 13 + self.Hotspot.X, self.Y + 13 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 14 + self.Hotspot.X, self.Y + 4 + self.Hotspot.Y, self.X + 14 + self.Hotspot.X, self.Y + 12 + self.Hotspot.Y, col)
                    canvs:drawLine(self.X + 15 + self.Hotspot.X, self.Y + 6 + self.Hotspot.Y, self.X + 15 + self.Hotspot.X, self.Y + 10 + self.Hotspot.Y, col)
                end
            end,



            Init = function(self, canvs, col)
                screen:blit(self.X, self.Y, self.img)
                
                if pad:l() then
                    self:Draw(canvs, Color.new(255, 255, 255))
                elseif pad:r() then
                    self:Draw(canvs, col)
                end

                dx = pad:analogX()
                if math.abs(dx) > 32 then
                    if self.X > SYSTEM.SCREEN_WIDTH then self.X = SYSTEM.SCREEN_WIDTH elseif self.X < 0 then self.X = 0
                    else
                        self.X = self.X + dx / self.SPD
                    end
                end
                dy = pad:analogY()
                if math.abs(dy) > 32 then
                    if self.Y > SYSTEM.SCREEN_HEIGHT then self.Y = SYSTEM.SCREEN_HEIGHT elseif self.Y < 0 then self.Y = 0
                    else
                        self.Y = self.Y + dy / self.SPD
                    end
                end
            end,









        }
		return o
	end
}