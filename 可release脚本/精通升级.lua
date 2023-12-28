local SelfEquipList = {
    [1] = { name = "����", downIndex = 11, equipIndex = 0, equipName = "" }, --- ����
    [2] = { name = "����", downIndex = 3, equipIndex = 14, equipName = "" }, --- ����
    [3] = { name = "��ָ��", downIndex = 7, equipIndex = 6, equipName = "" }, --- ��ָ���ϣ�
    [4] = { name = "��ָ��", downIndex = 8, equipIndex = 11, equipName = "" }, --- ��ָ���£�
    [5] = { name = "������", downIndex = 9, equipIndex = 12, equipName = "" }, --- �������ϣ�
    [6] = { name = "������", downIndex = 10, equipIndex = 13, equipName = "" }, --- �������£�
    [7] = { name = "�·�", downIndex = 12, equipIndex = 2, equipName = "" }, --- �·�
    [8] = { name = "ñ��", downIndex = 1, equipIndex = 1, equipName = "" }, --- ñ��
    [9] = { name = "����", downIndex = 2, equipIndex = 15, equipName = "" }, --- ���
    [10] = { name = "����", downIndex = 4, equipIndex = 3, equipName = "" }, --- ����
    [11] = { name = "����", downIndex = 5, equipIndex = 5, equipName = "" }, --- ����
    [12] = { name = "Ь��", downIndex = 6, equipIndex = 4, equipName = "" }, --- Ь��
    [13] = { name = "����", downIndex = 13, equipIndex = 7, equipName = "" }, --- ����
    [14] = { name = "����", downIndex = 14, equipIndex = 17, equipName = "" }, --- ����
    [15] = { name = "����", downIndex = 25, equipIndex = 19, equipName = "" }, --- ����
    [16] = { name = "���", downIndex = "", equipIndex = 18, equipName = "" }, --- ���
    [17] = { name = "����", downIndex = 16, equipIndex = 20, equipName = "" }, --- ����
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

function CheckAllJingTong()
    local needClean = 1
    for i = 1, #SelfEquipList do
        local isJTMaxLevel = LUA_ȡ����ֵ(string.format([[
            local equipIndex = %d
            local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(equipIndex)
            if tonumber(AttrLevel1) + tonumber(AttrLevel2) + tonumber(AttrLevel3) < 300 then
                return 0
            end
            return 1
        ]], SelfEquipList[i].equipIndex))

        if tonumber(isJTMaxLevel) == 0 then
            needClean = 0
            break
        end
    end

    if needClean == 1 then
        MentalTip("�������о�ͨ����, �������پ���ʯ")
        ȡ����Ʒ("����ʯ")
        ��ʱ(1000)
        �Զ����("����ʯ")
        return 1
    end
    return -1
end

function CheckSpecifiedJingTong(equipPosName, targetLevel)
    local isTargetLevel = 1
    for i = 1, #SelfEquipList do
        if SelfEquipList[i].name == equipPosName then
            local isJTMaxLevel = LUA_ȡ����ֵ(string.format([[
                local equipIndex = %d
                local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(equipIndex)
                if tonumber(AttrLevel1) < %d or tonumber(AttrLevel2) < %d or tonumber(AttrLevel3) < %d then
                    return 0
                end
                return 1
            ]], SelfEquipList[i].equipIndex, targetLevel, targetLevel, targetLevel))

            if tonumber(isJTMaxLevel) == 0 then
                isTargetLevel = 0
            end
            break
        end
    end

    if isTargetLevel == 1 then
        MentalTip("����" .. equipPosName .. "��ͨ�Ѵ�" .. tostring(targetLevel) .. "��, ��������")
        return 1
    end
    return -1
end

function getMainAttr()
    local tem = LUA_ȡ����ֵ(string.format([[
        local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
        local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
        local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
        local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
        local tt={ iIceAttack, iFireAttack, iThunderAttack,iPoisonAttack}
        if iIceAttack==math.max(unpack(tt)) then
           maxOfT ="��"
        elseif  iFireAttack==math.max(unpack(tt)) then
            maxOfT ="��"
        elseif  iThunderAttack==math.max(unpack(tt)) then
            maxOfT ="��"
        elseif  iPoisonAttack==math.max(unpack(tt)) then
            maxOfT ="��"
        end
        return maxOfT
    ]]), "s")
    MentalTip("�����Թ���:" .. tem)
    return tem
end

function ȡ����װ���־�(aaa)
    local tem = LUA_ȡ����ֵ(string.format([[
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa))
    return tonumber(tem)
end

function ȡ����װ��ID(aaa)
    local tem = LUA_ȡ����ֵ(string.format([[
		return EnumAction(%d,"equip"):GetID()
	]], aaa))
    return tonumber(tem)
end

function ȡ����װ������(aaa)
    return LUA_ȡ����ֵ(string.format([[
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end

function �жϹرմ���(strWindowName)
    for i = 1, 3 do
        if �����Ƿ����(strWindowName) == 1 then
            LUA_Call(string.format([[
				setmetatable(_G, {__index = %s_Env}) this:Hide()
			]], strWindowName))
            ��ʱ(1500)
        end
    end
end

function ȡ��װ����ȡ����(װ��λ������)
    for i = 1, #SelfEquipList do
        if SelfEquipList[i].name == װ��λ������ then
            MentalTip("׼��ȡ��װ��λ��:" .. װ��λ������)
            local װ���־� = ȡ����װ���־�(SelfEquipList[i].equipIndex)
            if װ���־� <= 0 then
                MentalTip("װ���־ò���,��ȡ��")
                return 0
            end
            if ȡ����װ��ID(SelfEquipList[i].equipIndex) <= 0 then
                return 0
            end

            for k = 1, 5 do
                if �����Ƿ����("SelfEquip") == 1 then
                    local װ������ = ȡ����װ������(SelfEquipList[i].equipIndex)
                    LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEquipList[i].downIndex))
                    ��ʱ(2000)
                    if ȡ����װ��ID(SelfEquipList[i].equipIndex) == 0 then
                        �жϹرմ���("SelfEquip")
                        return װ������
                    end
                else
                    LUA_Call("MainMenuBar_SelfEquip_Clicked();");
                    ��ʱ(2000)
                end
            end
            return 0
        end
    end
    MentalTip("��ʾ���� ȡ��װ�� �������")
    ��ʱ(2000)
end

function ȡ����װ������(aaa)
    local tem = LUA_ȡ����ֵ(string.format([[
		local index =%d
		local theaction = EnumAction(index,"equip")
		if theaction then
			local  ID =theaction:GetID();
			if tonumber( ID) > 0 then
				local Name = EnumAction(index,"equip"):GetName()
				return  Name
			end
		end
		return -1
	]], aaa))
    return tostring(tem)
end

function ȡ���Ͼ�ͨ��С�ȼ�(equipIndex, shuxing)
    local tem = LUA_ȡ����ֵ(string.format([[
		local index = 0
		local equipIndex = %d
		local JdSX = "%s"
		local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(equipIndex)
		if string.find(AttrName1,JdSX) then
			if index== 0 then
				index=AttrLevel1
			else
				if AttrLevel1 <index then
					index=AttrLevel1
				end
 			end
		end
		if string.find(AttrName2,JdSX) then
			if index== 0 then
				index=AttrLevel2
			else
				if AttrLevel2 <index then
					index=AttrLevel2
				end
 			end
		end
		if string.find(AttrName3,JdSX) then
			if index== 0 then
				index=AttrLevel3
			else
				if AttrLevel3 <index then
					index=AttrLevel3
				end
 			end
		end
		return index
	]], equipIndex, shuxing))
    return tonumber(tem)
end

function ȡ����װ��λ�þ�ͨ��С�ȼ�(װ��λ������, shuxing)
    local tem = 0
    for i = 1, #SelfEquipList do
        if SelfEquipList[i].name == װ��λ������ then
            tem = ȡ���Ͼ�ͨ��С�ȼ�(SelfEquipList[i].equipIndex, shuxing)
        end
    end
    return tonumber(tem)
end

function ʹ����Ʒ(��Ʒ�б�, �Ƿ��)
    if �Ƿ�� == 0 or �Ƿ�� == nil then
        tbangding = 10
    elseif �Ƿ�� == 1 then
        tbangding = 0
    elseif �Ƿ�� == 2 then
        tbangding = 1
    end
    for i = 0, 199 do
        local tem = LUA_ȡ����ֵ(string.format([[
			local tbangding =tostring("%s")
			local i =%d
			local ttname = "%s"
			local theAction=EnumAction(i,"packageitem")
			if theAction:GetID() ~= 0 then
				local GetName=theAction:GetName()
				local szItemNum =theAction:GetNum();
				local Status=GetItemBindStatus(i);
				if GetName~=nil and GetName ~="" then
					if string.find("|"..ttname.."|","|"..GetName.."|",1,true) then
						if string.find(tbangding,tostring(Status)) then
							PushDebugMessage("��Ь�������һ���Ʒ:"..GetName.."|����λ��:"..i)
							return 1
						end
					end
				end
			end
			return -1
		]], tbangding, i, ��Ʒ�б�))
        if tonumber(tem) >= 1 then
            LUA_Call(string.format([[
				local theAction = EnumAction(%d, "packageitem");
				if theAction:GetID() ~= 0 then
						setmetatable(_G, {__index = Packet_Env});
						local oldid = Packet_Space_Line1_Row1_button:GetActionItem();
						Packet_Space_Line1_Row1_button:SetActionItem(theAction:GetID());
						Packet_Space_Line1_Row1_button:DoAction();
						Packet_Space_Line1_Row1_button:SetActionItem(oldid);
				end
			]], i))
            ��ʱ(1000)
        end
    end
end

function ����װ��(װ��λ������, װ������)
    if װ������ == "" then
        MentalTip("��������,����װ��")
        MentalTip("��������,����װ��")
        MentalTip("��������,����װ��")
        ��ʱ(2000)
        return
    end

    for i = 1, #SelfEquipList do
        if SelfEquipList[i].name == װ��λ������ then
            for k = 1, 5 do
                if �����Ƿ����("SelfEquip") == 1 then
                    ʹ����Ʒ(װ������);
                    ��ʱ(2000)
                    if ȡ����װ��ID(SelfEquipList[i].equipIndex) > 0 then
                        MentalTip("��Ь���ɹ�����" .. װ������ .. "|��λ��:" .. װ��λ������)
                        �жϹرմ���("SelfEquip")
                        break
                    end
                else
                    LUA_Call("MainMenuBar_SelfEquip_Clicked();");
                    ��ʱ(2000)
                end
            end
        end
    end
end

function ��ͨ����(װ��λ������, ����, �ȼ�)

    if tonumber(�ȼ�) >= 30 and tonumber(�ȼ�) < 40 then
        ��Ҫ�������� = 14
    elseif tonumber(�ȼ�) >= 20 and tonumber(�ȼ�) < 30 then
        ��Ҫ�������� = 12
    elseif tonumber(�ȼ�) >= 1 and tonumber(�ȼ�) < 10 then
        ��Ҫ�������� = 1
    elseif tonumber(�ȼ�) >= 10 and tonumber(�ȼ�) < 20 then
        ��Ҫ�������� = 6
    elseif tonumber(�ȼ�) >= 40 and tonumber(�ȼ�) < 50 then
        ��Ҫ�������� = 16
    elseif tonumber(�ȼ�) >= 50 and tonumber(�ȼ�) < 60 then
        ��Ҫ�������� = 18
    elseif tonumber(�ȼ�) >= 60 and tonumber(�ȼ�) < 70 then
        ��Ҫ�������� = 20
    elseif tonumber(�ȼ�) >= 70 and tonumber(�ȼ�) < 80 then
        ��Ҫ�������� = 22
    elseif tonumber(�ȼ�) >= 80 and tonumber(�ȼ�) < 90 then
        ��Ҫ�������� = 24
    elseif tonumber(�ȼ�) >= 90 and tonumber(�ȼ�) < 100 then
        ��Ҫ�������� = 25
    else
        ��Ҫ�������� = 20
    end

    if ��ȡ������Ʒ����("����ʯ") < ��Ҫ�������� then
        MentalTip(װ��λ������ .. "|װ��������ͨĿ��ȼ�:" .. �ȼ� .. "|����ʯ����" .. ��Ҫ�������� .. "|��������")
        return
    end

    if ����ֵ(��ȡ������Ϣ(45) + ��ȡ������Ϣ(52)) < 100 then
        MentalTip("��ͨ��������,��Ҳ���")
        return
    end

    if ���� == "����" then
        JT_SHUXING = "con"
    elseif ���� == "��" then
        JT_SHUXING = "attack_fire"
    elseif ���� == "��" then
        JT_SHUXING = "attack_light"
    elseif ���� == "��" then
        JT_SHUXING = "attack_cold"
    elseif ���� == "��" then
        JT_SHUXING = "attack_poison"
    else
        MentalTip("��ͨ��������,�����úò���")
        return
    end
    --MentalTip("װ����ͨ����������Ϊ:" .. ����)
    local ��ͨ��С�ȼ� = ȡ����װ��λ�þ�ͨ��С�ȼ�(װ��λ������, JT_SHUXING)
    MentalTip(װ��λ������ .. "����:" .. JT_SHUXING .. "��С��ͨ:" .. ��ͨ��С�ȼ�)
    if ��ͨ��С�ȼ� > �ȼ� or ��ͨ��С�ȼ� == 0 then
        MentalTip("��ͨ������Ŀ��ȼ�: " .. tostring(�ȼ�))
        return
    end
    MoveToPos("����", 364, 245)

    local װ������ = ȡ��װ����ȡ����(װ��λ������)
    if װ������ == 0 then
        return
    end

    local LPindex = ��ȡ������Ʒλ��(װ������) - 1
    MentalTip("����ͨ�����ı������:" .. LPindex)
    if LPindex < 0 then
        return
    end

    for iii = 1, 999 do
        local tem = LUA_ȡ����ֵ(string.format([[
            local index = tonumber(%d)
            local JT_ABC=tostring("%s")
            local nlevel= tonumber(%d)
            local equip_level = LifeAbility : Get_Equip_Level(index);
            if equip_level <80 then
                PushDebugMessage("װ���ȼ�С��80,û�о�ͨ����")
                return 2
            end

            local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
            if selfMoney < 100 then
                PushDebugMessage("��ͨ����������Ҳ���")
                return 2
            end

            local theAction = EnumAction(index, "packageitem")
            local JT_XUHAO = -1
            for kkk=0,2 do
                local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(kkk);
                if(pLevel ~= nil and pLevel > 0) then
                    if string.find(pName, JT_ABC)  then
                        if tonumber(pLevel) < nlevel  then
                            JT_XUHAO = kkk + 1
                            JT_MQDJ = pLevel
                        end
                    end
                else
                    PushDebugMessage("װ��û�д��� �޷�����")
                    break
                end
            end

            if tonumber(JT_XUHAO)==-1 then
                return 2
            end

           local itemneed= PlayerPackage:CountAvailableItemByIDTable(20700055)

            if tonumber(JT_MQDJ) >= 30 and  tonumber(JT_MQDJ) < 40  then
                JT_XYJJS=14
            elseif tonumber(JT_MQDJ) >= 20 and  tonumber(JT_MQDJ) < 30  then
                JT_XYJJS=12
            elseif tonumber(JT_MQDJ) >=1 and  tonumber(JT_MQDJ) < 10  then
                JT_XYJJS=1
            elseif tonumber(JT_MQDJ) >=10 and  tonumber(JT_MQDJ) < 20  then
                JT_XYJJS=6
            elseif tonumber(JT_MQDJ) >=40 and  tonumber(JT_MQDJ) < 50  then
                JT_XYJJS=16
            elseif tonumber(JT_MQDJ) >=50 and  tonumber(JT_MQDJ) < 60  then
                JT_XYJJS=18
            elseif tonumber(JT_MQDJ) >=60 and  tonumber(JT_MQDJ) < 70  then
                JT_XYJJS=20
            elseif tonumber(JT_MQDJ) >=70 and  tonumber(JT_MQDJ) < 80  then
                JT_XYJJS=22
            elseif tonumber(JT_MQDJ) >=80 and  tonumber(JT_MQDJ) < 90  then
                JT_XYJJS=24
            elseif tonumber(JT_MQDJ) >=90 and  tonumber(JT_MQDJ) < 100  then
                JT_XYJJS=25
            else
                 JT_XYJJS=20
            end

            if itemneed < JT_XYJJS then
                PushDebugMessage("����ʯ:����")
                return 2
            end

            Clear_XSCRIPT();
            Set_XSCRIPT_Function_Name("EquipLevelupAtta");
            Set_XSCRIPT_ScriptID(890088);
            Set_XSCRIPT_Parameter(0,index);
            Set_XSCRIPT_Parameter(1, tonumber(JT_XUHAO));
            Set_XSCRIPT_Parameter(2, 0);
            Set_XSCRIPT_ParamCount(3);
            Send_XSCRIPT();
		]], LPindex, JT_SHUXING, �ȼ�))
        ��ʱ(1000)
        if tonumber(tem) == 2 then
            break
        end
    end
    ����װ��(װ��λ������, װ������)
end

function StrengthLevelUp(index)
    if CheckSpecifiedJingTong("����", index) == -1 then
        ��ͨ����("����", "����", index)
    end
    if CheckSpecifiedJingTong("����", index) == -1 then
        ��ͨ����("����", "����", index)
    end
    if CheckSpecifiedJingTong("����", index) == -1 then
        ��ͨ����("����", "����", index)
    end
    if CheckSpecifiedJingTong("Ь��", index) == -1 then
        ��ͨ����("Ь��", "����", index)
    end
    if CheckSpecifiedJingTong("ñ��", index) == -1 then
        ��ͨ����("ñ��", "����", index)
    end
    if CheckSpecifiedJingTong("�·�", index) == -1 then
        ��ͨ����("�·�", "����", index)
    end
end

function AttackLevelUp(index)
    if CheckSpecifiedJingTong("������", index) == -1 then
        ��ͨ����("������", ���Թ���, index)
    end
    if CheckSpecifiedJingTong("������", index) == -1 then
        ��ͨ����("������", ���Թ���, index)
    end
    if CheckSpecifiedJingTong("��ָ��", index) == -1 then
        ��ͨ����("��ָ��", ���Թ���, index)
    end
    if CheckSpecifiedJingTong("��ָ��", index) == -1 then
        ��ͨ����("��ָ��", ���Թ���, index)
    end
    if CheckSpecifiedJingTong("����", index) == -1 then
        ��ͨ����("����", ���Թ���, index)
    end
    if CheckSpecifiedJingTong("����", index) == -1 then
        ��ͨ����("����", ���Թ���, index)
    end
end

function ��ͨ��������()
    if ��ȡ������Ʒ����("����ʯ") < 12 then
        MentalTip("��ͨ������������15�� ������ͨ��������")
        return
    end

    local _, menPai, _, _, _, _, _, _, _ = ��ȡ��������()
    if menPai == "����" then
        StrengthLevelUp(30)
        StrengthLevelUp(50)
        StrengthLevelUp(70)
        StrengthLevelUp(100)
        AttackLevelUp(30)
        AttackLevelUp(50)
        AttackLevelUp(70)
        AttackLevelUp(100)
    else
        AttackLevelUp(30)
        AttackLevelUp(50)
        AttackLevelUp(70)
        AttackLevelUp(100)
        StrengthLevelUp(30)
        StrengthLevelUp(50)
        StrengthLevelUp(70)
        StrengthLevelUp(100)
    end

end
-- -------------------------------------------------------------------------------------------
local needNotLevelUp = CheckAllJingTong()
if needNotLevelUp == 1 then
    return
end

���Թ��� = getMainAttr()
ȡ����Ʒ("���")
ȡ����Ʒ("����ʯ")
��ͨ��������()
����Ʒ("���")
