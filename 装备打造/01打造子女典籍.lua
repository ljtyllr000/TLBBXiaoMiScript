
znEuipList =
{
	[1]  = { name="����", downIndex=0,  equipIndex=0, equipName="" },   
	[2]  = { name="����", downIndex=1, equipIndex=1, equipName=""},    
	[3]  = { name="����", downIndex=2,  equipIndex=5,equipName=""  },   
	[4]  = { name="����", downIndex=3,  equipIndex=4, equipName=""},    
	[5]  = { name="��", downIndex=4,  equipIndex=2, equipName=""},    
	[6]  = { name="����", downIndex=5, equipIndex=3, equipName=""},    
}

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

function ����_����ȷ��()
	if  �����Ƿ����("MessageBox_Self")==1 then
		����_������ʾ("����ȷ��")
		LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
		��ʱ(2000)
	end
end

function ����_���ڹر�(strWindowName)
      if �����Ƿ����(strWindowName)==1 then
	    LUA_Call(string.format([[
	            setmetatable(_G, {__index = %s_Env}) this:Hide()  
	  ]], strWindowName))  
		��ʱ(2000)
	  end
end

function ����_�жϹرմ���(strWindowName)
	if �����Ƿ����(strWindowName)==1 then
		LUA_Call(string.format([[
			setmetatable(_G, {__index = %s_Env}) this:Hide()  
		]], strWindowName))  
		��ʱ(1500)
	  end
end

-------------------------------------------------��Ů����---------------------------------
function ����_ȡ��Ůװ��ID(index)
		local tem =LUA_ȡ����ֵ(string.format([[
	        return EnumAction(%d ,"infantcard"):GetID()
	  ]], index));
	return tonumber(tem)
end

function ����_ȡ��Ůװ������(index)
		local tem =LUA_ȡ����ֵ(string.format([[
	        return EnumAction(%d ,"infantcard"):GetName()
	  ]], index));
	return tostring(tem)
end

function ����_ȡ��Ů�伮�ȼ�(index)
		local tem =LUA_ȡ����ֵ(string.format([[
	        return PlayerPackage:GetInfantCard_EnhanceLevel(%d)
	  ]], index));
	return tonumber(tem)
end
		
		

function ����_ȡ����Ůװ����ȡ����(װ��λ������)
	for i =1,#znEuipList do
		if znEuipList[i].name == װ��λ������ then
			����_������ʾ("׼��ȡ��װ��λ��:"..װ��λ������)
				if ����_ȡ��Ůװ��ID(znEuipList[i].equipIndex) == 0  then
					return 0
				end
				for k =1, 10 do	
					local  װ������ = ����_ȡ��Ůװ������(znEuipList[i].equipIndex)
					����_������ʾ("׼��ȡ��װ��λ��:"..װ������)	
					if  �����Ƿ����("Infant")~=1  then
						LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
						LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Infant_Switch();");��ʱ(2000)
						LUA_Call ("setmetatable(_G, {__index = Infant_Env});Infant_SetCheckBox(1);");��ʱ(2000)
					end
					LUA_Call(string.format([[setmetatable(_G, {__index = Infant_Env}); Infant_Card_Clicked(%d,0);]], znEuipList[i].downIndex))
					��ʱ(5000)
					if  ����_ȡ��Ůװ��ID(znEuipList[i].equipIndex) == 0 then
						����_�жϹرմ���("Infant")
						����_�жϹرմ���("SelfEquip")
						return װ������
					end	
				end	
				return 0
			end
		end
end

function ����_������Ůװ��(װ��λ������,װ������)
     if װ������==""  then
		����_������ʾ("��������,����_������Ůװ��")
		return
	end
	if ��ȡ������Ʒ����(װ������)<=0 then
			����_������ʾ("û��װ���޷�ʹ��,����_������Ůװ��")
			return
	end	
	for i =1,#znEuipList do
		if znEuipList[i].name == װ��λ������ then
			for k =1, 5 do
				if  �����Ƿ����("Infant")~=1  then
					LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
					LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Infant_Switch();");��ʱ(2000)
					LUA_Call ("setmetatable(_G, {__index = Infant_Env});Infant_SetCheckBox(1);");��ʱ(2000)
				end
				�Ҽ�ʹ����Ʒ(װ������);��ʱ(2000)
				if  ����_ȡ��Ůװ��ID(znEuipList[i].equipIndex) > 0 then
					����_�жϹرմ���("Infant")
					����_�жϹرմ���("SelfEquip")
					����_������ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ������)
					break   
				end
			end
		end
	end
