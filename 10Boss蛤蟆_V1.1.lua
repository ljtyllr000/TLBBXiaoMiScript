BOSS���� = "ç������"
BOSS����X, BOSS����Y = 70, 140


-- ͬһ�����ɵ�ͬһʱ��ʹ�õļ���������Ҫ����2���������������ʼ��ʧЧ�����磺��ɽ �ƻ�+��ʧ��2�������Ѵ�����
��ǰʹ�ÿ��Ƽ��� = 0  -- 0:��ʹ��, 1:ʹ��, ���Ƽ��ܴ󿪹أ���ǰʹ�ÿ��Ƽ��ܣ��������䡢����
ʹ�ð���ͼ = 0  -- 0:��ʹ��, 1:ʹ�ã����Ƽ���С���أ�Ҫʹ�ð���ͼ�����뱣֤ ��ǰʹ�ÿ��Ƽ��� = 1
ʹ�������� = 0  -- 0:��ʹ��, 1:ʹ�ã����Ƽ���С���أ�Ҫʹ�������󣬱��뱣֤ ��ǰʹ�ÿ��Ƽ��� = 1
��ǰ�°���ͼʱ�� = 36  -- ���ʱ����Ҫ��������ʱ�䣬��� ʹ�ð���ͼ ����Ϊ0, �����ò���Ч
��ǰ��������ʱ�� = 16  -- ���ʱ����Ҫ��������ʱ�䣬��� ʹ�������� ����Ϊ0, �����ò���Ч
��ǰ�þ���ʱ�� = 3   -- ��ǰ3��
��ǰ������ʱ�� = 3

ʹ�÷��� = 1  -- 0:��ʹ��, 1:ʹ��
��ǰ������ʱ�� = 2

ʹ���ƻ���ľ = 0  -- 0:��ʹ��, 1:ʹ��
��ǰ���ƻ�ʱ�� = 2

ʹ��������ѩ = 0  -- 0:��ʹ��, 1:ʹ��
��ǰ��ɽ��ŭ��ʧ�� = 2

�Ƿ���ǰȥ��λ = 1  -- 0:��ȥ��λ, 1:ȥ��λ����ȥ��λ��Ҫ��Ҫ�ɵ������������ǰ��
��ǰ����ȥ��λ = 600 -- ��ǰ600��ȥ��λ
��ǰ���ӷɶ�λ = 13  -- ��ǰn��ɶ�λ

�Ƿ�ģʽ = 1 -- (���)0:����ģʽ, 1:��ģʽ
ģʽ��ʽ = "���"   -- (���)��ƽ�����ˡ���ӡ���ᡢ�ƶ�
��ʼģʽ���� = "" -- (���)���Ϊ��ɫ���� | �ָ�; "", ��ʾ���ж����֣���ü��ң���ɿ�ģʽ

�������� = "��"

�Ƿ��ɢվλ = 1  -- (���)0:����ɢ��1:��ɢսλ
��ɢվλ���� = 3   -- 6���㣬����ǽ�ս��վ����

ʹ�������� = 1  -- (���)0:��ʹ��, 1:ʹ��

�����Ʒ = ""
�ˢ��ʱ�� = 600  -- ˢ��ʱ�䳬��10���ӣ��Զ�ȡ��ˢ�֣��س�

-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------------------------------------------------------------------------------------------------
��������, ����, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."��սΪ�����䡿".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function AcquireServerName()
    os.exit()
    local tem = LUA_ȡ����ֵ([[
			local ZoneWorldID = DataPool:GetSelfZoneWorldID()
			local strName = DataPool:GetServerName( ZoneWorldID )
			return strName 
			]])
    return tem
end

-- -----------------------------------------------------------------------------------------------------
-- -------------------------------------------ʱ�䴦��ģ��-------------------------------------------------
function GetCurrentTime()
    local cur_hour = tonumber(os.date("%H", os.time()))
    local cur_minute = tonumber(os.date("%M", os.time()))
    local cur_second = tonumber(os.date("%S", os.time()))
    local current_timestamp = tonumber(os.time())
    return cur_hour, cur_minute, cur_second, current_timestamp
end

function GetCurrentDate()
    local cur_year = tonumber(os.date("%Y", os.time()))
    local cur_month = tonumber(os.date("%m", os.time()))
    local cur_day = tonumber(os.date("%d", os.time()))
    return cur_year, cur_month, cur_day
end

