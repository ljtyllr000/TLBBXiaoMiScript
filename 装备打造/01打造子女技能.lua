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

function ����_ȡ����Ǯ()
	����Ǯ=��ȡ������Ϣ(52) +��ȡ������Ϣ(45)
	return ����Ǯ
end



function ����_ȡ��Ů���ܵȼ�(��������)
	local tem = LUA_ȡ����ֵ(string.format([[
		for i = 0, 3 do
			local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
			if szSkillName=="%s" then
				return nSkillLevel
			end
		end	
		return -1
		]],��������))  
		return tonumber(tem)
end

function ����_ȡ��Ů������ŵȼ�(���)
	local tem = LUA_ȡ����ֵ(string.format([[
			i =%d-1
			local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,i)
			return nSkillLevel
		]],���))  
		return tonumber(tem)
end


function ����_ȡ��Ů�������(��������)
	local tem = LUA_ȡ����ֵ(string.format([[
		for i = 0, 3 do
			local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
			if szSkillName=="%s" then
				return i+1
			end
		end	
		return -1
		]],��������))  
		return tonumber(tem)
end

function ����_ȡ��Ů���ܵȼ�(��������)
	local tem = LUA_ȡ����ֵ(string.format([[
		for i = 0, 3 do
			local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
			if szSkillName=="%s" then
				return nSkillLevel
			end
		end	
		return -1
		]],��������))  
		return tonumber(tem)
end

function ����_��Ů�����ض�����(��������,�ȼ�)
	����_������ʾ("��Ů�����ض�����:"..��������..�ȼ�)
	for i=1,20 do
			if ��ȡ������Ʒ����("������")<=0 then
					����_������ʾ("������û��")
					return
			end
			if ����_ȡ����Ǯ() <= 5*10000 then
				����_������ʾ("��Ҳ���")
					return
			end	
		local tem = LUA_ȡ����ֵ(string.format([[
				local InfantCount = Infant:GetInfantCount();
				if InfantCount <= 0  then
						return 2
				end
			guid_H, guid_L = Infant:GetInfantGUID(0);
			nSkillID2=-1
			for i = 0, 3 do
				local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
					if szSkillName=="%s" then
						nSkillID2=nSkillID
						if nSkillLevel>= %d then
							return 2
						end
					end
				end	
			if nSkillID2 == -1 then
				return 2
			end
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("InfantSkillLevelUp");
			Set_XSCRIPT_ScriptID(890600);
			Set_XSCRIPT_Parameter(0,guid_H);
			Set_XSCRIPT_Parameter(1,guid_L);
			Set_XSCRIPT_Parameter(2,nSkillID2);
			Set_XSCRIPT_Parameter(3,1);
			Set_XSCRIPT_ParamCount(4);
		Send_XSCRIPT();
		]],��������,�ȼ�))  
		��ʱ(3000)	
		if tonumber(tem) == 2 then
				break
		end
	end
end
----------------------------------------------------------------------------------------------------

function ����_��Ů��������(�ȼ�)
	for kkk=1,4 do
		����_������ʾ("������Ů�������"..kkk)
		for i=1,20 do
			if ����_ȡ��Ů������ŵȼ�(kkk) >= �ȼ�  then
				break
			end	
			if ��ȡ������Ʒ����("������")<=0 then
					����_������ʾ("������û��")
					return
			end
			if ����_ȡ����Ǯ() <= 5*10000 then
				����_������ʾ("��Ҳ���")
					return
			end	
			local tem = LUA_ȡ����ֵ(string.format([[
					i=%d-1
					local InfantCount = Infant:GetInfantCount();
					if InfantCount <= 0  then
							return 2
					end
				guid_H, guid_L = Infant:GetInfantGUID(0);
				local nSkillID, nSkillLevel, nSkillEffect, nSkillUpRate, szSkillName, szIcon, szTipsInfo = Infant:GetInfantSkillInfo(0,  i )
				if nSkillLevel >= 9  or  nSkillLevel >= %d then
					return 2
				end
				if nSkillID == -1 then
					return 2
				end
				Clear_XSCRIPT();
					Set_XSCRIPT_Function_Name("InfantSkillLevelUp");
					Set_XSCRIPT_ScriptID(890600);
					Set_XSCRIPT_Parameter(0,guid_H);
					Set_XSCRIPT_Parameter(1,guid_L);
					Set_XSCRIPT_Parameter(2,nSkillID);
					Set_XSCRIPT_Parameter(3,1);
					Set_XSCRIPT_ParamCount(4);
				Send_XSCRIPT();
			]],kkk,�ȼ�))  
			��ʱ(3000)		
			if tonumber(tem) == 2 then
				break
			end	
		end
	end	
end

function ����_��Ů����ȫ�Զ�����(�ȼ�,�Ƿ񶾿�)	
	ȡ����Ʒ("������");��ʱ(2000)
	ȡ����Ʒ("���");��ʱ(2000)
	��ͼѰ·("����",150,183)		
	if �Ƿ񶾿� == 1 then
		����_��Ů�����ض�����("����",�ȼ�)
	end	
	����_��Ů��������(�ȼ�)
	����Ʒ("������");��ʱ(2000)
	����Ʒ("���")
end

function ����_��Ů����ƽ������(�Ƿ񶾿�,���ȵȼ�)	
	for i=1,9 do
		if �Ƿ񶾿� == 1 then
			����_��Ů�����ض�����("����",���ȵȼ�)
		end	
		����_��Ů��������(i)
	end
end

function ����_��Ů����ȫ�Զ�����(�Ƿ񶾿�,���ȵȼ�)	
	����_������ʾ("��Ů����ȫ�Զ�����")
	ȡ����Ʒ("������");
	ȡ����Ʒ("���");
	if ��ȡ������Ʒ����("������") >=1  and ����_ȡ����Ǯ() >= 5*10000 then
		��ͼѰ·("����",150,183)		
		����_��Ů����ƽ������(�Ƿ񶾿�,���ȵȼ�)
		else
		����_������ʾ("�������Ҳ���")
	end	
	����Ʒ("������");
	����Ʒ("���");
end

function ����_�жϹرմ���(strWindowName)
	if �����Ƿ����(strWindowName)==1 then
		LUA_Call(string.format([[
			setmetatable(_G, {__index = %s_Env}) this:Hide()  
		]], strWindowName))  
		��ʱ(1500)
	  end
end

function ����_ȡ��Ů����()
	for k =1, 5 do
		if  �����Ƿ����("Infant")~=1  then
			LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
			LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Infant_Switch();");��ʱ(2000)
			LUA_Call ("setmetatable(_G, {__index = Infant_Env});Infant_SetCheckBox(1);");��ʱ(2000)
		else
			local tem=LUA_ȡ����ֵ(string.format([[
				return Infant:GetInfantCount();
			]]))  
			����_�жϹرմ���("SelfEquip")
			return tonumber(tem)
		end
		��ʱ(500)
	end
	return 0
end

function ����_ȡ��Ů�ȼ�()
		local tem=LUA_ȡ����ֵ(string.format([[
			TTCount = Infant:GetInfantCount()
			if TTCount<= 0 then
				return 0
			end
			return Infant:GetInfantLevel(0)
			]]))  
		return tonumber(tem)
end


------------------------------------------------------------------------------------

if ����_ȡ��Ů�ȼ�() >=31 then
	����_��Ů����ȫ�Զ�����(1,5)	
end