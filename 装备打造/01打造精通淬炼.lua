
--��ͨ��ϴ����һ���� 2021��12��28�� qq 103900393 �༭

local ȡ��������Ϊ =1

local ����ָ������ϴ=1
local ϴ��װ���б� =""



ϴ��װ���б�="|��ĺ|��¥|����|�������|������|��İʥ��|����ħ��|����|����|����ʥ��|����ʥѥ|����ħ��|����ħ��|��������|����ʥ��|��ˮ����|��ˮ���|��ˮ��ѥ|��ˮ����|��ˮ����|��ˮ��ѥ|��ѩ|����|����|˪��|����|��ĺ|��İʥ��|����|���|������|��������|��������|�Ắ|����|���|ǳ��|��ĺ|����|�Ắ|��ѩ|"

-----------------------------------------------------------------------------------------------------------------------------------------------
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

function  ����_ȡ����ȫ��Ǯ()
		local tem = LUA_ȡ����ֵ(string.format([[ 
			local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
			return selfMoney
			]]))
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


function ����_ȡ������ͨ����(index,����)
		local tem =LUA_ȡ����ֵ(string.format([[
			local theAction = EnumAction(%d, "packageitem")
			local tiaoshu=0
			for i= 0,2 do
				local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(i);
				if string.find(pName, "%s")  then
					tiaoshu=tiaoshu+1	
				end
			end
			return tiaoshu
	]], index,����), "n")
	return tonumber(tem)
end

--------------------------------------------------------------
function  ����_ȡ�����������()--300���
       if  ����ֵ( ����_ȡ����װ��ID(18) )>0 then
			return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return DataPool:GetKfsData("LIFE")
	]])))
	else
	return -1
    end
end

function ����_����ȷ��()     --������ȷ��
	for i=1,3 do
		if  �����Ƿ����("MessageBox_Self")==1 then
			LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
			��ʱ(2000)
		end
	end
end

function ����_�жϹرմ���(strWindowName)
	for i=1,3 do
		if �����Ƿ����(strWindowName)==1 then
			LUA_Call(string.format([[
				setmetatable(_G, {__index = %s_Env}) this:Hide()  
			]], strWindowName))  
			��ʱ(1500)
		  end
	end
end

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
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			����_������ʾ("׼��ȡ��װ��λ��:"..װ��λ������)
				local װ���־� =����_ȡ����װ���־�(SelfEuipList[i].equipIndex)
				if װ���־� <= 0 then
					����_������ʾ("װ���־ò���,��ȡ��")
					return 0
				end
				if ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) <= 0  then
					return 0
				end
				
				for k =1, 5 do	
					if  �����Ƿ����("SelfEquip")==1  then
						local  װ������ = ����_ȡ����װ������(SelfEuipList[i].equipIndex)
						LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEuipList[i].downIndex))
						��ʱ(2000)
						if  ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0 then
							����_�жϹرմ���("SelfEquip")
							return װ������
						end	
					else	
						LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
					end
				end	
				return 0
		end
	end
	��Ļ��ʾ("��ʾ���� ȡ��װ�� �������")
	��ʱ(2000)
end

function ����_ȡ����װ������(aaa)
	local tem = LUA_ȡ����ֵ(string.format([[ 
		local index =%d
		local theaction = EnumAction(index,"equip")
		if theaction then
			local  ID =theaction:GetID(); 
			if tonumber( ID) > 0 then
				local Name = EnumAction(index,"equip"):GetName()
				return  Name
			end	
		end
		return -1
	]], aaa))
	return tostring(tem)
end

function ����_ȡ����װ��λ������(װ��λ������)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			local  װ������ = ����_ȡ����װ������(SelfEuipList[i].equipIndex)
			return װ������
		end	
	end
end


