
--------------------------------------------------װ�����------------------------------------------------
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

-----------------------------------------------------------------------------------------------------

function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ103900393��ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
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
		��Ļ��ʾ("д��ɫ������|"..AAA.."|"..BBB.."|"..CCC);��ʱ(200)
		д������(·��,AAA,BBB,CCC);��ʱ(200)
	end
end

function ����_����ɫ������(AAA, BBB)
    local ����= ��ȡ������Ϣ(12)
    local ·��=string.format("C:\\����С��\\��ɫ����\\%s.ini",����)
    local tem =��������(·��,AAA,BBB)
	if tem ~=nil then
		��Ļ��ʾ(AAA.."|"..BBB.."=="..tem);��ʱ(500)
		else
		return 0
	end
	return tem
end

function ����_ȡ��������(����)  --1��������� 2������
	local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	if  ���� ==1 then
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
		��Ļ��ʾ("����ȡ����������Թ���:"..���Թ���)
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
	return tostring(���Թ���)
end

------------------------------------------------------------------------------------------------------------------------------------------------

function ����_ȡ����Ǯ()
	local ����Ǯ=��ȡ������Ϣ(52) +��ȡ������Ϣ(45)
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


	
function ����_ȡ����װ��λ�õȼ�(װ��λ������)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
			return	����_ȡ����װ���ȼ�(SelfEuipList[i].equipIndex) 
		end
	end
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





---------------------------------------------------------�ر�����-----------------------------------------------------------------

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
						����_�жϹرմ���("SelfJunXian")
					elseif װ��λ������=="���" then
						����_������ʾ("����������|������|,��ֹ����")
						��ʱ (2000)
						����Ʒ("|������|������|")
						
						 LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Wuhun_Switch();")
						��ʱ (2000)
						LUA_Call ("setmetatable(_G, {__index =  Wuhun_Env});Wuhun_Equip_Clicked(0);")
						��ʱ (2000)
						����_�жϹرմ���("Wuhun")
					else
						LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEuipList[i].downIndex))
					end	
					��ʱ(3000)
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
				����_�жϹرմ���("Shop")
				����_�жϹرմ���("YuanbaoShop")
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


function ����_ȡ���ϵ��Ƶȼ�(index,order)  --װ�����,�������
	local tem =LUA_ȡ����ֵ(string.format([[
	local index =%d
	local order =%d
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

------------------------------------------------------------------------------------





local  aaaaa,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
local �������� ={1,2,9,50,87,165,300}

function ����_��������(װ��λ������,�ȼ�)
	local ���Ƶȼ� = ����_ȡ����װ��λ�õ��Ƶȼ�(װ��λ������,1) 
	if ���Ƶȼ�<= 0 then
		��Ļ��ʾ("û�е���")
		return
	end	
	��Ļ��ʾ(װ��λ������.."���Ƶȼ�:"..���Ƶȼ�)
	��ʱ(200)
	if ���Ƶȼ� >= �ȼ� then
		return
	end
	local ��Ҫ���˿���� =��������[���Ƶȼ�]	
	if ��ȡ������Ʒ����("���˿") < ��Ҫ���˿���� then
		��Ļ��ʾ("���Ƶȼ�����,���˿����")
		return
	end
	if 	����_ȡ����Ǯ()  <5*10000 then
		��Ļ��ʾ("���Ƶȼ�����,��Ҳ���")
		return
	end

   local  LPname= ����_ȡ��װ����ȡ����(װ��λ������)
	��ʱ(2000) 
    if LPname == 0 then
        return
    end

	  --��Ļ��ʾ("װ��λ������:"..LPname)
     local LPindex=��ȡ������Ʒλ��(LPname)-1
	    -- ��Ļ��ʾ("����ͨ�����ı������:"..LPindex)
	if LPindex<0 then
		    return
	end
		

	��ͼѰ·("����",318,313)
	��ʱ(2000) 
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
						PushDebugMessage("�����Ѿ������õȼ�:"..todwlevel)
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
		����_����װ��(װ��λ������,LPname)
end



function  ����_ȫ�Զ���������(index)
	for i =1,#SelfEuipList do
		ȡ����Ʒ("���",99999999)
		ȡ����Ʒ("���˿")	
		local ��Ҫ���˿���� =��������[index]	
		if ��ȡ������Ʒ����("���˿") < ��Ҫ���˿���� then
			��Ļ��ʾ("���Ƶȼ�����.."..index..",���˿����:"..��Ҫ���˿����)
			��ʱ(2000)
			break
		end
		local װ��λ������ =SelfEuipList[i].name
		����_��������(װ��λ������,index)
	end
end

 ����_ȫ�Զ���������(3)
 ����_ȫ�Զ���������(4)
 ����_ȫ�Զ���������(5)
 ����_ȫ�Զ���������(6)