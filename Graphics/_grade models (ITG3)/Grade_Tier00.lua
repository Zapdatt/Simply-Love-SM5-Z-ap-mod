return Def.ActorFrame{

  -- Top center star
  LoadActor("star.txt")..{
    OnCommand=function(self) self:x(0):y(-30):zoom(0.4):wag():effectmagnitude(0,4,10) end
  },

  -- Top center flare
  LoadActor("goldflare.png")..{
    OnCommand=function(self) self:additiveblend(true):x(0):y(-29):zoom(0.35):wag():effectmagnitude(0,4,10) end
  },

  -- Top left star
  LoadActor("star.txt")..{
    OnCommand=function(self) self:x(-29):y(-9):zoom(0.4):wag():effectmagnitude(0,4,10) end
  },

  -- Top left flare
  LoadActor("goldflare.png")..{
    OnCommand=function(self) self:additiveblend(true):x(-29):y(-8):zoom(0.35):wag():effectmagnitude(0,4,10) end
  },

  -- Top right star
  LoadActor("star.txt")..{
    OnCommand=function(self) self:x(29):y(-9):zoom(0.4):wag():effectmagnitude(0,4,10) end
  },

  -- Top right flare
  LoadActor("goldflare.png")..{
    OnCommand=function(self) self:additiveblend(true):x(29):y(-8):zoom(0.35):wag():effectmagnitude(0,4,10) end
  },

  -- Bottom left star
  LoadActor("star.txt")..{
    OnCommand=function(self) self:x(-18):y(28):zoom(0.4):wag():effectmagnitude(0,4,10) end
  },

  -- Bottom left flare
  LoadActor("goldflare.png")..{
    OnCommand=function(self) self:additiveblend(true):x(-18):y(29):zoom(0.35):wag():effectmagnitude(0,4,10) end
  },

  -- Bottom right star
  LoadActor("star.txt")..{
    OnCommand=function(self) self:x(18):y(28):zoom(0.4):wag():effectmagnitude(0,4,10) end
  },

  -- Bottom right flare
  LoadActor("goldflare.png")..{
    OnCommand=function(self) self:additiveblend(true):x(18):y(29):zoom(0.35):wag():effectmagnitude(0,4,10) end
  },

}