function ����_ȡ���Ͼ�ͨ����(aaa,shuxing)
	local tem=  LUA_ȡ����ֵ(string.format([[ 
		local index = 0 
		local xuhao=%d
		local JdSX="%s"
		local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(xuhao) 
		if string.find(AttrName1,JdSX) then 
			index=index+1
		end
		if string.find(AttrName2,JdSX) then 
			index=index+1
		end	
		if string.find(AttrName3,JdSX) then 
			index=index+1
		end
		return index
		--PushDebugMessage(AttrLevel1..AttrName1..AttrLevel2..AttrName2..AttrLevel3..AttrName3)
	]], aaa,shuxing))
	return tonumber(tem)
end

function ����_ȡ���Ͼ�ͨ��С�ȼ�(aaa,shuxing)
	local tem=  LUA_ȡ����ֵ(string.format([[ 
		local index = 0 
		local xuhao=%d
		local JdSX="%s"
		local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(xuhao) 
		if string.find(AttrName1,JdSX) then 
			if index== 0 then
				index=AttrLevel1
			else
				if AttrLevel1 <index then
					index=AttrLevel1
				end
 			end
		end
		if string.find(AttrName2,JdSX) then 
			if index== 0 then
				index=AttrLevel2
			else
				if AttrLevel2 <index then
					index=AttrLevel2
				end
 			end
		end	
		if string.find(AttrName3,JdSX) then 
			if index== 0 then
				index=AttrLevel3
			else
				if AttrLevel3 <index then
					index=AttrLevel3
				end
 			end
		end
		return index
		--PushDebugMessage(AttrLevel1..AttrName1..AttrLevel2..AttrName2..AttrLevel3..AttrName3)
	]], aaa,shuxing))
	return tonumber(tem)
end

function ����_ȡ����װ��λ�þ�ͨ����(װ��λ������,shuxing)
	local tem = 0
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			tem=����_ȡ���Ͼ�ͨ����(SelfEuipList[i].equipIndex,shuxing)
		end	
	end
	return tonumber(tem)
end	

function ����_ȡ����װ��λ�þ�ͨ��С�ȼ�(װ��λ������,shuxing)
	local tem = 0
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			tem=����_ȡ���Ͼ�ͨ��С�ȼ�(SelfEuipList[i].equipIndex,shuxing)
		end	
	end
	return tonumber(tem)
end	


function ����_ʹ����Ʒ(��Ʒ�б�,�Ƿ��)
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
			if theAction:GetID() ~= 0 then
				local GetName=theAction:GetName()
				local szItemNum =theAction:GetNum();
				local Status=GetItemBindStatus(i);
				if GetName~=nil and GetName ~="" then
					if string.find("|"..ttname.."|","|"..GetName.."|",1,true) then
						if string.find(tbangding,tostring(Status)) then
							PushDebugMessage("���������һ���Ʒ:"..GetName.."|����λ��:"..i)
							return 1
						end	
					end
				end
			end	
			return -1
		]],tbangding, i,��Ʒ�б�))
  		if tonumber(tem)>= 1 then 
			LUA_Call(string.format([[
				local theAction = EnumAction(%d, "packageitem");
				if theAction:GetID() ~= 0 then
						setmetatable(_G, {__index = Packet_Env});
						local oldid = Packet_Space_Line1_Row1_button:GetActionItem();
						Packet_Space_Line1_Row1_button:SetActionItem(theAction:GetID());
						Packet_Space_Line1_Row1_button:DoAction();
						Packet_Space_Line1_Row1_button:SetActionItem(oldid);
				end
			]],i))
			��ʱ(1000)
		end
	end
end


function ����_����װ��(װ��λ������,װ������)
     if װ������==""  then
		����_������ʾ("��������,����_����װ��")
		����_������ʾ("��������,����_����װ��")
		����_������ʾ("��������,����_����װ��")
		��ʱ(2000)
		return
	end
	
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			for k =1, 5 do
				if  �����Ƿ����("SelfEquip")==1  then
					����_ʹ����Ʒ(װ������);��ʱ(2000)
					if  ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) > 0  then
						����_������ʾ("����ɹ�����"..װ������.."|��λ��:"..װ��λ������)
						����_�жϹرմ���("SelfEquip")
						break   
					end
				else	
					LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
				end
			end
		end
	end
