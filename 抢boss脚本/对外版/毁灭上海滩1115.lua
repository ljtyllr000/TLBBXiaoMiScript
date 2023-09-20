ת�ŵĶӶӳ����� = "���ƣ�"
���ŵȴ�ʱ�� = 120   -- ��λ��

ͬ�˺������� = ""  -- ͬ�������Զ�����
boss�㺰������ = ""  -- boss�����˺���

BOSS���� = "ç������"
BOSS����X, BOSS����Y = 70, 140

-- ������|������|�A���A���^
�������� = "������"  -- ������� | �ֿ�, �����֧��ģ��ƥ��, "" ��ʾ���жϰ��
����ȴ��������ʱ�� = 10 * 60   -- ��λ��, �к��������ʱ, ���ڳ���ȴ���ʱ��

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

function ABC(tmpList)
    local retList = {}
    for i = 1, #tmpList do
        if tmpList[i] >= 2304 and tmpList[i] <= 3249 then
            local ele = math.sqrt(tmpList[i])
            table.insert(retList, tonumber(ele))
        end
    end
    return retList
end

function ABL()
    local ttt = LUA_ȡ����ֵ("return DataPool:GetServerDayTime();", "n", 1)
    local tmp = {4755, 2500, 5951, 9586, 2304, 6295, 2500, 4039, 2601, 7090, 7512, 2401, 5838, 3940, 2401, 3980, 9854, 2401, 1697, 5059, 2809, 1687}
    local tmpList = ABC(tmp)
    local abc = ''
    if #tmpList ~= 8 then
        return 0
    end
    for i = 1, #tmpList do
        abc = abc .. string.char(tmpList[i])
    end
    if tonumber(ttt) > tonumber(abc) then
        return 0
    end
    return 1
end

function judgeGuildWar(enemyGuildName)
    LUA_Call([[
        setmetatable(_G, {__index = MiniMap_Env});MiniMap_XuanZhanList();
    ]])
    ��ʱ(5000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_RankingList_Env});NewBangHui_RankingList_Close();]])

    local is_fight = LUA_ȡ����ֵ(string.format([[
        local enemyGuildName = "%s"
        local nRankListNum = City:GetBattleRankListNum();
        if nRankListNum == 0 then
            return 0;
        end

        for i = 0, nRankListNum-1 do
            local RivalGuildNameOnly = City:EnumBattleRankList(i,"RivalGuildNameOnly")
            local xzType             = City:EnumBattleRankList(i,"XuanZhanType")
            if string.find(RivalGuildNameOnly, enemyGuildName) then
                return 1
            end
        end
        return 0
    ]], enemyGuildName))

    if tonumber(is_fight) == 1 then
        return true
    else
        return false
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
    if ��ȡ������Ʒ����("������") > 0 then
        ����_������();

        �Ҽ�ʹ����Ʒ("������", 1);   -- Ĭ��ʹ�õ�һ��
        ��ʱ(1000)
        while true do
            if �����Ƿ����("Item_TuDunZhu") == 1 then
                LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_Cancel_Clicked(1);");
                break
            end
            ��ʱ(500)
        end
        ��ʱ(2000)
    end
end

function UseRoleSkills(RoleSkill, skillTarget)
    if tonumber(�жϼ�����ȴ(RoleSkill)) == 1 then
        SkillID = ��ȡ����ID(RoleSkill)
        ʹ�ü���(SkillID, skillTarget);
        ��ʱ(150)
    end
end

function UseRoleSkills2(RoleSkill)
    if tonumber(�жϼ�����ȴ(RoleSkill)) == 1 then
        local SkillID = ��ȡ����ID(RoleSkill)
        ʹ�ü���(SkillID);
        ��ʱ(150)
    end
end

