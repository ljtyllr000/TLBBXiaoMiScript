


------------------------------------------------------------------------------------------------------------------------------------

function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."���Զ�ǿ����".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

-----------------------------------------------------------------------------------

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
SelfEuipList =
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
	[18] = { name="����ӡ", downIndex="", equipIndex=21,equipName="" ,},    --- ����
}


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

function ����_��Ԫ���깺��(����)
	local BDYB={
["��ɷǿ������"]={��һ��=1,�ڶ���=4,������=2,�ڼ�ҳ=0,ѡ��=15,Ԫ������=20}, 
["���ɰ"]={��һ��=1,�ڶ���=4,������=2,�ڼ�ҳ=0,ѡ��=14,Ԫ������=80}, 
	}
	
	if tonumber( ��ȡ������Ϣ(62)) <BDYB[����].Ԫ������ then
		����_������ʾ("������Ҫ��Ԫ��:"..BDYB[����].Ԫ������.."|����,��������")
		return
	end
		
	local ��ʱʱ�� = 3000
	if �����Ƿ����("YuanbaoShop")==0 then
		LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();");��ʱ(��ʱʱ��)
	end
	����_������ʾ("Ԫ��������һ��:"..BDYB[����].��һ��.."|��Ŵ�0123456")
	LUA_Call(string.format([[
	        setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(%d);
	  ]], BDYB[����].��һ��));��ʱ(��ʱʱ��)  
	
	����_������ʾ("Ԫ�������ڶ���:"..BDYB[����].�ڶ���.."|��Ŵ�123456")
	LUA_Call(string.format([[
	        setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(%d);
	  ]], BDYB[����].�ڶ���));��ʱ(��ʱʱ��)  
	
	����_������ʾ("Ԫ������������:"..BDYB[����].������.."|��Ŵ�123456")
		LUA_Call(string.format([[
	setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(%d);
		  ]], BDYB[����].������));��ʱ(��ʱʱ��)  
	---
	����_������ʾ("Ԫ�������ڼ�ҳ:"..BDYB[����].�ڼ�ҳ.."|��Ŵ�123456")
	if BDYB[����].�ڼ�ҳ== 1 then
		LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(��ʱʱ��)
		elseif BDYB[����].�ڼ�ҳ== 2 then
		LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(��ʱʱ��)
		LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(��ʱʱ��)
	end
	--ѡ��
		����_������ʾ("Ԫ������ѡ��:"..BDYB[����].ѡ��.."|��Ŵ�123456")
		LUA_Call(string.format([[
	        setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(%d);
	  ]], BDYB[����].ѡ��));��ʱ(��ʱʱ��)  
	����_����ȷ��()
	����_���ڹر�("YuanbaoShop")
end
	
	
function ����_ȡ�����ո�(index)--����ȡ�������ո�
	local aaa=  LUA_ȡ����ֵ(string.format([[ 
	index=%d
	if index==1 then
		local xianzai = DataPool:GetBaseBag_Num();
		local szPacketName = "base";
		local zhanyong = 0;
		for i=1, xianzai  do
			local theAction = PlayerPackage:EnumItem(szPacketName, i-1);
			local GetName=theAction:GetName()
			if GetName ~=""  then
				zhanyong = zhanyong + 1
			end
		end
		shengyu = xianzai - zhanyong
		return shengyu
	end
	
	if index==2 then
		local xianzai = DataPool:GetBaseBag_Num();
		local szPacketName = "material";
		local zhanyong = 0;
		
				for i=1, xianzai  do
			local theAction = PlayerPackage:EnumItem(szPacketName, i-1);
			local GetName=theAction:GetName()
			if GetName ~=""  then
				zhanyong = zhanyong + 1
			end
		end
		shengyu = xianzai - zhanyong
		return shengyu
	end
	]], index))
	return tonumber(aaa)
end

