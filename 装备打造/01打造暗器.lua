--1 ϴ��
--2 �Ǽ����� ---
--3 ���� ���� ����
--4 ������������ ������ ����
--	װ���ȼ���׼��
local g_FightScore_DarkScore_Level_List =
{
	--	�Ƽ���������	�Ƽ���������ҵȼ�+�ٱ���ͨ�ȼ�,ֻҪ�����С,һ�ɶ������
	[1] = {name = "�ɻ�ʯ", level = 75, needlevel = 30, param = 10},
	[2] = {name = "÷����", level = 90, needlevel = 50, param = 50},
	[3] = {name = "��������", level = 120, needlevel = 70, param = 100},
	[4] = {name = "�������", level = 120, needlevel = 90, param = 250},
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
function ����_ȡ���＼��(����) --1 
	local tem = LUA_ȡ����ֵ(string.format([[ 
	local num =tonumber(GetActionNum("skill"))
	for i = 1, num do 
		local theAction = EnumAction(i-1, "skill")
		local nSkillId = LifeAbility : GetLifeAbility_Number(theAction:GetID())
		local strName = Player:GetSkillInfo(nSkillId,"name")
		local strName2 = Player:GetSkillInfo(nSkillId,"skilldata")
		if nSkillId> 0 then 
			if strName == "%s" then 
				return 1
			end
		end
	end	
	return -1
	]], ����))
	return tonumber(tem)
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

function ����_ȡ����Ǯ()
	����Ǯ=��ȡ������Ϣ(52) +��ȡ������Ϣ(45)
	return ����Ǯ
end

function ����_ȡ����װ���ȼ�(aaa)
		local tem =  LUA_ȡ����ֵ(string.format([[ 
				local  index =%d
				local ID =EnumAction(index,"equip"):GetID()
				if ID > 0 then
					return	DataPool:GetEquipLevel(index)  --װ���ȼ� ����99��
				end
				return -1
			]], aaa))
			--return LifeAbility:GetWearedEquip_NeedLevel(index) --��Ҫ�ȼ�
		return  tonumber(tem)
end


function  ����_ȡ����װ���־�(aaa)
	local tem = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa))
		return  tonumber(tem)
end

function  ����_ȡ����װ��ID(aaa)
	local tem = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], aaa))
	return  tonumber(tem)
end

function ����_ȡ����װ������(aaa)
	return  LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end


function ����_ȡ���ϰ���Ʒ��()
	local aaa=  LUA_ȡ����ֵ(string.format([[ 
		local g_FightScore_DarkScore_Quality_List =
{
	[1] = {qua=40, str="��ͨ", param=20},			--	��ͨ
	[2] = {qua=80, str="����", param=40},			--	����
	[3] = {qua=120, str="�ܳ�", param=60},			--	�ܳ�
	[4] = {qua=160, str="׿Խ", param=80},			--	׿Խ
	[5] = {qua=200, str="����", param=100},			--	����
}
		local nNeedLevel = LifeAbility:GetWearedEquip_NeedLevel(17)
		local nGrade = LifeAbility:GetWearedDark_QualityGrade(17)
		for i,vItem in g_FightScore_DarkScore_Quality_List do
			if ( i == 1 and nGrade < vItem.qua ) or ( i > 1 and nGrade < vItem.qua and nGrade >= g_FightScore_DarkScore_Quality_List[i - 1].qua ) or ( i == 5 and nGrade >= vItem.qua ) then
				return  vItem.str
			end
		end
		return -1
	]], index))
	return aaa
end

function  ����_ȡ����װ���ȼ�(index)
local aaa=  LUA_ȡ����ֵ(string.format([[ 
		return LifeAbility : Get_Equip_Level(%d);
	]], index))
	return tonumber(aaa)
end

