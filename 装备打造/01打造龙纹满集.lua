

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


function  ����_ȡ�������ƺϳɵȼ�()
	local tem=   LUA_ȡ����ֵ(string.format([[
		local ID =EnumAction(19,"equip"):GetID()
		if ID> 0 then
			local  Level = LifeAbility:GetWearedLongWen_Level(19)
			return Level
		end
		return -1
	]]))
	return tonumber(tem)
end

function  ����_ȡ���������Ǽ��ȼ�()
	local tem=   LUA_ȡ����ֵ(string.format([[
		local ID =EnumAction(19,"equip"):GetID()
		if ID> 0 then
			local nQua = LifeAbility:GetWearedLongWen_Star(19)
			return nQua
		end
		return -1
	]]))
	return tonumber(tem)
end

function  ����_ȡ����������Ϣ(AAA)
	local tem=   LUA_ȡ����ֵ(string.format([[
		local ID =EnumAction(19,"equip"):GetID()
		if ID> 0 then
			local nExAttLevel = LifeAbility:GetWearedLongWen_AttLevel(19, %d-1)
			return nExAttLevel 
		end
		return -2	
	]], AAA))
	return tonumber(tem)
end

function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ103900393��ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
		--#Y
	]], strCode))
end





function ����_ȫ�Զ��������Ʋ���(�Ǽ������б�)
	local ���ƺϳɵȼ� =����_ȡ�������ƺϳɵȼ�()

	if ���ƺϳɵȼ�>=100 then
		local str= string.format("��ǰ���Ƶȼ�:[%d]������,ִ���������",���ƺϳɵȼ�)
		����_������ʾ(str)
		��ʱ(3000)
		ȡ����Ʒ("��������|����Ѫ��")
		����_������Ʒ("��������|����Ѫ��",2)
	else
		local str= string.format("��ǰ���Ƶȼ�:[%d]û������,���������������",���ƺϳɵȼ�)
		����_������ʾ(str)
		��ʱ(3000)
	end
	local �����Ǽ��ȼ�= ����_ȡ���������Ǽ��ȼ�()
	if �����Ǽ��ȼ� >= 8 then
		local str= string.format("��ǰ�����Ǽ��ȼ�:[%d]������,ִ���������",�����Ǽ��ȼ�)
		����_������ʾ(str)
		��ʱ(3000)
		ȡ����Ʒ(�Ǽ������б�)
		����_������Ʒ(�Ǽ������б�,2)
	else
		local str= string.format("��ǰ�����Ǽ��ȼ�:[%d]û������,���������������",�����Ǽ��ȼ�)
		����_������ʾ(str)
		��ʱ(3000)	
	end

	local ����Ѫ���޵ȼ�=  ����_ȡ����������Ϣ(1)
	local ���Ƽ����ȼ� = ����_ȡ����������Ϣ(2)
	local �������Թ����ȼ� = ����_ȡ����������Ϣ(3)
	if ����Ѫ���޵ȼ� >= 10 then
		local str= string.format("����Ѫ���޵ȼ�:[%d]������,ִ���������",����Ѫ���޵ȼ�)
		����_������ʾ(str)
		��ʱ(3000)
		ȡ����Ʒ("׺��ʯ��Ԫ")
		����_������Ʒ("׺��ʯ��Ԫ",2)
	else
		local str= string.format("����Ѫ���޵ȼ�:[%d]û������,���������������",����Ѫ���޵ȼ�)
		����_������ʾ(str)
		��ʱ(3000)	
	end
	
	if ���Ƽ����ȼ� >= 10 then
		local str= string.format("���Ƽ����ȼ�:[%d]������,ִ���������",���Ƽ����ȼ�)
		����_������ʾ(str)
		��ʱ(3000)
		ȡ����Ʒ("׺��ʯ����")
		����_������Ʒ("׺��ʯ����",2)
	else
		local str= string.format("���Ƽ����ȼ�:[%d]û������,���������������",���Ƽ����ȼ�)
		����_������ʾ(str)
		��ʱ(3000)	
	end
	
	if �������Թ����ȼ� >= 10 then
		local str= string.format("�������Թ����ȼ�:[%d]������,ִ���������",�������Թ����ȼ�)
		����_������ʾ(str)
		��ʱ(3000)
		ȡ����Ʒ("׺��ʯ����")
		����_������Ʒ("׺��ʯ����",2)
	else
		local str= string.format("�������Թ����ȼ�:[%d]û������,���������������",�������Թ����ȼ�)
		����_������ʾ(str)
		��ʱ(3000)	
	end
end


����_ȫ�Զ��������Ʋ���("������ʺϳɷ�|��������ʺϳɷ�|�м������|���������|������")