--[΢��TL7665]

΢��TL7665_��ͯ���� = {
    ����ID = "00AE70B4",
    �������� = "�������޻�ͯ����",
    Ŀ��ɳ� = 4, --0��ͨ 1���� 2�ܳ� 3׿Խ 4����
    ��ɺ󻹸�˭ = "�뱭��ɽ",
    ʹ�÷ǰ� = false,
    ��ͯλ�� = { "����", 270, 306 },
    ����ʱ������ = 60 * 60 * 10,
    û���ҵ��˽��� = 15,
}


local ����ʱ�� = os.time()

local t = ΢��TL7665_��ͯ����

local file = "C:\\����С��\\TL7665.ini"

local Name = ��ȡ��������()

local function ΢��TL7665(...)

    local a = { ... }

    if a == nil then
        return
    end

    local str = "return VX_TL7665('" .. a[1] .. "'"

    for i = 2, #a do

        if type(a[i]) == "string" then

            str = str .. ",'" .. tostring(a[i]) .. "'"

        else

            str = str .. "," .. tostring(a[i])

        end

    end

    str = str .. ");"

    local ret = LUA_ȡ����ֵ(str)

    if string.find(ret, "return") then

        return loadstring(ret)()

    else

        return ret

    end

end

LUA_ȡ����ֵ([[
    --������Ǵ�ɵ�� û�������ǲ�����

    PushDebugMessage("΢��TL7665")

    function retn(...)

        local ret = "return "

        for i=1,table.getn(arg) do

            if type(arg[i])=="number" then

                ret = ret .. tostring(arg[i])

            elseif type(arg[i])=="string" then

                ret = ret .. "'" ..tostring(arg[i]) .. "'"

            elseif type(arg[i])=="nil" then

                ret = ret .. "nil"

            elseif type(arg[i])=="boolean" then

                if arg[i] then

                    ret = ret .. "true"

                else

                    ret = ret .. "false"

                end

            end

            if i~=table.getn(arg) then

                ret = ret .. ","

            end

        end

        return ret

    end

    function VX_TL7665(...)

        if arg[1]=="��ȡid" then

            for i=0,9 do

                if Pet:IsPresent(i) then

                    local strName,strName2,sex = Pet : GetID(i);

                    if strName2==arg[2] then

                        return retn(i)

                    end

                end

            end

            return retn(-1)

        elseif arg[1]=="���뱦��" then

            Exchange:AddPet(arg[2]);

        elseif arg[1]=="ȷ������" then

            if IsWindowShow("Exchange") then

                setmetatable(_G, {__index = Exchange_Env});

                if Exchange:IsLocked("self")==false then

                    Exchange_Lock_Button_Clicked()

                    return

                end

                if Trade_Accept_Button:GetProperty("Disabled")~="True" then

                    Trade_Accept_Button_Clicked()

                    return

                end

            end

        elseif arg[1]=="�Է�����" then

            return retn(Exchange:IsLocked('other'))

        elseif arg[1]=="����" then

            Target:SelectThePlayer(arg[2])

            if Target:GetName()==arg[2] then

                Exchange:SendExchangeApply();

            end

            return retn(Target:GetName()==arg[2])

        elseif arg[1]=="��ͯ" then

            local g_selidx = arg[2]

            local g_ItemPos = arg[3]

            local nItemID = PlayerPackage : GetItemTableIndex( g_ItemPos )

            local bRet = 0

            local g_HuanTongCJTS = {30503016,30503017,30503018,30503019,30503020}

            for i=1,table.getn(g_HuanTongCJTS) do

                if (g_HuanTongCJTS[i] == nItemID) then

                    bRet = 1

                end

            end

            if (bRet ~= 1) then

                Pet : SkillStudy_Do(2, g_selidx, g_ItemPos)

            else

                local hid,lid = Pet:GetGUID(g_selidx)

                Clear_XSCRIPT()

                    Set_XSCRIPT_Function_Name("OnPropagate")

                    Set_XSCRIPT_ScriptID(311111)

                    Set_XSCRIPT_Parameter(0,49)

                    Set_XSCRIPT_Parameter(1,hid)

                    Set_XSCRIPT_Parameter(2,lid)

                    Set_XSCRIPT_Parameter(3,0)

                    Set_XSCRIPT_Parameter(4,0)

                    Set_XSCRIPT_Parameter(5,g_ItemPos)

                    Set_XSCRIPT_Parameter(6,0)

                    Set_XSCRIPT_ParamCount(7)

                Send_XSCRIPT();

            end

        elseif arg[1]=="����" then

            local idx = arg[2]

            if not Pet:IsPresent(idx) then

                return

            end

            local hid,lid = Pet:GetGUID(idx)

            Clear_XSCRIPT()

                Set_XSCRIPT_Function_Name('OnInquiryForGrowRate')

                Set_XSCRIPT_ScriptID(1050);

                Set_XSCRIPT_Parameter(0,hid);

                Set_XSCRIPT_Parameter(1,lid);

                Set_XSCRIPT_ParamCount(2);

            Send_XSCRIPT();

        elseif arg[1]=="��ȡ�ɳ�" then

            local idx = arg[2]

            if not Pet:IsPresent(idx) then

                return retn(-1)

            end

            return retn(Pet:GetPetGrowLevel(idx,tonumber(Pet:GetGrowRate(idx))))

        elseif arg[1]=="��������" then

            return retn(Exchange:IsStillAnyAppInList())

        elseif arg[1]=="�򿪽���" then

            setmetatable(_G, {__index = MainMenuBar_Env});

            MainMenuBar_Exchange_Clicked();

        end

    end

]])