function  ����_ȡ�����������()--300���
       if  tonumber(����_ȡ����װ��ID(18) )>0 then
			return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return DataPool:GetKfsData("LIFE")
	]])))
	else
		return -1
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
--------------------------------------------------װ�����------------------------------------------------
local SelfEuipList =
{
	[1]  = { name="����", downIndex=11,  equipIndex=0, equipName="" },    --- ����
	[2]  = { name="����", downIndex=3, equipIndex=14, equipName=""},    --- ����
	[3]  = { name="��ָ��", downIndex=7,  equipIndex=6,equipName=""  },    --- ��ָ���ϣ�
	[4]  = { name="��ָ��", downIndex=8,  equipIndex=11, equipName=""},    --- ��ָ���£�
	[5]  = { name="������", downIndex=9,  equipIndex=12, equipName=""},    --- �������ϣ�
	[6]  = { name="������", downIndex=10, equipIndex=13, equipName=""},    --- �������£�
	[7]  = { name="�·�", downIndex=12,  equipIndex=2,equipName=""  },    --- �·�
	[8]  = { name="ñ��", downIndex=1,  equipIndex=1, equipName="" },    --- ñ��
	[9]  = { name="����", downIndex=2, equipIndex=15,equipName="" },    --- ���
	[10] = { name="����", downIndex=4,  equipIndex=3, equipName="" },    --- ����
	[11] = { name="����", downIndex=5,  equipIndex=5, equipName="" },    --- ����
	[12] = { name="Ь��", downIndex=6,  equipIndex=4, equipName="" },    --- Ь��
	[13] = { name="����", downIndex=13,  equipIndex=7,equipName=""  },    --- ����
	[14] = { name="����", downIndex=14, equipIndex=17, equipName=""},    --- ����
	[15] = { name="����", downIndex=25, equipIndex=19,equipName="" },    --- ����
	[16] = { name="���", downIndex="", equipIndex=18,equipName="" },    --- ���
	[17] = { name="����", downIndex=16, equipIndex=20,equipName="" },    --- ����
}

----------------���---------------------------



function ����_ȡ��װ����ȡ����(װ��λ������)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			����_������ʾ("׼��ȡ��װ��λ��:"..װ��λ������)
				local װ���־� =����_ȡ����װ���־�(SelfEuipList[i].equipIndex)
				if װ���־� <= 0 then
					����_������ʾ("װ���־ò���,��ȡ��")
					return 0
				end
				if ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0  then
					return 0
				end
				
				for k =1, 10 do	
					local  װ������ = ����_ȡ����װ������(SelfEuipList[i].equipIndex)
					if  �����Ƿ����("SelfEquip")~=1  then
						LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
					end
					LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEuipList[i].downIndex))
					��ʱ(5000)
					if  ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0 then
						����_�жϹرմ���("SelfEquip")
						return װ������
					end	
				end	
				return 0
			end
		end
end

function ����_����װ��(װ��λ������,װ������)
     if װ������==""  then
		����_������ʾ("��������,����_����װ��")
		return
	end
	if ��ȡ������Ʒ����(װ������)<=0 then
			����_������ʾ("û��װ��"..װ������.."�޷�װ��")
			return
	end	
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			for k =1, 5 do
				�Ҽ�ʹ����Ʒ(װ������);��ʱ(2000)
				if  ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) > 0 then
					����_������ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ������)
					break   
				end
			end
		end
	end
end


function ����_ȡ���ϰ�����Ϣ(index)
	local tem =LUA_ȡ����ֵ(string.format([[
			index =%d
			local humanLYAddHP = LifeAbility:GetWearedDarkLY_CuiduHP(17) --ʵ�ʰ���Ѫ����
			local humanLYAddPro = LifeAbility:GetWearedDarkLY_CuiduPro(17) --ʵ�ʰ������Թ�
			local humanLYAddHit = LifeAbility:GetWearedDarkLY_CuiduHit(17) --ʵ�ʰ�������
			if index == 1 then
				return humanLYAddHP
			elseif index == 2 then
				return humanLYAddPro
			elseif index == 3 then	
				return humanLYAddHit
				else
				return humanLYAddHP
			end
				]],index), "n")
	return tonumber(tem)
