目标神器 = "神隐"
需要的属性 = {
    "血上限",
    "毒攻击",
    "玄攻击",
    "火攻击",
    "冰攻击",
    "体力",
    "忽略目标冰抗",
}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."【雨夜出品,必是精品】".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function MoveToPos(NPCCity, x, y)
    while true do
        跨图寻路(NPCCity, x, y)
        延时(500)
        local myX = 获取人物信息(7)
        local myY = 获取人物信息(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

function GetWeaponLevel(weaponIndex)
    local weaponLevel = LUA_取返回值(string.format([[
        local BagIndex = %d
        local eqLevel = LifeAbility : Get_Equip_Level(BagIndex)
        return eqLevel
    ]], weaponIndex))
    return tonumber(weaponLevel)
end

function GetOldAttr(weaponIndex)
    local weaponOldAttr = LUA_取返回值(string.format([[
        local weaponIndex = %d
        local theAction = EnumAction( weaponIndex, "packageitem" )
        local num = theAction:GetEquipAttrCount()
        local str = ""
        for i = 0, num-1 do
            local tempstr = theAction:EnumEquipExtAttr(i)
            local strTemp = ""
            if string.find(tempstr, "#{") then
                local left = string.find(tempstr, "#{")
                local left2 = string.find(tempstr, "}")
                strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))
            end
            str = str .. "|" .. strTemp
        end
        return str
    ]], weaponIndex))
    return weaponOldAttr
end

function GetWashAfterAttr()
    local newAttr = LUA_取返回值(string.format([[
		local num =  DataPool : Lua_GetSuperRecoinNum();
		local str = ""
		for i = 0, num-1 do
			local tempstr = DataPool :Lua_GetSuperRecoinEnumAttr(i)
            local strTemp = ""
            if string.find(tempstr, "#{") then
                local left = string.find(tempstr, "#{")
                local left2 = string.find(tempstr, "}")
                strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))
            end
			str = str .. "|" .. strTemp
		end
		return  str
	]], "s"))
    return newAttr
end

function SuperWeaponWash(weaponIndex)
        LUA_Call(string.format([[
            local weaponIndex = %d
            Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name( "OnShenqiUpgrade" )
				Set_XSCRIPT_ScriptID( 500505 )
				Set_XSCRIPT_Parameter( 0, weaponIndex )
				Set_XSCRIPT_Parameter( 1, 160 )
				Set_XSCRIPT_Parameter( 2, 0 )
				Set_XSCRIPT_ParamCount( 3 )
			Send_XSCRIPT()
        ]], weaponIndex))
end

function SaveSuperWeaponNewAttr()
    LUA_Call(string.format([[setmetatable(_G, {__index = SuperWeaponUpNEW_Env});SuperWeaponUpNEW_Tihuan_Clicked();]]))
end

function GetAllMoney()
    local allMoney = 获取人物信息(52) +获取人物信息(45)
    return tonumber(allMoney)
end

function main()
    local firstTip = "开始洗神器,目标属性:"
    for i = 1, #需要的属性 do
        firstTip = firstTip .. 需要的属性[i] .. ','
    end
    MentalTip(firstTip)

    if #需要的属性 > 7 then
        MentalTip("神器最多只有7条属性")
    end

    local weaponPos = 获取背包物品位置(目标神器)
    if weaponPos == nil or weaponPos < 1 then
        MentalTip(string.format("背包中缺少神器【%s】", 目标神器))
        return
    end

    local oldWeaponAttr = GetOldAttr(weaponPos - 1)
    local oldMatched = 0
    for j = 1, #需要的属性 do
        if string.find(oldWeaponAttr, 需要的属性[j]) then
            oldMatched = oldMatched + 1
        end
    end
    if oldMatched == #需要的属性 then
        MentalTip("您的神器属性已满足需要的属性")
        return
    end

    local weaponLevel = GetWeaponLevel(weaponPos - 1)
    local washMaterial = ""
    if weaponLevel == 82 or weaponLevel == 86 then
        washMaterial = "神兵符1级"
    elseif weaponLevel == 92 or weaponLevel == 96 then
        washMaterial = "神兵符2级"
    elseif weaponLevel == 102 then
        washMaterial = "神兵符3级"
    else
        MentalTip(string.format("装备【%s】不可进行神器炼魂", 目标神器))
        return
    end

    取出物品(washMaterial)
    取出物品("金币")
    延时(1000)
    if 获取背包物品数量(washMaterial) < 5 then
        MentalTip(string.format("神器炼魂材料【%s】数量不足", washMaterial))
        return
    end

    MoveToPos("苏州", 354, 240)
    延时(1500)
    对话NPC("欧治于")
    延时(1000)
    NPC二级对话("神器炼魂")
    延时(1500)
    右键使用物品(目标神器)
    延时(1000)

    local LHNum = 1
    while true do
        if 获取背包物品数量(washMaterial) < 5 or GetAllMoney() <= 5 * 10000 then
            MentalTip("材料或金币不足,自动停止")
            break
        end
        MentalTip(string.format("开始第%d次炼魂", LHNum))
        SuperWeaponWash(weaponPos - 1)
        延时(1000)
        local newMatched = 0
        local newAttr = GetWashAfterAttr()
        for j = 1, #需要的属性 do
            if string.find(newAttr, 需要的属性[j]) then
                newMatched = newMatched + 1
            end
        end
        if newMatched == #需要的属性 then
            MentalTip("您的神器属性已洗好")
            延时(500)
            SaveSuperWeaponNewAttr()
            return
        else
			MentalTip(string.format("第%d次炼魂不满足", LHNum))
        end
        LHNum = LHNum + 1
    end
end

-- ------------------------------- Main ---------------------------------
main()