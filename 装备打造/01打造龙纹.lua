
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
function ����_ȡ����Ǯ()
	����Ǯ=��ȡ������Ϣ(52) +��ȡ������Ϣ(45)
	return ����Ǯ
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
�Զ����װ�� = 0


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


function ����_ȫ�Զ�ѧϰ������������()
	if ����_����ɫ������("���쳬������","������������") =="���" then
		����_������ʾ("ȫ�Զ�ѧϰ���������������,��������")
		return
	end
	
	ȡ����Ʒ("׺��ʯ��Ԫ|׺��ʯ����|׺��ʯ����|")
	--����Ʒ("׺��ʯ��Ԫ|׺��ʯ����|׺��ʯ����|",�����,0,1,1)
	��������={
	{����="׺��ʯ��Ԫ",����=10,ID=4,��ʾ="ѧϰ����Ѫ����"},
	{����="׺��ʯ����",����=10,ID=6,��ʾ="ѧϰ���Ƽ�������"},
	{����="׺��ʯ����",����=10,ID=5,��ʾ="ѧϰ�������Թ���"},
	}
	local ���Թ���= ����_ȡ��������(2)
	if ���Թ���=="��" then
		UPindex= 1
	elseif ���Թ���=="��" then
		UPindex= 2
	elseif ���Թ���=="��" then
		UPindex= 3
	elseif ���Թ���=="��" then
		UPindex= 4
	end
	for i =1, 3 do
		if ����_ȡ����������Ϣ(i) == -1 then
			����_������ʾ(��������[i].��ʾ.."|��Ҫ����:"..��������[i].����)
			��ʱ(3000)
			if ��ȡ������Ʒ����(��������[i].����) >= ��������[i].���� then
			��������= ����_ȡ��װ����ȡ����("����")
			��ʱ(2000) 
			--����_������ʾ(��������)
			if �������� == 0 then
				 return 
			end
			 LPindex=��ȡ������Ʒλ��(��������)-1
			��ͼѰ·("������",125,201)
			--����_������ʾ("����ѧϰ����")
			LUA_Call(string.format([[
				local xuhao =%d
				local m_Equip_Idx =%d
				local m_select =%d
				if xuhao == 4 then
					PlayerPackage:Lw_Op_Do(4,m_Equip_Idx)
				elseif xuhao == 5 then
					PlayerPackage:Lw_Op_Do(5, m_Equip_Idx, m_select)
				elseif xuhao == 6 then
					PlayerPackage:Lw_Op_Do(6,m_Equip_Idx,m_select)					
				end
			]],��������[i].ID,LPindex,UPindex)) 
			��ʱ(2000) 	
			end
		end	
	����_����װ��("����","����")
	��ʱ(2000) 
	end
	if ����_ȡ����������Ϣ(1) >=1 and ����_ȡ����������Ϣ(2) >=1  and ����_ȡ����������Ϣ(3) >=1  then
		����_д��ɫ������("���쳬������","������������","���")
	end
end




function ����_ȫ������������()
	���Թ���= ����_ȡ��������(2)
	if ���Թ���=="��" then
		UPindex=1
	elseif ���Թ���=="��" then
		UPindex=2
	elseif ���Թ���=="��" then
		UPindex=3
	elseif ���Թ���=="��" then
		UPindex=4
	end
	����_������ʾ(UPindex)

      ��ͼѰ·("������",125,201)
      װ��λ������="����"
      ZBname= ����_ȡ��װ����ȡ����(װ��λ������)
      if ZBname==0 then
             return
      end

       ����_������ʾ("װ��λ������:"..ZBname)
       ZBindex=��ȡ������Ʒλ��(ZBname)-1
       ����_������ʾ("װ��λ�����Ƶı������:"..ZBindex)
    	if ZBindex<0 then
             return
	    end

for i=1,5 do
	local tem =LUA_ȡ����ֵ(string.format([[
		local itemIdx=tonumber(%d)
		PlayerPackage:Lw_Op_Do(8, itemIdx)
 ]], ZBindex,UPindex),"n")
