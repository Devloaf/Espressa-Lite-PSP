CreateCanvas = {
	new = function()
		local o = {
            X = nil,
            Y = nil,
            W = nil,
            H = nil,
            BlitTransparent = nil,
            TransparentLayer = {},
            TransparentLayerSize = nil,
            Layer = {},

            SetDefault = function(self)
                self.X = 0
                self.Y = 0
                self.W = SYSTEM.SCREEN_WIDTH
                self.H = SYSTEM.SCREEN_HEIGHT
                self.Layer[1] = Image.createEmpty(self.W, self.H)
                self.Layer[1]:fillRect(0, 0, SYSTEM.SCREEN_WIDTH, SYSTEM.SCREEN_HEIGHT, Color.new(255, 255, 255))
                self.TransparentLayer = Image.createEmpty(SYSTEM.SCREEN_WIDTH, SYSTEM.SCREEN_HEIGHT)
                self.TransparentLayerSize = 10
                self.BlitTransparent = false
                for j = 0, 27 do          -- 9 rows
                    for i = 0, 47 do     -- 16 columns

                        local x = i * self.TransparentLayerSize
                        local y = j * self.TransparentLayerSize

                        local color
                        if (i + j) % 2 == 0 then
                            color = Color.new(130, 130, 130)   -- dark grey
                        else
                            color = Color.new(185, 185, 185)   -- light grey
                        end

                        self.TransparentLayer:fillRect(x, y, self.TransparentLayerSize, self.TransparentLayerSize, color)
                    end
                end
            end,

            SetTransparentLayerDefaults = function(self)

                self.X = self.X --480 * (1-(self.W * 100 / 480 / 100))
                self.Y = self.Y --272 * (1-(self.H * 100 / 480 / 100))
                if (Me.Canvas.W < 480 and Me.Canvas.W >= 1) or (Me.Canvas.H < 272 and Me.Canvas.H >= 1) then
                    self.BlitTransparent = true
                end
            end,

            InitDraw = function(self)
                
                
                screen:blit(self.X, self.Y, self.Layer[1])

            end,


        }
		return o
	end
}