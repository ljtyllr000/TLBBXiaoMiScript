

ȡ��������Ϊ =1           		--1,���������2,���ض����ɺ�������������
�����Ƿ��ҹ������ = 1  	--1���� 2��ʹ�ý�ҹ���
�Ƿ��������� = 1					 --�ض�Ϊ3

�����ҽ�=50           				 --�������ϱ�����50J

������=�����ҽ�*10000
����ʴ���ܼ���ͼ۸�=100*10000
��ֽ��ͼ۸� =30*10000
����ͼ����ͼ۸�=500*10000
����ʴ���ܼ�����ʧ��=0

-----------------------------------------------------------------------------------------------------------------------------------------------------


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

--------------------------------------------------װ�����------------------------------------------------
local SelfEuipList =
{
	{ name="����", downIndex=11,  equipIndex=0, equipName="" },    --- ����
	{ name="����", downIndex=3, equipIndex=14, equipName=""},    --- ����
	{ name="��ָ��", downIndex=7,  equipIndex=6,equipName=""  },    --- ��ָ���ϣ�
	{ name="��ָ��", downIndex=8,  equipIndex=11, equipName=""},    --- ��ָ���£�
	{ name="������", downIndex=9,  equipIndex=12, equipName=""},    --- �������ϣ�
	{ name="������", downIndex=10, equipIndex=13, equipName=""},    --- �������£�
	{ name="�·�", downIndex=12,  equipIndex=2,equipName=""  },    --- �·�
	{ name="ñ��", downIndex=1,  equipIndex=1, equipName="" },    --- ñ��
	{ name="����", downIndex=2, equipIndex=15,equipName="" },    --- ���
	{ name="����", downIndex=4,  equipIndex=3, equipName="" },    --- ����
	{ name="����", downIndex=5,  equipIndex=5, equipName="" },    --- ����
	{ name="Ь��", downIndex=6,  equipIndex=4, equipName="" },    --- Ь��
	{ name="����", downIndex=13,  equipIndex=7,equipName=""  },    --- ����
	{ name="����", downIndex=14, equipIndex=17, equipName=""},    --- ����
	{ name="����", downIndex=25, equipIndex=19,equipName="" },    --- ����
	{ name="���", downIndex="", equipIndex=18,equipName="" },    --- ���
	{ name="����", downIndex=16, equipIndex=20,equipName="" },    --- ����
	{ name="����ӡ", downIndex="", equipIndex=21,equipName="" ,},    --- ����
}

---------------------------------------------
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

function �رմ���(strWindowName)
	    LUA_Call(string.format([[
				name = "%s"
				if IsWindowShow(name) then
	            setmetatable(_G, {__index = name_Env}) this:Hide()  
				end
	  ]], strWindowName))  
end

function MessageBoxOK()
	if  �����Ƿ����("MessageBox_Self")==1 then
		LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
		��ʱ(1000)
	end
end

function ����_ȡ����װ���Ƿ��е���(index)
		return  LUA_ȡ����ֵ(string.format([[ 
		 return LifeAbility:IsEquipHaveDiaowen(%d)
	]], index))
end





--------------------------------------------------------------
function  ȡװ���־�(aaa)
return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa)))
end
function  ȡװ��ID(aaa)
return  LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], aaa))
end

function  ȡװ������(aaa)
return  LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end

function  ȡ����װ���ȼ�(index)
local aaa=  LUA_ȡ����ֵ(string.format([[ 
		return LifeAbility : Get_Equip_Level(%d);
	]], index))
	return tonumber(aaa)
end



function  ȡ�����������()--300���
       if  ����ֵ( ȡװ��ID(18) )>0 then
			return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return DataPool:GetKfsData("LIFE")
	]])))
	else
	return -1
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
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			for k =1, 5 do
				�رմ���("Shop")
				LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();")
				if װ��λ������ == "���" then
					����_������();��ʱ(2000)
					�Ҽ�ʹ����Ʒ(װ������);��ʱ(8000)
				else
					�Ҽ�ʹ����Ʒ(װ������);��ʱ(2000)
				end
				if  ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) > 0 then
					����_������ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ������)
					break   
				end
			end
		end
	end
	--����_������ʾ(װ��λ������..":λ�ô���")