end



	for i=1,5 do
		local tem =LUA_ȡ����ֵ(string.format([[
					local itemIdx=tonumber(%d)
					local nId = PlayerPackage:GetBagLWData(itemIdx, "HP")
					if nId ~= nil and nId > 0 then
					local selfMoney =  tonumber(Player:GetData("MONEY") +Player:GetData("MONEY_JZ"))
					local m_needMoney =PlayerPackage:GetBagLWAttrExInfo(itemIdx, nId, "LEVELUPMONEY")
					--PushDebugMessage("������:"..m_needMoney) 

					if selfMoney < m_needMoney then
					--PushDebugMessage("������:"..m_needMoney.."��Ҳ���") 
					return 2
					end

					local needItemNum = PlayerPackage:GetBagLWAttrExInfo(itemIdx, nId, "LEVELUPITEMNUM")
					--PushDebugMessage(needItemNum)
					local LW_BDyuan=PlayerPackage:CountAvailableItemByIDTable(20310181)
					--PushDebugMessage(LW_BDyuan)
					if LW_BDyuan>needItemNum then
					PlayerPackage:Lw_Op_Do(7, itemIdx)
					else
					 --PushDebugMessage("���ϲ���")
					 return 2
					end
					else
					local selfMoney =  tonumber(Player:GetData("MONEY") +Player:GetData("MONEY_JZ"))
					if selfMoney <10000 then
					--PushDebugMessage("������:10000,��ǰ����") 
					return 2
					end
					local LW_BDyuan=PlayerPackage:CountAvailableItemByIDTable(20310181)
					if tonumber(LW_BDyuan)<10 then
					return 2
					end
					PlayerPackage:Lw_Op_Do(4, itemIdx)--1234
					return 2
					end
		 ]], ZBindex,UPindex),"n")
				if tonumber(tem)==2 then
					break
				 end
				  ��ʱ(1000)
		   end	

	for i=1,5 do
			local tem =LUA_ȡ����ֵ(string.format([[
			local itemIdx=tonumber(%d)
			local nId = PlayerPackage:GetBagLWData(itemIdx, "RESIST")
			if nId ~= nil and nId > 0 then
			local selfMoney =  tonumber(Player:GetData("MONEY") +Player:GetData("MONEY_JZ"))
			local m_needMoney =PlayerPackage:GetBagLWAttrExInfo(itemIdx, nId, "LEVELUPMONEY")
			--PushDebugMessage("������:"..m_needMoney) 

			if selfMoney < m_needMoney then
			--PushDebugMessage("������:"..m_needMoney.."��Ҳ���") 
			return 2
			end

			local needItemNum = PlayerPackage:GetBagLWAttrExInfo(itemIdx, nId, "LEVELUPITEMNUM")
			--PushDebugMessage(needItemNum)
			local LW_BDyuan=PlayerPackage:CountAvailableItemByIDTable(20310182)
			--PushDebugMessage(LW_BDyuan)

			if LW_BDyuan>needItemNum then
				PlayerPackage:Lw_Op_Do(9, itemIdx)
			else
			 --PushDebugMessage("���ϲ���")
			 return 2
			end
			else
			local selfMoney =  tonumber(Player:GetData("MONEY") +Player:GetData("MONEY_JZ"))
			if selfMoney <10000 then
			--PushDebugMessage("������:10000,��ǰ����") 
			return 2
			end
			local LW_BDyuan=PlayerPackage:CountAvailableItemByIDTable(20310182)
			if tonumber(LW_BDyuan)<10 then
			return 2
			end
				PlayerPackage:Lw_Op_Do(6, itemIdx, tonumber(%d))--1234
			return 2
			end
			 ]], ZBindex,UPindex),"n")
	    if tonumber(tem)==2 then
			break
		 end
		  ��ʱ(1000)
   end	




for i=1,5 do
	local tem =LUA_ȡ����ֵ(string.format([[
		local itemIdx=tonumber(%d)
		local nId = PlayerPackage:GetBagLWData(itemIdx, "BUFF")
		if nId ~= nil and nId > 0 then
		local selfMoney =  tonumber(Player:GetData("MONEY") +Player:GetData("MONEY_JZ"))
		local m_needMoney =PlayerPackage:GetBagLWAttrExInfo(itemIdx, nId, "LEVELUPMONEY")
		--PushDebugMessage("������:"..m_needMoney) 
		if selfMoney < m_needMoney then
		--PushDebugMessage("������:"..m_needMoney.."��Ҳ���") 
		return 2
		end
		local needItemNum = PlayerPackage:GetBagLWAttrExInfo(itemIdx, nId, "LEVELUPITEMNUM")
		--PushDebugMessage(needItemNum)
		local LW_BDyuan=PlayerPackage:CountAvailableItemByIDTable(20310183)
		--PushDebugMessage(LW_BDyuan)

		if LW_BDyuan>needItemNum then
			PlayerPackage:Lw_Op_Do(8, itemIdx)
		else
		 --PushDebugMessage("���ϲ���")
		 return 2
		end
		else
		local selfMoney =  tonumber(Player:GetData("MONEY") +Player:GetData("MONEY_JZ"))
		if selfMoney <10000 then
		--PushDebugMessage("������:10000,��ǰ����") 
		return 2
		end

		local LW_BDyuan=PlayerPackage:CountAvailableItemByIDTable(20310183)
		if tonumber(LW_BDyuan)<10 then
		return 2
		end
			PlayerPackage:Lw_Op_Do(5, itemIdx, tonumber(%d))--1234
		return 2
		end
 ]], ZBindex,UPindex),"n")
	    if tonumber(tem)==2 then
			break
		 end
		  ��ʱ(1000)
   end	
	��ʱ(2000)
	����_����װ��(װ��λ������,ZBname)
