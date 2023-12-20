function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function �жϹرմ���(strWindowName)
    if �����Ƿ����(strWindowName) == 1 then
        LUA_Call(string.format([[
			setmetatable(_G, {__index = %s_Env}) this:Hide()
		]], strWindowName))
        ��ʱ(1500)
    end
end

-- ��Ůװ������ ================================================================================
znEuipList = {
    [1] = { name = "����", downIndex = 0, equipIndex = 0, equipName = "" },
    [2] = { name = "����", downIndex = 1, equipIndex = 1, equipName = "" },
    [3] = { name = "����", downIndex = 2, equipIndex = 5, equipName = "" },
    [4] = { name = "����", downIndex = 3, equipIndex = 4, equipName = "" },
    [5] = { name = "��", downIndex = 4, equipIndex = 2, equipName = "" },
    [6] = { name = "����", downIndex = 5, equipIndex = 3, equipName = "" },
}

-- -----------------------------------------------��Ů����---------------------------------
function GetInfantEquipID(index)
    local tem = LUA_ȡ����ֵ(string.format([[
	        return EnumAction(%d ,"infantcard"):GetID()
	  ]], index));
    return tonumber(tem)
end

function GetInfantEquipName(index)
    local tem = LUA_ȡ����ֵ(string.format([[
	        return EnumAction(%d ,"infantcard"):GetName()
	  ]], index));
    return tostring(tem)
end

function GetInfantEquipLevel(index)
    local tem = LUA_ȡ����ֵ(string.format([[
	        return PlayerPackage:GetInfantCard_EnhanceLevel(%d)
	  ]], index));
    return tonumber(tem)
end

function DownEquipGetEquipName(equipLocationName)
    for i = 1, #znEuipList do
        if znEuipList[i].name == equipLocationName then
            MentalTip("׼��ȡ��װ��λ��:" .. equipLocationName)
            if GetInfantEquipID(znEuipList[i].equipIndex) == 0 then
                return 0
            end
            for k = 1, 10 do
                local equipName = GetInfantEquipName(znEuipList[i].equipIndex)
                MentalTip("׼��ȡ��װ��λ��:" .. equipName)

                LUA_Call(string.format([[setmetatable(_G, {__index = Infant_Env}); Infant_Card_Clicked(%d,0);]], znEuipList[i].downIndex))
                ��ʱ(1000)
                if GetInfantEquipID(znEuipList[i].equipIndex) == 0 then
                    �жϹرմ���("Infant")
                    �жϹرմ���("SelfEquip")
                    return equipName
                end
            end
            return 0
        end
    end
end

function WearInfantEquip(equipLocationName, equipName)
    if equipName == "" then
        MentalTip("��������,������Ůװ��ʧ��")
        return
    end
    if ��ȡ������Ʒ����(equipName) <= 0 then
        MentalTip("û��װ���޷�ʹ��,������Ůװ��")
        return
    end
    for i = 1, #znEuipList do
        if znEuipList[i].name == equipLocationName then
            for k = 1, 5 do

                �Ҽ�ʹ����Ʒ(equipName);
                ��ʱ(1000)

                if GetInfantEquipID(znEuipList[i].equipIndex) > 0 then
                    �жϹرմ���("Infant")
                    �жϹرմ���("SelfEquip")
                    MentalTip(" �ɹ�����" .. equipName .. ", ��λ��:" .. equipLocationName)
                    break
                end
            end
        end
    end
end



-- ---------------------------------------------------------------------------------------


function InfantEquipLevelUp(InfantLocationName, level)
    if ��ȡ������Ʒ����("�伮ע��") <= 0 then
        MentalTip("���ϲ���")
        return
    end

    ��ͼѰ·("����", 151, 173)

    local equipName = DownEquipGetEquipName(InfantLocationName)
    ��ʱ(1000)

    if equipName == 0 then
        return -1
    else
        LPindex = ��ȡ������Ʒλ��(equipName) - 1
    end
    if GetInfantEquipLevel(LPindex) >= level then
        WearInfantEquip(InfantLocationName, equipName)
        return
    end

    local curMaterialCount = ��ȡ������Ʒ����("�伮ע��")
    for i = 1, curMaterialCount do
        if ��ȡ������Ʒ����("�伮ע��") <= 0 then
            MentalTip("���ϲ���")
            break
        end
        LUA_Call(string.format([[
			g_BagIndex = %d
			if g_BagIndex == -1 then
		        PushDebugMessage("#{ZSJX_140707_05}")
		        return
            end

			local g_MoneyCost =10000
            local selfMoney = Player : GetData( "MONEY" ) + Player : GetData( "MONEY_JZ" )
	        if selfMoney < g_MoneyCost then
	        	PushDebugMessage("#{KPWFS_131112_26}")
	        	return
	        end

	        local enhancelevel = PlayerPackage:GetInfantCard_EnhanceLevel(g_BagIndex)
	        if enhancelevel >= %d then
	        	PushDebugMessage("#{KPWFS_131112_45}")
	        	return
	        end

            if PlayerPackage:CountAvailableItemByIDTable(38000807) <= 0 then
                PushDebugMessage("���ϲ���")
                return
            end

             Clear_XSCRIPT();
                Set_XSCRIPT_Function_Name("StudyBooks");
                Set_XSCRIPT_ScriptID(890630);
                Set_XSCRIPT_Parameter(0,g_BagIndex);
                Set_XSCRIPT_Parameter(1,1);
                Set_XSCRIPT_ParamCount(2);
            Send_XSCRIPT()
	    ]], LPindex, level))
        ��ʱ(500)

        local curEquipLevel = GetInfantEquipLevel(LPindex)
        if curEquipLevel >= level then
            break
        end

    end