function ����_��˹õ��һ�ǿ��()
	�Զ����("���������|��������")
	ȡ����Ʒ("��˹õ��")  
	for i=1,99 do  
		if  ����_ȡ�����ո�(1) <= 3 then
			����_������ʾ("�����ո���|�����в�˹õ��һ�ǿ��")
			break
		end
		if ��ȡ������Ʒ����("��˹õ��")>=30 then
			��ͼѰ·("����",182,68)
			if �Ի�NPC("�͸���") then
				NPC�����Ի�("��˹õ��һ�����") ;��ʱ(1000)
				NPC�����Ի�("30�䲨˹õ��һ�����") ;��ʱ(1000)
				����_���()
			end
			else
			����_������ʾ("��˹õ�岻��|�����в�˹õ��һ�ǿ��")
			break
		end
		��ʱ(1000)
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

function  ����_ȡװ��ǿ���ȼ�(AAA)
	local tem=   LUA_ȡ����ֵ(string.format([[
			setmetatable(_G, {__index = EquipStrengthen_Env});
			local Level=  LifeAbility : Get_Equip_CurStrengthLevel(%d);
			return Level
		]], AAA))
	return tonumber(tem)
end

function  ����_ȡ����װ��ǿ���ȼ�(AAA)
	local tem=   LUA_ȡ����ֵ(string.format([[
			local oEquip = EnumAction(%d, "equip")
			local nlevel,aaa,bbb = oEquip:GetStrengthenLevel()
			return nlevel
			-- -1 ��û��װ�� 0 ��û��ǿ��
		]], AAA))
	return tonumber(tem)
end

function ����_ȡ����װ��λ��ǿ���ȼ�(װ��λ������)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			return	����_ȡ����װ��ǿ���ȼ�(SelfEuipList[i].equipIndex) 
		end
	end
end	




----------------���---------------------------
�Զ����װ�� = 0


---------------------------------------------------------�ر�����-----------------------------------------------------------------

function ����_ȡ��װ����ȡ����(װ��λ������)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
				��Ļ��ʾ("׼��ȡ��װ��λ��:"..װ��λ������)
				��ʱ(2000)
				local װ���־� =����_ȡ����װ���־�(SelfEuipList[i].equipIndex)
				if װ���־� <= 0 then
					��Ļ��ʾ("װ���־ò���,��ȡ��")
					return 0
				end
				if ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0  then
					return 0
				end
				
				for k =1, 10 do	
					local  װ������ = ����_ȡ����װ������(SelfEuipList[i].equipIndex)
					if  �����Ƿ����("SelfEquip")==0  then
						LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(2000)
					end
					 if װ��λ������=="����ӡ" then
						LUA_Call ("setmetatable(_G, {__index = Xiulian_Env});Xiulian_JueWei_Page_Switch();");��ʱ (2000)
						LUA_Call ("setmetatable(_G, {__index = SelfJunXian_Env});SelfJunXian_Equip_Clicked(0);");��ʱ (2000)
						����_�жϹرմ���("SelfJunXian")
					else
						LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEuipList[i].downIndex))
					end	
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
	--����_������ʾ(װ��λ������..":λ�ô���")
end
-----------------------------------------------------------------------------------------------------------