end

-------------------------------------------------------------------------------------


function ����_װ������(װ��λ������,����,����)
	local JT_SHUXING=""
    if ����=="����" then
		JT_SHUXING="con"
	elseif ����=="��" then
		JT_SHUXING="attack_fire"
	elseif ����=="��" then
		JT_SHUXING="attack_light"
	elseif ����=="��" then
		JT_SHUXING="attack_cold"
	elseif ����=="��" then
		JT_SHUXING="attack_poison"  
	end
	if 	JT_SHUXING=="" then
		����_������ʾ("��ͨ���,�����úò���")
		��ʱ(1000)
		return		  
	end
	����_������ʾ("��ͨ���,"..װ��λ������..����..����)

	if ����ָ������ϴ==1 then
		if not string.find(ϴ��װ���б�,����_ȡ����װ��λ������(װ��λ������)) then
			��Ļ��ʾ("û�����б�ϴ")
			��ʱ(200)
			return
		end	
	end
	
	local ��ͨ���� =����_ȡ����װ��λ�þ�ͨ����(װ��λ������,JT_SHUXING)
	��Ļ��ʾ("�㵱ǰ��λ��:"..װ��λ������.."��������:"..��ͨ����)
	if ��ͨ���� >= ���� then
		��Ļ��ʾ(����.."��������")
		��ʱ(200)
		return
	end
	
	local ��ͨ����=tonumber( ����_����ɫ������("��ͨ���", װ��λ������.."��ͨ����"))
	if ��ͨ���� >= ���� then
		return 
	end
	
	--ȡ����Ʒ("���")
	if ��ȡ������Ʒ����("���")< 15 then
	    ����_������ʾ("��𲻹�15�� ������ͨ���")
		return
	end	
	
	if ����ֵ(��ȡ������Ϣ(45)+��ȡ������Ϣ(52)) <3*10000 then
		����_������ʾ("��ͨ���,��Ҳ���")
		return
	end

	��ͼѰ·("����",364,245)

	local װ������= ����_ȡ��װ����ȡ����(װ��λ������);��ʱ(2000) 
	����_������ʾ(װ������);��ʱ(2000) 
	if װ������ == 0 then
        return -1
	else
		LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	
	        for iii=1,999 do
		local tem =LUA_ȡ����ֵ(string.format([[
	    local index = tonumber(%d)
		
		local equip_level = LifeAbility : Get_Equip_Level(index);
		if equip_level <80 then
				PushDebugMessage("װ���ȼ��������ܴ���")
					return 2
		end
		
		
		
		local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
		if selfMoney<50000 then
					PushDebugMessage("����Ҳ���")
					return 2
		end
		
		
		  --local curTime = OSAPI:GetTickCount()
		  --PushDebugMessage(curTime)

               local theAction = EnumAction(index, "packageitem")
			
			   JT_ABC=tostring("%s") 
			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(0);
						 if	string.find(pName, JT_ABC)  then	
								JT_AAA=1
								else
								JT_AAA=0
						end
			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(1);		
			 if	string.find(pName, JT_ABC)  then
								JT_BBB=1
				else
								JT_BBB=0
				end
				
			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(2);		
			 if	string.find(pName,JT_ABC )  then
								JT_CCC=1
				else
								JT_CCC=0
			end	
			local JT_shuliang=JT_AAA+JT_BBB+JT_CCC
           if  JT_shuliang>=1 then
		   local itemneed=PlayerPackage:CountAvailableItemByIDTable(20700063) 
		    if itemneed < 15 then
				PushDebugMessage("��𲻹�")
			 return 2
			end
		   end
		
			PushDebugMessage("��ͨ�������:"..JT_AAA..JT_BBB..JT_CCC)
				    if JT_AAA+JT_BBB+JT_CCC>=%d then
						PushDebugMessage("��ͨ�����㹻����,���ٴ��")
						return 2
					end
					
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("EquipCuiLian");
				Set_XSCRIPT_ScriptID(890088);
				Set_XSCRIPT_Parameter(0,index);
				Set_XSCRIPT_Parameter(1,JT_AAA)
				Set_XSCRIPT_Parameter(2,JT_BBB)
				Set_XSCRIPT_Parameter(3,JT_CCC)
				Set_XSCRIPT_ParamCount(4);
			Send_XSCRIPT();	
		]], LPindex,JT_SHUXING,����), "d")
		��ʱ(500)
		 if tonumber(tem)==2 then
			break
		 end
		end
		��ʱ(500)
		��ͨ���� = ����_ȡ������ͨ����(LPindex,JT_SHUXING)
		��ʱ(500)
		����_д��ɫ������("��ͨ���", װ��λ������.."��ͨ����",��ͨ����) 
		����_����װ��(װ��λ������,װ������)
