local GetLuaValue = LUA_ȡ����ֵ
local Sleep = ��ʱ
local QuestFrameOptionClicked = NPC�����Ի�


function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function MoveToNPC(fx, fy, nId, npc_name)
    while true do
        if nId == ��ȡ������Ϣ(16) and �����������(fx, fy, ��ȡ������Ϣ(7), ��ȡ������Ϣ(8)) < 5 then
            �Ի�NPC(npc_name)
            Sleep(500)
            return
        else
            ��ͼѰ·(nId, fx, fy)
        end
    end
end

function IsWindowShow(name)
    if tonumber(GetLuaValue("if IsWindowShow('" .. name .. "') then return 1 end return 0", "n", 1)) == 1 then
        return true
    end
    return false
end

local tpname = { "��", "��ˮ", "��ľ", "���", "Ϣ��", }

function WashBaoYu(baoYuIndex, targetRate)
    local num = ��ȡ������Ʒ����("����Ȫ")
    local n2 = tonumber(GetLuaValue("local num=0 for i=1,5 do num=num+Player:GetFiveElements_JadeExtend(" .. baoYuIndex - 1 .. ",Player:GetFiveElements_JadeType(" .. baoYuIndex - 1 .. ",i-1))end return num", "n", 1))
    local n3 = tonumber(GetLuaValue("return Player:GetData('MONEY')+Player:GetData('MONEY_JZ')", "n", 1))
    MentalTip("����|��ǰ��ţ�" .. baoYuIndex .. " ֵ��" .. n2 .. "%% ����������" .. num .. " ��ң�" .. n3)
    while num >= 5 and n2 < targetRate and n3 >= 10000 do
        if IsWindowShow("EquipBaoJian_Wash") and string.find(GetLuaValue("setmetatable(_G, {__index = EquipBaoJian_Wash_Env})return EquipBaoJian_Wash_DragTitle:GetText()", "s", 1), tpname[baoYuIndex]) then
            MentalTip("��ϴ������" .. tpname[baoYuIndex])
            GetLuaValue(string.format([[
                baoYuIndex = %d
                Clear_XSCRIPT()
                    Set_XSCRIPT_Function_Name('FiveElementsJadeWash')
                    Set_XSCRIPT_ScriptID(880039)
                    Set_XSCRIPT_Parameter(0, baoYuIndex - 1)
                    Set_XSCRIPT_Parameter(1,2)
                    Set_XSCRIPT_ParamCount(2)
                Send_XSCRIPT()
			]], baoYuIndex))
            Sleep(1000)
            GetLuaValue("setmetatable(_G, {__index = WuhunQuest_Env})if this:IsVisible()then WuhunQuest_Bn1Click()end")
        else
            MoveToNPC(113, 200, "������", "������")
            QuestFrameOptionClicked("���б����ϴ")
            Sleep(500)
            QuestFrameOptionClicked(tpname[baoYuIndex] .. "�����ϴ")
        end
        Sleep(500)
        num = ��ȡ������Ʒ����("����Ȫ")
        n2 = tonumber(GetLuaValue("local num=0 for i=1,5 do num=num+Player:GetFiveElements_JadeExtend(" .. baoYuIndex - 1 .. ",Player:GetFiveElements_JadeType(" .. baoYuIndex - 1 .. ",i-1))end return num", "n", 1))
        n3 = tonumber(GetLuaValue("return Player:GetData('MONEY')+Player:GetData('MONEY_JZ')", "n", 1))
        MentalTip("��ǰ��ţ�" .. baoYuIndex .. " ֵ��" .. n2 .. "%% ����������" .. num .. " ��ң�" .. n3)
        Sleep(1000)
    end
end

--"��","��ˮ","��ľ","���","Ϣ��"
function Wash(addRate)
    WashBaoYu(1, addRate)  -- ��
    WashBaoYu(2, addRate)  -- ��ˮ
    WashBaoYu(3, addRate)  -- ��ľ
    WashBaoYu(4, addRate)  -- ���
    WashBaoYu(5, addRate)  -- Ϣ��
end

ȡ����Ʒ("����Ȫ")
ȡ����Ʒ("���")
����Ʒ("����Ȫ", ������Ʒ, 0, 1, 1)
Wash(30)
Wash(45)
Wash(65)
Wash(80)
Wash(100)

����Ʒ("���")