function ����_ȫ�Զ�ǿ��װ��(װ��λ������,�ȼ�)
		ȡ����Ʒ("���",20*10000)
		--����_������ʾ("��ǰ����Ǯ:"..����_ȡ����Ǯ())
		if ����_ȡ����Ǯ() < 1*10000 then
			����_������ʾ("ǿ��:"..װ��λ������.."|Ŀ��ȼ�:"..�ȼ�.."|��Ҳ�����������");��ʱ(200)
			return 
		end
		ȡ����Ʒ("���ǿ������|���ǿ��¶")
		
	if ��ȡ������Ʒ����("���ǿ������|���ǿ��¶")<=0 then 
			����_������ʾ("ǿ��:"..װ��λ������.."|Ŀ��ȼ�:"..�ȼ�.."|ǿ�����ϲ�����������");��ʱ(200)
			return 
	else
		if ��ȡ������Ʒ����("���ǿ��¶")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ��¶")-1
		end
		
		if ��ȡ������Ʒ����("���ǿ������")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ������")-1
		end
	end


	local ǿ���ȼ�=����_ȡ����װ��λ��ǿ���ȼ�(װ��λ������)
	
	if ǿ���ȼ� >= �ȼ� then
		����_������ʾ("��ǰǿ��λ��:[%s]ǿ���ȼ�[%d]Ŀ��ȼ�[%d]��������",װ��λ������,ǿ���ȼ�,�ȼ�)
		return 
	end
	��ͼѰ·("����",305,291)
	
	local װ������= ����_ȡ��װ����ȡ����(װ��λ������); ��ʱ(2000) 
	
	����_������ʾ(װ������)
	
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	
	for  kkk =1, 99 do
		��ͼѰ·("����",305,291)
		local nowLV=����_ȡװ��ǿ���ȼ�(LPindex)
		if  nowLV >= tonumber(�ȼ�) then
			����_������ʾ("ǿ���ȼ��㹻��,����")
			break
		end	
	
		if ��ȡ������Ʒ����("���ǿ��¶")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ��¶")-1
		end
		
		if ��ȡ������Ʒ����("���ǿ������")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ������")-1
		end
		if ��ȡ������Ʒ����("���ǿ������|���ǿ��¶")==0 then 
			break 
		end
		
		����_������ʾ("װ������[%s]װ��λ��[%d]����λ��[%d]Ŀ��ȼ�[%d]Ŀǰ�ȼ�[%d]",װ������,LPindex,CLindex,nowLV,�ȼ�)
		LUA_Call(string.format([[
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("FinishEnhance");
				Set_XSCRIPT_ScriptID(809262);
				Set_XSCRIPT_Parameter(0,%d);
				Set_XSCRIPT_Parameter(1,%d);
				Set_XSCRIPT_Parameter(2,-1);
				Set_XSCRIPT_ParamCount(3);
			Send_XSCRIPT();
			]], LPindex,CLindex))  
			��ʱ(500)
	end
	--ǿ���ȼ�=����_ȡװ��ǿ���ȼ�(LPindex)
	--����_д��ɫ������("��������", װ��λ������.."ǿ���ȼ�",ǿ���ȼ�) 
	����_����װ��(װ��λ������,װ������)		
