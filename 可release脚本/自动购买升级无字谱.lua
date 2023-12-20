--1�� ������
�Զ����� = 0
���ѹ��ٴ� = 0
�ľ����� = { "���š�����", "ǲ��������", "Ͷ�ס�����", "����������" }
�ؼ����� = { "����ǧ��", "�����м�", "Ͷ������", "75���ؼ�" }

--������Գ���1000����� ����1000���趨
_menPaiAttrList = {
    ["����"] = "��",
    ["����"] = "��",
    ["ؤ��"] = "��",
    ["�䵱"] = "��",
    ["����"] = "��",
    ["����"] = "��",
    ["����"] = "��",
    ["��ɽ"] = "��",
    ["��ң"] = "��",
    ["Ľ��"] = "��",
    ["����"] = "��",
    ["���"] = "��",
    ["�һ���"] = "��",
    ["�����"] = "��",
}
�ľ������� = {

    "���š�����",
    "ǲ��������",
    "Ͷ�ס�����",
    "����",
    "����������",

    --������������ ��˳������
    "��������",
    "��������",
    "��������",
    "��������",
    "�˻�",
    "����",
    "ǲ������",
    "ǲ������",
    "ǲ������",
    "ǲ������",
    "���š���",
    "���š���",
    "���š���",
    "���š���",
    "Ͷ�ס���",
    "Ͷ�ס���",
    "Ͷ�ס���",
    "Ͷ�ס���",
    "���ġ���",
    "���ġ���",
    "���ġ���",
    "���ġ���",
    "�Ľ�����",
    "�Ľ�����",
    "�Ľ�����",
    "�Ľ�����",
    "���顤��",
    "���顤��",
    "���顤��",
    "���顤��"
}

g_ID = -1

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function StringSplit(str, reps)
    -- �ַ����и�
    local resultStrList = {}
    string.gsub(str, '[^' .. reps .. ']+',
            function(w)
                table.insert(resultStrList, w)
            end
    )
    return resultStrList
end

function initialWZP(xinJueName)
    local ret = LUA_ȡ����ֵ(string.format([[
        local name = "%s"
        for i = 1, 98 do
            if DataPool:LuaFnGetXingJuanInfo(i, 'Name') == name then
                g_ID = i
                return g_ID
            end
        end
        return false
    ]], xinJueName))
    if ret == 'false' then
        return false
    else
        g_ID = tonumber(ret)
        return true
    end
end

function multiUseClick()
    LUA_Call([[
        if IsWindowShow("Item_MultiUse") then
            Item_MultiUse_BuyMulti_Clicked()
        end
    ]])
end

function getPlayerMainAttr()
    local mainAttrStr = LUA_ȡ����ֵ([[
        local a = Player:GetData("ATTACKCOLD");
        local b = Player:GetData("ATTACKFIRE");
        local c = Player:GetData("ATTACKLIGHT");
        local d = Player:GetData("ATTACKPOISON");
        if a > b and a > c and a > d then
            return "��" .. "|" .. a
        elseif b > a and b > c and b > d then
            return "��" .. "|" .. b
        elseif c > a and c > b and c > d then
            return "��" .. "|" .. c
        elseif d > a and d > c and d > b then
            return "��" .. "|" .. d
        else
            return "δ֪" .. "|" .. "-1"
        end
    ]])
    local mainAttrList = StringSplit(mainAttrStr, '|')
    local mainAttr, attrValue = mainAttrList[1], mainAttrList[2]
    return mainAttr, tonumber(attrValue)
end

function LevelUpXinJue()
    local ret = LUA_ȡ����ֵ(string.format([[
        local g_ID = %d

        --0���� 1�������� 2������һ��
        local jie = -1
        if DataPool:LuaFnGetXingJuanInfo(g_ID, 'UnLocked') == 1 then
            jie = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Order')
        end
        if jie == 5 then
            return 2
        end

        local name = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Name')
        local ji = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Level')
        local Chip = DataPool:LuaFnGetXingJuanInfo(g_ID, 'ChipCount')
        local exp = Player:GetData('XJSTOREEXP')
        local money = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
        local need_exp, need_money, need_Chip = 0, 0, 0

        if jie == -1 then
            if g_ID >= 19 and g_ID <= 36 then
                need_Chip = 40
            elseif g_ID >= 37 and g_ID <= 64 then
                need_Chip = 35
            elseif g_ID >= 65 and g_ID <= 98 then
                need_Chip = 30
            end
        elseif ji == 10 then
            need_Chip, need_money = DataPool:LuaFnGetXingJuanOrderNeed(g_ID, jie + 1)
        else
            need_exp, need_money = DataPool:LuaFnGetXingJuanLevelNeed(g_ID, jie, ji)
        end
        if need_exp > exp then
            PushDebugMessage("����ܰ��ʾ��" .. name .. " �ľ�������")
            return 0
        elseif need_money > money then
            PushDebugMessage("����ܰ��ʾ��" .. name .. " ��Ҳ���")
            return 0
        elseif need_Chip > Chip then
            PushDebugMessage("����ܰ��ʾ��" .. name .. " ��ӡ����")
            return 2
        else
            if jie == -1 then
                Clear_XSCRIPT();
                Set_XSCRIPT_Function_Name("ActiveXingJuan");
                Set_XSCRIPT_ScriptID(888555);
                Set_XSCRIPT_Parameter(0, g_ID);
                Set_XSCRIPT_Parameter(1, 1);
                Set_XSCRIPT_ParamCount(2);
                Send_XSCRIPT();
            elseif ji == 10 then
                Clear_XSCRIPT();
                Set_XSCRIPT_Function_Name("XingJuanLevelUp");
                Set_XSCRIPT_ScriptID(888555);
                Set_XSCRIPT_Parameter(0, g_ID);
                Set_XSCRIPT_Parameter(1, 1);
                Set_XSCRIPT_ParamCount(2);
                Send_XSCRIPT();
            else
                Clear_XSCRIPT();
                Set_XSCRIPT_Function_Name("XingJuanLevelUp");
                Set_XSCRIPT_ScriptID(888555);
                Set_XSCRIPT_Parameter(0, g_ID);
                Set_XSCRIPT_Parameter(1, 0);
                Set_XSCRIPT_ParamCount(2);
                Send_XSCRIPT();
            end
            return 1
        end
    ]], g_ID))
    return tonumber(ret)