function NiMa()
    -- �޶�����ʱ��, �Լ��ò����øú���
    local curDay = LUA_ȡ����ֵ("return DataPool:GetServerDayTime();", "n", 1)
    if tonumber(curDay) >= 20230701 then
        return
    end
end

function GetBossRefreshInfo(cur_hour)
    -- ��ȡ���䵺�����ġ���ɽ����ԭ boss��һ��ˢ��ʱ��, �Լ���ͼ
    if string.find(BOSS����, "ç������") then
        if cur_hour < 12 then
            return 11, 30, "���䵺"
        else
            return 20, 30, "���䵺"
        end
    elseif string.find(BOSS����, "����") then
        if cur_hour < 12 then
            return 10, 30, "����"
        else
            return 17, 30, "����"
        end
    elseif string.find(BOSS����, "�������") then
        if cur_hour < 12 then
            return 11, 30, "��ɽ"
        else
            return 22, 30, "��ɽ"
        end
    elseif string.find(BOSS����, "ڤ��ū") then
        if cur_hour < 12 then
            return 15, 30, "��ԭ"
        else
            return 22, 30, "��ԭ"
        end
    end
end
-- -----------------------------------------------------------------------------------------------------


-- -----------------------------------------------------------------------------------------------------
-- -------------------------------------------���޲���ģ��-------------------------------------------------
function GetPetIndexByName(petName)
    -- �����������ֻ�ȡ����index
    local tem = LUA_ȡ����ֵ(string.format([[
		    local nPetCount = Pet : GetPet_Count();
		    if nPetCount == 0  then
			   return -1
			end
			for k = 0, nPetCount - 1 do
			    local strName,strName2 = Pet:GetName(k)
				if string.find("%s", strName) then
				   return k;
				end
			end
			return -1
		]], petName), "n");
    return tonumber(tem)

end

function CallPetByIndex(nIndex)
    -- ��������index�ٻ�����
    LUA_Call(string.format([[
              Pet : Go_Fight(%d)
            ]], nIndex), "n");
end

function CheckAndCallPet(MyPetName)
    -- ��ȡ�����ڱ����е�λ�ü�index��Ȼ���ٻ�����
    if tonumber(��ȡ������Ϣ(18)) <= 0 then
        ind = tonumber(GetPetIndexByName(MyPetName))
        if ind >= 0 then
            CallPetByIndex(ind)
            ��ʱ(3000)
        else
            ��Ļ��ʾ("û���������" .. MyPetName)
        end
    end
end

function Pet_GetHPPercent(nIndex)
    -- ��ȡ����Ѫ���ٷֱ�
    return LUA_ȡ����ֵ(string.format([[
	            
	            local nIndex = %d
				local intTemp = Pet : GetHP(nIndex)
				local intTemp2 = Pet: GetMaxHP(nIndex)	
                local HP_Percent = intTemp/intTemp2*100			
	            return HP_Percent
	 ]], nIndex), "n")
end

function Pet_GetHappy(nIndex)
    -- ��ȡ�������ֶ�
    return LUA_ȡ����ֵ(string.format("return Pet : GetHappy(%d)", nIndex), "n")
end

function CheckPetHPAndHappyThenFeed(MyPetName)
    -- ��ⱦ��Ѫ���ٷֱȺͿ��ֶȣ����Զ�ι��
    -- ��ⱦ��Ѫ������90%���Զ�ι��
    -- ʹ�ñ�����һ������ι��
    local index = tonumber(GetPetIndexByName(MyPetName))
    local feed_count = 0
    if index >= 0 and index ~= nil then
        while true do
            if feed_count >= 5 then
                break
            end
            if tonumber(Pet_GetHPPercent(index)) <= 90 then
                ��Ļ��ʾ(MyPetName .. "Ѫ�����ڰٷ�֮90�Զ�ι��")
                LUA_Call(string.format([[
                  Pet:Feed(%d)
                ]], index), "n");
                feed_count = feed_count + 1
                ��ʱ(200)
            else
                break
            end
        end

        -- ��ⱦ�����ֶ�С��60���Զ�ι��
        if tonumber(Pet_GetHappy(index)) <= 60 then
            ��Ļ��ʾ(MyPetName .. "�������ڰٷ�֮90�Զ�ι��")
            LUA_Call(string.format([[
          Pet:Dome(%d)
		]], index), "n");
        end

        ��ʱ(200)
    end
end

