------------------------------------------------
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
	for i=0,199 do
			local tem = LUA_ȡ����ֵ(string.format([[
				local tbangding =tostring("%s")
				local i =%d
				local ttname = "%s"
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


function  ����_ȡ����������Ϣ(index)
	local aaa=  LUA_ȡ����ֵ(string.format([[ 
			index = %d
			local nType,BaoZhu1,BaoZhu2,BaoZhu3,BaoZhu4,nQual = DataPool:GetLingPaiInfo()
			--local IconName,ItemName = DataPool:GetLingPaiBaoZhuIconName(1)
			if nType> 0 then
				if index == 1 then
					return BaoZhu1
				end
				if index == 2 then
					return BaoZhu2
				end
				if index == 3 then
					return BaoZhu3
				end
				if index == 4 then
					return BaoZhu4
				end	
				if index == 5 then
					return nQual
				end	
									
			end
			return -1
	]], index))
	return tonumber(aaa)
end


function ����_ȫ�Զ����ƴ������()
	if ����_ȡ����������Ϣ(1)>=50 and ����_ȡ����������Ϣ(2)>=50 and  ����_ȡ����������Ϣ(3)>=50 and  ����_ȡ����������Ϣ(4)>=50 then
		ȡ����Ʒ("����ľ�")
		����_������Ʒ("����ľ�",2)
		else
		��Ļ��ʾ("���鶼û��")
		
	end
	
	local ��ǰ�������Ƶȼ� =����_ȡ����������Ϣ(5) 
	if ��ǰ�������Ƶȼ�>=8 then
		local ��ʾ =string.format("�����Ǽ�������ǰ�ȼ�[%d]",��ǰ�������Ƶȼ�)
		����_������ʾ(��ʾ) 
		��ʱ(1000)
		ȡ����Ʒ("����Һ")
		����_������Ʒ("����Һ",2)
		else
			local ��ʾ =string.format("�����Ǽ�������ǰ�ȼ�[%d],��������",��ǰ�������Ƶȼ�)
		����_������ʾ(��ʾ) 
	end
end


����_ȫ�Զ����ƴ������()