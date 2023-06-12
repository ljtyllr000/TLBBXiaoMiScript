���׽��_������Ʒ�� = {
    { name = "ѩ֥ҩɢ", num = 1 },
    { name = "��Ԫ����", num = 2 },
    { name = "����ǿ������", num = 2 },
}

lua = LUA_ȡ����ֵ

local songLiaoNPCInfo = {
    { scene = "����", x = 235, y = 222, npc = "������" },
    { scene = "����", x = 223, y = 230, npc = "˾��" },
    { scene = "����", x = 255, y = 238, npc = "����" },
    { scene = "����", x = 294, y = 241, npc = "����" },
    { scene = "����", x = 312, y = 235, npc = "ף˧" },
}

function GetLevel()
    local level = tonumber(lua("return Player:GetData('LEVEL')"))
    if level >= 60 and level <= 69 then
        return 1
    elseif level >= 70 and level <= 79 then
        return 2
    elseif level >= 80 and level <= 89 then
        return 3
    elseif level >= 90 and level <= 109 then
        return 4
    elseif level >= 110 and level <= 119 then
        return 5
    end
    return -1
end

function OpenSongLiao()
    local curMap = lua("return GetCurrentSceneName()")
    if curMap ~= "����ս��" and curMap ~= "���Ź�ǰ��" then
        local Week = os.date("%A")
        if Week ~= "Tuesday" and Week ~= "Thursday" then
            ��Ļ��ʾ("����û������")
            return false
        end

        local time = tonumber(lua("return DataPool:GetServerMinuteTime()"))
        if time > 213000 then
            ��Ļ��ʾ("��ѽ���, ������")
            return false
        end

        local level = GetLevel()
        if level == -1 then
            ��Ļ��ʾ("�ȼ�������Ҫ��")
            return false
        end
    else
        return true
    end

    while true do
        local curMap = lua("return GetCurrentSceneName()")
        if curMap ~= "����ս��" and curMap ~= "���Ź�ǰ��" then
            local level = GetLevel()
            local NPCInfo = songLiaoNPCInfo[level]

            local NPCEventList = lua([[
				if IsWindowShow("Quest") then
					local a,b,c,d,e =DataPool:GetNPCEventList_Item(0)
					return e
				end
			]])
            if NPCEventList == "#{SLDZ_220216_44}" then
                return false
            end

            ��ͼѰ·(NPCInfo.scene, NPCInfo.x, NPCInfo.y)
            ��ʱ(1000)
            �Ի�NPC(NPCInfo.npc)
            ��ʱ(1000)
            NPC�����Ի�("#{SLDZ_100805_03}")
            ��ʱ(1000)

            �Ի�NPC(NPCInfo.npc)
            ��ʱ(1000)
            lua("ContexMenu_LeaveTeam_Clicked()")
            ��ʱ(100)
            lua(string.format([[
				if Target:GetDialogNpcName()=="%s" and DataPool:GetNPCEventList_Num()>0 then
					local a,b,c,d,e =DataPool:GetNPCEventList_Item(1)
					if a~="text" then
						QuestFrameOptionClicked(b,c,d)
					end
				end
			]], NPCInfo.npc))
            ��ʱ(5000)
            �ȴ���ͼ���()
        else
            return true
        end
        ��ʱ(1000)
    end

end

function UseRoleSkills(RoleSkill, skillTarget)
    -- ʹ�����ɼ���
    if tonumber(�жϼ�����ȴ(RoleSkill)) == 1 then
        SkillID = ��ȡ����ID(RoleSkill)
        ʹ�ü���(SkillID, skillTarget);
        ��ʱ(110)
    end
end

function UseWuHunSkill(skillTarget)
    -- ��꼼��
    local WHSkillID = DataPool:GetKfsSkill(2)
    ʹ�ü���(WHSkillID, skillTarget);
    ��ʱ(110)
end

