--���׽��_������Ʒ�� = {
--	{name="ѩ֥ҩɢ",num=1},
--	{name="��Լ�ľ��غ�",num=1},
--}


--���������� �Լ�����д?
lua = LUA_ȡ����ֵ
local ����INFO = {
	{scene="����",x=235,y=222,npc="������"},
	{scene="����",x=223,y=230,npc="˾��"},
	{scene="����",x=255,y=238,npc="����"},
	{scene="����",x=294,y=241,npc="����"},
	{scene="����",x=312,y=235,npc="ף˧"},
}

function GetLevel()
	local level = tonumber(lua("return Player:GetData('LEVEL')"))
	if level>=60 and level<=69 then
		return 1
	elseif level>=70 and level<=79 then
		return 2
	elseif level>=80 and level<=89 then
		return 3
	elseif level>=90 and level<=109 then
		return 4
	elseif level>=110 and level<=119 then
		return 5
	end
	return -1
end

function OpenSongliao()
	local ��ͼ�� = lua("return GetCurrentSceneName()")
	if ��ͼ��~="����ս��" and ��ͼ��~="���Ź�ǰ��" then
		local Week = os.date("%A")
		if Week~="Tuesday" and Week~="Thursday" then
			��Ļ��ʾ("����û������")
			return false
		end
	
		local time = tonumber(lua("return DataPool:GetServerMinuteTime()"))
		if time>213000 then
			��Ļ��ʾ("������")
			return false
		end

		local level = GetLevel()
		if level==-1 then
			��Ļ��ʾ("�ȼ�������Ҫ��")
			return false
		end
	else
		return true
	end

	while true do
		local ��ͼ�� = lua("return GetCurrentSceneName()")
		if ��ͼ��~="����ս��" and ��ͼ��~="���Ź�ǰ��" then
			local level = GetLevel()
			local ��Ϣ = ����INFO[level]

			local NPCEventList = lua([[
				if IsWindowShow("Quest") then
					local a,b,c,d,e =DataPool:GetNPCEventList_Item(0)
					return e
				end
			]])
			if NPCEventList=="#{SLDZ_220216_44}" then
				return false
			end

			��ͼѰ·(��Ϣ.scene,��Ϣ.x,��Ϣ.y)��ʱ(1000)
			�Ի�NPC(��Ϣ.npc)��ʱ(1000)
			NPC�����Ի�("#{SLDZ_100805_03}")��ʱ(1000)

			�Ի�NPC(��Ϣ.npc)��ʱ(1000)
			lua("ContexMenu_LeaveTeam_Clicked()")��ʱ(100)
			lua(string.format([[
				if Target:GetDialogNpcName()=="%s" and DataPool:GetNPCEventList_Num()>0 then
					local a,b,c,d,e =DataPool:GetNPCEventList_Item(1)
					if a~="text" then
						QuestFrameOptionClicked(b,c,d)
					end
				end
			]],��Ϣ.npc))	��ʱ(5000)
			�ȴ���ͼ���()
		else
			return true
		end
		��ʱ(1000)
	end

end