end


function ����_ȡ��װ����ȡ����(װ��λ������)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			����_������ʾ("׼��ȡ��װ��λ��:"..װ��λ������)
			local װ���־� = ����_ȡ����װ���־�(SelfEuipList[i].equipIndex)
				if װ��λ������=="���" then
					local װ���־�= ����_ȡ�����������()
				end
				if tonumber(װ���־�) <= 0 then
					--����_������ʾ("װ���־ò���,��ȡ��")
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
					 if װ��λ������=="����ӡ" then
						LUA_Call ("setmetatable(_G, {__index = Xiulian_Env});Xiulian_JueWei_Page_Switch();");��ʱ (2000)
						LUA_Call ("setmetatable(_G, {__index = SelfJunXian_Env});SelfJunXian_Equip_Clicked(0);");��ʱ (2000)
						�رմ���("SelfJunXian")
					elseif װ��λ������=="���" then
						����_������ʾ("����������|������|,��ֹ����")
						��ʱ (2000)
						����Ʒ("|������|������|")
						
						 LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Wuhun_Switch();")
						��ʱ (2000)
						LUA_Call ("setmetatable(_G, {__index =  Wuhun_Env});Wuhun_Equip_Clicked(0);")
						��ʱ (2000)
						�رմ���("Wuhun")
					else
						LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEuipList[i].downIndex))
					end	
					��ʱ(3000)
					if  ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0 then
						�رմ���("SelfEquip")
						return װ������
					end	
				end	
			return 0
		end
	end
end


-------------------------------------------------------------------------------------



function ����_ȡ���ϵ��Ƶȼ�(index,order)  --װ�����,�������
	local tem =LUA_ȡ����ֵ(string.format([[
	index =%d
	order =%d
	local nDiaoWenID = LifeAbility:GetWearedDiaowenId(index) 
	if nDiaoWenID> 0 and order == 1 then
		local nLevel = LifeAbility:GetWearedDiaoWenGrade(nDiaoWenID)
		local strName = LifeAbility:GetWearedDiaoWenName(nDiaoWenID)
		return nLevel 
	end
	return -1
	]],index,order),"n",1)
	return tonumber(tem)
end	


function ����_ȡ����װ��λ�õ��Ƶȼ�(װ��λ������,order)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			return	����_ȡ���ϵ��Ƶȼ�(SelfEuipList[i].equipIndex,order) 
		end
	end
	return -1
end	

function ����_ȡ����װ�����Ƶȼ�(index)
	local tem =LUA_ȡ����ֵ(string.format([[
		index=%d
		local isHaveEquip, gemIndex1, gemIndex2, gemIndex3, gemIndex4 = LifeAbility : SplitWearedEquipGem(index)  
		if isHaveEquip then
			local nDiaoWenID = LifeAbility:GetWearedDiaowenId(index)
			local nLevel = LifeAbility:GetWearedDiaoWenGrade(nDiaoWenID)
			--local strName = LifeAbility:GetWearedDiaoWenName(nDiaoWenID)
			return nLevel
		end
		return -2
	]], index),"n")
	return tem
end



--��Ϣ�� (����_ȡ����װ�����Ƶȼ�(0),0,"����103900393",3)

function ����_ȡ���н��()  --���+����
	local tem =LUA_ȡ����ֵ(string.format([[
			local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
			return selfMoney
			]]),"n",1)
	return tonumber(tem)
end