end



function ����_��ͨ����(װ��λ������,����,�ȼ�)

	if tonumber(�ȼ�) >= 30 and  tonumber(�ȼ�) < 40  then
		��Ҫ��������=14
	elseif tonumber(�ȼ�) >= 20 and  tonumber(�ȼ�) < 30  then
		��Ҫ��������=12
	elseif tonumber(�ȼ�) >=1 and  tonumber(�ȼ�) < 10  then
		��Ҫ��������=1		
	elseif tonumber(�ȼ�) >=10 and  tonumber(�ȼ�) < 20  then
		��Ҫ��������=6
	elseif tonumber(�ȼ�) >=40 and  tonumber(�ȼ�) < 50  then
		��Ҫ��������=16
	elseif tonumber(�ȼ�) >=50 and  tonumber(�ȼ�) < 60  then
		��Ҫ��������=18
	elseif tonumber(�ȼ�) >=60 and  tonumber(�ȼ�) < 70  then
		��Ҫ��������=20
	elseif tonumber(�ȼ�) >=70 and  tonumber(�ȼ�) < 80  then
		��Ҫ��������=22
	elseif tonumber(�ȼ�) >=80 and  tonumber(�ȼ�) < 90  then
		��Ҫ��������=24
	elseif tonumber(�ȼ�) >=90 and  tonumber(�ȼ�) < 100  then
		��Ҫ��������=25
	else
		 ��Ҫ��������=20
	end


	if ��ȡ������Ʒ����("����ʯ")< ��Ҫ�������� then
	    ��Ļ��ʾ(װ��λ������.."|װ��������ͨĿ��ȼ�:"..�ȼ�.."|����ʯ����"..��Ҫ��������.."|��������")
		return
	end	
	
	if ����ֵ(��ȡ������Ϣ(45)+��ȡ������Ϣ(52)) <5*10000 then
			    ��Ļ��ʾ("��ͨ��������,��Ҳ���")
		return
	end	
	
