-- ָ��װ�������б�, Ϊ�ձ�ʾ��ָ��װ��
--ָ��װ�������б� = "��ĺ|��¥|����|��İʥ��|����ħ��|����|����|����ʥ��|����ʥѥ|����ħ��|����ħ��|��������|����ʥ��|��ˮ����|��ˮ���|��ˮ��ѥ|��ˮ����|��ˮ����|��ˮ��ѥ|��ѩ|����|����|˪��|����|��ĺ|��İʥ��|����|���|��������|�Ắ|����|���|ǳ��|��ĺ|����|�Ắ|��ѩ"
ָ��װ�������б� = ""

-- ---------------------------------------------------------------------------------------------------------------------------------------------
function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function ȡ����ȫ��Ǯ()
    local tem = LUA_ȡ����ֵ(string.format([[
			local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
			return selfMoney
			]]))
    return tonumber(tem)
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

function ȡ������ͨ����(index, ����)
    local tem = LUA_ȡ����ֵ(string.format([[
			local theAction = EnumAction(%d, "packageitem")
			local tiaoshu=0
			for i= 0,2 do
				local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(i);
				if string.find(pName, "%s")  then
					tiaoshu=tiaoshu+1	
				end
			end
			return tiaoshu
	]], index, ����), "n")
    return tonumber(tem)
end

-- ------------------------------------------------------------


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

-- ------------------------------------------------װ�����------------------------------------------------
local SelfEuipList = {
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

function ȡ��װ����ȡ����(װ��λ������)
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            MentalTip("׼��ȡ��װ��λ��:" .. װ��λ������)
            local װ���־� = ȡ����װ���־�(SelfEuipList[i].equipIndex)
            if װ���־� <= 0 then
                MentalTip("װ���־ò���,��ȡ��")
                return 0
            end
            if ȡ����װ��ID(SelfEuipList[i].equipIndex) <= 0 then
                return 0
            end

            for k = 1, 5 do
                if �����Ƿ����("SelfEquip") == 1 then
                    local װ������ = ȡ����װ������(SelfEuipList[i].equipIndex)
                    LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEuipList[i].downIndex))
                    ��ʱ(2000)
                    if ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0 then
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

function ȡ����װ��λ������(װ��λ������)
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            local װ������ = ȡ����װ������(SelfEuipList[i].equipIndex)
            return װ������
        end
    end
end

function ȡ���Ͼ�ͨ����(aaa, shuxing)
    local tem = LUA_ȡ����ֵ(string.format([[
		local index = 0 
		local xuhao=%d
		local JdSX="%s"
		local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(xuhao) 
		if string.find(AttrName1,JdSX) then 
			index=index+1
		end
		if string.find(AttrName2,JdSX) then 
			index=index+1
		end	
		if string.find(AttrName3,JdSX) then 
			index=index+1
		end
		return index
		--PushDebugMessage(AttrLevel1..AttrName1..AttrLevel2..AttrName2..AttrLevel3..AttrName3)
	]], aaa, shuxing))
    return tonumber(tem)
end

function ȡ����װ��λ�þ�ͨ����(װ��λ������, shuxing)
    local tem = 0
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            tem = ȡ���Ͼ�ͨ����(SelfEuipList[i].equipIndex, shuxing)
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
							PushDebugMessage("�����һ���Ʒ:"..GetName.."|����λ��:"..i)
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
        ��Ļ��ʾ("��������,����װ��")
        ��Ļ��ʾ("��������,����װ��")
        ��Ļ��ʾ("��������,����װ��")
        ��ʱ(2000)
        return
    end

    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            for k = 1, 5 do
                if �����Ƿ����("SelfEquip") == 1 then
                    ʹ����Ʒ(װ������);
                    ��ʱ(2000)
                    if ȡ����װ��ID(SelfEuipList[i].equipIndex) > 0 then
                        MentalTip("�ɹ�����" .. װ������ .. "|��λ��:" .. װ��λ������)
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

-- -----------------------------------------------------------------------------------


