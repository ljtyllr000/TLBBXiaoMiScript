function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function JudgeHasAgname(Agname)
    -- �ж��Ƿ��иóƺ�
    local hasChengHao = LUA_ȡ����ֵ(string.format([[
        local targetAgname = "%s"
        local nAgnameNum = Player:GetAgnameNum();
        for k=0, nAgnameNum-1 do
            local szAgnameName, _ = Player:EnumAgname(k, "name", 0);
            -- local effect = Player:EnumAgname(k, "effect", 0, 0)
            if string.find(szAgnameName, targetAgname) then
                return 1
            end
        end
        return 0
    ]], Agname))
    return hasChengHao
end

function MoveToNPC(NPCCity, x, y)
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

function PiaoMiaoFengAgname()
    ȡ����Ʒ("�������")
    local AgnameList = { '���֮��â����', '���֮������˫', '���֮ս�޲�ʤ', '���֮�����ݺ�', '���֮Ψ�Ҷ���', '���֮��������' }
    if tonumber(JudgeHasAgname("���֮��������")) == 1 then
        MentalTip("����ӵ�С����֮�������¡��ƺ�, ���������������")
        ȡ����Ʒ("�������")
        ��ʱ(1000)
        �Զ����("�������")
    else
        MentalTip("ǰ�� ¥����193, 224������˪���һ�����翷塿�ƺ�")
        MoveToNPC("¥��", 193, 224)
        ��ʱ(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                �Ի�NPC("����˪")
                ��ʱ(1000)
                NPC�����Ի�("��������һ�����")
                ��ʱ(1000)
                NPC�����Ի�(agname)
                ��ʱ(1000)
                NPC�����Ի�("��Ҫ�һ�")
                ��ʱ(1000)
            end
        end

    end
end

function BingShengQiZhenAgname()
    local AgnameList = { '��������', 'ɱ������', '�۲�ΰ��', '��ʥ�ŷ�', '�����˫' }
    ȡ����Ʒ("�����ȷ�ӡ")
    if tonumber(JudgeHasAgname("�����˫")) == 1 then
        MentalTip("����ӵ�С������˫���ƺ�, ������ �����ȷ�ӡ")
        ȡ����Ʒ("�����ȷ�ӡ")
        ��ʱ(1000)
        �Զ����("�����ȷ�ӡ")
    else
        MentalTip("ǰ�� ������271, 202�������Ŵ��һ�����ʥ���󡿳ƺ�")
        MoveToNPC("����", 271, 202)
        ��ʱ(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                �Ի�NPC("������")
                ��ʱ(1000)
                NPC�����Ի�("�һ��ƺ�")
                ��ʱ(1000)
                NPC�����Ի�('�һ��ƺ�' .. agname)
                ��ʱ(1000)
                NPC�����Ի�("ȷ��")
                ��ʱ(1000)
            end
        end
    end
end

function FuDiAgname()
    local AgnameList = { '���������â��', '��ң�ɸ�������', '�ŋ�������Ǭ��', '������ɽ�����' }
    ȡ����Ʒ("���µ���")
    if tonumber(JudgeHasAgname("������ɽ�����")) == 1 then
        MentalTip("����ӵ�С�������ɽ����ݡ��ƺ�, ������ ���µ���")
        ȡ����Ʒ("���µ���")
        ��ʱ(1000)
        �Զ����("���µ���")
    else
        MentalTip("ǰ�� ����293, 92�������ܴ��һ����ŋָ��ء��ƺ�")
        MoveToNPC("����", 293, 92)
        ��ʱ(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                �Ի�NPC("������")
                ��ʱ(1000)
                NPC�����Ի�("�һ��ŋָ��سƺ�")
                ��ʱ(1000)
                NPC�����Ի�(agname)
                ��ʱ(1000)
            end
        end
    end
end

function LaoSanAgname()
    local AgnameList = { '�˷���ʿ', '�Ʒ���ʿ', '���Ӣ��', '���·˼���' }
    if tonumber(JudgeHasAgname("���·˼���")) == 1 then
        MentalTip("����ӵ�С����·˼���ƺţ�����")
    else
        MentalTip("ǰ�� ���� Ǯ���134, 260��Ǯ�����ȡ������Ͽ�ȡ��ƺ�")
        MoveToNPC("����", 134, 260)
        ��ʱ(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                �Ի�NPC("Ǯ����")
                ��ʱ(1000)
                NPC�����Ի�("��ȡ�ƺ�")
                ��ʱ(1000)
                NPC�����Ի�("��ȡ�µĳƺ�")
                ��ʱ(1000)
            end
        end
    end
end

function FanZeiAgname()
    local AgnameList = { 'ƽ��ʿ��', 'ƽ���ӳ�', 'ƽ��ͳ��', '���ܽ���', '����Ԫ˧' }
    if tonumber(JudgeHasAgname("����Ԫ˧")) == 1 then
        MentalTip("����ӵ�С�����Ԫ˧���ƺţ�����")
    else
        MentalTip("ǰ�� ������296, 243��������ȡ���������֡��ƺ�")
        MoveToNPC("����", 296, 243)
        ��ʱ(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                �Ի�NPC("��")
                ��ʱ(1000)
                NPC�����Ի�("��Ҫ�һ��ҵĳƺ�")
                ��ʱ(1000)
            end
        end
    end
end

function SongLiaoAgname()
    local AgnameList = { '������', '�ս���', '��ɽ��', '�ݺ�܇', '��ʿ��˫' }
    if tonumber(JudgeHasAgname("��ʿ��˫")) == 1 then
        MentalTip("����ӵ�С���ʿ��˫���ƺţ�����")
    else
        MentalTip("ǰ�� ���ݣ�293, 241����������ȡ�����ɴ�ս���ƺ�")
        MoveToNPC("����", 293, 241)
        ��ʱ(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                �Ի�NPC("����")
                ��ʱ(1000)
                NPC�����Ի�("��ȡ���ɴ�ս�ƺ�")
                ��ʱ(1000)
                NPC�����Ի�(agname, 1)
                ��ʱ(1000)
            end
        end
    end
end

function ShuaXingAgname()
    local AgnameList = {'�ֹ�����' }
    local itemIndex = { 1 }
    if tonumber(JudgeHasAgname("�ֹ�����")) == 1 then
        MentalTip("����ӵ�С��ֹ��������ƺţ�����")
    else
        MentalTip("ǰ�� ������355, 236�������˴� �ƽ����й���ˢ�ǡ��ƺ�")
        MoveToNPC("����", 355, 236)
        ��ʱ(1000)

        for index, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                �Ի�NPC("������")
                ��ʱ(1000)
                NPC�����Ի�("�ƽ���")
                ��ʱ(1000)
                if index == 4 then
                    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_PageDown();]])
                    ��ʱ(1000)
                end
                LUA_Call(string.format([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_Clicked(%d)]], itemIndex[index]))  -- ���
                ��ʱ(100)
                LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy2_Env});ActivitySchedule_MBuy2_OK_Clicked();]])  -- �������
            end
        end

        �Ҽ�ʹ����Ʒ("�ƺţ���Ŀ����")
        �Ҽ�ʹ����Ʒ("�ƺţ���������")
        �Ҽ�ʹ����Ʒ("�ƺţ���������")
        �Ҽ�ʹ����Ʒ("�ƺţ��ֹ�����")

    end

end

-- main ---------------------------------------------------------------
PiaoMiaoFengAgname()
LaoSanAgname()
SongLiaoAgname()
FanZeiAgname()
BingShengQiZhenAgname()
FuDiAgname()
ShuaXingAgname()