local function �ָ��ı�(szFullString, szSeparator)

    if szFullString == nil or szSeparator == nil then

        return

    end

    local nFindStartIndex = 1

    local nSplitIndex = 1

    local nSplitArray = {}

    while true do

        local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)

        if not nFindLastIndex then

            nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))

            break

        end

        nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)

        nFindStartIndex = nFindLastIndex + string.len(szSeparator)

        nSplitIndex = nSplitIndex + 1

    end

    return nSplitArray

end

local function ��ȡ��һ����()

    ��ͼѰ·(unpack(t.��ͯλ��))

    local ret = ��ȡ��Χ���("", ��ȡ������Ϣ(7), ��ȡ������Ϣ(8), 1)

    local ��Χ��� = �ָ��ı�(ret, "|")

    if ��Χ��� == nil then

        return "-1"

    end

    for i = 1, #��Χ��� do

        local _name = ��Χ���[i]

        local time = tonumber(��������(file, "PetHuantong", _name, "0"))

        if time + 30 >= os.time() then

            return _name

        end

    end

    return "-1"

end

local function ����һ����()

    local ��һ���ƴ� = 0

    while (os.time() < ����ʱ�� + t.����ʱ������) do

        ��ͼѰ·(unpack(t.��ͯλ��))

        local id = ΢��TL7665("��ȡid", t.����ID)

        if id == -1 then

            return

        end

        local ��һ�� = ��ȡ��һ����()

        if ��һ�� == "-1" then

            ��һ���ƴ� = ��һ���ƴ� + 1

            ��Ļ��ʾ("û���ҵ���һ���� : " .. ��һ���ƴ�)

            if ��һ���ƴ� >= t.û���ҵ��˽��� then

                д������(file, "�ɳ�", t.����ID, "-2")

                ����Ʒ(t.��������)

                ����Ʒ("���")

                return

            end

            ��ʱ(3000)
        else
            for oo = 1, 10 do
                --����һ����
                if �����Ƿ����("Exchange") ~= 1 then
                    ΢��TL7665("����", ��һ��)
                    ��ʱ(3000)
                else
                    while �����Ƿ����("Exchange") == 1 do
                        ΢��TL7665("���뱦��", id)
                        ��ʱ(1000)
                        ΢��TL7665("���뱦��", id)
                        ��ʱ(1000)
                        ΢��TL7665("ȷ������")
                        ��ʱ(1000)
                        ΢��TL7665("ȷ������")
                        ��ʱ(1000)
                    end

                    break
                end
            end
        end
    end
end

local function ������һ����()
    while (os.time() < ����ʱ�� + t.����ʱ������) do
        local id = ΢��TL7665("��ȡid", t.����ID)

        if id == -1 then
            return
        end

        ��ͼѰ·(unpack(t.��ͯλ��))

        if �����Ƿ����("Exchange") ~= 1 then
            ΢��TL7665("����", t.��ɺ󻹸�˭)
            ��ʱ(3000)
        else

            while �����Ƿ����("Exchange") == 1 do
                ΢��TL7665("���뱦��", id)
                ��ʱ(1000)
                ΢��TL7665("���뱦��", id)
                ��ʱ(1000)
                ΢��TL7665("ȷ������")
                ��ʱ(1000)
                ΢��TL7665("ȷ������")
                ��ʱ(1000)
            end
        end
    end
end

local id = ΢��TL7665("��ȡid", t.����ID)

if (id ~= -1) then
    local �ɳ� = ΢��TL7665("��ȡ�ɳ�", id)
    д������(file, "�ɳ�", t.����ID, tostring(�ɳ�))
end

ȡ����Ʒ("���")

ȡ����Ʒ(t.��������)

