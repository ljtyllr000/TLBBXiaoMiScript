--1�� ������
��ʼ֮ǰȡǮ = 1
�Զ����� = 1
���ѹ��ٴ� = 1
��������� = 1
�ľ����� = { "���š�����", "ǲ��������", "Ͷ�ס�����", "����������" }
�ؼ����� = { "����ǧ��", "�����м�", "Ͷ������", "75���ؼ�" }

--������Գ���1000����� ����1000���趨
_������ = {
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
������ = {

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
    "���顤��",
    "����",
    "����",
    "����",
    "��Х",
    "����",
    "��Ȼ",
    "����",
    "����",
    "��ľ",
    "�ݶ�",
    "����",
    "�߲�",
    "��ˮ",
    "����",
    "�ϻ�",
    "ӽ��",
    "����",
    "ӿȪ",
    "����",
    "��Ļ",
    "�Ǵ�",
    "����",
    "�ɽ�",
    "�ֽ�",
    "��ζ",
    "���",
    "��м",
    "����",
    "����",
    "����",
    "����",
    "��ȸ",
    "����",
    "ֹ��",
    "����",
    "����",
    "�۽�",
    "��ñ",
}

--΢��[TL7665]

--23��3��30��



if �ж�ͨ����ȫ��֤()~=1 then

    ��Ļ��ʾ("û����")

    return

end

LUA_ȡ����ֵ([[


function retn(...)
    local ret = "return "
    for i = 1, table.getn(arg) do
        if type(arg[i]) == "number" then
            ret = ret .. tostring(arg[i])
        elseif type(arg[i]) == "string" then
            ret = ret .. "'" .. tostring(arg[i]) .. "'"
        elseif type(arg[i]) == "nil" then
            ret = ret .. "nil"
        elseif type(arg[i]) == "boolean" then
            if arg[i] then
                ret = ret .. "true"
            else
                ret = ret .. "false"
            end
        end

        if i ~= table.getn(arg) then
            ret = ret .. ","
        end
    end

    return ret
end

local function PushDebugMessageEx(str)
    PushDebugMessage(string.format("%-99s", str))
end

local g_ID = -1

function VX_TL7665(...)
    if arg[1] == "��ʼ��" then
        local name = arg[2]
        for o = 1, 98 do
            if DataPool:LuaFnGetXingJuanInfo(o, 'Name') == name then
                g_ID = o
                return retn(true)
            end
        end
        return retn(false)
    elseif arg[1] == "����ʹ��" then
        if IsWindowShow("Item_MultiUse") then
            Item_MultiUse_BuyMulti_Clicked()
        end
    elseif arg[1] == "��ȡ������" then
        local a = Player:GetData("ATTACKCOLD");
        local b = Player:GetData("ATTACKFIRE");
        local c = Player:GetData("ATTACKLIGHT");
        local d = Player:GetData("ATTACKPOISON");
        if a > b and a > c and a > d then
            return retn("��", a)
        elseif b > a and b > c and b > d then
            return retn("��", b)
        elseif c > a and c > b and c > d then
            return retn("��", c)
        elseif d > a and d > c and d > b then
            return retn("��", d)
        else
            return retn("δ֪", -1)
        end
    elseif arg[1] == "����" then
        --0���� 1�������� 2������һ��
        local jie = -1
        if DataPool:LuaFnGetXingJuanInfo(g_ID, 'UnLocked') == 1 then
            jie = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Order')
        end
        if jie == 5 then
            return retn(2)
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
            PushDebugMessageEx(string.format("��΢��TL7665��  %-12s ������", name))
            return retn(0)
        elseif need_money > money then
            PushDebugMessageEx(string.format("��΢��TL7665��  %-12s ��Ҳ���", name))
            return retn(0)
        elseif need_Chip > Chip then
            PushDebugMessageEx(string.format("��΢��TL7665��  %-12s ��ӡ����", name))
            return retn(2)
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
            return retn(1)
        end
    elseif arg[1] == "��Ҫ��������" then
        local name = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Name')
        local Order = 0

        if DataPool:LuaFnGetXingJuanInfo(g_ID, 'UnLocked') ~= 1 then
            Order = -1
        else
            Order = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Order')
        end

        if Order == 5 then
            PushDebugMessageEx(string.format("��΢��TL7665��  %-12s ������", name))
            return retn(0)
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
            return retn(0)
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
            return retn(0)
        end
        local need_chip = needtab[Order + 2]
        local maxbuy = math.floor(SHANHAIBI / price)
        if ChipCount >= need_chip or maxbuy == 0 then
            return retn(0)
        end
        PushDebugMessageEx(string.format("��΢��TL7665��  %-12s ��Ҫ[%d] ����[%d] �޹�[%d] ����[%d]", name, need_chip, price, MAXLimit, ChipCount))
        need_chip = need_chip - ChipCount
        if MAXLimit < need_chip then
            need_chip = MAXLimit
        end
        if maxbuy < need_chip then
            need_chip = maxbuy
        end
        PushDebugMessageEx(string.format("��΢��TL7665��  %-12s ���չ�������[%d]", name, need_chip))
        return retn(need_chip)
    elseif arg[1] == "����" then
        local Num = arg[2]
        local Name = DataPool:LuaFnGetXingJuanInfo(g_ID, 'Name') .. "��ӡ"
        for i = 0, 67 do
            local theAction = EnumAction(i, "boothitem")
            if theAction:GetID() ~= 0 and theAction:GetName() == Name then
                NpcShop:BulkBuyItem(i, Num, 0)
                return
            end
        end
    elseif arg[1] == "�ѹ�" then
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
    elseif arg[1] == "����" then
        local Name, wz = arg[2], arg[3]
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
    end
end


]])

local function ΢��TL7665(...)

    local a = {...}

    if a==nil then return end

    local str = "return VX_TL7665('"..a[1].."'"

    for i=2,#a do
        if type(a[i])=="string" then
            str = str .. ",'" .. tostring(a[i]) .. "'"
        else
            str = str .. "," .. tostring(a[i])
        end
    end

    str = str .. ");"

    local ret = LUA_ȡ����ֵ(str)

    if ret and string.find(ret,"return") then
        return loadstring(ret)()
    else
        return ret
    end

end



local function �Բ�ӡ(Name)

    if ��ȡ������Ʒ����(Name.."��ӡ")~=0 then

        �Ҽ�ʹ����Ʒ(Name.."��ӡ") ��ʱ(1000)

        ΢��TL7665("����ʹ��") ��ʱ(1000)

    end

end

local function StartUP(Name)

    �Բ�ӡ(Name)

    if ΢��TL7665("��ʼ��",Name) then

        local Num = ΢��TL7665("��Ҫ��������")

        if Num>0 then

            if �����Ƿ����("NewDungeon_DaibiShop")~=1 then

                ��ͼѰ·("����", 212, 52) ��ʱ(500)

                �Ի�NPC("����") ��ʱ(1000)

                NPC�����Ի�("��ɽ��") ��ʱ(1000)

            end

            ΢��TL7665("����",Num) ��ʱ(1500)

            �Բ�ӡ(Name)

        end

        while true do

            local ret = ΢��TL7665("����")

            if ret==0 then

                return false

            elseif ret==2 then

                return true

            end

            ��ʱ(300)

        end

    else

        ��Ļ��ʾ(Name.."ʧ��")

        return true

    end

end

local ��������,���� = ��ȡ��������()

local ���������� = _������[����]

local ������,ֵ = ΢��TL7665("��ȡ������")

if ֵ<1000 then

    if ���������� then

        ������ = ����������

        ��Ļ��ʾ("������Բ���1000�� ����������������"..������)

    end

end

��Ļ��ʾ("������ : "..������) ��ʱ(1000)

if ��ʼ֮ǰȡǮ==1 then

    ȡ����Ʒ("���")

end

ȡ����Ʒ("��Ʒ�ľ���¼|��Ʒ�ľ���¼|��Ʒ�ľ���¼")

local ��¼ = {

    "��Ʒ�ľ���¼",

    "��Ʒ�ľ���¼",

    "��Ʒ�ľ���¼",

}

for i=1,#��¼ do

    if ��ȡ������Ʒ����(��¼[i])~=0 then
        �Ҽ�ʹ����Ʒ(��¼[i]) ��ʱ(1000)
        ΢��TL7665("����ʹ��") ��ʱ(1000)
    end
end

for i=1,#������ do
    local Name = ������[i]
    if string.find(Name,"����") then
        Name = string.gsub(Name,"����",������)
    end

    if StartUP(Name)==false then
        break
    end
    ��ʱ(300)

end

if �Զ�����==1 then
    if ���ѹ��ٴ�==1 then
        ΢��TL7665("�ѹ�")��ʱ(1000)
    end

    for i=1,4 do
        local Name = �ľ�����[i]
        if Name then
            if string.find(Name,"����") then
                Name = string.gsub(Name,"����",������)
            end
            ΢��TL7665("����",Name,i) ��ʱ(300)
        end

        local Name = �ؼ�����[i]
        if Name then
            if Name=="75���ؼ�" then
                if ������=="��" then
                    Name = "���߱���"
                elseif ������=="��" then
                    Name = "�һ�����"
                elseif ������=="��" then
                    Name = "�����Ὥ"
                elseif ������=="��" then
                    Name = "����֮��"
                end
            end
            ΢��TL7665("����",Name,i) ��ʱ(300)
        end
    end
end

if ���������==1 then
    ����Ʒ("���")
end