function ����_ȡ����װ�����Ƶȼ�(LPindex)
	local tem =LUA_ȡ����ֵ(string.format([[
	    local index = tonumber(%d)
		local IsHaveDiaowen = LifeAbility:IsEquipHaveDiaowen(index)
			if  tonumber(IsHaveDiaowen)~=1 then
				PushDebugMessage("װ��û�е���")
				return -1
		end
		local dwId,dwlevel = LifeAbility:GetEquitDiaowenID(index)
		return dwlevel
		]], LPindex),"n")
	return tem
end



function ����_��������(LPindex,�ȼ�)
	if �Ƿ��������� == 1 then
	local tem =LUA_ȡ����ֵ(string.format([[
		local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
		if selfMoney<50000 then
					PushDebugMessage("���Ƶȼ�������Ҳ���")
					return 2
		end
		
	    local index = tonumber(%d)
	    local todwlevel= tonumber(%d)	
		local IsHaveDiaowen = LifeAbility:IsEquipHaveDiaowen(index)
	    local IsHaveDiaowenEx = LifeAbility:IsEquipHaveDiaowenEx(index)
		if  tonumber(IsHaveDiaowen)~=1 then
				PushDebugMessage("װ��û�е���")
				return 2
		end
			local dwId,dwlevel = LifeAbility:GetEquitDiaowenID(index)
			local dwIdEx,dwlevelEx = LifeAbility:GetEquitDiaowenIDEx(index)
         if dwlevel>=todwlevel then
				PushDebugMessage("�����Ѿ������õȼ�:"..todwlevel.."|��������_������������")
				return 2
          end
		
			Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name("DoEquipDWLevelUp")
				Set_XSCRIPT_ScriptID(809272)
				Set_XSCRIPT_Parameter(0, index) --���������
				Set_XSCRIPT_Parameter(1, todwlevel)  --��һ������Ҫ�����ĵȼ�
				Set_XSCRIPT_Parameter(2, 0) --�ڶ�������Ҫ�����ĵȼ�
				Set_XSCRIPT_Parameter(3, 0)  --0������ʾֱ���� 1��������ʾ
				Set_XSCRIPT_ParamCount(4)
			Send_XSCRIPT()
			
		]], LPindex,�ȼ�),"n")
	end
end
--------------------------------------------------------------------------------------------------



function �����̻���Ʒ(����, ����, �ܼ۸�,�ж��Ƿ�����Ʒ)


     ����_������ʾ("���칺���̻���Ʒ:"..����.."|����:"..����)
     if tonumber(�ж��Ƿ�����Ʒ)==1 then
      if ��ȡ������Ʒ����(����)>=���� then
       ����_������ʾ("�������������Ʒ"..����)
	    return false
       end
	end 
	
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
					--��Ʒ��,������,�����̵�ID,����,�ܼ۸�
					local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
					if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
					    if pName == "%s" and pCount <= %d and pYB/pCount <= %d then
						   --PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
						   --��������,ֱ�ӷ���
						   PlayerShop:SearchPageBuyItem(i - 1, "item")
						   return true
						end
					end
				end
			end
            return false
	]], ����, ����, �ܼ۸�), "b")
    ��ʱ (2000)
	�رմ���("PS_ShopSearch")
	�رմ���("PS_ShopList")
	�رմ���("Quest")	
	return tem
end

-----------------------------------------------------------------------------------����Ԫ������-----------
function ����Ԫ������(YBname)

if YBname=="������������ͼ��" then
	LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(3)")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(18);")--����
	��ʱ(2000)
elseif YBname=="�·���������ͼ��" then
	LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(3);")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(11);")--�·�
	��ʱ(2000)
	
