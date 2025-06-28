return Def.ActorFrame{
	OnCommand=function(self) 
		self:zoom(0.7):wag():effectmagnitude(0,10,0) 
	end,
		LoadActor("cplus.txt")..{}
}