end

function AutoInfantEquipLevelUp()
    if tonumber(LUA_ȡ����ֵ('return Infant:GetHeroType(0);')) <= 0 then
        MentalTip("��Ůû�г���")
        return
    end

    local minLevel = 9
    for _, v in pairs(znEuipList) do
        local InfantLocationName = v['name']
        local equipName = DownEquipGetEquipName(InfantLocationName)
        local LPindex = ��ȡ������Ʒλ��(equipName) - 1
        local equipLevel = GetInfantEquipLevel(LPindex)
        if equipLevel < minLevel then
            minLevel = equipLevel
        end
        WearInfantEquip(InfantLocationName, equipName)
    end
    MentalTip(string.format('��Ůװ�����Ϊ %d ��', minLevel))

    
    for level = minLevel, 9 do
		MentalTip(string.format("��ʼ���������%d��", level))
        for _, v in pairs(znEuipList) do
            local InfantLocationName = v['name']
            InfantEquipLevelUp(InfantLocationName, level)
        end
    end

    for _, v in pairs(znEuipList) do
        local equipLocationName = v['name']
        local equipName = v['equipName']
        WearInfantEquip(equipLocationName, equipName)
    end
end

-- ===========================================================================================
-- ��Ů�������� ================================================================================
function GetInfantNum()
    for k = 1, 5 do
        if �����Ƿ����("Infant") ~= 1 then
            LUA_Call("MainMenuBar_SelfEquip_Clicked();");
            ��ʱ(2000)
            LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Infant_Switch();");
            ��ʱ(2000)
            LUA_Call("setmetatable(_G, {__index = Infant_Env});Infant_SetCheckBox(1);");
            ��ʱ(2000)
        else
            local tem = LUA_ȡ����ֵ(string.format([[
				return Infant:GetInfantCount();
			]]))
            �жϹرմ���("SelfEquip")
            return tonumber(tem)
        end
        ��ʱ(500)
    end
    return 0
end

function GetInfantLevel()
    local tem = LUA_ȡ����ֵ(string.format([[
			TTCount = Infant:GetInfantCount()
			if TTCount<= 0 then
				return 0
			end
			return Infant:GetInfantLevel(0)
			]]))
    return tonumber(tem)
end


function GetMyMoney()
    ����Ǯ = ��ȡ������Ϣ(52) + ��ȡ������Ϣ(45)
    return ����Ǯ
end

function GetInfantSkillLevelByName(infantSkillName)
    local tem = LUA_ȡ����ֵ(string.format([[
		for i = 0, 3 do
			local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
			if szSkillName == "%s" then
				return nSkillLevel
			end
		end
		return -1
		]], infantSkillName))
    return tonumber(tem)
end

function GetInfantSkillLevelById(infantSkillID)
    local tem = LUA_ȡ����ֵ(string.format([[
			i = %d - 1
			local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,i)
			return nSkillLevel
		]], infantSkillID))
    return tonumber(tem)
end

function GetInfantSkillName(infantSkillID)
    local tem = LUA_ȡ����ֵ(string.format([[
		local infantSkillID = %d - 1
        local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  infantSkillID )
		return szSkillName
		]], infantSkillID))
    return tem
end

function getInfantSkillID(infantSkillName)
    local tem = LUA_ȡ����ֵ(string.format([[
		for i = 0, 3 do
			local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
			if szSkillName == "%s" then
				return i+1
			end
		end
		return -1
		]], infantSkillName))
    return tonumber(tem)
end