end



-----------------------------------------------------------------------------------------


function ����_��Ů�伮����(װ��λ������,�ȼ�)
	local �伮�ȼ�=tonumber( ����_����ɫ������("��������", װ��λ������.."�伮�ȼ�"))
	if �伮�ȼ� >= �ȼ� then
		����_������ʾ(װ��λ������..�ȼ�.."|��������")
		return 
	end
		ȡ����Ʒ("�伮ע��")
	if ��ȡ������Ʒ����("�伮ע��") <= 0 then
		����_������ʾ("���ϲ���")
		return
	end	
	��ͼѰ·("����",151,173)
	local װ������= ����_ȡ����Ůװ����ȡ����(װ��λ������)
	��ʱ(3000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	if ����_ȡ��Ů�伮�ȼ�(LPindex) >=�ȼ�  then
		����_������Ůװ��(װ��λ������,װ������)
		return
	end
		
	for i =1,50 do
		if ��ȡ������Ʒ����("�伮ע��") <= 0 then
			����_������ʾ("���ϲ���")
			break
		end	
		    LUA_Call(string.format([[
			g_BagIndex = %d
			if g_BagIndex == -1 then
		PushDebugMessage("#{ZSJX_140707_05}")
		return
	end
	
			local g_MoneyCost =10000
				local selfMoney = Player : GetData( "MONEY" ) + Player : GetData( "MONEY_JZ" )
	if selfMoney < g_MoneyCost then
		PushDebugMessage("#{KPWFS_131112_26}")
		return
	end
	
	local enhancelevel = PlayerPackage:GetInfantCard_EnhanceLevel(g_BagIndex)
	if enhancelevel >= %d then
		PushDebugMessage("#{KPWFS_131112_45}")
		return
	end
			
		--if PlayerPackage:CountAvailableItemByIDTable(38000807) <= 0 then
			--PushDebugMessage("���ϲ���")
			--return
		--end		
			
		 Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("StudyBooks");
			Set_XSCRIPT_ScriptID(890630);
			Set_XSCRIPT_Parameter(0,g_BagIndex);
			Set_XSCRIPT_Parameter(1,1);  
			Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT()
	  ]], LPindex,�ȼ�))
	��ʱ(2000)
	�伮�ȼ�=����_ȡ��Ů�伮�ȼ�(LPindex)
	if �伮�ȼ�>= �ȼ� then
		break
	end	
		��ʱ(3000)
	end
	local �伮�ȼ�=����_ȡ��Ů�伮�ȼ�(LPindex)
	����_д��ɫ������("��������", װ��λ������.."�伮�ȼ�",�伮�ȼ�) 
	����_������Ůװ��(װ��λ������,װ������)
end

function ����_��Ůȫ�Զ��伮����(�ȼ�)
	����_��Ů�伮����("����",�ȼ�)
	����_��Ů�伮����("����",�ȼ�)
	����_��Ů�伮����("����",�ȼ�)
	����_��Ů�伮����("����",�ȼ�)
	����_��Ů�伮����("��",�ȼ�)
	����_��Ů�伮����("����",�ȼ�)
end


function ����_��Ů�伮ƽ������()
	if tonumber(LUA_ȡ����ֵ('return Infant:GetHeroType(0);')) <= 0 then
		����_������ʾ("��Ůû�г���")
		return
	end	
	ȡ����Ʒ("�伮ע��")	
	ȡ����Ʒ("���")
	for i =1,9 do
		����_��Ůȫ�Զ��伮����(i)
	end
	����Ʒ("���")
	����Ʒ("�伮ע��")
end

---------------------------------------------------------
����_��Ů�伮ƽ������()	