end


function ����_���ƺϳ�(���ƺϳɵȼ�)
	if ����_ȡ����װ��ID(19) <=0 or ����_ȡ����װ������(19)~="����" then 
		����_������ʾ("û��װ������,�����ϳ�...");��ʱ(1500)
		return
	end	
	local ����ȼ�=tonumber(��ȡ������Ϣ(26))
	if ����ȼ�>=98 then 
		���ƺϳɵȼ� =100
	else
		���ƺϳɵȼ� =80
	end	
	ȡ����Ʒ("���")
	ȡ����Ʒ("��������")
	 װ��λ������="����"
     ZBname= ����_ȡ��װ����ȡ����(װ��λ������)
    if ZBname==0 then
         return
     end
	for i=1,900 do
		if ����_ȡ����Ǯ() <1*10000 then
			��ͼѰ·("������",125,201)
			break
		end
		����_������ʾ("װ��λ������:"..ZBname)
		ZBindex=��ȡ������Ʒλ��(ZBname)-1
		����_������ʾ("װ��λ�����Ƶı������:"..ZBindex)
    	if ZBindex<0 then
            break
	    end
		local tem = LUA_ȡ����ֵ(string.format([[
			local main_lv = PlayerPackage:GetBagLWData(%d, "LEVEL")
			return main_lv
		]],ZBindex),"n")
		
		if tonumber(tem)>=���ƺϳɵȼ� then
			 ����_������ʾ("���Ƶȼ�[%d]>=%d��������",tem,���ƺϳɵȼ�)
			break
		end	
		YLindex=��ȡ������Ʒλ��("��������")-1
		����_������ʾ("���ϵı������:"..YLindex)
    	if YLindex<0 then
            break
	    end	
		if �����Ƿ����("LongwenLevelUp")==0 then
			����_������ʾ("���������Ƴɳ��ȼ��Ի���")
			��ͼѰ·("������",125,201)
			�Ի�NPC("��ӥ");��ʱ(1500)
			NPC�����Ի�("�������Ƴɳ��ȼ�");��ʱ(1500)
		end 
		
		XLindex=��ȡ������Ʒλ��("����Ѫ��")-1
		if XLindex<0 then
			XLindex=-1 
		end	
		����_������ʾ("�ϳɵȼ���������Ѫ��λ��[%d]",XLindex)
		LUA_Call(string.format([[
			PlayerPackage:Lw_Op_Do(1, tonumber(%d),tonumber(%d),tonumber(%d))
		]], ZBindex,YLindex,XLindex),"n")
		��ʱ(200)
	end
	����_�жϹرմ���("LongwenLevelUp")
	��ʱ(2000)
	����_����װ��(װ��λ������,ZBname)
	����_������ʾ("�������ƽ���")
end
	
	
function ����_�����̻Ṻ����Ʒ(����, ����, ����)
	for  qq=1,9 do
		ȡ����Ʒ("���",200*10000)  
		if ��ȡ������Ʒ����(����)>=���� then
			��Ļ��ʾ("�������������Ʒ"..����)
			return false
		end
		if �����Ƿ����("PS_ShopSearch")~=1  then
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
			
		LUA_Call(string.format([[	
			 PlayerShop:PacketSend_Search(2 , 2, 1, "%s", %d)		
		]], ����,qq))
		��ʱ(1500)
		--������һҳ��û�з�����������Ʒ
		local tem = LUA_ȡ����ֵ(string.format([[
				setmetatable(_G, {__index = PS_ShopSearch_Env})
				for i = 1 ,10 do 
					local theAction = EnumAction( i - 1 , "playershop_cur_page")
					if theAction:GetID() ~= 0 then
						--��Ʒ��,������,�����̵�ID,����,�ܼ۸�
						local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
						if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
							if pName == "%s"   then
								if pYB/pCount <= %d  the
									if   pCount <= %d
										PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
										PlayerShop:SearchPageBuyItem(i - 1, "item")
										return 1	
									end
								else
									return -2
								end		
							end
						end
					end
				end
				return -1
		]], ����, ����, ����), "b")
		��ʱ(1500)
	end