function װ������(װ��λ������, attr, ����)
    local JT_SHUXING = ""
    if attr == "����" then
        JT_SHUXING = "con"
    elseif attr == "��" then
        JT_SHUXING = "attack_fire"
    elseif attr == "��" then
        JT_SHUXING = "attack_light"
    elseif attr == "��" then
        JT_SHUXING = "attack_cold"
    elseif attr == "��" then
        JT_SHUXING = "attack_poison"
    end
    if JT_SHUXING == "" then
        MentalTip("��ͨ����,�����úò���")
        ��ʱ(1000)
        return
    end

    local equipName = ȡ����װ��λ������(װ��λ������)

    MentalTip("��ͨ����," .. װ��λ������ .. attr .. ����)

    if ָ��װ�������б� ~= nil and ָ��װ�������б� ~= '' then
        if not string.find(ָ��װ�������б�, equipName) then
            MentalTip(string.format('��%s������ָ��װ���б�, ������װ��', equipName))
            ��ʱ(200)
            return
        end
    end

    local ��ͨ���� = ȡ����װ��λ�þ�ͨ����(װ��λ������, JT_SHUXING)
    MentalTip("�㵱ǰ��λ��:" .. װ��λ������ .. "���������������:" .. ��ͨ����)
    if ��ͨ���� >= ���� then
        MentalTip("���װ��λ��: " .. װ��λ������ .. " ����ľ�ͨ���� >=" .. ����)
        ��ʱ(200)
        return
    end

    if ��ȡ������Ʒ����("���") < 15 then
        MentalTip("��𲻹�15�� ������ͨ����")
        return
    end

    if ����ֵ(��ȡ������Ϣ(45) + ��ȡ������Ϣ(52)) < 3 * 10000 then
        MentalTip("��ͨ����,��Ҳ���")
        return
    end

    ��ͼѰ·("����", 364, 245)

    local װ������ = ȡ��װ����ȡ����(װ��λ������);
    MentalTip(string.format("׼��������%s��λ���ϵġ�%s��", װ��λ������, װ������));
    ��ʱ(2000)
    if װ������ == 0 then
        return -1
    else
        LPindex = ��ȡ������Ʒλ��(װ������) - 1
    end

    for iii = 1, 999 do
        local tem = LUA_ȡ����ֵ(string.format([[
            local index = tonumber(%d)

            local equip_level = LifeAbility : Get_Equip_Level(index);
            if equip_level < 80 then
                PushDebugMessage("װ���ȼ��������ܴ���")
                return 2
            end

            local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
            if selfMoney < 50000 then
                PushDebugMessage("����Ҳ���")
                return 2
            end

            local theAction = EnumAction(index, "packageitem")
            JT_ABC = tostring("%s")
            local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(0);
            if	string.find(pName, JT_ABC)  then
                JT_AAA = 1
            else
                JT_AAA = 0
            end

			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(1);		
            if string.find(pName, JT_ABC)  then
                JT_BBB=1
            else
                JT_BBB=0
            end
				
            local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(2);
            if string.find(pName,JT_ABC )  then
                JT_CCC=1
            else
                JT_CCC=0
            end

			local JT_shuliang = JT_AAA + JT_BBB + JT_CCC
            if  JT_shuliang >= 1 then
                local itemneed=PlayerPackage:CountAvailableItemByIDTable(20700063)
                if itemneed < 15 then
                    PushDebugMessage("��𲻹�")
                    return 2
                end
            end
		
			PushDebugMessage("��ͨ�������:"..JT_AAA..JT_BBB..JT_CCC)
            if JT_AAA+JT_BBB+JT_CCC>=%d then
                PushDebugMessage("��ͨ�����㹻����,���ٴ���")
                return 2
            end
					
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("EquipCuiLian");
				Set_XSCRIPT_ScriptID(890088);
				Set_XSCRIPT_Parameter(0,index);
				Set_XSCRIPT_Parameter(1,JT_AAA)
				Set_XSCRIPT_Parameter(2,JT_BBB)
				Set_XSCRIPT_Parameter(3,JT_CCC)
				Set_XSCRIPT_ParamCount(4);
			Send_XSCRIPT();	
		]], LPindex, JT_SHUXING, ����), "d")
        ��ʱ(500)
        if tonumber(tem) == 2 then
            break
        end
    end
    ��ʱ(500)
    ����װ��(װ��λ������, װ������)
end

function GetMainAttr()
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
    return tem
end

function ȫ�Զ�����(sameAttrNum)
    if ȡ����ȫ��Ǯ() < 5 * 10000 then
        MentalTip("��Ҳ���������ͨ����")
        return
    end
    if sameAttrNum == 1 then
        ������� = 10
    end
    if sameAttrNum == 2 then
        -- ϴ˫����
        ������� = 15
    end
    if sameAttrNum == 3 then
        -- ϴ������
        ������� = 20
    end

    if ��ȡ������Ʒ����("���") < ������� then
        MentalTip("��𲻹�������ͨ����")
        return
    end

    local myMainAttr = GetMainAttr()
    MentalTip("����������Ϊ:" .. myMainAttr)

    if menpai == "����" then
        װ������("����", "����", sameAttrNum)
        װ������("����", "����", sameAttrNum)
        װ������("����", "����", sameAttrNum)
        װ������("Ь��", "����", sameAttrNum)
        װ������("ñ��", "����", sameAttrNum)
        װ������("�·�", "����", sameAttrNum)
        װ������("��ָ��", myMainAttr, sameAttrNum)
        װ������("��ָ��", myMainAttr, sameAttrNum)
        װ������("������", myMainAttr, sameAttrNum)
        װ������("������", myMainAttr, sameAttrNum)
        װ������("����", myMainAttr, sameAttrNum)
        װ������("����", myMainAttr, sameAttrNum)
    else
        װ������("��ָ��", myMainAttr, sameAttrNum)
        װ������("��ָ��", myMainAttr, sameAttrNum)
        װ������("������", myMainAttr, sameAttrNum)
        װ������("������", myMainAttr, sameAttrNum)
        װ������("����", myMainAttr, sameAttrNum)
        װ������("����", myMainAttr, sameAttrNum)
        װ������("����", "����", sameAttrNum)
        װ������("����", "����", sameAttrNum)
        װ������("����", "����", sameAttrNum)
        װ������("Ь��", "����", sameAttrNum)
        װ������("ñ��", "����", sameAttrNum)
        װ������("�·�", "����", sameAttrNum)
    end
end

-- main ִ������ -------------------------------------------------------------------------------------------
local ��������, menpai, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()
ȡ����Ʒ("���")
ȡ����Ʒ("���")
����Ʒ("���", ������Ʒ, 0, 1, 1)
ȫ�Զ�����(1) --��������
ȫ�Զ�����(2)
ȫ�Զ�����(3)
����Ʒ("���")
����Ʒ("���")