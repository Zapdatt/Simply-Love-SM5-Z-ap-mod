return Def.ActorFrame{
	OnCommand=function(self) 
		self:zoom(0.7):rotationy(-90):spin():effectmagnitude(0,40,0) 
	end,
		LoadActor("aplus.txt")..{}
}
