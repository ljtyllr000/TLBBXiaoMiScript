
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
function ����_����ȷ��()
	if  �����Ƿ����("MessageBox_Self")==1 then
		����_������ʾ("����ȷ��")
		LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
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

function  ����_ȡ����װ���ȼ�(index)
local aaa=  LUA_ȡ����ֵ(string.format([[ 
		return LifeAbility : Get_Equip_Level(%d);
	]], index))
	return tonumber(aaa)
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



function ����_ȡ��װ����ȡ����(װ��λ������)
	for i =1,17 do
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
			����_������ʾ("û��װ���޷�ʹ��,����_����װ��")
			return
	end	
	for i =1,17 do
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

function ����_ȡ��ϴ��ļ���(index)
		 local isWQ =""
		for i=1, 5 do
			 isWQ = LUA_ȡ����ֵ(string.format([[
						local str =""
						local  xuhao=%d
							local desc0,desc1,desc2 =  DataPool:GetDarkSkillNewDesc()
							if xuhao==1 then 
								str= desc0
							elseif  xuhao==2 then 
								str= desc1
							elseif xuhao==3 then 
								str= desc2
							end
						return str
				 ]],index))
			if isWQ~="" then
				return tostring(isWQ) 
			end
		end	
	return tostring(isWQ) 
end

function ����_ȡ��������(index,xuhao)
        local isWQ = LUA_ȡ����ֵ(string.format([[
					local str =""
					local desc0,desc1,desc2 = DataPool:GetDarkSkillDesc(%d)
					local  xuhao=%d
					if xuhao==1 then 
						str= desc0
					elseif  xuhao==2 then 
						str= desc1
					elseif xuhao==3 then 
						str= desc2
					end
					return str
			 ]],index,xuhao),"n")
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

function ����_ȡ��������(����)  --1��������� 2������
	if  �����Ƿ����("SelfEquip")~=1  then
		LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
	end
	
	local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	if  ���� ==1 then
		local tem =LUA_ȡ����ֵ(string.format([[
		local maxOfT="����"
		local	iIceDefine,iFireDefine,iThunderDefine,iPoisonDefine =0,0,0,0
		iIceAttack = Player:GetData( "ATTACKCOLD" );
		iFireAttack = Player:GetData( "ATTACKFIRE" );
		iThunderAttack = Player:GetData( "ATTACKLIGHT" );
		iPoisonAttack = Player:GetData( "ATTACKPOISON" );
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
		����_������ʾ("����ȡ����������Թ���:"..���Թ���)
	elseif  ���� == 2 then
		if string.find("����|����|ؤ��", menpai) then
			���Թ���="��"
		elseif  string.find("��ң|����|", menpai) then
			���Թ���="��"
		elseif  string.find("����|��ɽ|", menpai) then
			���Թ���="��"
		elseif  string.find("����|����|���|Ľ��|�䵱", menpai) then
			���Թ���="��"
		end
	else
		return -1
	end
	return ���Թ���
end

local �������� =����_ȡ��������(1)

function ����_����ȫ�Զ�ϴѪ����()
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
	 if string.find (����_ȡ��������(LPindex,3),"Ѫ����") and string.find (����_ȡ��������(LPindex,1),��������)  then 
			if string.find (����_ȡ��������(LPindex,2),"ɢ")  or  string.find (����_ȡ��������(LPindex,2),"���")  then

				����_������ʾ(װ������.."�Ѿ���Ѫ��������������")
				����Ʒ("����ʯ")
				����Ʒ("���")
				����_����װ��(װ��λ������,װ������)	
				��ʱ(3000)	
				return 
			end
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
						��ʱ(1000)
						local ��Ϣ1 =����_ȡ��ϴ��ļ���(1)
						local ��Ϣ2=����_ȡ��ϴ��ļ���(2)
						local ��Ϣ3 =����_ȡ��ϴ��ļ���(3)
						��Ļ��ʾ("1"..��Ϣ1)
						��Ļ��ʾ("2"..��Ϣ2)
						��Ļ��ʾ("3"..��Ϣ3)
						if string.find (��Ϣ3,"Ѫ����") and string.find (��Ϣ1,��������) then
							if string.find (��Ϣ2,"ɢ")  or  string.find (��Ϣ2,"���")  then
								����_ȷ������(LPindex)
								��ʱ(3000)
							end	
								 if string.find (����_ȡ��������(LPindex,3),"Ѫ����") and string.find (����_ȡ��������(LPindex,1),��������)  then 
										if string.find (��Ϣ2,"ɢ")  or  string.find (��Ϣ2,"���")  then
											break
										end
								end	
						end
					end
					��ʱ(500)
						����Ʒ("����ʯ")
						����Ʒ("���")
					����_����װ��(װ��λ������,װ������)		
end
			
function ����_����ȫ������()
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
	 if string.find (����_ȡ��������(LPindex,3),"Ѫ����") and string.find (����_ȡ��������(LPindex,1),��������)  then 

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
						��ʱ(1000)
						local ��Ϣ1 =����_ȡ��ϴ��ļ���(1)
						local ��Ϣ2=����_ȡ��ϴ��ļ���(2)
						local ��Ϣ3 =����_ȡ��ϴ��ļ���(3)
						��Ļ��ʾ("1"..��Ϣ1)
						��Ļ��ʾ("2"..��Ϣ2)
						��Ļ��ʾ("3"..��Ϣ3)
						if string.find (��Ϣ3,"Ѫ����") and string.find (��Ϣ1,��������) then
	
								����_ȷ������(LPindex)
								��ʱ(3000)
			
								 if string.find (����_ȡ��������(LPindex,3),"Ѫ����") and string.find (����_ȡ��������(LPindex,1),��������)  then 
					
											break
					
								end	
						end
					end
					��ʱ(500)
						����Ʒ("����ʯ")
						����Ʒ("���")
					����_����װ��(װ��λ������,װ������)		
end			
					����_����ȫ������()
--����_����ȫ�Զ�ϴѪ����()	