lifeSkillId = {
    ABILITY_PENGREN = 1, --��⿼��ܶ�Ӧ���
    ABILITY_ZHIYAO = 2, --��ҩ���ܶ�Ӧ���
    ABILITY_XIANGQIAN = 3, --��Ƕ���ܶ�Ӧ���
    ABILITY_ZHUZAO = 4, --���켼�ܶ�Ӧ���
    ABILITY_FENGREN = 5, --���Ҽ��ܶ�Ӧ���
    ABILITY_GONGYI = 6, --�����������ܶ�Ӧ���
    ABILITY_CAIKUANG = 7, --�ɿ��ܶ�Ӧ���
    ABILITY_CAIYAO = 8, --��ҩ���ܶ�Ӧ���
    ABILITY_DIAOYU = 9, --���㼼�ܶ�Ӧ���
    ABILITY_ZHONGZHI = 10, --��ֲ���ܶ�Ӧ���
    ABILITY_KAIGUANG = 11, --���⼼�ܶ�Ӧ���
    ABILITY_SHENGHUOSHU = 12, --ʥ�������ܶ�Ӧ���
    ABILITY_NIANGJIU = 13, --��Ƽ��ܶ�Ӧ���
    ABILITY_XUANBINGSHU = 14, --���������ܶ�Ӧ���
    ABILITY_ZHIGU = 15, --�ƹƼ��ܶ�Ӧ���
    ABILITY_ZHIDU = 16, --�ƶ����ܶ�Ӧ���
    ABILITY_ZHIFU = 17, --�Ʒ����ܶ�Ӧ���
    ABILITY_LIANDAN = 18, --�������ܶ�Ӧ���
    ABILITY_QIMENDUNJIA = 19, --���Ŷݼ׼��ܶ�Ӧ���
    ABILITY_GONGCHENGXUE = 20, --����ѧ���ܶ�Ӧ���
    ABILITY_QUGUI = 21, --�����ܶ�Ӧ���
    ABILITY_WABAO = 22, --�ڱ����ܶ�Ӧ���
    ABILITY_PAOSHANG = 23, --���̼��ܶ�Ӧ���
    ABILITY_SHAJIA = 24, --ɱ�ۼ��ܶ�Ӧ���
    ABILITY_REMAI = 25, --�������ܶ�Ӧ���
    ABILITY_CAOZUOZHONG = 26, --�����м��ܶ�Ӧ���
    ABILITY_YAOLI = 27, --ҩ���ܶ�Ӧ���
    ABILITY_YANGSHENGFA = 28, --������
    ABILITY_FOFA = 29, --�� ���� ���ڸ��� ����
    ABILITY_CAIHUOSHU = 30, --�ɻ��� ���� ���ڸ��� ʥ����
    ABILITY_LIANHUALUO = 31, --������ ؤ�� ���ڸ��� ���
    ABILITY_CAIBINGSHU = 32, --�ɱ��� ��ɽ ���ڸ��� ������
    ABILITY_JINGMAIBAIJUE = 33, --�����پ� ���� ���ڸ��� �ƹ�
    ABILITY_YINCHONGSHU = 34, --������ ���� ���ڸ��� �ƶ�
    ABILITY_LINGXINSHU = 35, --������ ���� ���ڸ��� �Ʒ�
    ABILITY_DAOFA = 36, --���� �䵱 ���ڸ��� ����
    ABILITY_LIUYIFENGGU = 37, --���շ�� ��ң ���ڸ��� ���Ŷݼ�
    ABILITY_QISHU = 38, --����
    ABILITY_GPS = 39, --��λ
    ABILITY_HUOXUE = 40, --��Ѫ
    ABILITY_YANGQI = 41, --����
    ABILITY_QIANGSHEN = 42, --ǿ��
    ABILITY_JIANTI = 43, --����
    ABILITY_XIUSHEN = 44, --����
    ABILITY_SUTI = 45, --����
    ABILITY_CAILIAOHECHENG = 49, --���Ϻϳ� ���Ϻϳ�
}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetLifeSkillLevel(targetAbilityName)
    local lifeSkillLevel = LUA_ȡ����ֵ(string.format([[
        local targetAbilityName = "%s"
		local nAbilityNum = GetActionNum("life");
		for i=0, nAbilityNum do
            local theAction = EnumAction(i, "life");
			if theAction:GetID() ~= 0 then
			    local defineID = theAction:GetDefineID()
                local szName = theAction:GetName();  -- ���������
			    local nAbilityID =	LifeAbility : GetLifeAbility_Number(theAction:GetID());
                local nLevel = Player:GetAbilityInfo(nAbilityID, "level");  -- ����ܵĵȼ�
                local nMaxLevel = Player:GetAbilityInfo(nAbilityID, "maxlevel");  -- ����ܵ����ȼ�
                local nSkillExp = Player:GetAbilityInfo(nAbilityID, "skillexp");  -- ����ܵ�ǰ������
                local szExplain = Player:GetAbilityInfo(nAbilityID, "explain");  -- ����ܽ���
                local nNeedLevel = AbilityTeacher:GetNeedLevel();
                local nNeedSkillExp = AbilityTeacher:GetNeedSkillExp();

                if targetAbilityName == szName then
                    return nLevel
                end
            end
	    end
	    return -1
	]], targetAbilityName))
    return tonumber(lifeSkillLevel)
