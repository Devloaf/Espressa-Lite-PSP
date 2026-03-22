P.Draw.Square = function(canv, index, cur, size, color)
	for i = 1, size do
		canv.Layer[index].Tex:fillRect(cur.X + cur.Hotspot.X, cur.Y + cur.Hotspot.Y, i, i, color)
	end
end