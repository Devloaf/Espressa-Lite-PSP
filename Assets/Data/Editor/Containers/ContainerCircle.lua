P.Draw.Circle = function(canv, index, cur, sel, color)
	
	
	
	if sel == 1 then
		canv.Layer[index].Tex:drawLine(cur.X + 2 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, cur.X + 2 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 3 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, color)
	
	
	
	elseif sel == 2 then
		canv.Layer[index].Tex:fillRect(cur.X + 2 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, 3, 5, color)
		canv.Layer[index].Tex:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 1 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 5 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 5 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, color)
	
	
	
	elseif sel == 3 then
		canv.Layer[index].Tex:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 1 + cur.Hotspot.X, cur.Y + 5 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 2 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 2 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, color)
		
		canv.Layer[index].Tex:fillRect(cur.X + 3 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, 3, 7, color)
		
		canv.Layer[index].Tex:drawLine(cur.X + 6 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 6 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 7 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 7 + cur.Hotspot.X, cur.Y + 5 + cur.Hotspot.Y, color)
	
	
	
	elseif sel == 4 then
		canv.Layer[index].Tex:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 1 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 2 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 2 + cur.Hotspot.X, cur.Y + 7 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 3 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 3 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
		
		canv.Layer[index].Tex:fillRect(cur.X + 4 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, 3, 9, color)
		
		canv.Layer[index].Tex:drawLine(cur.X + 7 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 7 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 8 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 8 + cur.Hotspot.X, cur.Y + 7 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 9 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 9 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, color)
	
	
	
	elseif sel == 5 then
		canv.Layer[index].Tex:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 1 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 2 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 2 + cur.Hotspot.X, cur.Y + 9 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 3 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 3 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
		
		canv.Layer[index].Tex:fillRect(cur.X + 4 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, 5, 11, color)
		
		canv.Layer[index].Tex:drawLine(cur.X + 9 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, cur.X + 9 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 10 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 10 + cur.Hotspot.X, cur.Y + 9 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 11 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 11 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
	
	
	
	elseif sel == 6 then
		canv.Layer[index].Tex:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, cur.X + 1 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 2 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 2 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 3 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 3 + cur.Hotspot.X, cur.Y + 11 + cur.Hotspot.Y, color)
		
		canv.Layer[index].Tex:fillRect(cur.X + 4 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, 2, 11, color)
		canv.Layer[index].Tex:fillRect(cur.X + 6 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, 3, 13, color)
		canv.Layer[index].Tex:fillRect(cur.X + 9 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, 2, 11, color)
		
		canv.Layer[index].Tex:drawLine(cur.X + 11 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 11 + cur.Hotspot.X, cur.Y + 11 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 12 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 12 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 13 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, cur.X + 13 + cur.Hotspot.X, cur.Y + 8 + cur.Hotspot.Y, color)
	
	
	
	elseif sel == 7 then
		canv.Layer[index].Tex:drawLine(cur.X + 1 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, cur.X + 1 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 2 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 2 + cur.Hotspot.X, cur.Y + 12 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 3 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 3 + cur.Hotspot.X, cur.Y + 13 + cur.Hotspot.Y, color)
		
		canv.Layer[index].Tex:fillRect(cur.X + 4 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, 2, 13, color)
		canv.Layer[index].Tex:fillRect(cur.X + 6 + cur.Hotspot.X, cur.Y + 1 + cur.Hotspot.Y, 5, 15, color)
		canv.Layer[index].Tex:fillRect(cur.X + 11 + cur.Hotspot.X, cur.Y + 2 + cur.Hotspot.Y, 2, 13, color)
		
		canv.Layer[index].Tex:drawLine(cur.X + 13 + cur.Hotspot.X, cur.Y + 3 + cur.Hotspot.Y, cur.X + 13 + cur.Hotspot.X, cur.Y + 13 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 14 + cur.Hotspot.X, cur.Y + 4 + cur.Hotspot.Y, cur.X + 14 + cur.Hotspot.X, cur.Y + 12 + cur.Hotspot.Y, color)
		canv.Layer[index].Tex:drawLine(cur.X + 15 + cur.Hotspot.X, cur.Y + 6 + cur.Hotspot.Y, cur.X + 15 + cur.Hotspot.X, cur.Y + 10 + cur.Hotspot.Y, color)
	end
	
	
	
end