end

function GetGuildCityName()
    local myGuildCityName = LUA_ȡ����ֵ([[
       local guildID, clanID = DataPool:GetGuildClanID()
       local myCityName = Guild:GetMyGuildDetailInfo("CityName")
       PushDebugMessage("myCityName: " .. myCityName)
       return myCityName
   ]])
    return myGuildCityName
end

function BackToBangHui()
    -- ����򿪰����棬�л������ܻ�ȡ�����Ϣ
    LUA_Call([[setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnOpenGruidClick();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Hygl_Env});NewBangHui_Hygl_Bhxx_Clicked();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Bhxx_Env});NewBangHui_Bhxx_Tmxx_Clicked();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Tmxx_Env});NewBangHui_Tmxx_Closed();]])

    ����_������()

    local myGuildCityName = GetGuildCityName()

    if tonumber(myGuildCityName) == -1 then
        MentalTip("�ű��������ʧ��, ʹ�ð�Ԫ������λ")
        return
    end

    local inBangHui = 0
    local curCityName = ��ȡ������Ϣ(16)
    if curCityName == "����" then
        ����_������()
        while true do
            ��ͼѰ·("����", 322, 264)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 322 and tonumber(myY) == 264 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("������")
    elseif curCityName == "����" then
        ����_������()
        while true do
            ��ͼѰ·("����", 179, 121)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 179 and tonumber(myY) == 121 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("������")
    elseif curCityName == "����" then
        ����_������()
        while true do
            ��ͼѰ·("����", 237, 236)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 237 and tonumber(myY) == 236 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("������")
    elseif curCityName == "¥��" then
        ����_������()
        while true do
            ��ͼѰ·("¥��", 190, 130)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 190 and tonumber(myY) == 130 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("�����v")
    elseif curCityName == myGuildCityName then
        inBangHui = 1
        ����_������()
    else
        ִ�й���("����س�")
        ��ʱ(3000)
        ����_������()
        while true do
            ��ͼѰ·("����", 179, 121)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 179 and tonumber(myY) == 121 then
                break
            end
        end
        ��ʱ(3000)
        �Ի�NPC("������")
    end

    if inBangHui == 0 then
        ��ʱ(500)
        NPC�����Ի�("���뱾�����")
        �ȴ���ͼ���()
        ��ʱ(3000)
    end

    while true do
        local curMap = ��ȡ������Ϣ(16)
        if curMap == myGuildCityName then
            ��ʱ(2000)
            break
        end
        ��ʱ(1000)
    end
end