function StartSongliao()
	local ���� = lua([[
		local ret, name, score, towerScore, damage, damageAfford, damageDefend, cure, kill, camp = CSongliaoWarData:TSLGetMyScoreData()
		return camp
	]])
	local ������INFO = {}
	if ����=="157" then
		������INFO = {
			{name="#{SLDZ_220216_168}",x=108,y=230},
			{name="#{SLDZ_220216_167}",x=160,y=219},
			{name="#{SLDZ_220216_169}",x=212,y=230},
			{name="#{SLDZ_220216_162}",x=192,y=243},
			{name="#{SLDZ_220216_163}",x=212,y=268},
			{name="#{SLDZ_220216_161}",x=127,y=243},
			{name="#{SLDZ_220216_164}",x=107,y=268},
			{name="#{SLDZ_220216_165}",x=159,y=291},
		}
	else
		������INFO = {
			{name="#{SLDZ_220216_172}",x=212,y=91},
			{name="#{SLDZ_220216_170}",x=160,y=96},
			{name="#{SLDZ_220216_171}",x=108,y=92},
			{name="#{SLDZ_220216_161}",x=127,y=76},
			{name="#{SLDZ_220216_164}",x=107,y=49},
			{name="#{SLDZ_220216_162}",x=192,y=76},
			{name="#{SLDZ_220216_163}",x=212,y=49},
			{name="#{SLDZ_220216_166}",x=159,y=27},
		}
	end
	for i=1,#������INFO do
		if lua("return GetCurrentSceneName()")~="����ս��" then
			return
		end
		�ȴ���ͼ���()
		��������()
		while true do
			if lua("return GetCurrentSceneName()")~="����ս��" then
				break
			end
			�ȴ���ͼ���()
			��������()
			local act = ������INFO[i]
			��ͼѰ·("����ս��",act.x,act.y)��ʱ(300)
			�Զ����()
			local ret = lua(string.format([[
				for i=1,2000 do
					if SetMainTargetFromList(i ,false, false)==1 then
						if Target:GetName()=="%s" then
							return i
						end
					end
				end
				return -1
			]],act.name))
			if ret~="-1" then
				��������(tonumber(ret)) ��ʱ(800)
			else
				break
			end
		end
	end
	if lua("return GetCurrentSceneName()")=="����ս��" then
		if ����=="157" then
			��ͼѰ·("����ս��",297,227)��ʱ(300)
		else
			��ͼѰ·("����ս��",21,88)��ʱ(300)
		end

		while lua("return GetCurrentSceneName()")=="����ս��" do
			�Ի�NPC("��������")��ʱ(800)
			�Ի�NPC("��������")��ʱ(800)
			NPC�����Ի�("#{SLDZ_100805_37}")��ʱ(800)
			NPC�����Ի�("#{INTERFACE_XML_557}")��ʱ(800)
			�ȴ���ͼ���()
		end
	end
	while lua("return GetCurrentSceneName()")=="���Ź�ǰ��" do
		��Ļ��ʾ("�ȴ�����")
		��ʱ(5000)
		�ȴ���ͼ���()
	end

end


if not OpenSongliao() then
	return
end
while true do
	�ȴ���ͼ���()
	if lua("return GetCurrentSceneName()")=="���Ź�ǰ��" then
		��Ļ��ʾ("�ȴ�����ս��")
		��ʱ(5000)
	else
		break
	end
end
if lua("return GetCurrentSceneName()")=="����ս��" then
	StartSongliao()
		
	local ��Ϣ = ����INFO[GetLevel()]
	��ͼѰ·(��Ϣ.scene,��Ϣ.x,��Ϣ.y)��ʱ(1000)
	�Ի�NPC(��Ϣ.npc)��ʱ(1000)
	NPC�����Ի�("#{SLDZ_100805_03}")��ʱ(1000)
end

--function Buy����()
--	��ͼѰ·("����",310,203)��ʱ(1000)
--	�Ի�NPC("������")��ʱ(1000)
--	NPC�����Ի�("#{PVPZH_220124_31}")��ʱ(1000)	--����
--	NPC�����Ի�("#{PVPZH_220124_32}")��ʱ(1000)	--���
--end


local itemname = {"�ࣨ�Σ�","܇���Σ�","�h���Σ�","�ڣ��ɣ�","܇���ɣ�","�����ɣ�","�䣨�ɣ�","���ɣ�","�h���Σ�","�h���Σ�","�R���Σ�","�����Σ�","�����Σ�","܇���Σ�","܇���Σ�","�R���Σ�","�ˣ��Σ�","�ࣨ�Σ�","�����Σ�","�����Σ�","���������񡤺���","��������񡤺���","����������ӥ��","���������ӥ��","���������񡤻�Х","��������񡤻�Х","��������������","�������������"}
for i=1,#itemname do
	local count = ��ȡ������Ʒ����(itemname[i])
	for i=1,count do
		�Ҽ�ʹ����Ʒ(itemname[i])
		��ʱ(300)
	end
end


for k=1,#���׽��_������Ʒ�� do
	local name = ���׽��_������Ʒ��[k].name
	local num = ���׽��_������Ʒ��[k].num
	��Ļ��ʾ(name)
	for i=1,num do
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
		]],name,name))
		��ʱ(1000)
	end
end
�Ҽ�ʹ����Ʒ("ѩ֥ҩɢ")