-- --------------------------------------------------------------------------------------------------
function SpecifiedInfantSkillLevelUp(skillName, targetLevel)
    MentalTip(string.format("������%s�����ض��ȼ���%s��:", skillName, targetLevel))
    local curWLZNum = ��ȡ������Ʒ����("������")
    for i = 1, curWLZNum do
        if ��ȡ������Ʒ����("������") <= 0 then
            MentalTip("������û��")
            return
        end
        if GetMyMoney() <= 5 * 10000 then
            MentalTip("��Ҳ���")
            return
        end
        local tem = LUA_ȡ����ֵ(string.format([[
			local InfantCount = Infant:GetInfantCount();
			if InfantCount <= 0  then
			    return 2
			end

			guid_H, guid_L = Infant:GetInfantGUID(0);
			nSkillID2 = -1
			for i = 0, 3 do
				local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
                if szSkillName == "%s" then
                    nSkillID2 = nSkillID
                    if nSkillLevel >= %d then
                        return 2
                    end
                end
            end
			if nSkillID2 == -1 then
				return 2
			end

            Clear_XSCRIPT();
                Set_XSCRIPT_Function_Name("InfantSkillLevelUp");
                Set_XSCRIPT_ScriptID(890600);
                Set_XSCRIPT_Parameter(0,guid_H);
                Set_XSCRIPT_Parameter(1,guid_L);
                Set_XSCRIPT_Parameter(2,nSkillID2);
                Set_XSCRIPT_Parameter(3,1);
                Set_XSCRIPT_ParamCount(4);
            Send_XSCRIPT();
		]], skillName, targetLevel))
        ��ʱ(3000)
        if tonumber(tem) == 2 then
            break
        end
    end
end

function NormalInfantSkillLevelUp(targetLevel)
    for kkk = 1, 4 do
        local skillName = GetInfantSkillName(kkk)

        local curWLZNum = ��ȡ������Ʒ����("������")
        for i = 1, curWLZNum do
            MentalTip("������Ů����" .. skillName .. "���ȼ�" .. targetLevel)
            if GetInfantSkillLevelById(kkk) >= targetLevel then
                break
            end
            if ��ȡ������Ʒ����("������") <= 0 then
                MentalTip("������û��")
                return
            end
            if GetMyMoney() <= 5 * 10000 then
                MentalTip("��Ҳ���")
                return
            end
            local tem = LUA_ȡ����ֵ(string.format([[
				i = %d - 1
				local InfantCount = Infant:GetInfantCount();
				if InfantCount <= 0  then
				    return 2
				end

				guid_H, guid_L = Infant:GetInfantGUID(0);
				local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
				if nSkillLevel >= 9  or  nSkillLevel >= %d then
					return 2
				end
				if nSkillID == -1 then
					return 2
				end

				Clear_XSCRIPT();
					Set_XSCRIPT_Function_Name("InfantSkillLevelUp");
					Set_XSCRIPT_ScriptID(890600);
					Set_XSCRIPT_Parameter(0,guid_H);
					Set_XSCRIPT_Parameter(1,guid_L);
					Set_XSCRIPT_Parameter(2,nSkillID);
					Set_XSCRIPT_Parameter(3,1);
					Set_XSCRIPT_ParamCount(4);
				Send_XSCRIPT();
			]], kkk, targetLevel))
            ��ʱ(500)
            if tonumber(tem) == 2 then
                break
            end
        end
    end
end

function InfantSkillLevelUp(level)
    ��ͼѰ·("����", 150, 183)

    --SpecifiedInfantSkillLevelUp("����", level)

    NormalInfantSkillLevelUp(level)
    ��ʱ(2000)

end


-- ----------------------------------------------------------------------------------
function AutoInfantSkillLevelUp()
    local minSkillLevel = 9
    for i = 1, 4 do
        local curSkillLevel = GetInfantSkillLevelById(i)
        if curSkillLevel < minSkillLevel then
            minSkillLevel = curSkillLevel
        end
    end
    MentalTip(string.format("��ǰ��Ů������͵ȼ�Ϊ %d ��", minSkillLevel))

    local startSkillLevel = minSkillLevel + 1
    if GetInfantNum() > 0 and GetInfantLevel() >= 31 then
        for i = startSkillLevel, 9 do
			MentalTip("ȫ�������ȼ�" .. i)
            InfantSkillLevelUp(i)
        end
    end
end

-- -------------------------------------------------------
ȡ����Ʒ("������|�伮ע��")
ȡ����Ʒ("���")
AutoInfantSkillLevelUp()
AutoInfantEquipLevelUp()
����Ʒ("������")
����Ʒ("�伮ע��")
����Ʒ("���")