--����ж�

    if ����=="����" then
		JT_SHUXING="con"
	elseif ����=="��" then
		JT_SHUXING="attack_fire"
	elseif ����=="��" then
		JT_SHUXING="attack_light"
	elseif ����=="��" then
		JT_SHUXING="attack_cold"
	elseif ����=="��" then
		JT_SHUXING="attack_poison"
	else
	   ��Ļ��ʾ("��ͨ��������,�����úò���")
		return		    
	end
	��Ļ��ʾ("װ����ȡ������Ϊ:"..����)
	local ��ͨ��С�ȼ�=����_ȡ����װ��λ�þ�ͨ��С�ȼ�(װ��λ������,JT_SHUXING)
	��Ļ��ʾ(��ͨ��С�ȼ�)
	if ��ͨ��С�ȼ�>�ȼ� or ��ͨ��С�ȼ�== 0 then
			��Ļ��ʾ("û�о�ͨ���ߵȼ�����")
		return
	end	
	��ͼѰ·("����",364,245)

    local װ������= ����_ȡ��װ����ȡ����(װ��λ������)
    if װ������==0 then
        return
    end
	
	local  LPindex=��ȡ������Ʒλ��(װ������)-1
	��Ļ��ʾ("����ͨ�����ı������:"..LPindex)
	if LPindex<0 then
		return
	end
	
    for iii=1,999 do
		��Ļ��ʾ(iii)
		local tem =LUA_ȡ����ֵ(string.format([[
	    local index = tonumber(%d)
		local JT_ABC=tostring("%s") 
	    local nlevel= tonumber(%d)
		local equip_level = LifeAbility : Get_Equip_Level(index);
		if equip_level <80 then
				PushDebugMessage("װ���ȼ��������ܴ���")
				return 2
		end
		------------------
		local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
		if selfMoney<50000 then
					PushDebugMessage("��ͨ����������Ҳ���")
					return 2
		end
		------------------------------
            local theAction = EnumAction(index, "packageitem")
			local JT_XUHAO=-1
			for kkk=0,2 do
			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(kkk);
			    if(pLevel ~= nil and pLevel > 0) then
						 if	string.find(pName, JT_ABC)  then	
								if tonumber(pLevel) < nlevel  then
									JT_XUHAO= kkk+1
									JT_MQDJ=pLevel
								end
						end
					else
					PushDebugMessage("װ��û�д��� �޷�����")
					break	
				end		
			end		
			--PushDebugMessage("װ�������Զ�Ӧλ��:"..JT_XUHAO)
			
			if tonumber(JT_XUHAO)==-1 then
					return 2	
            end		
				
		   local itemneed= PlayerPackage:CountAvailableItemByIDTable(20700055)
		
		   if tonumber(JT_MQDJ) >= 30 and  tonumber(JT_MQDJ) < 40  then
			JT_XYJJS=14
		elseif tonumber(JT_MQDJ) >= 20 and  tonumber(JT_MQDJ) < 30  then
				JT_XYJJS=12
				elseif tonumber(JT_MQDJ) >=1 and  tonumber(JT_MQDJ) < 10  then
				JT_XYJJS=1		
				elseif tonumber(JT_MQDJ) >=10 and  tonumber(JT_MQDJ) < 20  then
				JT_XYJJS=6
								elseif tonumber(JT_MQDJ) >=40 and  tonumber(JT_MQDJ) < 50  then
				JT_XYJJS=16
								elseif tonumber(JT_MQDJ) >=50 and  tonumber(JT_MQDJ) < 60  then
				JT_XYJJS=18
								elseif tonumber(JT_MQDJ) >=60 and  tonumber(JT_MQDJ) < 70  then
				JT_XYJJS=20
												elseif tonumber(JT_MQDJ) >=70 and  tonumber(JT_MQDJ) < 80  then
				JT_XYJJS=22
												elseif tonumber(JT_MQDJ) >=80 and  tonumber(JT_MQDJ) < 90  then
				JT_XYJJS=24
												elseif tonumber(JT_MQDJ) >=90 and  tonumber(JT_MQDJ) < 100  then
				JT_XYJJS=25
				else
				 JT_XYJJS=20
				end
				
			--PushDebugMessage("��Ҫ����ʯ:"..JT_XYJJS)
			if itemneed < JT_XYJJS then
				PushDebugMessage("����ʯ:����")
				return 2
		    end
				Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("EquipLevelupAtta");
				Set_XSCRIPT_ScriptID(890088);
				Set_XSCRIPT_Parameter(0,index); 
				Set_XSCRIPT_Parameter(1, tonumber(JT_XUHAO));
				Set_XSCRIPT_Parameter(2, 0);
				Set_XSCRIPT_ParamCount(3);
				Send_XSCRIPT();
		]], LPindex,JT_SHUXING,�ȼ�))
		--��Ļ��ʾ(tem)
		��ʱ(1000)
		 if tonumber(tem)==2 then
			break
		 end
	end
	����_����װ��(װ��λ������,װ������)
