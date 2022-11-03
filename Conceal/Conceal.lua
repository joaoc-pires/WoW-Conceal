Conceal = LibStub("AceAddon-3.0"):NewAddon("Conceal", "AceConsole-3.0", "AceTimer-3.0", "AceEvent-3.0")
local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

local defaults = {
    profile = {
        interactive = true,
        health = 100,
        power = false,
        mouseover = true,
        alpha = 30,
        animationDuration = 0.25,
        fadeOutDuration = 0.25,
        actionBar1 = true,
        actionBar1ConcealDuringCombat = false,
        actionBar2 = true,
        actionBar2ConcealDuringCombat = false,
        actionBar3 = true,
        actionBar3ConcealDuringCombat = false,
        actionBar4 = true,
        actionBar4ConcealDuringCombat = false,
        actionBar5 = true,
        actionBar5ConcealDuringCombat = false,
        actionBar6 = true,
        actionBar6ConcealDuringCombat = false,
        actionBar7 = true,
        actionBar7ConcealDuringCombat = false,
        actionBar8 = true,
        actionBar8ConcealDuringCombat = false,
        petActionBar = true,
        petActionBarConcealDuringCombat = false,
        stanceBar = true,
        stanceBarConcealDuringCombat = false,
        selfFrame = true,
        selfFrameConcealDuringCombat = false,
        targetFrame = false,
        targetFrameConcealDuringCombat = false,
        microBar = false,
        microBarConcealDuringCombat = false
    }
}