function LifeSkillStudyAndLevelUp()
    local needStudyLifeSkill = {
        [1] = { skillName = "����", studyLevel = 10, npcMap = "����", ncpName = "Ү�ɴ�ʯ", posX = 188, posY = 62 },
        [2] = { skillName = "����", studyLevel = 10, npcMap = "����", ncpName = "ľ����", posX = 105, posY = 135 },
        [3] = { skillName = "����", studyLevel = 10, npcMap = "����", ncpName = "������", posX = 108, posY = 140 },
        [4] = { skillName = "����", studyLevel = 10, npcMap = "����", ncpName = "Ǿޱ", posX = 132, posY = 156 },
        [5] = { skillName = "ҩ��", studyLevel = 10, npcMap = "����", ncpName = "��ӱ��", posX = 136, posY = 169 },
        [6] = { skillName = "����", studyLevel = 10, npcMap = "-1", ncpName = "����", posX = 46, posY = 91 },
        [7] = { skillName = "ǿ��", studyLevel = 10, npcMap = "-1", ncpName = "ǮΪһ", posX = 149, posY = 57 },
        [8] = { skillName = "����", studyLevel = 10, npcMap = "-1", ncpName = "ǮΪһ", posX = 149, posY = 57 },
        [9] = { skillName = "��Ѫ", studyLevel = 10, npcMap = "-1", ncpName = "������", posX = 266, posY = 140 },
        [10] = { skillName = "���ϼӹ�", studyLevel = 1, npcMap = "����", ncpName = "������", posX = 155, posY = 174 },
        [11] = { skillName = "�������", studyLevel = 3, npcMap = "����", ncpName = "�����", posX = 53, posY = 212 },
    }

    for i = 1, #needStudyLifeSkill do
        local studyMap = needStudyLifeSkill[i].npcMap
        local lifeSkillName = needStudyLifeSkill[i].skillName
        local studyLevel = needStudyLifeSkill[i].studyLevel
        local npcName = needStudyLifeSkill[i].ncpName
        local posX = needStudyLifeSkill[i].posX
        local posY = needStudyLifeSkill[i].posY
        local lifeSkillLevel = GetLifeSkillLevel(lifeSkillName)
        if studyMap ~= "-1" then
            if lifeSkillLevel == -1 then
                ��ͼѰ·(studyMap, posX, posY)
                ��ʱ(1000)
                �Ի�NPC(npcName)
                ��ʱ(1000)
                NPC�����Ի�("ѧϰ", 1)
                ��ʱ(1000)
                NPC�����Ի�("ȷ��")
                ��ʱ(500)
            end
            if lifeSkillLevel < studyLevel then
                ��ͼѰ·(studyMap, posX, posY)
                ��ʱ(1000)

                if i == 11 then
                    -- ������Ĳ��ᵯ����������
                    for i = 1, studyLevel - lifeSkillLevel do
                        �Ի�NPC(npcName)
                        ��ʱ(1000)
                        NPC�����Ի�("����", 1)
                        ��ʱ(1000)
                        NPC�����Ի�("ȷ��")
                        ��ʱ(100)
                    end
                else
                    �Ի�NPC(npcName)
                    ��ʱ(1000)
                    NPC�����Ի�("����", 1)
                    ��ʱ(1000)
                    for i = 1, studyLevel - lifeSkillLevel do
                        -- TODO
                        LUA_Call([[

                        ]])
                        ��ʱ(500)
                    end
                end
            end
        else
            local myGuildCityName = GetGuildCityName()
            if lifeSkillLevel == -1 then
                BackToBangHui()
                while true do
                    ��ͼѰ·(myGuildCityName, posX, posY)
                    ��ʱ(500)
                    local myX = ��ȡ������Ϣ(7)
                    local myY = ��ȡ������Ϣ(8)
                    if tonumber(myX) == posX and tonumber(myY) == posY then
                        break
                    end
                end
                ��ʱ(2000)
                �Ի�NPC(npcName)
                ��ʱ(1000)
                NPC�����Ի�("ѧϰ", 1)
                ��ʱ(1000)
                NPC�����Ի�("ȷ��")
                ��ʱ(500)
            end
            if lifeSkillLevel < studyLevel then
                BackToBangHui()
                while true do
                    ��ͼѰ·(myGuildCityName, posX, posY)
                    ��ʱ(500)
                    local myX = ��ȡ������Ϣ(7)
                    local myY = ��ȡ������Ϣ(8)
                    if tonumber(myX) == posX and tonumber(myY) == posY then
                        break
                    end
                end
                ��ʱ(2000)
                �Ի�NPC(npcName)
                ��ʱ(1000)
                NPC�����Ի�("����", 1)
                ��ʱ(1000)
                for i = 1, studyLevel - lifeSkillLevel do
                    -- TODO
                    LUA_Call([[

                    ]])
                    ��ʱ(500)
                end
            end
        end
    end
end