function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ103900393��ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end



function ����_д��ɫ������(AAA, BBB, CCC)
    local ����= ��ȡ������Ϣ(12)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
	if AAA~=nil and BBB~=nil and CCC~=nil  then
		����_������ʾ("д��ɫ������|"..AAA.."|"..BBB.."|"..CCC);��ʱ(20)
		д������(·��,AAA,BBB,CCC);��ʱ(20)
	end
end

function ����_����ɫ������(AAA, BBB)
    local ����= ��ȡ������Ϣ(12)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
    local tem =��������(·��,AAA,BBB)
	if tem then
		����_������ʾ("����ɫ����:"..AAA.."|"..BBB.."=="..tem);��ʱ(20)
	else
		return -1
	end
	return tem
end



function ����_дָ����ɫ������(����,AAA, BBB, CCC)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
	if AAA~=nil and BBB~=nil and CCC~=nil  then
		����_������ʾ("д��ɫ������|"..AAA.."|"..BBB.."|"..CCC);��ʱ(20)
		д������(·��,AAA,BBB,CCC);��ʱ(20)
	end
end

function ����_���ӽ�ɫ������(AAA, BBB, CCC)
     local tem =����_����ɫ������(AAA, BBB);��ʱ(2000)
	if tem ~=nil or  tem ~= "" then
		if  not string.find(tem,CCC) then
			CCC=tem..CCC
			��ʱ(2000)
			����_д��ɫ������(AAA, BBB, CCC)
		end	
	else
		��ʱ(2000)
		����_д��ɫ������(AAA, BBB, CCC)
	end
end

function ����_ɾ����ɫ������(AAA, BBB, CCC)
    local tem =����_����ɫ������(AAA, BBB);��ʱ(1000)
	if tem ~=nil and  tem ~= "" then
		if string.find(tem,CCC) then
			DDD=string.gsub(tem,CCC,"|")
			��ʱ(2000)
			����_д��ɫ������(AAA, BBB, DDD)
		end
		else
		����_������ʾ("ɾ����ɫ������..������")
	end
end




function ����_ȡ����ӡ�ȼ�()
	local main_lv = LUA_ȡ����ֵ(string.format([[
		 ActionHXY = EnumAction(21,"equip")
		if ActionHXY and ActionHXY:GetID() ~= 0 then
			local nEquipLevel = DataPool:Lua_GetHXYLevel(  )
			return  nEquipLevel 
		else
			return 0
		end
		]]))  
	return  tonumber( main_lv)
end


if ����_ȡ����ӡ�ȼ�() >= 100 then
	����_ɾ����ɫ������("����","ս����Ʒ", "����ѫ��")
	
	����_���ӽ�ɫ������("����","ս����Ʒ", "|����¶|")
	����_���ӽ�ɫ������("����","ս����Ʒ", "|��������|")
else
	ȡ����Ʒ("����¶")
	local �������� =��ȡ������Ʒ����("����¶")
	if ��������>=30 then
			����_ɾ����ɫ������("����","ս����Ʒ", "����¶")	
			����_���ӽ�ɫ������("����","ս����Ʒ", "|����ѫ��|")
			����_���ӽ�ɫ������("����","ս����Ʒ", "|��������|")
		else
			����_ɾ����ɫ������("����","ս����Ʒ", "��������")	
			����_���ӽ�ɫ������("����","ս����Ʒ", "|����¶|")
			����_���ӽ�ɫ������("����","ս����Ʒ", "|����ѫ��|")	
	end
	����Ʒ("����¶")
end	

ִ�й���("��ս����Ʒ")






function ����_����ӡ����()
	��Ļ��ʾ("����_����ӡ����")
	ȡ����Ʒ("����ѫ��")
	for i=1,20 do
		if ��ȡ������Ʒ����("����ѫ��")>0 then
			LUA_Call ("SelfJunXian_EquipHXYLevelup();");��ʱ(200)
		end
	end
	ִ�й���("�Զ����") 
end

����_����ӡ����()