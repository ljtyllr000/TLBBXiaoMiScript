

��˹õ��һ�ǿ�� = 1

function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		DebugListBox_ListBox:AddInfo("#e0000ff#g28f1ff".."������������ʾ��%s")	--
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
	]], strCode))
end

function ����_��˹õ��һ�ǿ��()
	ȡ����Ʒ("��˹õ��")  
	for i=1,99 do  
		if ��ȡ������Ʒ����("��˹õ��")>=30 then
			��ͼѰ·("����",182,68)
			if �Ի�NPC("�͸���") then
				NPC�����Ի�("��˹õ��һ�����") ;��ʱ(3000)
				NPC�����Ի�("30�䲨˹õ��һ�����") ;��ʱ(3000)
				����_���()
			end
			else
			����_������ʾ("��˹õ�岻��|�����в�˹õ��һ�ǿ��")
			break
		end
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


function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		DebugListBox_ListBox:AddInfo("#e0000ff#g28f1ff".."������������ʾ��%s")	--
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
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
---------------------------------------------------------�ر�����-----------------------------------------------------------------
--------------------------------------------------װ�����------------------------------------------------
local SelfEuipList =
{
	[1]  = { name="����", downIndex=11,  equipIndex=0, equipName="" },    --- ����
	[2]  = { name="����", downIndex=3, equipIndex=14, equipName=""},    --- ����
	[3]  = { name="��ָ���ϣ�", downIndex=7,  equipIndex=6,equipName=""  },    --- ��ָ���ϣ�
	[4]  = { name="��ָ���£�", downIndex=8,  equipIndex=11, equipName=""},    --- ��ָ���£�
	[5]  = { name="�������ϣ�", downIndex=9,  equipIndex=12, equipName=""},    --- �������ϣ�
	[6]  = { name="�������£�", downIndex=10, equipIndex=13, equipName=""},    --- �������£�
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
	--����_������ʾ(װ��λ������..":λ�ô���")
end
-----------------------------------------------------------------------------------------------------------
function ����_ȫ�Զ�ǿ��װ��(װ��λ������,�ȼ�)
		ȡ����Ʒ("���",20*10000)
		--����_������ʾ("��ǰ����Ǯ:"..����_ȡ����Ǯ())
		if ����_ȡ����Ǯ() < 1*10000 then
			����_������ʾ("ǿ��:"..װ��λ������.."|��Ҳ�����������");��ʱ(200)
		end
		ȡ����Ʒ("���ǿ������|���ǿ��¶")
	if ��ȡ������Ʒ����("���ǿ������|���ǿ��¶")==0 then 
			����_������ʾ("ǿ��:"..װ��λ������.."|ǿ�����ϲ�����������");��ʱ(200)
			return 
			else
		if ��ȡ������Ʒ����("���ǿ��¶")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ��¶")-1
		end
		
		if ��ȡ������Ʒ����("���ǿ������")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ������")-1
		end
	end


	local ǿ���ȼ�=tonumber( ����_����ɫ������("��������", װ��λ������.."ǿ���ȼ�"))
	
	if ǿ���ȼ� >= �ȼ� then
		return 
	end
	
	��ͼѰ·("����",305,291)
		
	local װ������= ����_ȡ��װ����ȡ����(װ��λ������)
	     ��ʱ(2000) 
	����_������ʾ(װ������)
	if װ������ == 0 then
             return -1
		else
	   LPindex=��ȡ������Ʒλ��(װ������)-1	
	end
	
	����_������ʾ("װ��λ��:"..LPindex.."����λ��:"..CLindex)
	��ͼѰ·("����",305,291)

	while ����_ȡװ��ǿ���ȼ�(LPindex) < tonumber(�ȼ�) do
		if ��ȡ������Ʒ����("���ǿ��¶")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ��¶")-1
		end
		
		if ��ȡ������Ʒ����("���ǿ������")> 0 then 	
			 CLindex=��ȡ������Ʒλ��("���ǿ������")-1
		end
		if ��ȡ������Ʒ����("���ǿ������|���ǿ��¶")==0 then 
			break 
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
	ǿ���ȼ�=����_ȡװ��ǿ���ȼ�(LPindex)
	����_д��ɫ������("��������", װ��λ������.."ǿ���ȼ�",ǿ���ȼ�) 
	����_����װ��(װ��λ������,װ������)		
end

function ����_ǿ��ȫ��װ��(�ȼ�)
		if ��˹õ��һ�ǿ��==1 then
			����_��˹õ��һ�ǿ��()
		end
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("�·�",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("ñ��",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)		
	����_ȫ�Զ�ǿ��װ��("Ь��",�ȼ�)
	����_ȫ�Զ�ǿ��װ��("����",�ȼ�)			
	����_ȫ�Զ�ǿ��װ��("��ָ���ϣ�",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("��ָ���£�",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("�������ϣ�",�ȼ�)	
	����_ȫ�Զ�ǿ��װ��("�������£�",�ȼ�)							
end

����_ǿ��ȫ��װ��(4)  -----ȫ�Զ�ȫ��װ��ǿ��
����_ǿ��ȫ��װ��(4)  