
local addonName, ns = ...

local lib = CreateFrame("Frame")
ns.lib = lib

--simple drag func
function lib:AddSimpleDrag(f)

  f:SetHitRectInsets(-15,-15,-15,-15)
  f:SetClampedToScreen(true)
  f:SetMovable(true)
  f:SetUserPlaced(true)

  f:EnableMouse(true)

  f:RegisterForDrag("LeftButton")
  f:SetScript("OnEnter", function(s)
    GameTooltip:SetOwner(s, "ANCHOR_CURSOR")
    GameTooltip:AddLine(s:GetName(), 0, 1, 0.5, 1, 1, 1)
    GameTooltip:AddLine("Hold down ALT+SHIFT to drag!", 1, 1, 1, 1, 1, 1)
    GameTooltip:Show()
  end)
  f:SetScript("OnLeave", function(s) GameTooltip:Hide() end)
  f:SetScript("OnDragStart", function(s) if IsAltKeyDown() and IsShiftKeyDown() then s:StartMoving() end end)
  f:SetScript("OnDragStop", function(s) s:StopMovingOrSizing() end)

end