end
-----------------------------------------------------------------------------
function ����_ȫ�Զ�����װ��(װ��λ������,�ȼ�,����)
		
		ȡ����Ʒ("���",20*10000)
		--����_������ʾ("��ǰ����Ǯ:"..����_ȡ����Ǯ())
		if ����_ȡ����Ǯ() < 1*10000 then
			����_������ʾ("ǿ��:"..װ��λ������.."|Ŀ��ȼ�:"..�ȼ�.."|��Ҳ�����������");��ʱ(200)
		end
		
	local ǿ���ȼ�=����_ȡ����װ��λ��ǿ���ȼ�(װ��λ������)
	if ǿ���ȼ� >= �ȼ� then
		return 
	end
		
		
	ȡ����Ʒ(����)

	��ͼѰ·("����",305,291)
		
	local װ������= ����_ȡ��װ����ȡ����(װ��λ������)
	 ��ʱ(3000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end

	��ͼѰ·("����",305,291)

	while ����_ȡװ��ǿ���ȼ�(LPindex) < tonumber(�ȼ�) do
		if ��ȡ������Ʒ����(����)==0 then 
			if ����=="��ɷǿ������" then
				����_��Ԫ���깺��(����)
			else
				local ǿ���ȼ�=����_ȡװ��ǿ���ȼ�(LPindex)
				--����_д��ɫ������("��������", װ��λ������.."ǿ���ȼ�",ǿ���ȼ�) 
				����_����װ��(װ��λ������,װ������)		
					return	
			end
		end

	if ��ȡ������Ʒ����(����)> 0 then 	
		 CLindex=��ȡ������Ʒλ��(����)-1
			else
			return
	end
	
	����_������ʾ("װ��λ��:"..LPindex.."����λ��:"..CLindex)
	 LUA_Call(string.format([[
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("FinishEnhance");
				Set_XSCRIPT_ScriptID(809262);
				Set_XSCRIPT_Parameter(0,%d);
				Set_XSCRIPT_Parameter(1,%d);
				Set_XSCRIPT_Parameter(2,-1);
				Set_XSCRIPT_ParamCount(3);
			Send_XSCRIPT();
			]], LPindex,CLindex))  
			��ʱ(3000)
	end
	--ǿ���ȼ�=����_ȡװ��ǿ���ȼ�(LPindex)
	--����_д��ɫ������("��������", װ��λ������.."ǿ���ȼ�",ǿ���ȼ�) 
	����_����װ��(װ��λ������,װ������)		
	
end
	


function ����_�߼�ǿ��(����,�߼��ȼ�)
	ȡ����Ʒ(����)
	if ��ȡ������Ʒ����(����)> 0 then 	
		else
			return
	end
	
	for i =1,#(SelfEuipList) do
			local ǿ���ȼ�=����_ȡ����װ��λ��ǿ���ȼ�(SelfEuipList[i].name)
			if ǿ���ȼ�>=9 and ǿ���ȼ� < �߼��ȼ� then
				����_ȫ�Զ�����װ��(SelfEuipList[i].name,�߼��ȼ�,����)
			end			
	end
	if ��ȡ������Ʒ����(����)> 0 then 	
		����Ʒ(����)
	end
end



function ����_ǿ��ȫ��װ��(�ȼ�)
	if ��˹õ��һ�ǿ��==1 then
		����_��˹õ��һ�ǿ��()
	end
	ȡ����Ʒ("���ǿ������|���ǿ��¶")	
	if ��ȡ������Ʒ����("���ǿ������|���ǿ��¶")<=0 then 
		����_������ʾ("ǿ������,������������")
		��ʱ(200)
		return 
	end
		
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	--����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("�·�",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("ñ��",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)		
	����_ȫ�Զ�ǿ��װ��("Ь��",�ȼ�)
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)			
	����_ȫ�Զ�ǿ��װ��("��ָ��",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("��ָ��",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("������",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("������",�ȼ�)							
end

function ����_���װ��()
		if �Զ����װ�� ==0  then
			for i =1,table.getn(SelfEuipList) do
				SelfEuipList[i].equipName = ����_ȡ����װ������(SelfEuipList[i].equipIndex)
			end	
			�Զ����װ�� = 1		
		else
			for i =1,table.getn(SelfEuipList) do
				if ����_ȡ����װ������(SelfEuipList[i].equipIndex)~= SelfEuipList[i].equipName then
					����_����װ��(SelfEuipList[i].name,SelfEuipList[i].equipName)
				end			     
			end	
		end	
end

function ����_��ȡǿ8��9()
	��ͼѰ·("����",305,291)
	if �Ի�NPC("�����") then
		NPC�����Ի�("ǿ����ֵ��") ;��ʱ(2000)
		NPC�����Ի�("��ȡǿ�����ᡤ8��9") ;��ʱ(2000)
	end
end

function ����_����ǿ��89װ��(װ��λ������)
	
		local �ȼ� = 8
		ȡ����Ʒ("���",20*10000)
		--����_������ʾ("��ǰ����Ǯ:"..����_ȡ����Ǯ())
		if ����_ȡ����Ǯ() < 1*10000 then
			����_������ʾ("��Ҳ�����������");��ʱ(200)
			return 
		end
		ȡ����Ʒ("ǿ�����ᡤ8��9")
	if ��ȡ������Ʒ����("ǿ�����ᡤ8��9")<=0 then 
		����_������ʾ("ǿ��:"..װ��λ������.."|Ŀ��ȼ�:"..�ȼ�.."|ǿ�����ϲ�����������");
		��ʱ(2000)
		return 
	end

	local ǿ���ȼ�=����_ȡ����װ��λ��ǿ���ȼ�(װ��λ������)
	
	if ǿ���ȼ� ~= �ȼ� then
		����_������ʾ("��ǰǿ��λ��:[%s]ǿ���ȼ�[%d]Ŀ��ȼ�[%d]��������",װ��λ������,ǿ���ȼ�,�ȼ�)
		return 
	end
		����_��ȡǿ8��9()
	��ͼѰ·("����",305,291)
		
	local װ������= ����_ȡ��װ����ȡ����(װ��λ������)
	     ��ʱ(2000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	
		��ͼѰ·("����",305,291)
		local nowLV=����_ȡװ��ǿ���ȼ�(LPindex)
		if  nowLV ~= tonumber(�ȼ�) then
			����_������ʾ("ǿ���ȼ��㹻��,����")
			����_����װ��(װ��λ������,װ������)		
		end	
		
		if ��ȡ������Ʒ����("ǿ�����ᡤ8��9")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("ǿ�����ᡤ8��9")-1
		end

		����_������ʾ("װ������[%s]װ��λ��[%d]����λ��[%d]Ŀ��ȼ�[%d]Ŀǰ�ȼ�[%d]",װ������,LPindex,CLindex,nowLV,�ȼ�)
		LUA_Call(string.format([[
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("FinishQuickEnhance");
			Set_XSCRIPT_ScriptID(809262);
			Set_XSCRIPT_Parameter(0,%d);
			Set_XSCRIPT_Parameter(1,%d);
			Set_XSCRIPT_ParamCount(2);
		Send_XSCRIPT();
			]], LPindex,CLindex))  
			��ʱ(2000)
	--ǿ���ȼ�=����_ȡװ��ǿ���ȼ�(LPindex)
	--����_д��ɫ������("��������", װ��λ������.."ǿ���ȼ�",ǿ���ȼ�) 
	����_����װ��(װ��λ������,װ������)		
end




---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
--����_ȫ�Զ�����װ��("����",5,"��ɷǿ������")--��ɷǿ������ �ϻ��� ��д

��˹õ��һ�ǿ�� =1

����_���װ��()    --��ֹװ���Ҵ�
if ��˹õ��һ�ǿ��==1 then
	����_��˹õ��һ�ǿ��()
end
ȡ����Ʒ("���ǿ������|���ǿ��¶")	
if ��ȡ������Ʒ����("���ǿ������|���ǿ��¶")<=0 then 
	����_������ʾ("ǿ������,������������")
	��ʱ(200)
	--return 
end


	����_ȫ�Զ�ǿ��װ��("����",8)
	����_ȫ�Զ�ǿ��װ��("����ӡ",8)
	����_ȫ�Զ�ǿ��װ��("����",8)	
	����_ȫ�Զ�ǿ��װ��("����",8)
	����_ȫ�Զ�ǿ��װ��("����",8)	
	����_ȫ�Զ�ǿ��װ��("����",8)
	����_ȫ�Զ�ǿ��װ��("����",8)			
	����_ȫ�Զ�ǿ��װ��("��ָ��",8)	
	����_ȫ�Զ�ǿ��װ��("��ָ��",8)	
	����_ȫ�Զ�ǿ��װ��("������",8)	
	����_ȫ�Զ�ǿ��װ��("������",8)		
	����_ȫ�Զ�ǿ��װ��("�·�",8)	
	����_ȫ�Զ�ǿ��װ��("ñ��",8)	
	����_ȫ�Զ�ǿ��װ��("����",8)	
	����_ȫ�Զ�ǿ��װ��("����",8)	
	����_ȫ�Զ�ǿ��װ��("����",8)		
	����_ȫ�Զ�ǿ��װ��("Ь��",8)
	
	����_����ǿ��89װ��("����")
	����_����ǿ��89װ��("����ӡ")
	����_����ǿ��89װ��("����")	
	����_����ǿ��89װ��("����")
	����_����ǿ��89װ��("����")	
	����_����ǿ��89װ��("����")
	����_����ǿ��89װ��("����")			
	����_����ǿ��89װ��("��ָ��")	
	����_����ǿ��89װ��("��ָ��")	
	����_����ǿ��89װ��("������")	
	����_����ǿ��89װ��("������")		
	����_����ǿ��89װ��("�·�")	
	����_����ǿ��89װ��("ñ��")	
	����_����ǿ��89װ��("����")	
	����_����ǿ��89װ��("����")	
	����_����ǿ��89װ��("����")		
	����_����ǿ��89װ��("Ь��")
	--����_�߼�ǿ��("����ǿ������",20)
--����_ǿ��ȫ��װ��(3)
--����_ǿ��ȫ��װ��(5)  
--����_ǿ��ȫ��װ��(7)  
--����_ǿ��ȫ��װ��(8)  
--����_ǿ��ȫ��װ��(9)  
����_�߼�ǿ��("����ǿ������",30)
����_���װ��()   --��ֹװ���Ҵ