end

function GetNeedBuyCYCount()
    local needBuyCount = LUA_ȡ����ֵ(string.format([[
        local g_ID = %d
        local name = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Name')
        local Order = 0

        if DataPool:LuaFnGetXingJuanInfo(g_ID, 'UnLocked') ~= 1 then
            Order = -1
        else
            Order = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Order')
        end

        if Order == 5 then
            PushDebugMessage("��" .. name .. "��" .. "������")
            return 0
        end

        local Level = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Level')
        local ChipCount = DataPool:LuaFnGetXingJuanInfo(g_ID, 'ChipCount')
        local EXP = Player:GetData('XJSTOREEXP')
        local SHANHAIBI = Player:GetData('SHANHAIBI')
        local MAXLimit = 0
        local a, b, c, d, e, f, g, h, j = Player:GetData('SHShopLimit')

        if g_ID >= 19 and g_ID <= 36 then
            MAXLimit = 8 - c
        elseif g_ID >= 37 and g_ID <= 64 then
            MAXLimit = 40 - b
        elseif g_ID >= 65 and g_ID <= 98 then
            MAXLimit = 120 - a
        end

        if MAXLimit == 0 then
            return 0
        end

        local price = 0

        local needtab = {}

        if g_ID >= 19 and g_ID <= 36 then
            needtab = { 80, 40, 34, 27, 19, 10 }
            price = 250
        elseif g_ID >= 37 and g_ID <= 64 then
            needtab = { 70, 35, 30, 24, 17, 9 }
            price = 50
        elseif g_ID >= 65 and g_ID <= 98 then
            needtab = { 60, 30, 26, 21, 15, 8 }
            price = 20
        else
            return 0
        end
        local need_chip = needtab[Order + 2]
        local maxbuy = math.floor(SHANHAIBI / price)
        if ChipCount >= need_chip or maxbuy == 0 then
            return 0
        end
        PushDebugMessage("����ܰ��ʾ��" .. name .. " ��Ҫ[" .. need_chip .."] ����[" .. price .. "] �޹�[" .. MAXLimit .."] ����[" .. ChipCount .. "]")
        need_chip = need_chip - ChipCount
        if MAXLimit < need_chip then
            need_chip = MAXLimit
        end
        if maxbuy < need_chip then
            need_chip = maxbuy
        end
        PushDebugMessage("����ܰ��ʾ��" .. name .. " ���չ�������[" .. need_chip .. "]")
        return need_chip
    ]], g_ID))
    return tonumber(needBuyCount)
end

function BuyXinJueCY(needBuyCount)
    LUA_ȡ����ֵ(string.format([[
        local g_ID = %d
        local Num = %d
        local Name = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Name') .. "��ӡ"
        for i = 0, 67 do
            local theAction = EnumAction(i, "boothitem")
            if theAction:GetID() ~= 0 and theAction:GetName() == Name then
                NpcShop:BulkBuyItem(i, Num, 0)
                return
            end
        end
    ]], g_ID, needBuyCount))
end

function wear(xinJueName, index)
    LUA_ȡ����ֵ(string.format([[
        local Name, wz = "%s", "%s"
        for o = 1, 98 do
            if DataPool:LuaFnGetXingJuanInfo(o, 'Name') == Name then
                Clear_XSCRIPT();
                Set_XSCRIPT_Function_Name("InsertSlot");
                Set_XSCRIPT_ScriptID(888555);
                Set_XSCRIPT_Parameter(0, o);
                Set_XSCRIPT_Parameter(1, wz);
                Set_XSCRIPT_Parameter(2, 0);
                Set_XSCRIPT_ParamCount(3);
                Send_XSCRIPT();
                return
            end
        end
        for i = 1, 46 do
            if DataPool:LuaFnGetSkillCardInfo(i, "Level") ~= 0 then
                if DataPool:LuaFnGetSkillCardInfo(i, "Name") == Name then
                    Clear_XSCRIPT();
                    Set_XSCRIPT_Function_Name("InsertSlot");
                    Set_XSCRIPT_ScriptID(888555);
                    Set_XSCRIPT_Parameter(0, i);
                    Set_XSCRIPT_Parameter(1, wz);
                    Set_XSCRIPT_Parameter(2, 1);
                    Set_XSCRIPT_ParamCount(3);
                    Send_XSCRIPT();
                    return
                end
            end
        end
    ]], xinJueName, index))

