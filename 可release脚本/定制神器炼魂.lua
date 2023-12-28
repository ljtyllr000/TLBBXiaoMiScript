Ŀ������ = "����"
��Ҫ������ = {
    "Ѫ����",
    "������",
    "������",
    "�𹥻�",
    "������",
    "����",
    "����Ŀ�����",
}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function MoveToPos(NPCCity, x, y)
    while true do
        ��ͼѰ·(NPCCity, x, y)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

function GetWeaponLevel(weaponIndex)
    local weaponLevel = LUA_ȡ����ֵ(string.format([[
        local BagIndex = %d
        local eqLevel = LifeAbility : Get_Equip_Level(BagIndex)
        return eqLevel
    ]], weaponIndex))
    return tonumber(weaponLevel)
end

function GetOldAttr(weaponIndex)
    local weaponOldAttr = LUA_ȡ����ֵ(string.format([[
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
    local newAttr = LUA_ȡ����ֵ(string.format([[
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
    local allMoney = ��ȡ������Ϣ(52) +��ȡ������Ϣ(45)
    return tonumber(allMoney)
end

function main()
    local firstTip = "��ʼϴ����,Ŀ������:"
    for i = 1, #��Ҫ������ do
        firstTip = firstTip .. ��Ҫ������[i] .. ','
    end
    MentalTip(firstTip)

    if #��Ҫ������ > 7 then
        MentalTip("�������ֻ��7������")
    end

    local weaponPos = ��ȡ������Ʒλ��(Ŀ������)
    if weaponPos == nil or weaponPos < 1 then
        MentalTip(string.format("������ȱ��������%s��", Ŀ������))
        return
    end

    local oldWeaponAttr = GetOldAttr(weaponPos - 1)
    local oldMatched = 0
    for j = 1, #��Ҫ������ do
        if string.find(oldWeaponAttr, ��Ҫ������[j]) then
            oldMatched = oldMatched + 1
        end
    end
    if oldMatched == #��Ҫ������ then
        MentalTip("��������������������Ҫ������")
        return
    end

    local weaponLevel = GetWeaponLevel(weaponPos - 1)
    local washMaterial = ""
    if weaponLevel == 82 or weaponLevel == 86 then
        washMaterial = "�����1��"
    elseif weaponLevel == 92 or weaponLevel == 96 then
        washMaterial = "�����2��"
    elseif weaponLevel == 102 then
        washMaterial = "�����3��"
    else
        MentalTip(string.format("װ����%s�����ɽ�����������", Ŀ������))
        return
    end

    ȡ����Ʒ(washMaterial)
    ȡ����Ʒ("���")
    ��ʱ(1000)
    if ��ȡ������Ʒ����(washMaterial) < 5 then
        MentalTip(string.format("����������ϡ�%s����������", washMaterial))
        return
    end

    MoveToPos("����", 354, 240)
    ��ʱ(1500)
    �Ի�NPC("ŷ����")
    ��ʱ(1000)
    NPC�����Ի�("��������")
    ��ʱ(1500)
    �Ҽ�ʹ����Ʒ(Ŀ������)
    ��ʱ(1000)

    local LHNum = 1
    while true do
        if ��ȡ������Ʒ����(washMaterial) < 5 or GetAllMoney() <= 5 * 10000 then
            MentalTip("���ϻ��Ҳ���,�Զ�ֹͣ")
            break
        end
        MentalTip(string.format("��ʼ��%d������", LHNum))
        SuperWeaponWash(weaponPos - 1)
        ��ʱ(1000)
        local newMatched = 0
        local newAttr = GetWashAfterAttr()
        for j = 1, #��Ҫ������ do
            if string.find(newAttr, ��Ҫ������[j]) then
                newMatched = newMatched + 1
            end
        end
        if newMatched == #��Ҫ������ then
            MentalTip("��������������ϴ��")
            ��ʱ(500)
            SaveSuperWeaponNewAttr()
            return
        else
			MentalTip(string.format("��%d�����겻����", LHNum))
        end
        LHNum = LHNum + 1
    end
end

-- ------------------------------- Main ---------------------------------
main()