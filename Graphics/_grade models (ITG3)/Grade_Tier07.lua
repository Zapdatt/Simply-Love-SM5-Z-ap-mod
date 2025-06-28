return Def.ActorFrame{
	OnCommand=function(self) 
  self:zoom(0.8):rotationy(-90):spin():effectmagnitude(0,40,0) 
	end,
  LoadActor("sminus.txt")
}