end

function DownAllXinJue()
    LUA_Call([[
        for i = 1, 4 do
            local a = DataPool:LuaFnGetActivedXingJuanID(i)
            if a ~= 0 then
                Clear_XSCRIPT();
                Set_XSCRIPT_Function_Name("InsertSlot");
                Set_XSCRIPT_ScriptID(888555);
                Set_XSCRIPT_Parameter(0, a);
                Set_XSCRIPT_Parameter(1, 0);
                Set_XSCRIPT_Parameter(2, 0);
                Set_XSCRIPT_ParamCount(3);
                Send_XSCRIPT();
            end
        end
    ]])
end

function useXinJueCY(xinJueCYName)
    if ��ȡ������Ʒ����(xinJueCYName .. "��ӡ") ~= 0 then
        �Ҽ�ʹ����Ʒ(xinJueCYName .. "��ӡ")
        ��ʱ(1000)
        multiUseClick()
        ��ʱ(1000)
    end
end

function StartUP(xinJueName)
    useXinJueCY(xinJueName)

    if initialWZP(xinJueName) then
        local needBuyCYCount = GetNeedBuyCYCount()

        if needBuyCYCount > 0 then
            if �����Ƿ����("NewDungeon_DaibiShop") ~= 1 then
                ��ͼѰ·("����", 212, 52)
                ��ʱ(500)
                �Ի�NPC("����")
                ��ʱ(1000)
                NPC�����Ի�("��ɽ��")
                ��ʱ(1000)
            end

            BuyXinJueCY(needBuyCYCount)
            ��ʱ(1500)

            useXinJueCY(xinJueName)

        end

        while true do
            local ret = LevelUpXinJue()
            if ret == 0 then
                return false
            elseif ret == 2 then
                return true
            end
            ��ʱ(300)
        end

    else
        MentalTip(xinJueName .. "ʧ��")
        return true
    end
end



-- ������, ִ������ -----------------------------------------------------------------------------------------

if �ж�ͨ����ȫ��֤() ~= 1 then
    ��Ļ��ʾ("û����, ���Ƚ���")
    return
end

local _, menPai = ��ȡ��������()

local menPaiAttr = _menPaiAttrList[menPai]

local myMainAttr, myMainAttrVal = getPlayerMainAttr()

if myMainAttrVal < 1000 then
    if menPaiAttr then
        myMainAttr = menPaiAttr
        MentalTip("������Բ���1000��, ����������������" .. myMainAttr)
    end
end
MentalTip(string.format("������������: %s", myMainAttr))

ȡ����Ʒ("���")

ȡ����Ʒ("��Ʒ�ľ���¼|��Ʒ�ľ���¼|��Ʒ�ľ���¼")

local xinJueJiLu = {
    "��Ʒ�ľ���¼",
    "��Ʒ�ľ���¼",
    "��Ʒ�ľ���¼",
}

for i = 1, #xinJueJiLu do
    if ��ȡ������Ʒ����(xinJueJiLu[i]) ~= 0 then
        �Ҽ�ʹ����Ʒ(xinJueJiLu[i])
        ��ʱ(1000)
        multiUseClick()
        ��ʱ(1000)
    end
end

for i = 1, #�ľ������� do
    local xinJueName = �ľ�������[i]
    if string.find(xinJueName, "����") then
        xinJueName = string.gsub(xinJueName, "����", myMainAttr)
    end

    if StartUP(xinJueName) == false then
        break
    end
    ��ʱ(300)

end

if �Զ����� == 1 then
    if ���ѹ��ٴ� == 1 then
        DownAllXinJue()
        ��ʱ(1000)
    end

    for i = 1, 4 do
        local wearXinJueName = �ľ�����[i]
        if wearXinJueName then
            if string.find(wearXinJueName, "����") then
                wearXinJueName = string.gsub(wearXinJueName, "����", myMainAttr)
            end
            wear(wearXinJueName, i)
            ��ʱ(300)
        end

        local wearMJName = �ؼ�����[i]
        if wearMJName then
            if wearMJName == "75���ؼ�" then
                if myMainAttr == "��" then
                    wearMJName = "���߱���"
                elseif myMainAttr == "��" then
                    wearMJName = "�һ�����"
                elseif myMainAttr == "��" then
                    wearMJName = "�����Ὥ"
                elseif myMainAttr == "��" then
                    wearMJName = "����֮��"
                end
            end
            wear(Name, i)
            ��ʱ(300)
        end
    end
end

����Ʒ("���")