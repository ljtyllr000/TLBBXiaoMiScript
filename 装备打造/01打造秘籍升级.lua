	function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		DebugListBox_ListBox:AddInfo("#e0000ff#u#g28f1ff".."������������ʾ��%s")	--
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
	]], strCode))
end

function ����_д��ɫ������(AAA, BBB, CCC)
    local ����= ��ȡ������Ϣ(12)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
	if AAA~=nil and BBB~=nil and CCC~=nil  then
		����_������ʾ("д��ɫ������|"..AAA.."|"..BBB.."|"..CCC);��ʱ(200)
		д������(·��,AAA,BBB,CCC);��ʱ(200)
	end
end

function ����_����ɫ������(AAA, BBB)
    local ����= ��ȡ������Ϣ(12)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
    local tem =��������(·��,AAA,BBB)
	if tem ~=nil then
		����_������ʾ(AAA.."|"..BBB.."=="..tem);��ʱ(500)
		else
		return 0
	end
	return tem
end





---------------------------------------------------------�ر�����-----------------------------------------------------------------
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

function ����_�һ�ʹ����Ʒ(index) --�������
	LUA_Call(string.format([[
		local theAction = EnumAction(%d, "packageitem");
		if theAction:GetID() ~= 0 then
				setmetatable(_G, {__index = Packet_Env});
				local oldid = Packet_Space_Line1_Row1_button:GetActionItem();
				Packet_Space_Line1_Row1_button:SetActionItem(theAction:GetID());
				Packet_Space_Line1_Row1_button:DoAction();
				Packet_Space_Line1_Row1_button:SetActionItem(oldid);
		end
	]], index))
end


function ����_������Ʒ(��Ʒ�б�,�Ƿ��)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	for i=0,59 do
			local tem = LUA_ȡ����ֵ(string.format([[
				tbangding =tostring("%s")
				i =%d
				ttname = "%s"
				local theAction=EnumAction(i,"packageitem")
			    local GetName=theAction:GetName()
				local szItemNum =theAction:GetNum();
				local Status=GetItemBindStatus(i);
					if GetName~=nil and GetName ~="" then
						if string.find(ttname,GetName ) then
							if string.find(tbangding,tostring(Status)) then
								PushDebugMessage("������Ʒ:"..GetName.."|����λ��:"..i)
								return 1
							end	
						end
					end
				return -1
					]],tbangding, i,��Ʒ�б�))
				if tonumber(tem)==1 then 
					for k=1,5 do
						if �����Ƿ����("Shop")==1 then
							����_�һ�ʹ����Ʒ(i)
							��ʱ(1000)
							break
						else
							��ͼѰ·("����",184,274)
							�Ի�NPC("�Ž���")
							��ʱ(1000)
						end
					end
					��ʱ(200)
			end
		end
end



----------------------------------------------------------------------------------------------------------------------

function ����_ȡ�ؼ�����(Index)	
	local tem=   LUA_ȡ����ֵ(string.format([[
		Index =%d-1
		local theAction = EnumAction(Index, "combobook")
		if (theAction:GetID() ~= 0 ) then
			local bookname = Player:GetComboBookInfo(Index, "bookname");
			local nLevel = Player:GetComboBookInfo(Index, "level");
			return bookname
		end
		return -1
	]], Index))
	return tem
end

function ����_�����ؼ�(Index)	
	LUA_ȡ����ֵ(string.format([[
		local xiuweivalue =  Player : GetData( "XIUWEI" )
		Index =%d-1
		local theAction = EnumAction(Index, "combobook")
		if (theAction:GetID() ~= 0 ) then
			local levelupneed =  Player : GetComboBookInfo(Index, "nextlevelexp");
			if xiuweivalue > levelupneed then
				AskLevelupComboBook(Index);
				else
				PushDebugMessage("�ĵò���:"..levelupneed)
			end
		end
			]], Index))
end
	


function ����_�һ��ؼ�(index)
	��ͼѰ·("����",219,245);��ʱ(1500)
	�Ի�NPC("������");��ʱ(1500)
	NPC�����Ի�("�һ������ؼ�");��ʱ(1500)
	NPC�����Ի�("500��",1);��ʱ(1500)
	����_���(index-1)
end


function ����_ȫ�Զ��ؼ�()
	if not string.find(����_ȡ�ؼ�����(1),"���¾Ž�") then
		ȡ����Ʒ("�ؼ���ҳ")
		if ��ȡ������Ʒ����("�ؼ���ҳ")< 500 then
			return
		end
		����_�һ��ؼ�(1)
		����_������()
		�Ҽ�ʹ����Ʒ("���¾Ž�")
		��ʱ(10000)
		����Ʒ("�ؼ���ҳ")
	end

	if not string.find(����_ȡ�ؼ�����(2),"�����澭") then
		ȡ����Ʒ("�ؼ���ҳ")
		if ��ȡ������Ʒ����("�ؼ���ҳ")< 500 then
			return
		end
		����_�һ��ؼ�(2)
		����_������()
		�Ҽ�ʹ����Ʒ("�����澭")
		��ʱ(10000)
		����Ʒ("�ؼ���ҳ")
	end

	if not string.find(����_ȡ�ؼ�����(3),"���վ�") then
		ȡ����Ʒ("�ؼ���ҳ")
		if ��ȡ������Ʒ����("�ؼ���ҳ")< 500 then
			return
		end
		����_�һ��ؼ�(3)
		����_������()
		�Ҽ�ʹ����Ʒ("���վ�")
		��ʱ(10000)
		����Ʒ("�ؼ���ҳ")
	end
end

function ����_�ؼ�����()
	if string.find(����_ȡ�ؼ�����(1),"���¾Ž�") and  string.find(����_ȡ�ؼ�����(2),"�����澭") and string.find(����_ȡ�ؼ�����(3),"���վ�") then
		����_������Ʒ("�ؼ���ҳ",2)
	else
		����Ʒ("�ؼ���ҳ")
	end
end


for i =1,20 do
	����_�����ؼ�(1)	
	����_�����ؼ�(2)	
	����_�����ؼ�(3)
end
--����_ȫ�Զ��ؼ�()
--����_�ؼ�����()