elseif YBname=="ñ�Ӷ�������ͼ��" then
	LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(3);")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);")--�·�
	��ʱ(2000)
	elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(3);")
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(7);")--��������
		
		elseif YBname=="Ь����������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(3);")
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);")--Ь������
			elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(3);")--����
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
		    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);")--��������
					elseif YBname=="����ӡ��������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����2
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);")--����ӡ����
		
							elseif YBname=="�����������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����2
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);")--���ӡ����
		
		elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����2
	��ʱ(2000)
			    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);")--��������
		
									elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����2
	��ʱ(2000)
			    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(10);")--��������

	elseif YBname=="�����������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(17);")
	
		elseif YBname=="����𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(18);")
	
		
		elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
				    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);")
	
			elseif YBname=="���󶾹�����ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
				    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);")
	
		elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);")
	
			elseif YBname=="�����𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);")
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);")
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);")
	
	
			elseif YBname=="���Ʊ�������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(10);")
	

	
				elseif YBname=="���ƻ𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(11);")
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(12);")
	
					elseif YBname=="���ƶ�������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(13);")
	
	
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(12);")
	
					elseif YBname=="�����𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(13);")
	
					elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);")
	
					elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(15);")
	
	
	
				elseif YBname=="��Ʒ������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(4);")--����1
	��ʱ(2000)
				    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(9);")
	
	
					elseif YBname=="����" then
					
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(6);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);")
		��ʱ(2000)
	MessageBoxOK()
     LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);")
		��ʱ(2000)
		
					elseif YBname=="����ʴ���ܼ�" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(6);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);")
		��ʱ(2000)
		else
		����_������ʾ(YBname.."|��Ԫ������������ִ���")
end
��ʱ(2000)
MessageBoxOK()
��ʱ(2000)
�رմ���("YuanbaoShop")
end


---------------------------------------------------------------------------------��Ԫ������-------------
-----------------------------------------------------------------------------------����Ԫ������-----------
function ��Ԫ������(YBname)
if YBname=="������������ͼ��" then
	LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3)")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(18);")--����
	��ʱ(2000)
elseif YBname=="�·���������ͼ��" then
	LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(11);")--�·�
	��ʱ(2000)
elseif YBname=="ñ�Ӷ�������ͼ��" then
	LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);")--ñ�Ӷ���
	��ʱ(2000)
		
	elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);")
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(7);")--��������
		
		elseif YBname=="Ь����������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);")
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);")--Ь������
			elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);")--����
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
		    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);")--��������
					elseif YBname=="����ӡ��������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����2
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);")--����ӡ����
		
							elseif YBname=="�����������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����2
	��ʱ(2000)
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);")--���ӡ����
		
		elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����2
	��ʱ(2000)
			    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);")--��������
		
									elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����2
	��ʱ(2000)
			    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(10);")--��������

	elseif YBname=="�����������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(17);")
	
		elseif YBname=="����𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(18);")
	
		
		elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
				    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);")
	
			elseif YBname=="���󶾹�����ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
				    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);")
	
	
	
		elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);")
	
			elseif YBname=="�����𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);")
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);")
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);")
	
	
			elseif YBname=="���Ʊ�������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(10);")
	

	
				elseif YBname=="���ƻ𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(11);")
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(12);")
	
					elseif YBname=="���ƶ�������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(13);")
	
	
	
				elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(12);")
	
					elseif YBname=="�����𹥵���ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(13);")
	
					elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);")
	
					elseif YBname=="������������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);")--����1
	��ʱ(2000)
					    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(15);")
	
	
	
				elseif YBname=="��Ʒ������ͼ��" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);")--����1
	��ʱ(2000)
				    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();") --��һҳ
				��ʱ(2000)	
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(9);")
	
	

					elseif YBname=="����ʴ���ܼ�" then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
	��ʱ(2000)
	LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
	��ʱ(2000)
    LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(6);")--����1
	��ʱ(2000)
	  LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);")
	
	
		else
		����_������ʾ(YBname.."|��Ԫ������������ִ���")
		
		
end
MessageBoxOK()
��ʱ(2000)
MessageBoxOK()
��ʱ(2000)
LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();")
�رմ���("YuanbaoShop")
��ʱ(2000)
end