end


function ����_ȡ��������(����)
	local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	if  ���� == 1 then
		local tem =LUA_ȡ����ֵ(string.format([[
			local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
			local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
			local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
			local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
			local tt={ iIceAttack, iFireAttack, iThunderAttack,iPoisonAttack}
			if iIceAttack==math.max(unpack(tt)) then
				maxOfT ="��"
			elseif  iFireAttack==math.max(unpack(tt)) then
				maxOfT ="��"
			elseif  iThunderAttack==math.max(unpack(tt)) then
				maxOfT ="��"
			elseif  iPoisonAttack==math.max(unpack(tt)) then
				maxOfT ="��"
			end
			return maxOfT 
				]]), "s")
			���Թ���=tem
			����_������ʾ("���Թ���:"..���Թ���)
	end

	if  ���� == 2 then
		if string.find("����|����|ؤ��", menpai) then
			���Թ���="��"
		elseif  string.find("��ң|����|", menpai) then
			���Թ���="��"
		elseif  string.find("����|��ɽ|", menpai) then
			���Թ���="��"
		elseif  string.find("����|����|���|Ľ��|�䵱", menpai) then
			���Թ���="��"
		end
	end
	if  ���� == 3 then
		local  ������������ = "111|aaa|"
		local  ������������ = "111|aaa|"
		local  ������������ = "111|aaa|"
		local  ������������ = "111|aaa|"
	
		if string.find(������������, ��������) then
			���Թ���="��"
		elseif  string.find(������������, ��������) then
			���Թ���="��"
		elseif  string.find(������������, ��������) then
			���Թ���="��"
		elseif  string.find(������������, ��������) then
			���Թ���="��"
		end
	end
	return ���Թ���
end



---------------------------------------------------------------��������------------------------------------------
function ����_ȡ���ϰ�������ֵ(index)
		local tem = LUA_ȡ����ֵ(string.format([[
			index = %d-1
			local  theAction = EnumAction(17, "equip");
			local ID  =theAction:GetID()
			if ID > 0 then
				local EquipAttrNum =  theAction:GetEquipAttrCount()
				local tempstr = theAction:EnumEquipExtAttr(index)
				if string.find(tempstr, "#{") then
						local left = string.find(tempstr, "#{")
						local left2 = string.find(tempstr, "}")
						local strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))	
						local strTempNum= tonumber(string.sub(tempstr,left2+3))
						return strTempNum
				end
			end	
			return -1
	]],index), "b")
	return tonumber(tem)
end

function ����_ȡ������������ֵ(���,index)
		local tem = LUA_ȡ����ֵ(string.format([[
			xxx=%d
			index = %d-1
			local  theAction = EnumAction(xxx,"packageitem")
			local ID  =theAction:GetID()
			if ID > 0 then
				local EquipAttrNum =  theAction:GetEquipAttrCount()
				local tempstr = theAction:EnumEquipExtAttr(index)
				if string.find(tempstr, "#{") then
						local left = string.find(tempstr, "#{")
						local left2 = string.find(tempstr, "}")
						local strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))	
						local strTempNum= tonumber(string.sub(tempstr,left2+3))
						return strTempNum
				end
			end	
			return -1
	]], ���, index), "b")
	return tonumber(tem)
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
	for i=0,200 do
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

function ����_ȡ��������Ʒ(��Ʒ�б�)
	ȡ����Ʒ(��Ʒ�б�)
	����_������Ʒ(��Ʒ�б�,2)
	����Ʒ(��Ʒ�б�)
