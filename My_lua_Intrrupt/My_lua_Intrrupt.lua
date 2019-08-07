local frame=CreateFrame("frame") 
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED") 
frame:SetScript("OnEvent",function(self,event) 
	local _, subEvent, _, sourceGUID, sourceName, _, _, destGUID, destName = CombatLogGetCurrentEventInfo() 
	if(subEvent== "SPELL_INTERRUPT" and sourceGUID ==UnitGUID("player")) then 
		local spell,_,_,extraSpell = select(12,CombatLogGetCurrentEventInfo()) 
		SendChatMessage("成功打断>"..destName.."<的法术"..GetSpellLink(extraSpell).."，下次打断CD 24s","SAY")
	end

	local spell,spellName,_,extraSpell = select(12,CombatLogGetCurrentEventInfo()) 
	if(subEvent== "SPELL_CAST_SUCCESS" and sourceGUID ==UnitGUID("player")) then 
		-- if (spell == 193530) then
			-- SendChatMessage("此时此刻, 爆发! ","SAY")
		-- end

		if (spell == 186265) then
			SendChatMessage("龟了龟了...最多苟8s...","SAY")
		end

	end

	if(subEvent== "SPELL_CAST_SUCCESS" and sourceGUID ==UnitGUID("pet")) then 

		if (spell == 264667) then
			SendChatMessage("嗜血开! 冲啊！为了部落! Lok'tar ogar!","SAY")
		end
	end

end)
PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare")
SetCVar("stopAutoAttackOnTargetChange", 1)
SetCVar("targetNearestDistance", 50)
SetCVar("TargetPriorityAllowAnyOnScreen", 0) 
SetCVar("Targetnearestuseold", 1)
