
function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."��������ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function ����_ȡ������Ʒ����(��Ʒ�б�,�Ƿ��)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	local tem = LUA_ȡ����ֵ(string.format([[
		tem = 0
		for i= 0, 200 do
			tbangding =tostring("%s")
			ttname = "%s"
			local theAction=EnumAction(i,"packageitem")
			local GetName=theAction:GetName()
			
			local Status=GetItemBindStatus(i);
			if GetName~=nil and GetName ~="" then
				if string.find(ttname,GetName ,1,true) then
					if string.find(tbangding,tostring(Status)) then
						local szItemNum =theAction:GetNum();
						tem=tem+szItemNum
					end	
				end
			end
		end	
		return tem
			]],tbangding,��Ʒ�б�))
	return tonumber(tem)		
end
		
		
function ����_������ϴ(index)
	LUA_Call(string.format([[
		local atime =DataPool:GetServerDayTime()
		if atime >= 20220201 then
			return
		end
		m_Equip_Idx=%d
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("Lw_PropertyReset");
			Set_XSCRIPT_ScriptID(809273);
			Set_XSCRIPT_Parameter(0,m_Equip_Idx);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
		 ]], index))
end


function ����_����ȷ��(���)
	LUA_Call(string.format([[
			 Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("DoRefreshLw_Property");
			Set_XSCRIPT_ScriptID(809273);
			Set_XSCRIPT_Parameter(0,%d);
			Set_XSCRIPT_Parameter(1,0);
			Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT();
		 ]], ���))
end

		
		
function ����_ȡ������ϴ���ص�����()
	local isWQ = LUA_ȡ����ֵ(string.format([[
		local atime =DataPool:GetServerDayTime()
		if atime >= 20220201 then
			return
		end
		local num =  DataPool : Lua_GetRecoinNum();
	local str = ""
	for i = 0, num-1 do
		local tempstr = DataPool :Lua_GetRecoinEnumAttr(i)
		if string.find(tempstr, "#{") then
			local left = string.find(tempstr, "#{")
			local left2 = string.find(tempstr, "}")
			strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))	
		end 
			str = str..strTemp.."|"
	end
	return  str
	]], "s"))
	return tostring(isWQ) 
end
		
function ����_ȡ������ϴ���ص���������()
	local isWQ = LUA_ȡ����ֵ(string.format([[
		local num =  DataPool : Lua_GetRecoinNum();
		return num
				 ]], "n"))
	return tonumber(isWQ) 
end


-------------------------------------------------------------------------
��Ҫ����=
{ 
"�ڹ�����",
"�⹦����",
"����",
"����",
"�ڹ�����",
"�⹦����",
"����",
"������",
"���ķ���",
}

		
		

			
function ����_�Զ����Ƽ�Ʒ��ϴ(������,��Ҫ����)
		��ͼѰ·("������",125,201);��ʱ(1500)
		��� = ��ȡ������Ʒλ��("����")-1
		����_������ʾ("���"..���)
		
		if tonumber(���) < 0 then
			return
		end

	while  true do

		if ����_ȡ������Ʒ����("����ˮ",2) < 7 then
			����_������ʾ("����ˮ����7��ֹͣ")
			return
		end	
		����_������ϴ(���)
		��ʱ(3000)
		if ����_ȡ������ϴ���ص���������() >=������ then
			��ϴ�������= ����_ȡ������ϴ���ص�����()
			����_������ʾ(��ϴ�������)
			���� = 0
			for i=1,#��Ҫ���� do
				if string.find(��ϴ�������,��Ҫ����[i]) then
					����=����+1
				end
			end
			����_������ʾ("��Ҫ��������:"..����)
			��ʱ(3000)
			if tonumber(����) <= ��Ҫ���� then
				����_����ȷ��(���)
				return
			end	
		end
		��ʱ(3000)
	end
end
-------------------------------------------------------------------------------------------

local ��������,����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()

ȷ������ ={
["��ɽ"]={ "Ѫ����","������","����","�⹦",},
["���"]={ "Ѫ����","������","����","�⹦",},

["��ң"]={ "Ѫ����","������","����","�⹦",},


}

function ����_�Զ�����������ϴ()
		��ͼѰ·("������",125,201);��ʱ(1500)
		��� = ��ȡ������Ʒλ��("����")-1
		����_������ʾ("���"..���)
		
		if tonumber(���) < 0 then
			return
		end

	while  true do
		��ʱ(3000)
		if ��ȡ������Ʒ����("����ˮ") < 7 then
			����_������ʾ("����ˮ����7��ֹͣ")
			return
		end	
			��ϴ�������= ����_ȡ������ϴ���ص�����()
			����_������ʾ(��ϴ�������)
			tem = 0
			
			for i=1,#ȷ������[����] do
				if  string.find(��ϴ�������,ȷ������[����][i]) then
					tem =tem +1
				end
			end
			if tem ==table.getn(#��ɽ) then
				����_������ʾ("����ȷ����:"..tem)
				��ʱ(3000)
				����_����ȷ��(���)
				return
			end	
		����_������ϴ(���)
		��ʱ(3000)
	end
end
--����_�Զ�����������ϴ()
---------------------------------------------------------------------------------------------------------------------

--����_�Զ����Ƽ�Ʒ��ϴ(������,��Ҫ����)  
--������ ���ڵ���
--��Ҫ����С�ڵ���

����_�Զ����Ƽ�Ʒ��ϴ(7,1)  