function ����_�Զ��������ͼ��(DWname,Gbug,BDbug,HLbug,YBbug)
	����_������ʾ(string.format("��%s����ʼ�Զ���⹺�����ͼ��",DWname))
	ȡ����Ʒ(DWname)
	if ��ȡ������Ʒ����(DWname)>= 1 then 
		return true
	end
	
	if Gbug  then  --��ҹ���
		for i =1, 5 do
			if ��ȡ������Ʒ����(DWname)>= 1 then 
				return true
			end
			�����̻���Ʒ(DWname, 1,����ͼ����ͼ۸�,1)
		end	
	end
	
	if YBbug  then  --Ԫ������
		��Ļ��ʾ("��ϵ����QQ103900393����")
		if ��ȡ������Ʒ����(DWname)>= 1 then 
			return true
		end
	end
	
	if BDbug then   --�󶨹���
		for i =1, 5 do
			if tonumber(��ȡ������Ϣ(62))>= 400 then
				��Ԫ������(DWname)
			end
			if ��ȡ������Ʒ����(DWname)>= 1 then 
				return true
			end
		end	
	end
	
	if HLbug then  --��������
		for i =1, 5 do
			if ��ȡ������Ʒ����(DWname)>= 1 then 
				return true
			end
			if tonumber(��ȡ������Ϣ(55))>= 400 then
				��Ԫ������(DWname)
			end
		end	
	end
	if ��ȡ������Ʒ����(DWname)== 0 then
		return false
	end 
end



function ����_������()
	for i=1, 5 do
		local ������������ = ��ȡ������Ʒ����("����")
		if ������������>=20 then
			����_������ʾ("�����౳���Ѿ���%d,��������",������������)
			��ʱ(1000)
			return
		end	
		if tonumber(��ȡ������Ϣ(55))>= 200 then
			����Ԫ������("����")	
			��ʱ(3000)
		end		
	end
end



function ����_����ͼ���Զ��ϳ�(DWname,Gbug,BDbug,HLbug,YBbug)
	local  ����ͼ���ϳɺ������=string.gsub (DWname, "ͼ��", "")
    local  ����ͼ���ϳɺ������ =����ͼ���ϳɺ������.."1��"
	����_������ʾ(string.format("��%s���ϳɺ�����֡�%s����ʼ�Զ���⴦�����ͼ��",DWname,����ͼ���ϳɺ������))
	ȡ����Ʒ(����ͼ���ϳɺ������)
	if ��ȡ������Ʒ����(����ͼ���ϳɺ������)>= 1 then
		����_������ʾ(string.format("��%s���ϳɺ�����֡�%s�������ܴ���ͼ��,��������",DWname,����ͼ���ϳɺ������))
		return  ����ͼ���ϳɺ������
	end
	����_�Զ��������ͼ��(DWname,Gbug,BDbug,HLbug,YBbug)
	 if ��ȡ������Ʒ����(DWname)<= 0 then 
		return false
	end
			
	--������

	����_������()
		
	--�����ֽ
	 if tonumber(��ȡ������Ʒ����("��ֽ"))< 20 then
		��ʱ(2000)
		�����̻���Ʒ("��ֽ", 250,��ֽ��ͼ۸�,1)
		 ��ʱ(2000)
	end

     local dwndex=��ȡ������Ʒλ��(DWname)-1
	 ��ʱ(1000)
	��ͼѰ·("����",318,315)
	LUA_Call(string.format([[ 
		Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name("DWHechengBeginPay")
		Set_XSCRIPT_ScriptID(809272)
		Set_XSCRIPT_Parameter(0, %d)
		Set_XSCRIPT_Parameter(1, 0)
		Set_XSCRIPT_ParamCount(2)
		Send_XSCRIPT()
	]], dwndex))
	 ��ʱ(3000)
	LUA_Call(string.format([[ 
		Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name("DoDiaowenAction")
		Set_XSCRIPT_ScriptID(809272)
		Set_XSCRIPT_Parameter(0, 4)
		Set_XSCRIPT_Parameter(1, %d)--0��� 
		Set_XSCRIPT_ParamCount(2)
		Send_XSCRIPT()
	]], dwndex))
	��ʱ(3000)
