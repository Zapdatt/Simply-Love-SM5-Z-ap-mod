return Def.ActorFrame{	--MilestoneCommand was changed to HundredMilestoneCommand, idk why there was a difference, but this made it work
	Def.Sprite {
		Texture = "explosion",
		InitCommand=function(self) self:diffusealpha(0):blend(Blend.Add) end,
		HundredMilestoneCommand=function(self) self:finishtweening():zoom(0):linear(0.1):zoom(2.4):diffusealpha(1):linear(0.5):zoom(2):diffusealpha(0) end
	},
	Def.Sprite {
		Texture = "explosion",
		InitCommand=function(self) self:diffusealpha(0):blend(Blend.Add) end,
		HundredMilestoneCommand=function(self) self:finishtweening():zoom(0):linear(0.1):zoom(2.4):diffusealpha(1):linear(0.5):zoom(2):diffusealpha(0) end
	}
}