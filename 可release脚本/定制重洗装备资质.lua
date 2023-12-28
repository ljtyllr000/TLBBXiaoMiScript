װ������ = "����"   -- TODO ÿ�ζ���Ҫ�޸�װ�����֣�ֻ��ָ��һ��װ�������Խ�ȡװ�������е�ĳ���������ַ���

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


function GetOldLagerZiZhi(equipPos)
    local equipBindStatus = LUA_ȡ����ֵ(string.format([[
        local Identify_Item = %d
        local equipBindStatus = PlayerPackage:GetItemBindStatusByIndex(Identify_Item);
        return equipBindStatus
    ]], equipPos))
    if tonumber(equipBindStatus) ~= 1 then
        MentalTip("��ǰװ�������Ѱ�װ��, �����¼�������")
        return 1
    end

    local oldLagerZZ = LUA_ȡ����ֵ(string.format([[
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
        local oldLagerZiZhi = oldValue1
        if oldType1 ~= nil and oldType2 ~= nil then
            if oldValue2 > oldValue1 then
                oldLagerZiZhi = oldValue2
            end
        elseif oldType1 == nil and oldType1 == nil then
            return -1
        end

        if oldLagerZiZhi == 60 then
            return -1
        end
        return oldLagerZiZhi
    ]], equipPos))

    return tonumber(oldLagerZZ)
end

function GetNewLagerZiZhi(equipPos)
    local newLagerZZ = LUA_ȡ����ֵ(string.format([[
        local Identify_Item = %d

        local oldType1,oldValue1,oldType2,oldValue2 = DataPool : GetEquipZiZhi(Identify_Item);
        local oldLagerZiZhi = oldValue1
        if oldType1 ~= nil and oldType2 ~= nil then
            if oldValue2 > oldValue1 then
                oldLagerZiZhi = oldValue2
            end
        end

        local str =  DataPool : GetEquipZiZhiRefreshDesc(Identify_Item);
        local type1,value1,type2,value2 = DataPool : GetEquipZiZhiCompare(Identify_Item);

        local newLagerZiZhi = -1
        if oldType1 ~= nil and oldType2 ~= nil then
            newValue1 = oldValue1 + value1
            newValue2 = oldValue2 + value2
            newLagerZiZhi = newValue1
            if newValue2 > newValue1 then
                newLagerZiZhi = newValue2
            end
        elseif type2 == nil then
            newLagerZiZhi = oldValue1 + value1
        end
        return newLagerZiZhi
    ]], equipPos))
    return tonumber(newLagerZZ)
end

function ReIdentityZiZhi()
    -- ������¼�����ť
    LUA_Call([[
        setmetatable(_G, {__index = IdentifyTwice_Env});IdentifyTwice_Buttons_Clicked();
    ]])
end

function ReplaceZiZhi()
    -- ����滻
    LUA_Call([[
        setmetatable(_G, {__index = IdentifyTwice_Env});IdentifyTwice_SaveChange_Clicked();
    ]])
end


function equipIdentifyTwice(equipPos)
    local oldLagerZZ = GetOldLagerZiZhi(equipPos)
    if oldLagerZZ == -1 then
        MentalTip("��װ���������¼�������")
        return -1
    end

    ReIdentityZiZhi()   -- ������¼���
    ��ʱ(500)
    local newLagerZZ = GetNewLagerZiZhi(equipPos)
    MentalTip(string.format("��װ��ԭ�ϴ�����:��%d��, �½ϴ�����:��%d��", oldLagerZZ, newLagerZZ))

    if newLagerZZ > oldLagerZZ then
        MentalTip(string.format("��װ���½ϴ����ʡ�%d����ԭ�ϴ����ʡ�%d����, �滻Ϊ������", newLagerZZ, oldLagerZZ))
        ReplaceZiZhi()   -- ��� �滻
    end
    return 1
end

function GetEquipPos(equipNameList)
    local equipIndex = LUA_ȡ����ֵ(string.format([[
        local targetItemName = "%s"
        local currNum = DataPool:GetBaseBag_Num();
        for i=1, currNum do
            local theAction,bLocked = PlayerPackage:EnumItem("base", i-1);
            if theAction:GetID() ~= 0 then
                local itemName = theAction:GetName()   -- ��Ʒ����
                if string.find(itemName, targetItemName) then
                    return i
                end
            end
        end
        return -1
    ]], equipNameList))
    return tonumber(equipIndex)
end

function RightClick(equipPos)
    local row = math.floor(tonumber(equipPos) / 10)
    local col = math.floor(tonumber(equipPos) % 10)
    if col == 0 then
        col = 10
    else
        row = row + 1
    end

    -- �Ҽ�ʹ��
    LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))
end

-- Main ------------------------------------------------------------------------------------------------------------
MentalTip(string.format("ֻ�б������ɰ�����ﱺľ�,��ϴ��60%,���˳�"))
MentalTip(string.format("ֻ�б������ɰ�����ﱺľ�,��ϴ��60%,���˳�"))
MentalTip(string.format("�������¼���װ����%s��", װ������))
ȡ����Ʒ("����|���ɰ")
MoveToPos("����", 354, 234)
��ʱ(2000)
�Ի�NPC("ŷұ��")
��ʱ(500)
NPC�����Ի�("���¼���װ������")
��ʱ(1000)
local equipPos = GetEquipPos(װ������)
if equipPos == -1 then
    MentalTip(string.format("������û��װ����%s��", װ������))
else
    local equipIndex = equipPos -1
    RightClick(equipPos)
    ��ʱ(1000)

    while true do
        if (��ȡ������Ʒ����("���ɰ") + ��ȡ������Ʒ����("����")) <= 0 then
            break
        end
        local ret = equipIdentifyTwice(equipIndex)
        if ret == -1 then
            break
        end
        ��ʱ(500)
    end
end