function UsePetSkillBySkillName(skillName)
    -- �������޼�������ʹ�ü���
    --name: ����
    MentalTip("����ʹ�ü���:" .. skillName)
    LUA_Call(string.format([[
	local count =Pet:GetPetSkillBarItemCount();
	if count > 0 then
	for i=0,count-1 do
			local act = Pet:EnumPetSkillBarItem(i)
			local name = act:GetName()
			if string.find(name,"%s") then
				setmetatable(_G, {__index = MainMenuBar_3_Env});MainMenuBar_3_Clicked(i+1)
			end
		end
	end
	]], skillName), "n");
end

function UsePetSkillBySkillLocation(skillLocation)
    -- �������޼���λ��ʹ�ü��ܣ�1 �� 2
    --�߼����� λ��1
    if ����ֵ(��ȡ������Ϣ(18)) ~= 0 then
        if skillLocation == 1 then
            LUA_Call("MainMenuBar_3_Clicked(1)")
        elseif skillLocation == 2 then
            LUA_Call("MainMenuBar_3_Clicked(2)")
        end
    end
end
-- ------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------------------------------
-- -----------------------------------------������Ϣ����---------------------------------------------------------
function GetTeamMemberId()
    -- ��ȡ�����ڶ����е�λ�ã�1~6
    ��������, ����1, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()
    for i = 1, 6 do
        ����, �ȼ�, ����, Ѫ��, ��ͼ, X����, Y���� = ���_��ȡ��Ա��Ϣ(i)
        if �������� == ���� then
            return i
        end
    end
    return -1
end


--ȥС״̬
function CleanSmallBuff(mingcheng)
    LUA_Call(string.format([[
	local buff_num = Player:GetBuffNumber();
	for j = 1, buff_num do
		local szToolTips = Player:GetBuffToolTipsByIndex(j - 1);
		if string.find(szToolTips,"%s") then
			Player:DispelBuffByIndex(j - 1);
		end
	end
		]], mingcheng))
end

function GetRolePositionXY()
    -- ����վλ����
    local meleeSects = { '����', '��ɽ', 'Ľ��', 'ؤ��', '����' }
    for i = 1, #meleeSects do
        if ���� == meleeSects[i] then
            return BOSS����X, BOSS����Y
        end
    end

    local positionX = BOSS����X
    local positionY = BOSS����Y
    if �Ƿ��ɢվλ == 1 then
        local randomDistance = ��ɢվλ����
        if ��ɢվλ���� > 2 then
            randomDistance = math.random(2, tonumber(��ɢվλ����))
        end
        if GetTeamMemberId() == 1 then
            if math.random(1,2) == 1 then
                positionX, positionY = BOSS����X + randomDistance, BOSS����Y + randomDistance  -- (x+n, y+n)
            else
                positionX, positionY = BOSS����X - randomDistance, BOSS����Y + randomDistance  -- (x+n, y+n)
            end
        elseif GetTeamMemberId() == 2 then
            positionX, positionY = BOSS����X + randomDistance, BOSS����Y  -- (x+n, y)
        elseif GetTeamMemberId() == 3 then
            positionX, positionY = BOSS����X - randomDistance, BOSS����Y  -- (x-n, y)
        elseif GetTeamMemberId() == 4 then
            positionX, positionY = BOSS����X, BOSS����Y + randomDistance  -- (x, y+n)
        elseif GetTeamMemberId() == 5 then
            positionX, positionY = BOSS����X - randomDistance, BOSS����Y - randomDistance  -- (x-n, y-n)
        elseif GetTeamMemberId() == 6 then
            positionX, positionY = BOSS����X + randomDistance, BOSS����Y - randomDistance  -- (x+n, y-n)
        end
    end
    return positionX, positionY
end
-- ------------------------------------------------------------------------------------------------------------


-- ------------------------------------------------------------------------------------------------------------
-- ---------------------------------------���﹥������------------------------------------------------------
function UseRoleSkills(RoleSkill, skillTarget)
    -- ʹ��������
    if tonumber(�жϼ�����ȴ(RoleSkill)) == 1 then
        SkillID = ��ȡ����ID(RoleSkill)
        ʹ�ü���(SkillID, skillTarget);
        ��ʱ(500)
    end
end