end



function ����_�Զ�����ʴ��(װ��λ������,����ͼֽ����,Gbug,BDbug,HLbug,YBbug)
		if  ����_ȡ����װ��λ�õ��Ƶȼ�(װ��λ������,1) >=1 then
			����_������ʾ("�Զ�����ϵ���λ��:%s �Ѿ��е��� ��������",װ��λ������)
			return
		end	
		����_������ʾ("�Զ�����ϵ���λ��:"..װ��λ������.."|��������:"..����ͼֽ����)
		str=װ��λ������.."���Ƶȼ�"
		if  tonumber(����_����ɫ������("���������������", str)) >= 3 then
			return 
		end
		
     if ����ʴ���ܼ�����ʧ��==1 then
		����_������ʾ("����ʴ���ܼ�����ʧ��|��������")
		return
	end
    �رմ���("YuanbaoShop")

	if ����ֵ(��ȡ������Ϣ(55)) <200 and ����ֵ(��ȡ������Ϣ(62))<200  then
	����_������ʾ("�����Զ��ϵ����������Ԫ��200����Ԫ��200,���Լ�����,Ŀǰ��������")
	��ʱ(200)
	return
	end
	
	if ����ֵ(��ȡ������Ϣ(45)) <������ then
		����_������ʾ("�����Զ��ϵ����������ٽ���Ϊ:"..�����ҽ�.."��|���Լ�����")
		��ʱ(500) 
		return
	end

   local   LPname= ����_ȡ��װ����ȡ����(װ��λ������)
	     ��ʱ(2000) 
        if LPname==0 then
             return
         end

	  ����_������ʾ("װ��λ������:"..LPname)
     LPindex=��ȡ������Ʒλ��(LPname)-1
	     ����_������ʾ("�����Ƶı������:"..LPindex)
	if LPindex<0 then
		    return
	end
if tonumber( ����_ȡ����װ���Ƿ��е���(LPindex))==1 then
	 ����_������ʾ("װ��λ������:"..LPname.."|�Ѿ��е�����������")
	
	����_��������(LPindex,3)
    ��ʱ(2000)
	����_д��ɫ������("���������������",str,����_ȡ����װ�����Ƶȼ�(LPindex));��ʱ(3000)	
     ����_����װ��(װ��λ������,LPname)
    ��ʱ(2000)
	return
end

if ȡ����װ���ȼ�(LPindex)<50 then
		 ����_������ʾ("װ��λ������:"..LPname.."|С��50������װ������")
    ��ʱ(2000)
    ����_����װ��(װ��λ������,LPname)
    ��ʱ(2000)
	return
end

----------------------------------------------------------------

	����_����ͼ���Զ��ϳ�(����ͼֽ����,Gbug,BDbug,HLbug,YBbug)
	local  ����ͼ���ϳɺ������=string.gsub (����ͼֽ����, "ͼ��", "")
    local  ����ͼ���ϳɺ������ =����ͼ���ϳɺ������.."1��"
	if ��ȡ������Ʒ����(����ͼ���ϳɺ������) >=1 then
		DWMZindex=��ȡ������Ʒλ��(����ͼ���ϳɺ������)-1
		����_������ʾ("����λ��:"..DWMZindex)
	else
		����_����װ��(װ��λ������,LPname)
		return
	end		

	if ��ȡ������Ʒ����("����ʴ���ܼ�")< 1 then
			�����̻���Ʒ("����ʴ���ܼ�", 5,����ʴ���ܼ���ͼ۸�,1)
			 ��ʱ(2000)
	end

if ��ȡ������Ʒ����("����ʴ���ܼ�")< 1 then
		    if ����ֵ(��ȡ������Ϣ(62))>= 200 then
            ����_������ʾ("�ð�Ԫ������ͼ��:����ʴ���ܼ�")
			��Ԫ������("����ʴ���ܼ�")
      	    ��ʱ(2000)	
            end	