function UseRoleSkillAttack(attackTargetID)
    -- ������ϼ��ܣ���ʹ��
    if ���� == "��ң" then
        UseRoleSkills("���κ���", attackTargetID);
        UseRoleSkills("��Խ����", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("��Ӣ��", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("�������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("����׷��", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("����ʸ", attackTargetID);
    elseif ���� == "ؤ��" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("�����л�", attackTargetID);
        UseRoleSkills("����Ͷ��", attackTargetID);
        UseRoleSkills("����ͷ", attackTargetID);
        UseRoleSkills("�����", attackTargetID);
    elseif ���� == "���" then
        UseRoleSkills("һ������", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("���޳���", attackTargetID);
        UseRoleSkills("δ����˥", attackTargetID);
        UseRoleSkills("Ǭ����", attackTargetID);
    elseif ���� == "��ɽ" then
        UseRoleSkills("�ƻ���ľ", attackTargetID);
        UseRoleSkills("���α���", attackTargetID);
        UseRoleSkills("�������", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("�ھ�����", attackTargetID);
        UseRoleSkills("���Ϸ�", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("������ɽ", attackTargetID);
        UseRoleSkills("�콭����", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("���ͬ��", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("Ц��ص�", attackTargetID);
        UseRoleSkills("���߶���", attackTargetID);
        UseRoleSkills("��ɰ��", attackTargetID);
    elseif ���� == "�䵱" then
        UseRoleSkills("��ҫ����", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("����ָ·", attackTargetID);
        UseRoleSkills("��Ů����", attackTargetID);
        UseRoleSkills("̫Ԩʮ����", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "����" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("�г彣", attackTargetID);
        UseRoleSkills("����", attackTargetID);
        UseRoleSkills("������", attackTargetID);
        UseRoleSkills("����ŭ��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("һ��ָ", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "Ľ��" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("�ὣ����", attackTargetID);
        UseRoleSkills("����ʽ", attackTargetID);
        UseRoleSkills("���쳱��", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("������ɽ", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("�ھ�����", attackTargetID);
        UseRoleSkills("ʨ�Ӻ�", attackTargetID);
        UseRoleSkills("��ӡ���", attackTargetID);
        UseRoleSkills("���������", attackTargetID);
        UseRoleSkills("����ȭ", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("������˫", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("�ھ�����", attackTargetID);
        UseRoleSkills("���ȼ�", attackTargetID);
        UseRoleSkills("���ճ��", attackTargetID);
        UseRoleSkills("ˮ���߾�", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "�һ���" then
        UseRoleSkills("��֮����", attackTargetID);
        UseRoleSkills("���˲�Թ", attackTargetID);
        UseRoleSkills("��ҹ��", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("����֮��", attackTargetID);
    elseif ���� == "�����" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("��������", attackTargetID);
            UseRoleSkills("��������", attackTargetID);
        end
        UseRoleSkills("�һ�����", attackTargetID);
        UseRoleSkills("�л�ǧ��", attackTargetID);
    end
end

function UseEnhancedSkill()
    if ���� == "����" then
        UseRoleSkills2("�������")
    elseif ���� == "����" then
        UseRoleSkills2("��������")
    elseif ���� == "Ľ��" then
        UseRoleSkills2("��ϼӳ��")
    elseif ���� == "����" then
        UseRoleSkills2("ŭ����ն")
        UseRoleSkills2("�����޼�")
    elseif ���� == "����" then
        UseRoleSkills2("ն���")
    end
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

function BackToCity()
    -- �س�
    local current_map = ��ȡ������Ϣ(16)
    local mainCity = { '����', '����', '����', '¥��' }
    local inMainCity = 0
    for k, value in pairs(mainCity) do
        if value == current_map then
            inMainCity = 1
            break
        end
    end
    if inMainCity == 1 then
        -- �����ǾͲ�ʹ�ö�λ�سǣ���ʡֽ�ɻ�
        return
    end

    local downZQ = 0
    while true do
        if downZQ >= 3 then
            break
        end
        if tonumber(��ȡ������Ϣ(13)) == 0 then
            ����_������()
            ��ʱ(1000)
        else
            break
        end
        downZQ = downZQ + 1
    end

    if ��ȡ������Ʒ����("��ɫ��λ��") > 0 then
        �Ҽ�ʹ����Ʒ("��ɫ��λ��")
        ��ʱ(1500)
    elseif ��ȡ������Ʒ����("��ɫ��λ��") > 0 then
        �Ҽ�ʹ����Ʒ("��ɫ��λ��")
        ��ʱ(1500)
    elseif ��ȡ������Ʒ����("��ɫ��λ��") > 0 then
        �Ҽ�ʹ����Ʒ("��ɫ��λ��")
        ��ʱ(1500)
    elseif ��ȡ������Ʒ����("��ɫ��λ��") > 0 then
        �Ҽ�ʹ����Ʒ("��ɫ��λ��")
        ��ʱ(1500)
    elseif ��ȡ������Ʒ����("��ɫ��λ��") > 0 then
        �Ҽ�ʹ����Ʒ("��ɫ��λ��")
        ��ʱ(1500)
    elseif ��ȡ������Ʒ����("��ɫ��λ��") > 0 then
        �Ҽ�ʹ����Ʒ("��ɫ��λ��")
        ��ʱ(1500)
    elseif ��ȡ������Ʒ����("�����ټ���") > 0 then
        �Ҽ�ʹ����Ʒ("�����ټ���")
        ��ʱ(1500)
    else
        ִ�й���("����س�")
        ��ʱ(1500)
    end
end

function AudgeQmFu()
    local tmp = LUA_ȡ����ֵ([[
        local zoneworldid =  DataPool:GetSelfZoneWorldID()
        return zoneworldid
    ]])
    return tmp
end

function AddBuff()
    local downZQ = 0
    -- ������
    while true do
        if downZQ >= 3 then
            break
        end
        if tonumber(��ȡ������Ϣ(13)) == 0 then
            ����_������()
            ��ʱ(1000)
        else
            break
        end
        downZQ = downZQ + 1
    end

    -- ʹ�ð�������
    if �жϼ�����ȴ("��������") == 1 then
        local HideSkillID = ��ȡ����ID("��������")
        ʹ�ü���(HideSkillID)
        ��ʱ(2000)
    end

    -- �ж��Ƿ��ݡ�ʹ����
    local jieBaiCount = LUA_ȡ����ֵ([[
        local m_DataCount = DataPool:GetBrotherCount()
        return m_DataCount
    ]])
    LUA_Call([[DataPool:AskBrotherInfo()]])
    ��ʱ(1000)
    if tonumber(jieBaiCount) > 1 then
        if �жϼ�����ȴ("�츲��") == 1 then
            local HideSkillID = ��ȡ����ID("�츲��")
            ʹ�ü���(HideSkillID)
            ��ʱ(2000)
        end
    end
end


function judgePosedTLZExist(TLZName, originCount)
    local nowTLZCount = ��ȡ������Ʒ����(TLZName)
    if nowTLZCount == 0 or nowTLZCount <= (originCount - 2) then
        return 0
    end
    return 1
end


-- ִ������ ----------------------------------------------------------------------------------------------------
-- ִ������ ----------------------------------------------------------------------------------------------------
-- ִ������ ----------------------------------------------------------------------------------------------------
ִ�й���("ͬ����Ϸʱ��")
myName = ��ȡ������Ϣ(12)
myLevel = ��ȡ������Ϣ(26)
ttpRet = AudgeQmFu()
if ttpRet ~= nil and ttpRet ~= "" then
    if tonumber(ttpRet) == 155 then
        ��Ļ��ʾ()
    else
        MentalTip("��ָ�����޷�ʹ��")
        return
    end
else
    return
end

tmpRet = ABL()

-- �ж��Ƿ��к��������
waitInCity = false
local guildFireBlack = StringSplit(��������, "|")
for i = 1, #guildFireBlack do
    local hasBlackFire = judgeGuildWar(guildFireBlack[i])
    if hasBlackFire then
        waitInCity = true
        break
    end
end

if tmpRet == 0 then
    MentalTip("�ű��ѹ���")
    return
end

-- ת�š��������
if myName == ת�ŵĶӶӳ����� then
    while true do
        if judgeInRaid() == '1' then
            break
        end
        MentalTip("�ų����ڶ��鿪ʼ���Զ���ת����")
        LUA_Call([[setmetatable(_G, {__index = Union_Ensure_Env});Union_Ensure_OnEvent("OPNE_CREATE_RAID_CONFIRM");]])
        ��ʱ(3000)
        LUA_Call([[setmetatable(_G, {__index = Union_Ensure_Env});Union_Ensure_ConfirmClick();]])
    end

    startTime = os.time()
    while true do
        if os.time() - startTime > ���ŵȴ�ʱ�� then
            break
        end
        LUA_Call([[Player:SendAgreeRaidApplication(0);]])
        ��ʱ(300)
        if ͬ�˺������� ~= nil and ͬ�˺������� then
            LUA_Call(string.format([[
                setmetatable(_G, {__index = ChatFrame_Env});Talk : SendChatMessage('guild_league', '%s');
            ]], ͬ�˺�������))
        end
    end
else
    local tmp = 1
    while true do
        if tmp >= 15 then
            break
        end
        MentalTip(string.format("�ȴ���%d���뿪ʼ������̶��ų�����", 15 - tmp))
        tmp = tmp + 1
        ��ʱ(1000)
    end
    while true do
        if judgeInRaid() == '0' then
            ִ�й���("����̶��ų�")
        else
            break
        end
        ��ʱ(1000)
    end
end


-- �سǼ�״̬����Ѫ��ŭ
MentalTip("�سǼ�״̬, ����Ѫ��ŭ������")
BackToCity()
��ʱ(2000)
AddBuff()
��ʱ(1000)
ִ�й���("������Ѫ")

originTLZCount = ��ȡ������Ʒ����("������")

-- û�ڻ�ĺ��ϵ�ȴ������
if not waitInCity then
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
            if judgePosedTLZExist("������", originTLZCount) == 1 then
                UseTuLingZhuTransmit()
            else
                if string.find(BOSS����, "��ɽ") then
                    ��ͼѰ·("����", 113, 130)
                end
                ��ͼѰ·(BossLocation, BOSS����X, BOSS����Y)
                ��ʱ(1000)
                ����_������()
				��ʱ(500)
				����_������()
				��ʱ(500)
				����_������()
            end
            ��ʱ(2000)
        end

        if boss�㺰������ ~= nil and boss�㺰������ ~= "" then
            LUA_Call(string.format([[
                setmetatable(_G, {__index = ChatFrame_Env});Talk : SendChatMessage('near', '%s');
            ]], boss�㺰������))
        end

        --UseEnhancedSkill()  -- Ĭ�ϲ���Ч, ���Կ�����������������С�ն�����

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
        else
            local now_x = ��ȡ������Ϣ(7)
            local now_y = ��ȡ������Ϣ(8)
            if tonumber(�����������(now_x,now_y,BOSS����X,BOSS����Y)) > 5 then
                ��ͼѰ·(BossLocation, BOSS����X, BOSS����Y)
            end
        end

        ��ʱ(200)  -- ��ֹ��������
    end

    ��ʱ(1000)

else
    local sleepCount = 0
    while true do
        if sleepCount >= ����ȴ��������ʱ�� then
            break
        end
        MentalTip(string.format("���İ����ں����������, �ȴ���%d�����˳��Ŷӽ�������", (����ȴ��������ʱ�� - sleepCount)))
        sleepCount = sleepCount + 1
        ��ʱ(1000)
    end
end

ִ�й���("�˳��Ŷ�")
