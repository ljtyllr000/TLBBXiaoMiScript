function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function equipIdentify(equipPos)
    -- װ�����ʼ���
    LUA_Call(string.format([[
        local Identify_Item = %d
        Clear_XSCRIPT();
            Set_XSCRIPT_Function_Name("FinishAdjust");
            Set_XSCRIPT_ScriptID(809261);
            Set_XSCRIPT_Parameter(0,Identify_Item);
            Set_XSCRIPT_ParamCount(1);
        Send_XSCRIPT();
    ]], equipPos))
end

function equipIdentifyTwice(equipPos)
    -- ���¼�������
    -- �鿴װ���Ƿ��
    local EB_FREE_BIND = 0  -- �ް�����
    local EB_BINDED = 1  -- �Ѿ���
    local EB_GETUP_BIND = 2  -- ʰȡ��
    local EB_EQUIP_BIND = 3  -- װ����
    local equipBindStatus = LUA_ȡ����ֵ(string.format([[
        local Identify_Item = %d
        local equipBindStatus = PlayerPackage:GetItemBindStatusByIndex(Identify_Item);
        return equipBindStatus
    ]], equipPos))
    if tonumber(equipBindStatus) ~= 1 then
        MentalTip("��ǰװ�������Ѱ�װ��, �����¼�������")
        return 1
    end

    -- �鿴�����Ƿ��
    --local reIdentifyMaterialStatus = LUA_ȡ����ֵ([[
    --    local Tb_idx = 30008034;  -- ���ɰid��
    --    local jingangcuo_id = 30008048;  -- ����id
    --    local index,BindState = PlayerPackage:FindFirstBindedItemIdxByIDTable(tonumber(Tb_idx));
    --    local index2,BindState2 = PlayerPackage:FindFirstBindedItemIdxByIDTable(tonumber(jingangcuo_id));
    --    if(index == -1 and index2 == -1)then
    --        local str = "ȱ��#{_ITEM"..Tb_idx.."}��#{_ITEM"..jingangcuo_id.."}���������Ǳ�������";
    --        PushDebugMessage(str);
    --        return -1
    --    end
    --    return 1
    --]])

    local reIdentifyRet = LUA_ȡ����ֵ(string.format([[
        Identify_Item = %d
        local g_ZiZhiName = {
            [0] = "�⹥����",
            [1] = "�������",
            [2] = "�ڹ�����",
            [3] = "�ڷ�����",
            [4] = "��������",
            [5] = "��������",
        }
        local oldType1,oldValue1,oldType2,oldValue2 = DataPool : GetEquipZiZhi(Identify_Item);
        local oldZiZhi = ""
        if oldType1 ~= nil and oldType1 >= 0 then
            oldZiZhi = oldZiZhi .. g_ZiZhiName[oldType1] .. tostring(oldValue1)
        end
        if oldType2 ~= nil and oldType2 >= 0 then
            oldZiZhi = oldZiZhi .. g_ZiZhiName[oldType2] .. tostring(oldValue2)
        end
        PushDebugMessage("ԭ����: " .. oldZiZhi)

        if oldValue1 == 60 or oldValue2 == 60 then
            return
        end

        -- ���¼���
        Clear_XSCRIPT();
            Set_XSCRIPT_Function_Name("FinishReAdjust");
            Set_XSCRIPT_ScriptID(809261);
            Set_XSCRIPT_Parameter(0,Identify_Item);
            Set_XSCRIPT_Parameter(1,nMode);
            Set_XSCRIPT_Parameter(2,tonumber(IdentifyTwice_YuanBaoPay:GetCheck()));  -- ����Ƿ�ʹ��Ԫ������
            Set_XSCRIPT_ParamCount(3);
        Send_XSCRIPT();

        -- ���������б��滻
        local str =  DataPool : GetEquipZiZhiRefreshDesc(Identify_Item);
        local type1,value1,type2,value2 = DataPool : GetEquipZiZhiCompare(Identify_Item);

        if oldValue1 < 20 and oldValue2 < 20 then
            if value1 >= 20 or value2 >= 20 then
                -- �滻
                Clear_XSCRIPT();
                    Set_XSCRIPT_Function_Name("DoRefreshEquipZiZhi");
                    Set_XSCRIPT_ScriptID(809261);
                    Set_XSCRIPT_Parameter(0,Identify_Item);
                    Set_XSCRIPT_ParamCount(1);
                Send_XSCRIPT();
            end
        elseif oldValue1 == 20 or value2 == 20 then
            if value1 > 20 or value2 > 20 then
                -- �滻
                Clear_XSCRIPT();
                    Set_XSCRIPT_Function_Name("DoRefreshEquipZiZhi");
                    Set_XSCRIPT_ScriptID(809261);
                    Set_XSCRIPT_Parameter(0,Identify_Item);
                    Set_XSCRIPT_ParamCount(1);
                Send_XSCRIPT();
            end
        elseif oldValue1 == 30 or value2 == 30 then
            if value1 > 30 or value2 > 30 then
                -- �滻
                Clear_XSCRIPT();
                    Set_XSCRIPT_Function_Name("DoRefreshEquipZiZhi");
                    Set_XSCRIPT_ScriptID(809261);
                    Set_XSCRIPT_Parameter(0,Identify_Item);
                    Set_XSCRIPT_ParamCount(1);
                Send_XSCRIPT();
            end
        elseif oldValue1 == 35 or value2 == 35 then
            if value1 > 35 or value2 > 35 then
                -- �滻
                Clear_XSCRIPT();
                    Set_XSCRIPT_Function_Name("DoRefreshEquipZiZhi");
                    Set_XSCRIPT_ScriptID(809261);
                    Set_XSCRIPT_Parameter(0,Identify_Item);
                    Set_XSCRIPT_ParamCount(1);
                Send_XSCRIPT();
            end
        elseif oldValue1 == 40 or value2 == 40 then
            if value1 > 40 or value2 > 40 then
                -- �滻
                Clear_XSCRIPT();
                    Set_XSCRIPT_Function_Name("DoRefreshEquipZiZhi");
                    Set_XSCRIPT_ScriptID(809261);
                    Set_XSCRIPT_Parameter(0,Identify_Item);
                    Set_XSCRIPT_ParamCount(1);
                Send_XSCRIPT();
            end
        elseif oldValue1 == 45 or value2 == 45 then
            if value1 > 45 or value2 > 45 then
                -- �滻
                Clear_XSCRIPT();
                    Set_XSCRIPT_Function_Name("DoRefreshEquipZiZhi");
                    Set_XSCRIPT_ScriptID(809261);
                    Set_XSCRIPT_Parameter(0,Identify_Item);
                    Set_XSCRIPT_ParamCount(1);
                Send_XSCRIPT();
            end
        elseif oldValue1 == 60 or value2 == 60 then
            return 1
        end
        return -1
    ]], equipPos))  --TODO ����Identify_Item�Ƿ���װ���ڱ����е�λ�ã���ȡ������λ��("װ������") - 1

    return tonumber(reIdentifyRet)
end

-- Main ------------------------------------------------------------------------------------------------------------
װ������ = "����"   -- TODO ÿ�ζ���Ҫ�޸�װ������
MentalTip(string.format("�������¼���װ����%s��", װ������))
��ͼѰ·("����", 1, 2)  -- TODO
��ʱ(2000)
�Ի�NPC("ŷ����")
��ʱ(500)
NPC�����Ի�("���¼�������")
��ʱ(1000)
local equipIndex = ��ȡ������λ��(װ������) - 1
�Ҽ�ʹ����Ʒ(װ������)
��ʱ(1000)
while true do
    local tem = equipIdentifyTwice(equipIndex)
    if tem == 1 then
        break
    end
end