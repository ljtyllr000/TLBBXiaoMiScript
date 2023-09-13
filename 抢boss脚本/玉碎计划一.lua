�ų����� = "���ƣ�"
���ŵȴ�ʱ�� = 120   -- ��λ��

BOSS���� = "ç������"
BOSS����X, BOSS����Y = 70, 140

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function judgeInRaid()
    return LUA_ȡ����ֵ([[return Player:IsInRaid()]])
end

function GetBossInfo()
    if string.find(BOSS����, "ç������") then
        return "���䵺"
    elseif string.find(BOSS����, "����") then
        return "����"
    elseif string.find(BOSS����, "������") then
        return "��ɽ"
    elseif string.find(BOSS����, "ڤ��ū") then
        return "��ԭ"
    end
end

function GetTLZPos(TLZName, TLZNum)
    return LUA_ȡ����ֵ(string.format([[
        local currNum = DataPool:GetBaseBag_Num();
        local TLZName = "%s"
        local TLCNum = %d
        local TLZCount = 0
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
            local sName = theAction:GetName();
            if string.find(TLZName, sName) ~= nil then
                TLZCount = TLZCount + 1
                if TLZCount == TLCNum then
                    return i
                end
            end
        end
        return -1
    ]], TLZName, tonumber(TLZNum)))
end

function UseTuLingZhuPositioning()
    -- ʹ�������鶨λ
    -- ��λ��1��������
    if ��ȡ������Ʒ����("������") > 0 then
        �Ҽ�ʹ����Ʒ("������", 1);
        ��ʱ(1000)
        if �����Ƿ����("Item_TuDunZhu") == 1 then
            LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
            ��ʱ(1000)
            LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
        end
    end
    ��ʱ(1000)

    -- ��λ��2��������
    local secondTLZPos = GetTLZPos("������", 2)
    if tonumber(secondTLZPos) == -1 then
        return
    end

    local row = math.floor(tonumber(secondTLZPos) / 10)
    local col = math.floor(tonumber(secondTLZPos) % 10)
    if col == 0 then
        col = 10
    else
        row = row + 1
    end
    LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))
    ��ʱ(1000)
    if �����Ƿ����("Item_TuDunZhu") == 1 then
        LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
        ��ʱ(1000)
        LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
    end
end

function UseTuLingZhuTransmit()
    -- ʹ�������鴫��
    if ��ȡ������Ʒ����("������") > 0 then
        ����_������();

        �Ҽ�ʹ����Ʒ("������", 1);   -- Ĭ��ʹ�õ�һ��
        ��ʱ(1000)
        if �����Ƿ����("Item_TuDunZhu") == 1 then
            LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_Cancel_Clicked(1);");
            ��ʱ(2000)
        end
    end
end

function UseRoleSkills(RoleSkill, skillTarget)
    -- ʹ��������
    if tonumber(�жϼ�����ȴ(RoleSkill)) == 1 then
        SkillID = ��ȡ����ID(RoleSkill)
        ʹ�ü���(SkillID, skillTarget);
        ��ʱ(150)
    end
end

function UseRoleSkillAttack(attackTargetID)
    -- ������ϼ��ܣ���ʹ��
    if ���� == "��ң" then
        UseRoleSkills("��Խ����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��Ӣ��", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("����׷��", attackTargetID);
        UseRoleSkills("��ȸ��", attackTargetID);
        UseRoleSkills("����޼", attackTargetID);
        UseRoleSkills("����ʸ", attackTargetID);
    elseif ���� == "ؤ��" then
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("����Ͷ��", attackTargetID);
        UseRoleSkills("����ͷ", attackTargetID);
        UseRoleSkills("�����", attackTargetID);
    elseif ���� == "���" then
        UseRoleSkills("���޳���", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("һ������", attackTargetID);
        UseRoleSkills("δ����˥", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("Ǭ����", attackTargetID);
    elseif ���� == "��ɽ" then
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("����Ͷ��", attackTargetID);
        UseRoleSkills("���α���", attackTargetID);
        UseRoleSkills("�������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("�ھ�����", attackTargetID);
        UseRoleSkills("���Ϸ�", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("�콭����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "Ľ��" then
        UseRoleSkills("���쳱��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��ӡ���", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "ؤ��" then
        UseRoleSkills("�س��ݺ�", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "�һ���" then
        UseRoleSkills("��ҹ��", attackTargetID);
        UseRoleSkills("��֮����", attackTargetID);
        UseRoleSkills("����֮��", attackTargetID);
    elseif ���� == "�����" then
        UseRoleSkills("��������", attackTargetID);
    end
end

-- ִ������ ----------------------------------------------------------------------------------------------------
ִ�й���("ͬ����Ϸʱ��")
myName = ��ȡ������Ϣ(12)

if myName == �ų����� then
    LUA_Call([[setmetatable(_G, {__index = Union_Ensure_Env});Union_Ensure_OnEvent("OPNE_CREATE_RAID_CONFIRM");]])
    ��ʱ(2000)
    LUA_Call([[setmetatable(_G, {__index = Union_Ensure_Env});Union_Ensure_ConfirmClick();]])
    ��ʱ(1000)

    startTime = os.time()
    while true do
        if os.time() - startTime > ���ŵȴ�ʱ�� then
            break
        end
        LUA_Call([[Player:SendAgreeRaidApplication(0);]])
        ��ʱ(800)
    end
else
    ��ʱ(10000)
    while true do
        if judgeInRaid() == '0' then
            ִ�й���("����̶��ų�")
        else
            break
        end
        ��ʱ(1000)
    end
end

BossLocation = GetBossInfo()
if string.find(BOSS����, "��ɽ") then
    ��ͼѰ·("����", 113, 130)
end
��ͼѰ·(BossLocation, BOSS����X, BOSS����Y)

while true do
    local now_x = ��ȡ������Ϣ(7)
    local now_y = ��ȡ������Ϣ(8)
    if tonumber(now_x) == tonumber(BOSS����X) and tonumber(now_y) == tonumber(BOSS����Y) then
        break
    end
    ��ͼѰ·(BossLocation, BOSS����X, BOSS����Y)
    ��ʱ(1000)
end

UseTuLingZhuPositioning()
��ʱ(500)

����_������()

_, ����, _, _, _, _, _, _, _ = ��ȡ��������()
while true do
    _, ����ID, _, _, Ŀ��Ѫ��, _, _, _, _, _ = ������Χ��Ʒ(4, BOSS����, 15)

    if �ж���������() == 1 then
        -- �������ϣ��Զ���λ�ص�����ֻ�ص�һ�Σ�������س�
        ��������()
        �������ظ�()
        ��ʱ(1000)
        UseTuLingZhuTransmit()
        ��ʱ(2000)
    end

    if ����ID > 0 then
        if Ŀ��Ѫ�� > 0 then
            UseRoleSkillAttack(����ID)
            ��ʱ(110)
            UseRoleSkillAttack(����ID);
        else
            MentalTip("BOSS��������, ׼������!")
            MentalTip("BOSS��������, ׼������!")
            MentalTip("BOSS��������, ׼������!")
            ��ʱ(2000)
            break
        end
    end

    ��ʱ(200)  -- ��ֹ��������
end

��ʱ(1000)

ִ�й���("�˳��Ŷ�")