function UseRoleSkillAttack(attackTargetID)
    ����_������()
    ����_������()

    local ��������, ����, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()
    if ���� == "��ң" then
        UseRoleSkills("Ϫɽ����", attackTargetID);
        UseRoleSkills("��Խ����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��ָ��", attackTargetID);
        UseRoleSkills("��ɽ����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��Ӣ��", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("�������", attackTargetID);
        UseRoleSkills("����޼", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("����׷��", attackTargetID);
        UseRoleSkills("��ȸ��", attackTargetID);
        UseRoleSkills("��Ůɢ��", attackTargetID);
        UseRoleSkills("����뷢", attackTargetID);
        UseRoleSkills("һҶ��Ŀ", attackTargetID);
        UseRoleSkills("����ʸ", attackTargetID);
    elseif ���� == "���" then
        UseRoleSkills("���޳���", attackTargetID);
        UseRoleSkills("һ������", attackTargetID);
        UseRoleSkills("δ����˥", attackTargetID);
        UseRoleSkills("ӫ������", attackTargetID);
        UseRoleSkills("���Ʒ���", attackTargetID);
        UseRoleSkills("Ǭ����", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("ն���", attackTargetID);
        UseRoleSkills("�콭����", attackTargetID);
        UseRoleSkills("������צ", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("���۷�", attackTargetID);
        UseRoleSkills("�����ˮ", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("������ɽ", attackTargetID);
    elseif ���� == "��ɽ" then
        UseRoleSkills("�ƻ���ľ", attackTargetID);
        UseRoleSkills("����Ͷ��", attackTargetID);
        UseRoleSkills("���α���", attackTargetID);
        UseRoleSkills("�������", attackTargetID);
        UseRoleSkills("�������", attackTargetID);
        UseRoleSkills("�ھ�����", attackTargetID);
        UseRoleSkills("���Ϸ�", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("ָ�㽭ɽ", attackTargetID);
        UseRoleSkills("�г彣", attackTargetID);
        UseRoleSkills("����", attackTargetID);
        UseRoleSkills("������", attackTargetID);
        UseRoleSkills("����ŭ��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("һ��ָ", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "�䵱" then
        UseRoleSkills("����ָ·", attackTargetID);
        UseRoleSkills("��Ů����", attackTargetID);
        UseRoleSkills("�������", attackTargetID);
        UseRoleSkills("��ҫ����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("��Ұ�Ļ�", attackTargetID);
        UseRoleSkills("��ڤ����", attackTargetID);
        UseRoleSkills("��󸹦", attackTargetID);
        UseRoleSkills("���϶���", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("���ͬ��", attackTargetID);
        UseRoleSkills("��ɰ��", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��ӡ���", attackTargetID);
        UseRoleSkills("���������", attackTargetID);
        UseRoleSkills("һ����ɢ", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("�׽�͹�", attackTargetID);
        UseRoleSkills("����ȭ", attackTargetID);
    elseif ���� == "ؤ��" then
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("�س��ݺ�", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("�����л�", attackTargetID);
        UseRoleSkills("�����޹�", attackTargetID);
        UseRoleSkills("������ˮ", attackTargetID);
        UseRoleSkills("Ǳ������", attackTargetID);
        UseRoleSkills("�𾪰���", attackTargetID);
        UseRoleSkills("����Ͷ��", attackTargetID);
        UseRoleSkills("����ͷ", attackTargetID);
        UseRoleSkills("�����", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��������ն", attackTargetID);
        UseRoleSkills("�����޼�", attackTargetID);
        UseRoleSkills("���ȼ�", attackTargetID);
        UseRoleSkills("ˮ���߾�", attackTargetID);
        UseRoleSkills("���ճ��", attackTargetID);
        UseRoleSkills("������˫", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "Ľ��" then
        UseRoleSkills("����ʽ", attackTargetID);
        UseRoleSkills("���쳱��", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("����ʽ", attackTargetID);
        UseRoleSkills("�ὣ����", attackTargetID);
        UseRoleSkills("��������", attackTargetID);
        UseRoleSkills("������ɽ", attackTargetID);
        UseRoleSkills("�ǺӺ���", attackTargetID);
        UseRoleSkills("������", attackTargetID);
    elseif ���� == "�һ���" then
        UseRoleSkills("��ҹ��", attackTargetID);
        UseRoleSkills("��֮����", attackTargetID);
        UseRoleSkills("����֮��", attackTargetID);
        UseRoleSkills("���˲�Թ", attackTargetID);
        UseRoleSkills("����ͬ��", attackTargetID);
        UseRoleSkills("����֮��", attackTargetID);
    elseif ���� == "�����" then
        UseRoleSkills("��ǧ��", attackTargetID);
        UseRoleSkills("�һ�����", attackTargetID);
        UseRoleSkills("ָ����ӡ", attackTargetID);
        UseRoleSkills("�ӳⷽ��", attackTargetID);
        UseRoleSkills("�л�ǧ��", attackTargetID);
    end

    -- ��깥������
    --UseWuHunSkill(attackTargetID)   -- TODO ������꼼���Ƿ�����

    -- ������ϼ��ܣ���ʹ��
    UseRoleSkills("��������", attackTargetID);
    UseRoleSkills("��������", attackTargetID);
    UseRoleSkills("�ܾ�ʽ������", attackTargetID);
    UseRoleSkills("�Ƽ�ʽ������", attackTargetID);
    UseRoleSkills("����ʽ������", attackTargetID);

end

function UseJiaSuSkill()
    local ��������, ����, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()
    if ���� == "����" then
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "���" then
        UseRoleSkills("��ҡֱ��", attackTargetID);
    elseif ���� == "��ɽ" then
        UseRoleSkills("�׾Թ�϶", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��ö����", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("һέ�ɽ�", attackTargetID);
    elseif ���� == "ؤ��" then
        UseRoleSkills("�˲����", attackTargetID);
    elseif ���� == "����" then
        UseRoleSkills("��������", attackTargetID);
    elseif ���� == "Ľ��" then
        UseRoleSkills("İ����", attackTargetID);
    elseif ���� == "�����" then
        UseRoleSkills("���Ʒ�", attackTargetID);
    end
end

function StartSongLiao()
    local ZhengRong = lua([[
		local ret, name, score, towerScore, damage, damageAfford, damageDefend, cure, kill, camp = CSongliaoWarData:TSLGetMyScoreData()
		return camp
	]])
    local FangYuTaINFO = {}
    if ZhengRong == "157" then
        -- ��ɫΪ�ɷ���Ӫ�������η�
        FangYuTaINFO = {
            { name = "#{SLDZ_220216_168}", x = 108, y = 230 }, -- �εķ�������һ
            { name = "#{SLDZ_220216_167}", x = 160, y = 219 }, -- �εķ���������
            { name = "#{SLDZ_220216_169}", x = 212, y = 230 }, -- �εķ���������
            { name = "#{SLDZ_220216_162}", x = 192, y = 243 }, -- �ε�������
            { name = "#{SLDZ_220216_163}", x = 212, y = 268 }, -- �ε�������
            { name = "#{SLDZ_220216_161}", x = 127, y = 243 }, -- �ε�������
            { name = "#{SLDZ_220216_164}", x = 107, y = 268 }, -- �ε�������
            { name = "#{SLDZ_220216_165}", x = 159, y = 291 }, -- ��˧
        }
    else
        -- ��ɫΪ�η���Ӫ�������ɷ�
        FangYuTaINFO = {
            { name = "#{SLDZ_220216_172}", x = 212, y = 91 },  -- �ɵķ�������һ
            { name = "#{SLDZ_220216_170}", x = 160, y = 96 },  -- �ɵķ���������
            { name = "#{SLDZ_220216_171}", x = 108, y = 92 },  -- �ɵķ���������
            { name = "#{SLDZ_220216_161}", x = 127, y = 76 },  -- �ɵ�������
            { name = "#{SLDZ_220216_164}", x = 107, y = 49 },  -- �ɵ�������
            { name = "#{SLDZ_220216_162}", x = 192, y = 76 },  -- �ɵ�������
            { name = "#{SLDZ_220216_163}", x = 212, y = 49 },  -- �ɵ�������
            { name = "#{SLDZ_220216_166}", x = 159, y = 27 },  -- �ɽ�
        }
    end

    -- һ��һ������ȥ�������
    for i = 1, #FangYuTaINFO do
        if lua("return GetCurrentSceneName()") ~= "����ս��" then
            return
        end
        �ȴ���ͼ���()
        ��������()
        while true do
            -- ѭ��ʹ�ü��ܴ��
            if lua("return GetCurrentSceneName()") ~= "����ս��" then
                break
            end
            �ȴ���ͼ���()
            ��������()
            local act = FangYuTaINFO[i]
            UseJiaSuSkill()  -- ʹ�ü��ټ���
            if i == 2 or i == 3 or i == 4 or i == 5 or i == 7 or i == 8 then
                ��ͼѰ·("����ս��", act.x, act.y, 1)  -- ��������
            else
                ��ͼѰ·("����ս��", act.x, act.y)
                --��ʱ(300)
                --����_������()
            end

            --��ʱ(300)
            -- �Զ����()   -- ע�͵���������� ����˷�ʱ��
            --local ret = lua(string.format([[
			--	for i=1,2000 do
			--		if SetMainTargetFromList(i ,false, false)==1 then
			--			if Target:GetName()=="%s" then
			--				return i
			--			end
			--		end
			--	end
			--	return -1
			--]], act.name))
            --
            --if ret ~= "-1" then
            --    ��������(tonumber(ret))
            --    ��ʱ(800)
            --else
            --    break
            --end

            ��������, ����ID, ��ƷX����, ��ƷY����, Ŀ��Ѫ��, ��Ʒ����, ��Ʒ���, ��Ʒ����, �����ж�, ͷ����ע = ������Χ��Ʒ(4, act.name, 5)
            if Ŀ��Ѫ�� > 0 then
                UseRoleSkillAttack(����ID)
                ��ʱ(110)
            else
                break
            end

        end
    end

    -- ���ɽ�����ǰ���뿪NPC����ֻ��Ӯ��һ����ִ��������߼������һ�������Ϸ�ѭ����
    if lua("return GetCurrentSceneName()") == "����ս��" then
        if ZhengRong == "157" then
            ��ͼѰ·("����ս��", 297, 227)
            ��ʱ(300)
        else
            ��ͼѰ·("����ս��", 21, 88)
            ��ʱ(300)
        end

        while lua("return GetCurrentSceneName()") == "����ս��" do
            �Ի�NPC("��������")
            ��ʱ(800)
            �Ի�NPC("��������")
            ��ʱ(800)
            NPC�����Ի�("#{SLDZ_100805_37}")
            ��ʱ(800)
            NPC�����Ի�("#{INTERFACE_XML_557}")
            ��ʱ(800)
            �ȴ���ͼ���()
        end
    end
    while lua("return GetCurrentSceneName()") == "���Ź�ǰ��" do
        ��Ļ��ʾ("�ȴ�����")
        ��ʱ(5000)
        �ȴ���ͼ���()
    end

end



-- �ű�ִ���߼������￪ʼ ------------------------------------------------------------------
ִ�й���("ͬ����Ϸʱ��")

if not OpenSongLiao() then
    return
end
while true do
    �ȴ���ͼ���()
    if lua("return GetCurrentSceneName()") == "���Ź�ǰ��" then
        ��Ļ��ʾ("�ȴ�����ս��")
        ��ʱ(5000)
    else
        break
    end
end
if lua("return GetCurrentSceneName()") == "����ս��" then
    StartSongLiao()

    -- ���ɽ���, ��ȡ���ɽ���
    local NPCInfo = songLiaoNPCInfo[GetLevel()]
    ��ͼѰ·(NPCInfo.scene, NPCInfo.x, NPCInfo.y)
    ��ʱ(1000)
    �Ի�NPC(NPCInfo.npc)
    ��ʱ(1000)
    NPC�����Ի�("#{SLDZ_100805_03}")
    ��ʱ(1000)
end

-- ʹ�����ӡ����ɽ���
local itemname = { "�ࣨ�Σ�", "܇���Σ�", "�h���Σ�", "�ڣ��ɣ�", "܇���ɣ�", "�����ɣ�", "�䣨�ɣ�", "���ɣ�", "�h���Σ�", "�h���Σ�", "�R���Σ�", "�����Σ�", "�����Σ�", "܇���Σ�", "܇���Σ�", "�R���Σ�", "�ˣ��Σ�", "�ࣨ�Σ�", "�����Σ�", "�����Σ�", "���������񡤺���", "��������񡤺���", "����������ӥ��", "���������ӥ��", "���������񡤻�Х", "��������񡤻�Х", "��������������", "�������������" }
for i = 1, #itemname do
    local count = ��ȡ������Ʒ����(itemname[i])
    for i = 1, count do
        �Ҽ�ʹ����Ʒ(itemname[i])
        ��ʱ(300)
    end
end


-- ������
for k = 1, #���׽��_������Ʒ�� do
    local name = ���׽��_������Ʒ��[k].name
    local num = ���׽��_������Ʒ��[k].num
    ��Ļ��ʾ("����" .. name .. " " .. tostring(num) .. "��")
    for i = 1, num do
        lua(string.format([[
			local info= GetPVPShopData(1,1,16)
			for i=1,16 do
				if info[i].itemid>0 and info[i].itemname=="%s" then
					Clear_XSCRIPT()
						Set_XSCRIPT_Function_Name("BuyItem");
						Set_XSCRIPT_ScriptID(888969);
						Set_XSCRIPT_Parameter(0,266);
						Set_XSCRIPT_Parameter(1,1);
						Set_XSCRIPT_Parameter(2,info[i].itemid);
						Set_XSCRIPT_Parameter(3,1);
						Set_XSCRIPT_Parameter(4,1);
						Set_XSCRIPT_ParamCount(5);
					Send_XSCRIPT()
					return
				end
			end

			local info= GetPVPShopData(2,1,16)
			for i=1,16 do
				if info[i].itemid>0 and info[i].itemname=="%s" then
					PushDebugMessage(info[i].itemname)
					Clear_XSCRIPT()
						Set_XSCRIPT_Function_Name("BuyItem");
						Set_XSCRIPT_ScriptID(888969);
						Set_XSCRIPT_Parameter(0,266);
						Set_XSCRIPT_Parameter(1,1);
						Set_XSCRIPT_Parameter(2,info[i].itemid);
						Set_XSCRIPT_Parameter(3,1);
						Set_XSCRIPT_Parameter(4,2);
						Set_XSCRIPT_ParamCount(5);
					Send_XSCRIPT()
					return
				end
			end
		]], name, name))
        ��ʱ(1000)
    end
end

�Ҽ�ʹ����Ʒ("ѩ֥ҩɢ")
��ʱ(1000)
�Ҽ�ʹ����Ʒ("��Ԫ")