end
---------------------------------------------------------------------------------------------------------
function ����_��������ԭʼ����(���)
	local ���ϰ����ȼ� = ����_ȡ����װ���ȼ�(17)
	if ���ϰ����ȼ� <90 then
		����_������ʾ("��������ԭʼ����,�ȼ�����90��������") 
		��ʱ(1000)
		return
	else
		����_������ʾ("��������ԭʼ����") 	
		��ʱ(500)
	end	

	if 	 ����_����ɫ������("���쳬������", "��������ԭʼ����")== "1" then
		����_������ʾ("��������ԭʼ����,��������") 
		return
	end
	local ���ϰ�������ֵ=����_ȡ���ϰ�������ֵ(���)
	����_������ʾ("���ϰ���ԭʼ����ֵ:"..���ϰ�������ֵ) 
	if ���ϰ�������ֵ <= 2 then
		return
	end

	if ����_ȡ����Ǯ() <= 10*10000 or ��ȡ������Ʒ����("����ʯ") == 0 then
		����_������ʾ("��������ԭʼ����,���ϲ���")
			return
	end
	��ͼѰ·("����",207,342)
	local װ������= ����_ȡ��װ����ȡ����("����")
	   ��ʱ(2000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	
	
	for kkk=1,99 do
		local ԭʼ���� =����_ȡ������������ֵ(LPindex,���)
		����_������ʾ("ԭʼ����:"..ԭʼ����)
		if ԭʼ���� <=2 then
			break
		end
		if ����_ȡ����Ǯ() <= 1*10000 or ��ȡ������Ʒ����("����ʯ")< 1 then
			����_������ʾ("��������ԭʼ����,���ϲ���")
			break
		end	
		LUA_Call(string.format([[	
			DataPool:DarkAdjustAttr(%d, %d ,0)
		]], LPindex,���))
		��ʱ(2000)
	end
	����_����װ��("����",װ������)	
end

function ����_�������ܴ���ԭʼ����()
	local ���ϰ����ȼ� = ����_ȡ����װ���ȼ�(17)
	if ���ϰ����ȼ� <90 then
		����_������ʾ("�������ܴ���ԭʼ����,�ȼ�����90��������") 
		��ʱ(1000)
		return
	else
		����_������ʾ("�������ܴ���ԭʼ����") 	
		��ʱ(500)
	end	
	ȡ����Ʒ("����ʯ")
	��������,����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	if tonumber( ���⹥��) == 1 then
		if ����_ȡ���ϰ�������ֵ(1) <=2 and ����_ȡ���ϰ�������ֵ(4) <=4 then
			 ����_������Ʒ("����ʯ",2)
			else
			����_��������ԭʼ����(1)
			����_��������ԭʼ����(4)
		end
	else
		if ����_ȡ���ϰ�������ֵ(1) <=2 and ����_ȡ���ϰ�������ֵ(4) <=4 then
			 ����_������Ʒ("����ʯ",2)
			else
			����_��������ԭʼ����(1)
			����_��������ԭʼ����(4)
		end
	end	
	����Ʒ("����ʯ")
end

-------------------------------------------------------------------------------------
function ����_������ϴƷ��()
	����_������ʾ("������ϴƷ��") 
	
	if ����_ȡ���ϰ���Ʒ��()=="����" then
		����_������ʾ("������ϴƷ������,��������") 
		��ʱ(3000)
		return
	end		
	
	if 	 ����_����ɫ������("���쳬������", "������ϴƷ��")== "1" then
		����_������ʾ("������ϴƷ��,��������") 
		return
	end
	--local ���ϰ�������ֵ=����_ȡ���ϰ�������ֵ(���)
	--����_������ʾ("���ϰ���ԭʼ����ֵ:"..���ϰ�������ֵ) 
	--if ���ϰ�������ֵ <= 2 then
		--return
	--end
	ȡ����Ʒ("�ٴ�����|ǧ������")
	ȡ����Ʒ("���")
	if ����_ȡ����Ǯ() <= 1*10000 or ��ȡ������Ʒ����("�ٴ�����|ǧ������") == 0 then
		����_������ʾ("������ϴƷ��,���ϲ���")
			return
	end
	��ͼѰ·("����",207,342)
	local װ������= ����_ȡ��װ����ȡ����("����")
	   ��ʱ(2000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	
	for kkk=1,99 do
		if ����_ȡ����Ǯ() <= 1*10000 or ��ȡ������Ʒ����("�ٴ�����|ǧ������")< 1 then
			����_������ʾ("������ϴƷ��,���ϲ���")
			break
		end	
		if  ��ȡ������Ʒ����("�ٴ�����")>=1 then
			LUA_Call(string.format([[	
				DataPool:DarkResetQuality(%d, 1 ,0, 0);
			]], LPindex))
			��ʱ(2000)
		end
		if  ��ȡ������Ʒ����("ǧ������")>=1 then
			LUA_Call(string.format([[	
				DataPool:DarkResetQuality(%d, 2 ,0, 0);
			]], LPindex))
		end
		��ʱ(2000)
	end
	����_����װ��("����",װ������)		
end
-------------------------------------------------------------------
function ����_�����̻Ṻ����Ʒ(����, ����, ����,�ж��Ƿ�����Ʒ)
     ȡ����Ʒ("���",200000)  
	for k=1,9 do
	local str=string.format("�����̻Ṻ����Ʒ:%s|����%d|����%d", ����, ����, ����)
     ����_������ʾ(str)
     if tonumber(�ж��Ƿ�����Ʒ)==1 then
      if ��ȡ������Ʒ����(����)>=���� then
		����_������ʾ("�������������Ʒ"..����)
	    break
       end
	end 
    if �����Ƿ����("1PS_ShopSearch")== 0 then
      �ƴ�ѭ�� i=1,5 ִ��
             ��ͼѰ·("����",330,299)
             ��� �Ի�NPC("�Ǹ�ʢ")==1 ��
              ��ʱ (1000)
               NPC�����Ի�("�鿴�����̵�")
               ��ʱ (1000)
               ��� �����Ƿ����("PS_ShopList")==1 ��
                          	LUA_Call([[setmetatable(_G, {__index = PS_ShopList_Env}) PS_ShopList_ChangeTabIndex(3)]])	
                            ��ʱ (1000)
                    ����ѭ��
               ����    
          ����
    ����
	--������Ʒ
    end
	
     ��ʱ (2000)
	LUA_Call(string.format([[	
         PlayerShop:PacketSend_Search(2 , 2, 1, "%s", 1)		
	]], ����))
	��ʱ(1500)
	--������һҳ��û�з�����������Ʒ
	local tem = LUA_ȡ����ֵ(string.format([[
	        setmetatable(_G, {__index = PS_ShopSearch_Env})
			for i = 1 ,10 do 
				local theAction = EnumAction( i - 1 , "playershop_cur_page")
				if theAction:GetID() ~= 0 then
					--��Ʒ��,������,�����̵�ID,����,����
					local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
					if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
					    if pName == "%s" and pCount <= %d and  (pYB/pCount) <= %d  then
						   PushDebugMessage(pName.."|"..pShopName.."|����:"..pCount.."|�ܼ�:"..pYB)
						   --��������,ֱ�ӷ���
						   PlayerShop:SearchPageBuyItem(i - 1, "item")
						   return true
						end
					end
				end
			end
            return false
	]], ����, ����, ����), "b")
    ��ʱ (2000)
	end
    ����_�жϹرմ���("PS_ShopSearch")
	����_�жϹرմ���("PS_ShopList")
	����_�жϹرմ���("Quest")	
end

function ����_�����Զ���������ʯ()
	����_������ʾ("�Զ���������ʯ")
	for i =1,9 do
		ȡ����Ʒ("������ʯ")
		if ��ȡ������Ʒ����("������ʯ") <=0 then
				ȡ����Ʒ("������м")
				if ��ȡ������Ʒ����("������м") >=20 then
					����_������ʾ("�Զ��һ�������м");��ʱ(500)
					��ͼѰ·("¥��",134,118);��ʱ(500)
					�Ի�NPC("Ǯ����");��ʱ(500)
					NPC�����Ի�("�һ�������ʯ",1);��ʱ(500)
					NPC�����Ի�("�һ�������ʯ",1);��ʱ(500)
				else
					����Ʒ("������м")
					return -1
				end
		else
			return 1		
		end
	end
end




function ����_������������()
	�������� =����_ȡ����װ������(17) 
	if ��������== "�ϻ���" then
		ȡ����Ʒ("�����")
		����_�����̻Ṻ����Ʒ("�����",100,700,1)
		if ��ȡ������Ʒ����("�����")>=50 then
			����_ȡ��װ����ȡ����("����")
			��ͼѰ·("����",215,325);��ʱ(2500) 
			if �Ի�NPC("����") ==1  then
				NPC�����Ի�("�ϻ��ڴ��찵��",1);
				��ʱ(2500) 
				NPC�����Ի�("����");
				��ʱ(2500) 
				����_����װ��("����","�ϻ���")
				����_����װ��("����","÷����")
			end
		end
	elseif ��������== "÷����" then
		if ����_ȡ����װ���ȼ�(17) >= 90 then
			if ����_�����Զ���������ʯ() ==1 then
				ȡ����Ʒ("���")
				if ����_ȡ����Ǯ() <200*10000 then
					����_������ʾ("Ǯ������Ҫ������")
					��ʱ(1500)
					return
				end	
				����_������ʾ("��ʼ��ɱ�������");��ʱ(1500) 
				��ͼѰ·("¥��",134,118);��ʱ(500)
					local װ������= ����_ȡ��װ����ȡ����("����")
					��ʱ(2000) 
					����_������ʾ(װ������)
					if װ������ == 0 then
							 return -1
						else
					   LPindex=��ȡ������Ʒλ��(װ������)-1	
					end
					������ʯ��� =��ȡ������Ʒλ��("������ʯ")-1	
				local tem = LUA_ȡ����ֵ(string.format([[	
				Clear_XSCRIPT()
					Set_XSCRIPT_Function_Name( "Anqi2Shenzhen" )
					Set_XSCRIPT_ScriptID( 260001 )
					Set_XSCRIPT_Parameter( 0, %d)
					Set_XSCRIPT_Parameter( 1, %d )
					Set_XSCRIPT_ParamCount(2)
				Send_XSCRIPT()
					]], LPindex, ������ʯ���), "b")
				��ʱ(3000)
				����_����װ��("����",װ������)
				����_����װ��("����","��������")
			end	
		end
	end
end




--------------------------------------------------------------------------------------
function ����_ȡ����װ��������(���)
	local main_lv = LUA_ȡ����ֵ(string.format([[
		local EquipQual = DataPool:GetEquipQual(%d) 
		return EquipQual
		]],���))  
		return tonumber(main_lv)
end	

function ����_ֻ�ܽ��������������(���)
	
	if ����_ȡ����Ǯ() <= 1*10000 or ��ȡ������Ʒ����("�嶾��Ԫ��") == 0 then
		����_������ʾ("������ϴƷ��,���ϲ���")
			return
	end
	
	��ͼѰ·("����",207,403)
	local װ������= ����_ȡ��װ����ȡ����("����")
	��ʱ(2000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	
	LUA_Call(string.format([[	
	local g_LingYuLianDuItem = {20800039,20800041,20800043}
	g_Dark_Bag_Index = %d
	g_Dark_SelectPro  =  %d
	local needItemCount,needJz = DataPool : GetLYDarkLianduCostDataInBag(g_Dark_Bag_Index, g_Dark_SelectPro)
	if (g_Dark_Bag_Index == -1) then
		PushDebugMessage("#{AQJJ_160127_93}")
		return
	end
	
	--��ѡ����ϴ����
	if (g_Dark_SelectPro == -1) then
		PushDebugMessage("#{AQJJ_160127_101}")
		return
	end

	local EquipPoint = LifeAbility : Get_Equip_Point(g_Dark_Bag_Index)
	if (EquipPoint ~= 17) then
		PushDebugMessage("#{AQJJ_160127_99}")
		return
	end
	
	--��������
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name("LingyuLianDu")
		Set_XSCRIPT_ScriptID(260001)
		Set_XSCRIPT_Parameter(0,g_Dark_Bag_Index)
		Set_XSCRIPT_Parameter(1,g_Dark_SelectPro)
		Set_XSCRIPT_ParamCount(2)
	Send_XSCRIPT()
	]], ���))
	
	����_����װ��("����",װ������)
end

function ����_�Զ�����������()
	local ��������= ����_ȡ����װ������(17)
	if �������� ~= "�������" then
		local str=string.format("��������[%s]�����ڽ������,��������", ��������)
		����_������ʾ(str)
		��ʱ(2000)
		return
	end	
	if ����_ȡ����װ��������(17) >= 8 then
		����_ȡ��������Ʒ("��Ȫ��Ӣ")
	end

	if ����_ȡ���ϰ�����Ϣ(1) >=10688  then
		����_ȡ��������Ʒ("�嶾��Ԫ��")
	end
	if ����_ȡ���ϰ�����Ϣ(2) >=176  then
		����_ȡ��������Ʒ("�嶾�����")
	end
	if ����_ȡ���ϰ�����Ϣ(2) >=2175  then
		����_ȡ��������Ʒ("�嶾������")
	end
end

function ����_ѧϰ�����ַ�()
	local ���ϰ����ȼ� = ����_ȡ����װ���ȼ�(17)
	if ���ϰ����ȼ� <90 then
		����_������ʾ("ѧϰ�����ַ�,�ȼ�����90��������") 
		��ʱ(1000)
		return
	else
		����_������ʾ("ѧϰ�����ַ�") 	
		��ʱ(500)
	end	
	
	for i =1, 5 do
		if ����_ȡ���＼��("����Ͷ��") == 1 or ����_ȡ����Ǯ() < 2*10000 then
			break
		end	
		��Ļ��ʾ("ѧϰ�����ַ�-����Ͷ��")
		��ͼѰ·("����",207,342)
		if �Ի�NPC("����")==1 then
            NPC�����Ի�("ѧϰ�����ַ�",0)
			��ʱ(1000)
			NPC�����Ի�("ѧϰ40",1)
			��ʱ(1000)
			NPC�����Ի�("ȷ��",1)
		end		
		��ʱ(2000)
	end	
	for i =1, 5 do
		
		if ����_ȡ���＼��("������Ѩ") == 1 or ����_ȡ����Ǯ() < 10*10000 then
			break
		end	
		��Ļ��ʾ("ѧϰ�����ַ�-������Ѩ")
		��ͼѰ·("����",207,342)
		if �Ի�NPC("����")==1 then
            NPC�����Ի�("ѧϰ�����ַ�",0)
			��ʱ(1000)
			NPC�����Ի�("ѧϰ70",1)
			��ʱ(1000)
			NPC�����Ի�("ȷ��",1)
		end		
		��ʱ(2000)
	end	
	for i =1, 5 do
		if ����_ȡ���＼��("��������") == 1 or ����_ȡ����Ǯ() < 50*10000 then
			break
		end	
		��Ļ��ʾ("ѧϰ�����ַ�-��������")
		��ͼѰ·("����",207,342)
		if �Ի�NPC("����")==1 then
            NPC�����Ի�("ѧϰ�����ַ�",0)
			��ʱ(1000)
			NPC�����Ի�("ѧϰ90",1)
			��ʱ(1000)
			NPC�����Ի�("ȷ��",1)
		end		
		��ʱ(2000)
	end	
end



function ����_ϴѪ����(index)

        local isWQ = LUA_ȡ����ֵ(string.format([[
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("DarkSkillAdjustForBagItem");
		Set_XSCRIPT_ScriptID(332207);
		Set_XSCRIPT_Parameter(0,%d);
		Set_XSCRIPT_Parameter(1,0);
		Set_XSCRIPT_ParamCount(2);
	Send_XSCRIPT();
			 ]],index),"n")
end

function ����_ȡ��ϴ��ļ���()
        local isWQ = LUA_ȡ����ֵ(string.format([[
					local desc0,desc1,desc2 = DataPool:GetDarkSkillNewDesc()
					return desc2
			 ]], "s"))
	return tostring(isWQ) 
end

function ����_ȡ��������(index)
        local isWQ = LUA_ȡ����ֵ(string.format([[
					local desc0,desc1,desc2 = DataPool:GetDarkSkillDesc(%d)
					return desc2
			 ]],index),"n")
	return tostring(isWQ) 
end
	

function ����_ȷ������(index)
        local isWQ = LUA_ȡ����ֵ(string.format([[
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("DoRefreshDarkSkill");
			Set_XSCRIPT_ScriptID(332207);
			Set_XSCRIPT_Parameter(0,%d);
			Set_XSCRIPT_Parameter(1,0);
			Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT();
			 ]],index))
end		


function ����_����ȫ�Զ�ϴѪ����()
	if tonumber(����_����ɫ������("���쳬������","����Ѫ����")) == 1 then
		����_������ʾ("����ȫ�Զ�ϴѪ����,�Ѿ���Ѫ������,��������") 
		��ʱ(500)
		return
	end	

	local ���ϰ����ȼ� = ����_ȡ����װ���ȼ�(17)
	if ���ϰ����ȼ� <90 then
		����_������ʾ("����ȫ�Զ�ϴѪ����,�ȼ�����90��������") 
		��ʱ(1000)
		return
	else
		����_������ʾ("����ȫ�Զ�ϴѪ����") 	
		��ʱ(500)
	end	
	
	װ��λ������ ="����"
	ȡ����Ʒ("����ʯ")
	ȡ����Ʒ("���")
	if ��ȡ������Ʒ����("����ʯ")< 1 then
		return
	end
	if ����_ȡ����Ǯ()<=5*10000 then	
			return
	end
		
	local װ������= ����_ȡ��װ����ȡ����(װ��λ������)
	     ��ʱ(2000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	 if string.find (����_ȡ��������(LPindex),"Ѫ����") then 	
			����_д��ɫ������("���쳬������","����Ѫ����",1)
			����_������ʾ(װ������.."�Ѿ���Ѫ��������������")
			����Ʒ("����ʯ")
			����Ʒ("���")
			����_����װ��(װ��λ������,װ������)	
			
			��ʱ(3000)	
			return 
	end		
	if ����_ȡ����װ���ȼ�(LPindex)< 90 then
			����_������ʾ(װ������.."�ȼ�С��90��������")
			����Ʒ("����ʯ")
			����Ʒ("���")
			����_����װ��(װ��λ������,װ������)	
			��ʱ(3000)	
			return 
	end	
	��ͼѰ·("����",207,343)
					for  i = 1,999 do 
						if ��ȡ������Ʒ����("����ʯ")< 1 then
								break
							end
						if ����_ȡ����Ǯ()<=5*10000 then	
								break
							end
						����_ϴѪ����(LPindex)
						��ʱ(3000)
						��ϴ��Ķ�����= ����_ȡ��ϴ��ļ���()
						��Ļ��ʾ(��ϴ��Ķ�����)
						if string.find (��ϴ��Ķ�����,"Ѫ����") then
							����_ȷ������(LPindex)
							��ʱ(5000)
								 if string.find (����_ȡ��������(LPindex),"Ѫ����") then 
									
									����_д��ɫ������("���쳬������","����Ѫ����",1)
										break
								end	
						end
					end
						��ʱ(3000)
						����Ʒ("����ʯ")
						����Ʒ("���")
					����_����װ��(װ��λ������,װ������)		
end


����_������ϴƷ��()	
����_������������()			
����_����ȫ�Զ�ϴѪ����()	
����_ѧϰ�����ַ�()
����_�������ܴ���ԭʼ����()
����_������ϴƷ��()
����_�Զ�����������()