end


local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
if  ȡ��������Ϊ == 1 then
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

if  ȡ��������Ϊ == 2 then
if string.find("����|����|ؤ��", menpai) then
���Թ���="��"
elseif  string.find("��ң|����|", menpai) then
���Թ���="��"
elseif  string.find("����|��ɽ|", menpai) then
���Թ���="��"
elseif  string.find("����|����|���|Ľ��|�䵱", menpai) then
���Թ���="��"
end

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
--����_������ʾ("���Թ���:"..���Թ���)
end


function  ����_ȫ�Զ�����(index)
	if ����_ȡ����ȫ��Ǯ() < 50000 then
		����_������ʾ("��Ҳ���������ͨ���")
		return
	end	
	if index == 1 then
		������� = 10
	end
	if index == 2 then
		������� = 15
	end
	if index == 3 then
		������� = 20
	end

	if ��ȡ������Ʒ����("���")	< ������� then
			����_������ʾ("��𲻹�������ͨ���")
			return
	end	

	if string.find("����", menpai) then
		����_װ������("����","����",index)
		����_װ������("����","����",index)
		����_װ������("����","����",index)
		����_װ������("Ь��","����",index)
		����_װ������("ñ��","����",index)
		����_װ������("�·�","����",index)

		����_װ������("��ָ��",���Թ���,index) 
		����_װ������("��ָ��",���Թ���,index) 
		����_װ������("������",���Թ���,index) 
		����_װ������("������",���Թ���,index) 
		����_װ������("����",���Թ���,index) 
		����_װ������("����",���Թ���,index) 
	else 
		����_װ������("��ָ��",���Թ���,index) 
		����_װ������("��ָ��",���Թ���,index) 
		����_װ������("������",���Թ���,index) 
		����_װ������("������",���Թ���,index) 
		����_װ������("����",���Թ���,index) 
		����_װ������("����",���Թ���,index) 
		����_װ������("����","����",index)
		����_װ������("����","����",index)
		����_װ������("����","����",index)
		����_װ������("Ь��","����",index)
		����_װ������("ñ��","����",index)
		����_װ������("�·�","����",index)
	end
end


function  ����_��ͨ��������(index)
	��Ļ��ʾ("����_��ͨ��������:  "..index)
	��Ļ��ʾ("����_��ͨ��������:  "..index)
	��Ļ��ʾ("����_��ͨ��������:  "..index)
	ȡ����Ʒ("����ʯ")
	if ��ȡ������Ʒ����("����ʯ")< 12 then
		��Ļ��ʾ("��ͨ������������15�� ������ͨ��������")
		����Ʒ("����ʯ")
		return
	end	

	����_��ͨ����("������",���Թ���,index)
	����_��ͨ����("������",���Թ���,index)
	����_��ͨ����("��ָ��",���Թ���,index)
	����_��ͨ����("��ָ��",���Թ���,index)
	����_��ͨ����("����",���Թ���,index)
	����_��ͨ����("����",���Թ���,index)

	����_��ͨ����("����","����",index)
	����_��ͨ����("����","����",index)
	����_��ͨ����("����","����",index)
	����_��ͨ����("Ь��","����",index)
	����_��ͨ����("ñ��","����",index)
	����_��ͨ����("�·�","����",index)
	����Ʒ("����ʯ")
end
---------------------------------------------------------------------------------------------
ȡ����Ʒ("���",999999)
ȡ����Ʒ("���")
����Ʒ("���",������Ʒ,0,1,1)
����_ȫ�Զ�����(1) --��������
����_ȫ�Զ�����(2)
����_ȫ�Զ�����(3)
����Ʒ("���")