end

local starcailiao =	{
{����������=60},
{����������=120},
{����������=240},
{����������=400},
{����������=400,�����="���������",����=30},	
{����������=400,�����="�м������",����=60},	
{����������=400,�����="�߼������",����=120},	
{����������=400,�����="��ɫ�����",����=300},	
}



function ����_���������Ǽ�(index)
	if ����_ȡ����װ��ID(19) <=0 or ����_ȡ����װ������(19)~="����" then 
		����_������ʾ("û��װ������,��������...");��ʱ(1500)
		return
	end	
	for i=1, 9 do
		if not index then
			index = 9
		end	
		local  ���������������� = ����_ȡ���������Ǽ��ȼ�()
		if ����������������>= index then
			����_������ʾ("�����Ǽ�:%d,��������",����������������)	;��ʱ(1000)
			return
		end
		local ����������= starcailiao[����������������].����������
		local ���������= starcailiao[����������������].�����
		local ���������= starcailiao[����������������].����
		if ���������� then
			ȡ����Ʒ("������")
			local  ��������������= ��ȡ������Ʒ����("������")
			if ��������������>=���������� then
				����_������ʾ("���������Ǽ�:��Ҫ������ %s / %s �㹻",��������������,����������);��ʱ(1000)
			else
				����_�����̻Ṻ����Ʒ("������",����������-��������������,10*10000)
				if ��ȡ������Ʒ����("������")< ���������� then
					����_������ʾ("���������Ǽ�:��Ҫ������ %s / %s ����",��������������,����������);��ʱ(1000)
					break
				end	
			end
		end
		if ��������� and ��������� then
			ȡ����Ʒ(���������)
			local  �������������= ��ȡ������Ʒ����(���������)
			if �������������>=��������� then
				����_������ʾ("���������Ǽ�:��Ҫ%s %s �㹻",���������,���������);��ʱ(1000)
			else
				����_������ʾ("���������Ǽ�:��Ҫ%s %s ����",���������,���������);��ʱ(1000)
				break
			end
		end
			
		
		��ͼѰ·("������",125,201)
		��ʱ(2000)
		local װ��λ������="����"
		local ZBname= ����_ȡ��װ����ȡ����(װ��λ������)
		if ZBname==0 then
		   return
		end

		����_������ʾ("װ��λ������:"..ZBname)
		local ZBindex=��ȡ������Ʒλ��(ZBname)-1
		����_������ʾ("װ��λ�����Ƶı������:"..ZBindex)
		if ZBindex<0 then
			return
		end 	
		����_������ʾ("�Ǽ�����")
		LUA_Call(string.format([[
			PlayerPackage:Lw_Op_Do(2, tonumber(%d))
		]], ZBindex),"n")
		��ʱ(2000)
		����_����װ��(װ��λ������,ZBname)
		��ʱ(2000)
	end
	����_������ʾ("�������ǽ���");��ʱ(1000)
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




---------------------------------------------------------
if ����_ȡ����װ��ID(19) >0 and ����_ȡ����װ������(19)=="����" then 
	�����б� ="��������|����Ѫ��|������|׺��ʯ����|׺��ʯ����|׺��ʯ��Ԫ|����ˮ|���������|�м������|�߼������"
	ȡ����Ʒ(�����б�)
	����Ʒ(��Ʒ����,������Ʒ,1,1,1)
	����_���������Ǽ�()
	����_ȫ�Զ�ѧϰ������������()
	����_ȫ������������()
	����_���ƺϳ�()
	����_ȫ�Զ��������Ʋ���("������ʺϳɷ�|��������ʺϳɷ�|�м������|���������|������")
	����Ʒ("��������|����Ѫ��|������|׺��ʯ����|׺��ʯ����|׺��ʯ��Ԫ|����ˮ|���������|�м������|�߼������")
else 
	����_������ʾ("û��װ������,��������...");��ʱ(2000)	
end