if t.ʹ�÷ǰ� == false then
    ��Ļ��ʾ("��ʹ�ÿɽ��׵�" .. t.�������� .. "������ֿ��С�")
    ����Ʒ(t.��������, nil, 0, 1, 1)
    --����1���ɲ���  ����2���ɲ��� ����3��1��ֻ��� 0������� ����4��1��ֻ�治�� 0������� ����5:1����ֹ�Զ���Ǯ
end

while (os.time() < ����ʱ�� + t.����ʱ������) do
    local id = ΢��TL7665("��ȡid", t.����ID)

    if (id == -1) then
        ��ͼѰ·(unpack(t.��ͯλ��))
        local �ɳ� = tonumber(��������(file, "�ɳ�", t.����ID, "0"))
        if �ɳ� then
            ��Ļ��ʾ("��ǰ�ɳ��� : " .. �ɳ�)
            if �ɳ� >= t.Ŀ��ɳ� then
                ��Ļ��ʾ("�ɳ����ѴﵽҪ�� ��������")
                break
            end
        end

        local money = ��ȡ������Ϣ(45) + ��ȡ������Ϣ(52)
        if money < 10000 then
            ��Ļ��ʾ("��Ҳ��� ��������")
            break
        end

        if ��ȡ������Ʒ����(t.��������) == 0 then
            ��Ļ��ʾ("û������ ��������")
            break
        end

        д������(file, "PetHuantong", Name, os.time())

        if ΢��TL7665("��������") then
            ΢��TL7665("�򿪽���")
            ��ʱ(1200)
            while �����Ƿ����("Exchange") == 1 do
                if ΢��TL7665("�Է�����") then
                    ��ʱ(1000)
                    ΢��TL7665("ȷ������")
                    ��ʱ(1000)
                    ΢��TL7665("ȷ������")
                    ��ʱ(1000)
                end
            end
        else
            ��Ļ��ʾ("���޲��������� �ȴ�����")
        end
    else
        local money = ��ȡ������Ϣ(45) + ��ȡ������Ϣ(52)
        local �ɳ� = ΢��TL7665("��ȡ�ɳ�", id)
        д������(file, "�ɳ�", t.����ID, tostring(�ɳ�))

        if �ɳ� == -1 then
            if money < 10000 then
                ��Ļ��ʾ("��Ҳ��� ����һ����")
                д������(file, "PetHuantong", Name, "0")
                ����һ����()
                break
            end

            ΢��TL7665("����", id)
            ��ʱ(1200)

        elseif �ɳ� >= t.Ŀ��ɳ� then
            ��Ļ��ʾ("�ɳ����ѴﵽҪ�� ������һ����")
            ������һ����()
            break
        else
            if money < 10000 then
                ��Ļ��ʾ("��Ҳ��� ����һ����")
                д������(file, "PetHuantong", Name, "0")
                ����һ����()
                break
            end

            if ��ȡ������Ʒ����(t.��������) == 0 then
                ��Ļ��ʾ("û������ ����һ����")
                д������(file, "PetHuantong", Name, "0")
                ����һ����()
                break
            end

            ΢��TL7665("��ͯ", id, ��ȡ������Ʒλ��(t.��������) - 1)
            ��ʱ(1200)

        end
    end
    ��ʱ(1000)
end

��ʱ(3000)

while (os.time() < ����ʱ�� + t.����ʱ������) and Name == t.��ɺ󻹸�˭ do
    local id = ΢��TL7665("��ȡid", t.����ID)
    if id ~= -1 then
        return
    end

    ��ͼѰ·(unpack(t.��ͯλ��))

    local �ɳ� = tonumber(��������(file, "�ɳ�", t.����ID, "0"))

    if �ɳ� then
        ��Ļ��ʾ("��ǰ�ɳ��� : " .. �ɳ�)
        if �ɳ� >= t.Ŀ��ɳ� then
            ��ͼѰ·(unpack(t.��ͯλ��))
            if ΢��TL7665("��������") then
                ΢��TL7665("�򿪽���")
                ��ʱ(1200)
                while �����Ƿ����("Exchange") == 1 do
                    if ΢��TL7665("�Է�����") then
                        ��ʱ(1000)
                        ΢��TL7665("ȷ������")
                        ��ʱ(1000)
                        ΢��TL7665("ȷ������")
                        ��ʱ(1000)
                    end
                end
            else
                ��Ļ��ʾ("ϴ���� �ȴ����޹�λ")
            end

        elseif �ɳ� == -2 then
            ��Ļ��ʾ("ûϴ���� ���õ��� ����")
            break
        end
    else
        break
    end

    ��ʱ(1000)
end

����Ʒ(t.��������)

����Ʒ("���")
