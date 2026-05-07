CreatePalette = {
	new = function()
		local o = {
            X = nil,
            Y = nil,
            X1 = nil,
            Y1 = nil,
            X2 = nil,
            Y2 = nil,
            ColBox = nil,
            HotbarImg = nil,
            SelectionImg = nil,
            ColBoxSize = nil,
            ColBoxCurCol = nil,
            CurPal = nil,
            colname = nil,
            Timer = nil,

            SetDefault = function(self)
                self.X1 = 0
                self.Y1 = 192
                self.X2 = 0
                self.Y2 = 272
                self.X = 0
                self.Y = 192
                self.ColBoxSize = 22
                self.ColBoxCurCol = Image.createEmpty(self.ColBoxSize, self.ColBoxSize)
                self.HotbarImg = Image.load("Resources/Style/"..Config.Theme.."/ColorPalette/ColPal.png")
                self.SelectionImg = Image.load("Resources/Style/"..Config.Theme.."/ColorPalette/ColPalSel.png")
                self.Timer = Timer.new()
                self.colname = "A"
                self.CurPal = {}
                for i = 1, 1 do
                    self.CurPal[i] = {}
                    for j = 1, 18 do
                        self.CurPal[i][j] = { n = "DEBUG_COL", c = Color.new(255, 155, 170) }
                    end
                end
                dofile("Data/ColorPaletteDefault.cfg")
                LoadPal(self)

                for i = 1, 18 do
                    self.HotbarImg:fillRect(25+( (i-1)*24), 44, self.ColBoxSize, self.ColBoxSize, self.CurPal[1][i].c)
                end
                --self.HotbarImg:save("hotbar.png") -- Testing if all the squares have been printed into one picture with the hotbar
            end,

            InitDraw = function(self, sel)
                
                screen:blit(self.X, self.Y, self.HotbarImg)
                screen:print(self.X + 45, self.Y + 23, self.CurPal[1][sel].n, Color.new(0, 0, 0))
                screen:blit(self.X + 24 + ((sel-1)*(self.ColBoxSize+2)), self.Y + 43, self.SelectionImg)

            end,


        }
		return o
	end
}