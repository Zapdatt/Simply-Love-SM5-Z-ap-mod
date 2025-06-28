return Def.ActorFrame{
	OnCommand=function(self) 
		self:zoom(0.85):wag():effectmagnitude(0,10,10) 
	end,
		LoadActor("f.txt")..{}
}