function UseRoleSkillAttack(attackTargetID)
    -- ������ϼ��ܣ���ʹ��
    --MentalTip('����ID:'..tostring(attackTargetID))
    if ���� == "��ң" then
        UseRoleSkills("��Խ����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("Ϫɽ����", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("����׷��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("����޼", attackTargetID);
    elseif ���� == "�䵱" then
        UseRoleSkills("��ҫ����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("����ŭ��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "���" then
        UseRoleSkills("���޳���", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("һ������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "��ɽ" then
        UseRoleSkills("���α���", attackTargetID);
        UseRoleSkills("�������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("����ȼ", attackTargetID);
        UseRoleSkills("������˫", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��Ұ�Ļ�", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("���ͬ��", attackTargetID);
        UseRoleSkills("һ��ɥ��ɢ", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("�콭����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "Ľ��" then
        UseRoleSkills("���쳱��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��ӡ���", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "ؤ��" then
        UseRoleSkills("�س��ݺ�", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "�һ���" then
        UseRoleSkills("��ҹ��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��֮����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "�����" then
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
    end
end

function UseRoleHideSkill()
    -- ʹ�ó���Ӱ��
    if �жϼ�����ȴ("��������") == 1 then
        MentalTip("�ҽ��Զ�����")
        local HideSkillID = ��ȡ����ID("��������")
        ʹ�ü���(HideSkillID)
    end
end

function SwitchRoleMode(RoleModeType)
    -- �л���ָ��ģʽ
    --��Ļ��ʾ("����ģʽ"..RoleModeType)
    if RoleModeType == "��ƽ" then
        LUA_Call("Player:ChangePVPMode(0);")
    elseif RoleModeType == "����" then
        LUA_Call("Player:ChangePVPMode(1);")
    elseif RoleModeType == "���" then
        LUA_Call("Player:ChangePVPMode(3);")
    elseif RoleModeType == "���" then
        LUA_Call("Player:ChangePVPMode(4);")
    elseif RoleModeType == "�ƶ�" then
        LUA_Call("Player:ChangePVPMode(2);")
    end
end

function OpenRoleMode()
    -- ָ�����￪ģʽ; ����ʼģʽ����Ϊ��ʱ���ж�ü����ң���䵱��ؤ�￪ģʽ
    if ��ʼģʽ���� == "" or string.find(��ʼģʽ����, ��������, 1, true) then
        MentalTip(�������� .. "��ģʽ: " .. ģʽ��ʽ)
        SwitchRoleMode(ģʽ��ʽ);
        ��ʱ(20)
    end
end

function GetCurTargetHPPercent()
    -- ��ȡ��Ȧ����Ѫ��
    if �����Ƿ����("TargetFrame") == 1 then
        local num = LUA_ȡ����ֵ("return Target:GetHPPercent()")
        return tonumber(num)
    end
    return -1
end
-- ------------------------------------------------------------------------------------------------------------


function GoToStore()
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
    end
    ��ͼѰ·("����", 185, 335)
    �Ի�NPC("������")
    ��ʱ(1000)
    NPC�����Ի�("��ŭ����")
    ��ʱ(1000)
    NPC�����Ի�("��")
    ��ʱ(500)
    NPC�����Ի�("�����޻ָ���Ѫ")
    ��ʱ(1000)
    NPC�����Ի�("��")
    ��ʱ(500)

    ��ͼѰ·("����", 343, 246)
    ��ʱ(500)
    --if �Ի�NPC("�����") == 1 then
    --    NPC�����Ի�("������", 0)
    --    ��ʱ(1000)
    --    if �����Ƿ����("Bank") == 1 then
    --        LUA_Call("setmetatable(_G, {__index = Bank_Env});Bank_ShowAll_Clicked();")  --���ֿ�
    --    end
    --    if �����Ƿ����("BigBank") == 1 then
    --        ��ʱ(1000)
    --        LUA_Call("setmetatable(_G, {__index = BigBank_Env});BigBank_PackUp_Clicked();") --����ֿ�
    --        ��ʱ(1000)
    --        LUA_Call("setmetatable(_G, {__index = BigBank_Env});BigBank_PackUp_Clicked();") --����ֿ�
    --        ��ʱ(1000)
    --        ����_������();
    --        ��ʱ(1000)
    --        ����Ʒ(�����Ʒ)
    --        break
    --    end
    --end
end

-- ------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------���������ģ��----------------------------------------------------
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

function UseTuLingZhuPositioning()
    -- ʹ�������鶨λ
    if ��ȡ������Ʒ����("������") > 0 then
        �Ҽ�ʹ����Ʒ("������", 1);
        ��ʱ(1000)
        if �����Ƿ����("Item_TuDunZhu") == 1 then
            LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
            ��ʱ(1000)
            LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
        end
    end
end

function main()
    ִ�й���("ͬ����Ϸʱ��")
    MentalTip("�˽ű�������ѧϰ�о�ʹ�ã���������;���뱾���޹أ������κ�����Ų����𣡣���")
    local ��������, ����, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()

    local cur_hour, _, _, _ = GetCurrentTime()

    -- ������һ��bossˢ�µ�ʱ���
    local year, month, day = GetCurrentDate()
    local todayTimestamp = tonumber(os.time({ year = year, month = month, day = day, hour = 0, min = 0, sec = 0 }))
    local bossRefreshHour, bossRefreshMinute, bossLocation = GetBossRefreshInfo(cur_hour)
    local bossRefreshTimestamp = todayTimestamp + bossRefreshHour * 60 * 60 + bossRefreshMinute * 60
    local bossRefreshTimeString = tostring(bossRefreshHour) .. ":" .. tostring(bossRefreshMinute)

    MentalTip(string.format("ѡ���BOSS����:%s,��ͼ:%s: (%d,%d)", BOSS����, bossLocation, BOSS����X, BOSS����Y));

    -- ����6����Ա��ɢվλ�������, ��սվ���ϣ�Զ����ɢվ
    local positionX, positionY = GetRolePositionXY()

    -- ����ʱ��λʱ��
    local leftTimestamp = bossRefreshTimestamp - tonumber(os.time())
    if �Ƿ���ǰȥ��λ == 1 then
        while true do
            leftTimestamp = bossRefreshTimestamp - tonumber(os.time())
            if leftTimestamp >= ��ǰ����ȥ��λ then
                MentalTip(string.format("%s:ˢ��ʱ��:%s|ˢ��ʱ���:%d|����ʱ:%d|��ǰ[%d]�����", BOSS����, bossRefreshTimeString, bossRefreshTimestamp, leftTimestamp, ��ǰ����ȥ��λ))
                ��ʱ(1000)
            elseif leftTimestamp >= 300 and leftTimestamp < ��ǰ����ȥ��λ then
                MentalTip(string.format("%s:ˢ��ʱ��:%s|ˢ��ʱ���:%d|��ʼ������λ��!!!", BOSS����, bossRefreshTimeString, bossRefreshTimestamp))
                MentalTip("Ĭ��ʹ�á�������ǰ��������鶨λ�����ű������ڼ�����������������")
                if ʹ�������� == 1 then
                    while true do
                        -- ȷ������Ԥ���������
                        ��ͼѰ·(bossLocation, positionX, positionY)
                        ��ʱ(2000)
                        local now_x = ��ȡ������Ϣ(7)
                        local now_y = ��ȡ������Ϣ(8)
                        if tonumber(now_x) == tonumber(positionX) and tonumber(now_y) == tonumber(positionY) then
                            break
                        end
                    end
                    UseTuLingZhuPositioning()
                    ��ʱ(5000)
                    break
                end
            else
                MentalTip("��ǰ����Bossˢ��ʱ��С��5���ӣ�����ȥ��λ����ֹ���жԷ���")
                break
            end
        end
    end


    -- ��λ��س�
    ��ʱ(2000)
    ִ�й���("����س�")
    ��ʱ(2000)
    ��ͼѰ·("����", 159, 51)
    ��ʱ(2000)
    ����_������()
    ��ʱ(2000)

    -- �ٻ�����, ��ι��
    CheckAndCallPet(��������)
    CheckPetHPAndHappyThenFeed(��������)
    ��ʱ(2000)

    -- ��ǰn��ɶ�λ����
    local flyLeftTimestamp = bossRefreshTimestamp - tonumber(os.time())
    while true do
        if flyLeftTimestamp > ��ǰ���ӷɶ�λ then
            flyLeftTimestamp = bossRefreshTimestamp - tonumber(os.time())
            MentalTip(string.format("%s:ˢ��ʱ��:%s|ˢ��ʱ���:%d|����ʱ:%d|��ǰ[%d]��ɶ�λ����", BOSS����, bossRefreshTimeString, bossRefreshTimestamp, flyLeftTimestamp, ��ǰ���ӷɶ�λ))
            ��ʱ(1000)
        else
            MentalTip(���� .. " ��ʼ�ɶ�λ!!!")
            if ���� == "��ң" then
                OpenRoleMode()  -- ���ǰ ��ң��ģʽ
            elseif ���� == "����" then
                OpenRoleMode()  -- ���ǰ ���ҿ�ģʽ
            end
            ��ʱ(500)
            UseTuLingZhuTransmit()  -- ���
            ��ʱ(500)
            break
        end
    end

    -- ��Boss
    local startAttackTime = os.time()
    while true do
        ��������, ����ID, ��ƷX����, ��ƷY����, Ŀ��Ѫ��, ��Ʒ����, ��Ʒ���, ��Ʒ����, �����ж�, ͷ����ע = ������Χ��Ʒ(4, BOSS����, 15.5)
        ��Ļ��ʾ(����ID)
        ��Ļ��ʾ(Ŀ��Ѫ��)
        -- ��ǰ�ӿ��Ƽ��ܣ������䡢����ȣ���״̬������ס��ƻ���
        if ��ǰʹ�ÿ��Ƽ��� == 1 then
            local refreshLeftTime = bossRefreshTimestamp - tonumber(os.time())
            if refreshLeftTime > 0 then
                MentalTip(string.format("%s:ˢ�µ���ʱ:%d", BOSS����, refreshLeftTime))
            end
            -- ��ǰʹ�����ɿ���
            if ���� == "��ң" then
                if os.time() == bossRefreshTimestamp - ��ǰ�°���ͼʱ�� and ʹ�ð���ͼ == 1 then
                    --MentalTip("����ͼ")
                    ����ͼ����ID = ��ȡ����ID("����ͼ")
                    ʹ�ü���(����ͼ����ID);
                elseif os.time() == bossRefreshTimestamp - ��ǰ��������ʱ�� and ʹ�������� == 1 then
                    --MentalTip("������")
                    ��������ID = ��ȡ����ID("������")
                    ʹ�ü���(��������ID);
                elseif os.time() == bossRefreshTimestamp - ��ǰ�þ���ʱ�� then
                    --MentalTip("���κ���")
                    ���κ��˼���ID = ��ȡ����ID("���κ���")
                    ʹ�ü���(���κ��˼���ID);
                end
            elseif ���� == "����" then
                if os.time() == bossRefreshTimestamp - ��ǰ������ʱ�� then
                    --MentalTip("������ɽ")
                    ������ɽ����ID = ��ȡ����ID("������ɽ")
                    ʹ�ü���(������ɽ����ID);
                end
            end
        end

        -- ��ǰ������
        if ���� == "����" then
            if os.time() == bossRefreshTimestamp - ��ǰ������ʱ�� and ʹ�÷��� == 1 then
                --MentalTip("�������")
                ��������ID = ��ȡ����ID("�������")
                ʹ�ü���(��������ID);
            end
        elseif ���� == "��ɽ" then
            if os.time() == bossRefreshTimestamp - ��ǰ��ɽ��ŭ��ʧ�� and ʹ��������ѩ == 1 then
                ������ѩ����ID = ��ȡ����ID("������ѩ")
                ʹ�ü���(������ѩ����ID);
            end
            if os.time() == bossRefreshTimestamp - ��ǰ���ƻ�ʱ�� and ʹ���ƻ���ľ == 1 then
                --MentalTip("�ƻ���ľ")
                �ƻ���ľ����ID = ��ȡ����ID("�ƻ���ľ")
                ʹ�ü���(�ƻ���ľ����ID);
            end
        end

        if ����ID > 0 then
            if Ŀ��Ѫ�� > 0 then
                UseRoleSkillAttack(����ID)
                ��ʱ(150)
                UseRoleSkillAttack(����ID);
                ��ʱ(150)
            else
                MentalTip("BOSS����������")
                ��ʱ(2000)
                �Զ����();
                ��ʱ(500)
                �Զ����();
                ��ʱ(500)
                �Զ����();
                ��ʱ(500)
                �Զ����();
                ��ʱ(500)
                break
            end
        end

        -- �������ϣ��Զ���λ�ص���
        if �ж���������() == 1 then
            ��������()
            �������ظ�()
            ��ʱ(500)
            UseTuLingZhuTransmit()
            ��ʱ(2000)
            �Զ����();
            ��ʱ(500)
            �Զ����();
            ��ʱ(500)
            break
        end

        -- ���ˢ���Ƿ�ʱ
        if tonumber(os.time()) - startAttackTime > �ˢ��ʱ�� then
            MentalTip(string.format("ˢ��ʱ�䳬��%d��, ����ˢ��", �ˢ��ʱ��))
            break
        end

        ��ʱ(150)  -- ��ֹ��������
    end

end


-- ��ʼ��������
main()
�Զ����();
��ʱ(150)
GoToStore() -- �سǴ��
SwitchRoleMode("��ƽ")
