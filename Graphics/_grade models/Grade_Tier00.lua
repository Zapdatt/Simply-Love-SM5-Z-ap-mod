return Def.ActorFrame{

	-- Top center
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(0):y(-30):zoom(0.4):wag():effectmagnitude(0,4,10)
		end
	},

	-- Top left
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(-29):y(-9):zoom(0.4):wag():effectmagnitude(0,4,10)
		end
	},

	-- Top right
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(29):y(-9):zoom(0.4):wag():effectmagnitude(0,4,10)
		end
	},

	-- Bottom left
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(-18):y(28):zoom(0.4):wag():effectmagnitude(0,4,10)
		end
	},

	-- Bottom right
	LoadActor("star.txt")..{
		OnCommand=function(self)
			self:x(18):y(28):zoom(0.4):wag():effectmagnitude(0,4,10)
		end
	},
}
