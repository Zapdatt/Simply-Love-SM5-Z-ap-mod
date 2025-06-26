return Def.ActorFrame{

	-- Top left
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(-40):y(-30):zoom(0.5):wag():effectmagnitude(0,4,10)
		end
	},

	-- Top right
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(40):y(-30):zoom(0.5):wag():effectmagnitude(0,4,10)
		end
	},

	-- Bottom left
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(-40):y(30):zoom(0.5):wag():effectmagnitude(0,4,10)
		end
	},

	-- Bottom right
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(40):y(30):zoom(0.5):wag():effectmagnitude(0,4,10)
		end
	},

	-- Center star (5th star for Quint)
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(0):y(0):zoom(0.5):wag():effectmagnitude(0,4,10)
		end
	}
}