local options = {
    name = "Conceal ",
    handler = Conceal,
    type = "group",
    args = {
            -- General Options
            GeneralHeader = {
                order = 0,
                name = "General",
                type = "header",              
            },
            alpha = {
                order = 1,
                name = "Opacity",
                desc = "Opacity of the elements when concealed.",
                width = 2,
                type = "range",
                get = "GetSlider",
                set = "SetSlider",
                min = 0,
                max = 100,   
                step = 5,
                disabled = false,
            },
            animationDuration = {
                order = 1.2,
                name = "Fade In Duration",
                desc = "Controls the duration of the fade in animation in seconds",
                width = 2,
                type = "range",
                get = "GetSlider",
                set = "SetSlider",
                min = 0,
                max = 2,   
                step = 0.05,
                disabled = false,
            },
            fadeOutDuration = {
                order = 1.3,
                name = "Fade Out Duration",
                desc = "Controls the duration of the fade out animation in seconds",
                width = 2,
                type = "range",
                get = "GetSlider",
                set = "SetSlider",
                min = 0,
                max = 2,   
                step = 0.05,
                disabled = false,
            },
            health = {
                order = 2,
                name = "Health Treshold",
                desc = "The treshold which will trigger the elements to show if the Health % is bellow.",
                width = 2,
                type = "range",
                get = "GetSlider",
                set = "SetSlider",
                min = 0,
                max = 100,   
                step = 5,
                disabled = false,
            },
            GeneralHeader = {
                order = 3,
                name = "Player Frame",
                type = "header",              
            },
            selfFrame = {
                order = 3.1,
                name = "Conceal Player Frame",
                desc = "Hides the Player Frame using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            selfFrameConcealDuringCombat = {
                order = 3.2,
                name = "Conceal During Combat",
                desc = "Conceal Player Frame during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            targetFrame = {
                order = 3.3,
                name = "Conceal Target Frame",
                desc = "Hides the Player Frame using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            targetFrameConcealDuringCombat = {
                order = 3.4,
                name = "Conceal During Combat",
                desc = "Conceal Target Frame during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 1 Options
            ActionBar1Header = {
                order = 4,
                name = "Action Bar 1",
                type = "header",              
            },
            actionBar1 = {
                order = 4.1,
                name = "Conceal Action Bar 1",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            actionBar1ConcealDuringCombat = {
                order = 4.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 1 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 2 Options
            ActionBar2Header = {
                order = 5,
                name = "Action Bar 2",
                type = "header",              
            },
            actionBar2 = {
                order = 5.1,
                name = "Conceal Action Bar 2",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            actionBar2ConcealDuringCombat = {
                order = 5.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 2 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 3 Options
            ActionBar3Header = {
                order = 6,
                name = "Action Bar 3",
                type = "header",              
            },
            actionBar3 = {
                order = 6.1,
                name = "Conceal Action Bar 3",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5 ,
                disabled = false,
            },
            actionBar3ConcealDuringCombat = {
                order = 6.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 3 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 4 Options
            ActionBar4Header = {
                order = 7,
                name = "Action Bar 4",
                type = "header",              
            },
            actionBar4 = {
                order = 7.1,
                name = "Conceal Action Bar 4",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            actionBar4ConcealDuringCombat = {
                order = 7.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 4 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 5 Options
            ActionBar5Header = {
                order = 8,
                name = "Action Bar 5",
                type = "header",              
            },
            actionBar5 = {
                order = 8.1,
                name = "Conceal Action Bar 5",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            actionBar5ConcealDuringCombat = {
                order = 8.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 5 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 6 Options
            ActionBar6Header = {
                order = 9,
                name = "Action Bar 6",
                type = "header",              
            },
            actionBar6 = {
                order = 9.1,
                name = "Conceal Action Bar 6",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            actionBar6ConcealDuringCombat = {
                order = 9.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 6 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 7 Options
            ActionBar7Header = {
                order = 10,
                name = "Action Bar 7",
                type = "header",              
            },
            actionBar7 = {
                order = 10.1,
                name = "Conceal Action Bar 7",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            actionBar7ConcealDuringCombat = {
                order = 10.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 7 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Action Bar 8 Options
            ActionBar8Header = {
                order = 11,
                name = "Action Bar 8",
                type = "header",              
            },
            actionBar8 = {
                order = 11.1,
                name = "Conceal Action Bar 8",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            actionBar8ConcealDuringCombat = {
                order = 11.2,
                name = "Conceal During Combat",
                desc = "Conceal Action Bar 8 during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            -- Other Bar Options
            OtherBarsHeader = {
                order = 13,
                name = "Other Bars",
                type = "header",              
            },
            petActionBar = {
                order = 13.1,
                name = "Conceal Pet Action Bar",
                desc = "Hides the action bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            petActionBarConcealDuringCombat = {
                order = 13.2,
                name = "Conceal Pet Action Bar During Combat",
                desc = "Conceal Pet Action Bar during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            stanceBar = {
                order = 13.3,
                name = "Conceal Stance Bar",
                desc = "Hides the stance bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            stanceBarConcealDuringCombat = {
                order = 13.4,
                name = "Conceal Stance Bar During Combat",
                desc = "Conceal Stance Bar during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            microBar = {
                order = 13.5,
                name = "Conceal MicroBar and Bags",
                desc = "Hides the MicroBar and Bags bar using the defined Alpha.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
            microBarConcealDuringCombat = {
                order = 13.6,
                name = "Conceal MicroBar and Bags During Combat",
                desc = "Conceal MicroBar and Bags during combat, and low HP.",
                type = "toggle",
                get = "GetStatus",
                set = "SetStatus",
                width = 1.5,
                disabled = false,
            },
    }
}

local isInCombat = false

ActionBar2 = MultiBarBottomLeft
ActionBar3 = MultiBarBottomRight
ActionBar4 = MultiBarRight 
ActionBar5 = MultiBarLeft
ActionBar6 = MultiBar5
ActionBar7 = MultiBar6
ActionBar8 = MultiBar7

function Conceal:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("ConcealDB", defaults, true) 
    self.db.RegisterCallback(self, "OnProfileChanged", "ProfileHandler")
    self.db.RegisterCallback(self, "OnProfileCopied", "ProfileHandler")
    self.db.RegisterCallback(self, "OnProfileReset", "ProfileHandler")
    AC:RegisterOptionsTable("Conceal_options", options) 
    self.optionsFrame = ACD:AddToBlizOptions("Conceal_options", "Conceal")  
    
    Conceal:RegisterEvent("ADDON_LOADED", "loadConfig");
    Conceal:RegisterEvent("PLAYER_ENTER_COMBAT", "DidEnterCombat");
    Conceal:RegisterEvent("PLAYER_LEAVE_COMBAT", "DidExitCombat");
    Conceal:RegisterEvent("PLAYER_REGEN_DISABLED", "DidEnterCombat");
    Conceal:RegisterEvent("PLAYER_REGEN_ENABLED", "DidExitCombat");
    Conceal:RegisterEvent("PLAYER_TARGET_CHANGED", "TargetChanged");
    
    Conceal:HideGcdFlash()
    
    C_Timer.NewTicker(0.10, function()
        Conceal:ShowMouseOverElements()
        Conceal:RefreshGUI()
    end)
end

-- Conditionals
function Conceal:isHealthBelowThreshold()
    local threshold = self.db.profile["health"];
    if threshold then
        local hp = UnitHealth("player");
        local maxHP = UnitHealthMax("player");
        local pct = (hp / maxHP) * 100;
        return pct < threshold;
    else
        return false;
    end
end

function Conceal:FadeIn(frame, forced)
    local alphaTimer = self.db.profile["animationDuration"];
    if alphaTimer == 0 then alphaTimer = 0.01; end
    local frameAlpha = self.db.profile["alpha"];
    if frameAlpha > 1 then frameAlpha = frameAlpha / 100; end
    
    local currentAlpha = frame:GetAlpha()
    currentAlpha = tonumber(string.format("%.2f", currentAlpha))
    if (currentAlpha == frameAlpha) and not forced then 
    
        local animation = frame:CreateAnimationGroup();
        local fadeIn = animation:CreateAnimation("Alpha");
        fadeIn:SetFromAlpha(frameAlpha);
        fadeIn:SetToAlpha(1);
        fadeIn:SetDuration(alphaTimer);
        fadeIn:SetStartDelay(0);
        animation:SetToFinalAlpha(true)    
              
        animation:Play();
    end
    if forced then 
        frame:SetAlpha(frameAlpha)
    end
end

function Conceal:FadeOut(frame, forced)
    local alphaTimer = self.db.profile["fadeOutDuration"];
    if alphaTimer == 0 then alphaTimer = 0.01; end
    local frameAlpha = self.db.profile["alpha"];
    if frameAlpha > 1 then frameAlpha = frameAlpha / 100; end

    local currentAlpha = frame:GetAlpha()
    currentAlpha = tonumber(string.format("%.2f", currentAlpha))

    if (currentAlpha == 1) and not forced then 
        local animation = frame:CreateAnimationGroup();
        local fadeIn = animation:CreateAnimation("Alpha");
        fadeIn:SetFromAlpha(1);
        fadeIn:SetToAlpha(frameAlpha);
        fadeIn:SetDuration(alphaTimer);
        fadeIn:SetStartDelay(0);
        
        animation:SetToFinalAlpha(true)      
        animation:Play();
    end
    if forced then 
        frame:SetAlpha(1)
    end
end

-- Actions
function Conceal:ShowCombatElements()

    if self.db.profile["selfFrame"] and not self.db.profile["selfFrameConcealDuringCombat"] then Conceal:FadeIn(PlayerFrame) end --PlayerFrame:SetAlpha(1) end
    if self.db.profile["targetFrame"] and not self.db.profile["targetFrameConcealDuringCombat"] then TargetFrame:SetAlpha(1) end

    -- Action Bar 1
    local isActionBar1Concealable = self.db.profile["actionBar1"] 
    local concealActionBar1InCombat = self.db.profile["actionBar1ConcealDuringCombat"] 
    if isActionBar1Concealable and not concealActionBar1InCombat then 
        for i=1,12 do
            _G["ActionButton" ..i]:SetAlpha(1)
        end
    end
    
    if self.db.profile["actionBar2"] and not self.db.profile["actionBar2ConcealDuringCombat"] then ActionBar2:SetAlpha(1) end
    if self.db.profile["actionBar3"] and not self.db.profile["actionBar3ConcealDuringCombat"] then ActionBar3:SetAlpha(1) end
    if self.db.profile["actionBar4"] and not self.db.profile["actionBar4ConcealDuringCombat"] then ActionBar4:SetAlpha(1) end
    if self.db.profile["actionBar5"] and not self.db.profile["actionBar5ConcealDuringCombat"] then ActionBar5:SetAlpha(1) end
    if self.db.profile["actionBar6"] and not self.db.profile["actionBar6ConcealDuringCombat"] then ActionBar6:SetAlpha(1) end
    if self.db.profile["actionBar7"] and not self.db.profile["actionBar7ConcealDuringCombat"] then ActionBar7:SetAlpha(1) end
    if self.db.profile["actionBar8"] and not self.db.profile["actionBar8ConcealDuringCombat"] then ActionBar8:SetAlpha(1) end
    if self.db.profile["petActionBar"] and not self.db.profile["petActionBarConcealDuringCombat"] then PetActionBar:SetAlpha(1) end

    -- Stance Bar
    if self.db.profile["stanceBar"] and not self.db.profile["stanceBarConcealDuringCombat"]  then StanceBar:SetAlpha(1) end
    if self.db.profile["microBar"] and not self.db.profile["microBarConcealDuringCombat"]  then MicroButtonAndBagsBar:SetAlpha(1) end
end

function Conceal:ShowMouseOverElements()
    local frameAlpha = self.db.profile["alpha"];
    if frameAlpha > 1 then frameAlpha = frameAlpha / 100; end

    if self.db.profile["selfFrame"] then 
        if PlayerFrame:IsMouseOver() then 
            Conceal:FadeIn(PlayerFrame)
        elseif self.db.profile["selfFrameConcealDuringCombat"] then 
            Conceal:FadeOut(PlayerFrame)
        end 
    end

    if self.db.profile["targetFrame"] then 
        if TargetFrame:IsMouseOver() then 
            Conceal:FadeIn(TargetFrame)
        elseif self.db.profile["targetFrameConcealDuringCombat"] then 
            Conceal:FadeOut(TargetFrame)
        end 
    end

    -- Action Bar 1
    local isActionBar1Concealable = self.db.profile["actionBar1"]
    if isActionBar1Concealable then
        local isMouseOverActionBar1 = false
        for i=1,12 do
            if _G["ActionButton" ..i]:IsMouseOver() then isMouseOverActionBar1 = true end
        end
        if isMouseOverActionBar1 then 
            for i=1,12 do
                -- _G["ActionButton" ..i]:SetAlpha(1)
                Conceal:FadeIn(_G["ActionButton" ..i])
            end
        elseif self.db.profile["actionBar1ConcealDuringCombat"] then
            for i=1,12 do
                Conceal:FadeOut(_G["ActionButton" ..i])
            end
        end
    end

    if self.db.profile["actionBar2"] then 
        if ActionBar2:IsMouseOver() then 
            Conceal:FadeIn(ActionBar2)
        elseif self.db.profile["actionBar2ConcealDuringCombat"] then 
            Conceal:FadeOut(ActionBar2)
        end 
    end 
    if self.db.profile["actionBar3"] then 
        if ActionBar3:IsMouseOver() then 
            Conceal:FadeIn(ActionBar3)
        elseif self.db.profile["actionBar3ConcealDuringCombat"] then 
            Conceal:FadeOut(ActionBar3)
        end 
    end
    if self.db.profile["actionBar4"] then 
        if ActionBar4:IsMouseOver() then 
            Conceal:FadeIn(ActionBar4)
        elseif self.db.profile["actionBar4ConcealDuringCombat"] then 
            Conceal:FadeOut(ActionBar4)
        end 
    end
    if self.db.profile["actionBar5"] then 
        if ActionBar5:IsMouseOver() then 
            Conceal:FadeIn(ActionBar5)
        elseif self.db.profile["actionBar5ConcealDuringCombat"] then 
            Conceal:FadeOut(ActionBar5)
        end 
    end
    if self.db.profile["actionBar6"] then 
        if ActionBar6:IsMouseOver() then 
            Conceal:FadeIn(ActionBar6)
        elseif self.db.profile["actionBar6ConcealDuringCombat"] then 
            Conceal:FadeOut(ActionBar6)
        end 
    end
    if self.db.profile["actionBar7"] then 
        if ActionBar7:IsMouseOver() then 
            Conceal:FadeIn(ActionBar7)
        elseif self.db.profile["actionBar7ConcealDuringCombat"] then 
            Conceal:FadeOut(ActionBar7)
        end 
    end
    if self.db.profile["actionBar8"] then 
        if ActionBar8:IsMouseOver() then 
            Conceal:FadeIn(ActionBar8)
        elseif self.db.profile["actionBar8ConcealDuringCombat"] then 
            Conceal:FadeOut(ActionBar8)
        end 
    end
    if self.db.profile["petActionBar"] then 
        if PetActionBar:IsMouseOver() then 
            Conceal:FadeIn(PetActionBar)
        elseif self.db.profile["petActionBarConcealDuringCombat"] then 
            Conceal:FadeOut(PetActionBar)
        end 
    end
    if self.db.profile["stanceBar"]  then 
        if StanceBar:IsMouseOver() then 
            Conceal:FadeIn(StanceBar)
        elseif self.db.profile["stanceBarConcealDuringCombat"] then 
            Conceal:FadeOut(StanceBar)
        end 
    end
    if self.db.profile["microBar"]  then 
        if MicroButtonAndBagsBar:IsMouseOver() then 
            Conceal:FadeIn(MicroButtonAndBagsBar)
        elseif self.db.profile["microBarConcealDuringCombat"] then 
            Conceal:FadeOut(MicroButtonAndBagsBar)
        end 
    end
end

function Conceal:HideElements()

    if isInCombat then return end

    local frameAlpha = self.db.profile["alpha"];
    if frameAlpha > 1 then frameAlpha = frameAlpha / 100; end
    
    -- Player Frame
    if self.db.profile["selfFrame"] and not PlayerFrame:IsMouseOver() then Conceal:FadeOut(PlayerFrame) end
    if self.db.profile["targetFrame"] and not TargetFrame:IsMouseOver() then Conceal:FadeOut(TargetFrame); end

    -- Action Bar 1
    local isActionBar1Concealable = self.db.profile["actionBar1"]
    local isMouseOverActionBar1 = false
    for i=1,12 do
        if _G["ActionButton" ..i]:IsMouseOver() then isMouseOverActionBar1 = true end
    end
    if isActionBar1Concealable and not isMouseOverActionBar1 then 
        for i=1,12 do
            Conceal:FadeOut(_G["ActionButton" ..i])
        end
    end

    if self.db.profile["actionBar2"] and not ActionBar2:IsMouseOver() then Conceal:FadeOut(ActionBar2); end
    if self.db.profile["actionBar3"] and not ActionBar3:IsMouseOver() then Conceal:FadeOut(ActionBar3); end
    if self.db.profile["actionBar4"] and not ActionBar4:IsMouseOver() then Conceal:FadeOut(ActionBar4); end
    if self.db.profile["actionBar5"] and not ActionBar5:IsMouseOver() then Conceal:FadeOut(ActionBar5); end
    if self.db.profile["actionBar6"] and not ActionBar6:IsMouseOver() then Conceal:FadeOut(ActionBar6); end
    if self.db.profile["actionBar7"] and not ActionBar7:IsMouseOver() then Conceal:FadeOut(ActionBar7); end
    if self.db.profile["actionBar8"] and not ActionBar8:IsMouseOver() then Conceal:FadeOut(ActionBar8); end
    if self.db.profile["petActionBar"] and not PetActionBar:IsMouseOver() then Conceal:FadeOut(PetActionBar); end
    if self.db.profile["stanceBar"] and not StanceBar:IsMouseOver() then Conceal:FadeOut(StanceBar); end
    if self.db.profile["microBar"] and not MicroButtonAndBagsBar:IsMouseOver() then Conceal:FadeOut(MicroButtonAndBagsBar); end
end

function Conceal:TargetChanged()
    if UnitExists("target") then 
         Conceal:ShowCombatElements();
    else
        Conceal:HideElements()
    end
end


-- Event Handlers
function Conceal:DidEnterCombat() 
    Conceal:ShowCombatElements()
    isInCombat = true
end

function Conceal:DidExitCombat() 
    Conceal:HideElements()
    isInCombat = false
end


--credit https://www.mmo-champion.com/threads/2414999-How-do-I-disable-the-GCD-flash-on-my-bars
function Conceal:HideGcdFlash() 
    for i,v in pairs(_G) do
        if type(v)=="table" and type(v.SetDrawBling)=="function" then
            v:SetDrawBling(false)
        end
    end
end

function Conceal:ProfileHandler() 
    Conceal:loadConfig();
    Conceal:RefreshGUI();
end

function Conceal:loadConfig()
    -- Unused for now
end

function Conceal:RefreshGUI()
    local shouldShowCombatElement = false
    if UnitExists("target") then shouldShowCombatElement = shouldShowCombatElement or true; end
    if Conceal:isHealthBelowThreshold() then shouldShowCombatElement = shouldShowCombatElement or true; end
    if shouldShowCombatElement then 
        Conceal:ShowCombatElements();
    else
        Conceal:HideElements()
    end
end

function Conceal:GetStatus(info)
    Conceal:RefreshGUI()
    Conceal:loadConfig()
    return self.db.profile[info[#info]]
end

function Conceal:UpdateFramesToAlpha(alpha)
    if self.db.profile["selfFrame"] then PlayerFrame:SetAlpha(alpha); end
    if self.db.profile["targetFrame"] then TargetFrame:SetAlpha(alpha); end
    if self.db.profile["actionBar1"] then 
        for i=1,12 do
            _G["ActionButton" ..i]:SetAlpha(alpha)
        end
    end
    if self.db.profile["actionBar2"] then ActionBar2:SetAlpha(alpha); end
    if self.db.profile["actionBar3"] then ActionBar3:SetAlpha(alpha); end
    if self.db.profile["actionBar4"] then ActionBar4:SetAlpha(alpha); end
    if self.db.profile["actionBar5"] then ActionBar5:SetAlpha(alpha); end
    if self.db.profile["actionBar6"] then ActionBar6:SetAlpha(alpha); end
    if self.db.profile["actionBar7"] then ActionBar7:SetAlpha(alpha); end
    if self.db.profile["actionBar8"] then ActionBar8:SetAlpha(alpha); end
    if self.db.profile["petActionBar"] then PetActionBar:SetAlpha(alpha); end
    if self.db.profile["stanceBar"] then StanceBar:SetAlpha(alpha); end
    if self.db.profile["microBar"] then MicroButtonAndBagsBar:SetAlpha(alpha); end
end

function Conceal:SetStatus(info) 
    if self.db.profile[info[#info]] then
        self.db.profile[info[#info]] = false
        if info[#info] == "selfFrame" then PlayerFrame:SetAlpha(1); self.db.profile["selfFrameConcealDuringCombat"] = false end
        if info[#info] == "targetFrame" then TargetFrame:SetAlpha(1); self.db.profile["targetFrameConcealDuringCombat"] = false end
        if info[#info] == "actionBar1" then 
            for i=1,12 do
                _G["ActionButton" ..i]:SetAlpha(1)
            end
            self.db.profile["actionBar1ConcealDuringCombat"] = false 
        end
        if info[#info] == "actionBar2" then ActionBar2:SetAlpha(1); self.db.profile["actionBar2ConcealDuringCombat"] = false end
        if info[#info] == "actionBar3" then ActionBar3:SetAlpha(1); self.db.profile["actionBar3ConcealDuringCombat"] = false end
        if info[#info] == "actionBar4" then ActionBar4:SetAlpha(1); self.db.profile["actionBar4ConcealDuringCombat"] = false end
        if info[#info] == "actionBar5" then ActionBar5:SetAlpha(1); self.db.profile["actionBar5ConcealDuringCombat"] = false end
        if info[#info] == "actionBar6" then ActionBar6:SetAlpha(1); self.db.profile["actionBar6ConcealDuringCombat"] = false end
        if info[#info] == "actionBar7" then ActionBar7:SetAlpha(1); self.db.profile["actionBar7ConcealDuringCombat"] = false end
        if info[#info] == "actionBar8" then ActionBar8:SetAlpha(1); self.db.profile["actionBar8ConcealDuringCombat"] = false end
        if info[#info] == "petActionBar" then PetActionBar:SetAlpha(1); self.db.profile["petActionBarConcealDuringCombat"] = false end
        if info[#info] == "stanceBar" then StanceBar:SetAlpha(1); self.db.profile["stanceBarConcealDuringCombat"] = false end
        if info[#info] == "microBar" then MicroButtonAndBagsBar:SetAlpha(1); self.db.profile["microBarConcealDuringCombat"] = false end
    else 
        self.db.profile[info[#info]] = true
        if info[#info] == "selfFrameConcealDuringCombat" then self.db.profile["selfFrame"] = true end
        if info[#info] == "targetFrameConcealDuringCombat" then self.db.profile["targetFrame"] = true end
        if info[#info] == "actionBar1ConcealDuringCombat" then self.db.profile["actionBar1"] = true end
        if info[#info] == "actionBar2ConcealDuringCombat" then self.db.profile["actionBar2"] = true end
        if info[#info] == "actionBar3ConcealDuringCombat" then self.db.profile["actionBar3"] = true end
        if info[#info] == "actionBar4ConcealDuringCombat" then self.db.profile["actionBar4"] = true end
        if info[#info] == "actionBar5ConcealDuringCombat" then self.db.profile["actionBar5"] = true end
        if info[#info] == "actionBar6ConcealDuringCombat" then self.db.profile["actionBar6"] = true end
        if info[#info] == "actionBar7ConcealDuringCombat" then self.db.profile["actionBar7"] = true end
        if info[#info] == "actionBar8ConcealDuringCombat" then self.db.profile["actionBar8"] = true end
        if info[#info] == "petActionBarConcealDuringCombat" then self.db.profile["petActionBar"] = true end
        if info[#info] == "stanceBarConcealDuringCombat" then self.db.profile["stanceBar"] = true end
        if info[#info] == "microBarConcealDuringCombat" then self.db.profile["microBar"] = true end
        Conceal:loadConfig()
    end
    Conceal:RefreshGUI()
end

function Conceal:GetSlider(info)
    return self.db.profile[info[#info]]
end

function Conceal:SetSlider(info, value)
    self.db.profile[info[#info]] = value
    if info[#info] == "alpha" then 
        local frameAlpha = value;
        if frameAlpha > 1 then frameAlpha = frameAlpha / 100; end
        Conceal:UpdateFramesToAlpha(frameAlpha)
    end
end