end
if ��ȡ������Ʒ����("����ʴ���ܼ�")< 1 then
		    if ����ֵ(��ȡ������Ϣ(55))>= 200 then
            ����_������ʾ("�ú���Ԫ������ͼ��:����ʴ���ܼ�")
			����Ԫ������("����ʴ���ܼ�")
      	    ��ʱ(2000)	
            end	
end

if ��ȡ������Ʒ����("����ʴ���ܼ�")< 1 then
	����_������ʾ("����ʴ���ܼ�|����ʧ����������")
	����_����װ��(װ��λ������,LPname)
    ��ʱ(1000)
	����ʴ���ܼ�����ʧ��=1
	return
	else
	
    DWRKindex=��ȡ������Ʒλ��("����ʴ���ܼ�")-1
end

	��ͼѰ·("����",318,315)
	
	
local tem =LUA_ȡ����ֵ(string.format([[
      
		local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
		if selfMoney<50000 then
					PushDebugMessage("�������Խ�Ҳ���")
					return 2
		end
Clear_XSCRIPT()
Set_XSCRIPT_Function_Name("DoDiaowenAction")
Set_XSCRIPT_ScriptID(809272)
Set_XSCRIPT_Parameter(0, 1)
Set_XSCRIPT_Parameter(1, %d)--װ��
Set_XSCRIPT_Parameter(2, %d)--����ʴ���ܼ�
Set_XSCRIPT_Parameter(3, %d)--����
Set_XSCRIPT_ParamCount(4)
Send_XSCRIPT()
		]], LPindex,DWRKindex,DWMZindex),"n")
	      	    ��ʱ(2000)	
	����_��������(LPindex,3);��ʱ(3000)	
	����_д��ɫ������("���������������",str,����_ȡ����װ�����Ƶȼ�(LPindex));��ʱ(3000)	
	����_����װ��(װ��λ������,LPname)
end
---------------------------------------------------------------------------------------------------
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





------------------------------------------------------------------------
function ����_ȫ�����ϵ���()
	����_������ʾ("ȫ�Զ��ж������ϵ���")
	for i =1,3 do
		ȡ����Ʒ("���")  
		ȡ����Ʒ("����|��ֽ|���˿")
		����Ʒ("����|���˿","����",0,1,1)
	end	
	��ͼѰ·("����",330,299)
	����_�Զ�����ʴ��("ñ��","ñ�Ӷ�������ͼ��",true,true,true,false)
	
	����_�Զ�����ʴ��("����","������������ͼ��",true,true,true,false)  --1��ҹ��� 2��Ԫ������ 3�������� 4Ԫ������ 
	����_�Զ�����ʴ��("����","������������ͼ��",true,true,true,false)    
	����_�Զ�����ʴ��("����",string.format("����%s������ͼ��",���Թ���),true,true,true,false)
--����_�Զ�����ʴ��("���","�����������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("����ӡ","����ӡ��������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("����","������������ͼ��",true,true,true,false)
	
	����_�Զ�����ʴ��("����","������������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("Ь��","Ь����������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("����","������������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("�·�","�·���������ͼ��",true,true,true,false)

	
	����_�Զ�����ʴ��("����",string.format("����%s������ͼ��",���Թ���),true,true,true,false)
	����_�Զ�����ʴ��("����",string.format("����%s������ͼ��",���Թ���),true,true,true,false)
	����_�Զ�����ʴ��("����",string.format("����%s������ͼ��",���Թ���),true,true,true,false)

	
	����_�Զ�����ʴ��("��ָ��","��Ʒ������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("��ָ��","��Ʒ������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("������","��Ʒ������ͼ��",true,true,true,false)
	����_�Զ�����ʴ��("������","��Ʒ������ͼ��",true,true,true,false)
end


--ִ�й���("[�ű�]036���ս���")
����_ȫ�����ϵ���()