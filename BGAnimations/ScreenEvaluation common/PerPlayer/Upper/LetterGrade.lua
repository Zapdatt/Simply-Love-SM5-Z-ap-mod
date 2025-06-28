local player = ...

local AwardMap = {
    ["StageAward_FullComboW1"] = 1,
    ["StageAward_FullComboW2"] = 2,
    ["StageAward_SingleDigitW2"] = 2,
    ["StageAward_OneW2"] = 2,
    ["StageAward_FullComboW3"] = 3,
    ["StageAward_SingleDigitW3"] = 3,
    ["StageAward_OneW3"] = 3,
    ["StageAward_100PercentW3"] = 3,
    -- FullComboW4 technically doesn't exist, but we create it on the fly below.
    ["StageAward_FullComboW4"] = 4,
}

local playerStats = STATSMAN:GetCurStageStats():GetPlayerStageStats(player)
local grade = playerStats:GetGrade()
--local grade = "Grade_Failed"                  --override for testing
local award = AwardMap[playerStats:GetStageAward()]
local hasStream = false
--local mods = SL[ToEnumShortString(player)].ActiveModifiers
--local grade_style = mods.GradeDisplay or "SimplyLove"  -- fallback if none selected
local grade_style = SL[ToEnumShortString(player)].ActiveModifiers.GradeStyle or "SimplyLove" -- fallback if none selected



if grade_style == "Random" then
	local options = { "SimplyLove", "ITG2", "ITG3" }
	grade_style = options[math.random(#options)]
end

-- "I passd with a q though."
--local title = GAMESTATE:GetCurrentSong():GetDisplayFullTitle()
--if title == "D" then grade = "Grade_Tier99" end

-- QUINT
local ex = CalculateExScore(player, GetExJudgmentCounts(player))
if ex == 100 then grade = "Grade_Tier00" end

if award == 1 and playerStats:GetScore() == 0 then
    award = 0
end

if not GAMESTATE:IsCourseMode() then
    streamMeasures, breakMeasures = GetTotalStreamAndBreakMeasures(ToEnumShortString(player))
    totalMeasures = streamMeasures + breakMeasures
    
    if streamMeasures/totalMeasures >= 0.2 then hasStream = true end
end

local t = Def.ActorFrame{}

if grade_style == "ITG2" then
    -- Replace the original grade loading with ITG2 style 3D models
    t[#t+1] = Def.ActorFrame{
        InitCommand=function(self)
            self:draworder(1000)
            self:x(70 * (player==PLAYER_1 and -1 or 1))
            --self:y(_screen.cy-144)
            self:y(_screen.cy)
            self:zoom(1.2)
            self:diffusealpha(0)  -- start hidden
        end,
        OnCommand=function(self)
            -- Position adjustments
            self:x(40 * (player == PLAYER_1 and -1 or 1))
            self:zoom(2)
            self:diffusealpha(1)

            -- Wait briefly in center
            self:sleep(3)

            -- Animate to player-specific position and size
            self:decelerate(0.3)
            self:x(70 * (player == PLAYER_1 and -1 or 1))
            self:y(_screen.cy-144)
            self:zoom(1.2)
            
            -- Full combo effects
            if ThemePrefs.Get("GradeCombo") and award ~= nil then
                self:diffuseshift():effectperiod(0.8)
                if award == 0 then
                    -- FBFC, use a special color
                    local ItlPink = color("1,0.2,0.406,1")
                    self:effectcolor1(ItlPink)
                    self:effectcolor2(lerp_color(0.70, color("#ffffff"), ItlPink))
                elseif award < 4 then
                    self:effectcolor1(SL.JudgmentColors["ITG"][award])
                    self:effectcolor2(lerp_color(0.70, color("#ffffff"), SL.JudgmentColors["ITG"][award]))
                end
            end
        end,
        
        OffCommand=function(self)
            -- Animate off-screen to the side
            self:accelerate(0.3):addx((player == PLAYER_1 and -1 or 1) * SCREEN_WIDTH)
        end,

        -- Load the 3D grade model
        LoadActor(THEME:GetPathG("", "_grade models/"..grade..".lua"))
    }

elseif grade_style == "ITG3" then               
    -- Replace the original grade loading with ITG3 style 3D models     (idk how to load XML files so I just quickly converted them to .lua)
    t[#t+1] = Def.ActorFrame{
        InitCommand=function(self)
            self:draworder(1000)
            self:x(70 * (player==PLAYER_1 and -1 or 1))
            --self:y(_screen.cy-144)
            self:y(_screen.cy)
            self:zoom(1.2)
            self:diffusealpha(0)  -- start hidden
        end,
        OnCommand=function(self)
            -- Position adjustments
            self:x(40 * (player == PLAYER_1 and -1 or 1))
            self:zoom(2)
            self:diffusealpha(1)

            -- Wait briefly in center
            self:sleep(3)

            -- Animate to player-specific position and size
            self:decelerate(0.3)
            self:x(70 * (player == PLAYER_1 and -1 or 1))
            self:y(_screen.cy-144)
            self:zoom(1.2)
            
            -- Full combo effects
            if ThemePrefs.Get("GradeCombo") and award ~= nil then
                self:diffuseshift():effectperiod(0.8)
                if award == 0 then
                    -- FBFC, use a special color
                    local ItlPink = color("1,0.2,0.406,1")
                    self:effectcolor1(ItlPink)
                    self:effectcolor2(lerp_color(0.70, color("#ffffff"), ItlPink))
                elseif award < 4 then
                    self:effectcolor1(SL.JudgmentColors["ITG"][award])
                    self:effectcolor2(lerp_color(0.70, color("#ffffff"), SL.JudgmentColors["ITG"][award]))
                end
            end
        end,
        
        OffCommand=function(self)
            -- Animate off-screen to the side
            self:accelerate(0.3):addx((player == PLAYER_1 and -1 or 1) * SCREEN_WIDTH)
        end,

        -- Load the 3D grade model
        LoadActor(THEME:GetPathG("", "_grade models (ITG3)/"..grade..".lua"))
    }

elseif grade_style == "SimplyLove" then
    t[#t+1] = LoadActor(THEME:GetPathG("", "_grades/"..grade..".lua"), playerStats)..{
        InitCommand=function(self)
            self:x(70 * (player==PLAYER_1 and -1 or 1))
            self:y(_screen.cy-144)
        end,
        OnCommand=function(self)
            self:zoom(0.3)
            
            if not hasStream then
                self:zoom(0.4)
                self:y(_screen.cy-136)
            end
            
            if ThemePrefs.Get("GradeCombo") and award ~= nil then
                self:diffuseshift():effectperiod(0.8)
                if award == 0 then
                    -- FBFC, use a special color
                    local ItlPink = color("1,0.2,0.406,1")
                    self:effectcolor1(ItlPink)
                    self:effectcolor2(lerp_color(0.70, color("#ffffff"), ItlPink))
                elseif award < 4 then
                    self:effectcolor1(SL.JudgmentColors["ITG"][award])
                    self:effectcolor2(lerp_color(0.70, color("#ffffff"), SL.JudgmentColors["ITG"][award]))
                end
            end
        end
    }
end

return t