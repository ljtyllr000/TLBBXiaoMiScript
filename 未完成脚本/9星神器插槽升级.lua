function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetSlotLevel(slotIndex)
    local slotLevel = LUA_ȡ����ֵ(string.format([[
        local slotIndex = %d
        local slotLevel = DataPool:GetSuperWeaponDIYSkillSlotLevel(slotIndex)
        if slotLevel ~= nil and slotLevel > 0 then
            return slotLevel
        end
        return -1
    ]], slotIndex))
    return tonumber(slotLevel)
end

function GetLevelUpCost(slotLevel, slotIndex)
    local costNum = LUA_ȡ����ֵ(string.format([[
        local slotLevel = %d
        local slotIndex = %d
        local nCostNum, nCostMoney = DataPool:GetSuperWeaponDIYSkillLevelupData(slotLevel, slotIndex)
        if nCostNum ~= nil and nCostNum > 0 then
			return nCostNum
        end
        return -1
    ]], slotLevel, slotIndex))
    return tonumber(costNum)
end

function SlotLevelUp(slotIndex)
    local hunYuList = {
        [1] = "������",
        [2] = "�ػ���",
        [3] = "�����",
    }
    local slotLevel = GetSlotLevel(slotIndex)
    if slotLevel ~= -1 and slotLevel ~= 10 then
        while true do
            local newSlotLevel = GetSlotLevel(slotIndex)
            local MHYCount = ��ȡ������Ʒ����(hunYuList[slotIndex])
            local levelUpCost = GetLevelUpCost(newSlotLevel, slotIndex)
            if MHYCount < levelUpCost then
                MentalTip(string.format("�����С�%s����������", hunYuList[slotIndex]))
                break
            end
            if slotLevel == 10 then
                MentalTip(string.format("��%d����λ�Ѵ�����", slotIndex))
                break
            end
            LUA_Call(string.format([[
                setmetatable(_G, {__index = SuperWeapon9_DIYSkill_Env});
                SuperWeapon9_DIYSkill_MainButtonLevelUp(%d);
            ]], slotIndex))
            ��ʱ(200)
        end
    end
end

function main()
    MentalTip("����9��������3����λ")
    if DataPool:IsSuperWeapon9() ~= 1 then
        MentalTip("����������δ9��")
        return
    end

    ȡ����Ʒ("������|�ػ���|�����|���")

    -- �������
    for j = 1, 3 do
        MentalTip(string.format("��ʼ������%d����λ", j))
        SlotLevelUp(j)
    end

    ִ�й���("�ϳɵػ���")
    SlotLevelUp(2)

    ִ�й���("�ϳ������")
    SlotLevelUp(3)
end

-- ------------------------------ MAIN ----------------------------------
main()
