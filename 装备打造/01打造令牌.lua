�������Ƽ���="������|������|������|�Ѫ��|������"
���������б�={"������","������","������","�Ѫ��","������"}
��ȡ��������ﹱ={200,300,400,500,1000}
��ȡ��������ﹱ=50

------------------------------------------------
function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ103900393��ʾ��".."#eFF0000".."%s"
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
	if tem then
		����_������ʾ(AAA.."|"..BBB.."=="..tem);��ʱ(500)
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
		--��Ļ��ʾ("����ȡ����������Թ���:"..���Թ���)
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
}

----------------���---------------------------
function ����_ȡ����Ǯ()
	����Ǯ=tonumber( ��ȡ������Ϣ(52)) +     tonumber( ��ȡ������Ϣ(45))
	return ����Ǯ
end


function  ����_ȡ����װ���־�(aaa)
	local tem = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa))
		return  tonumber(tem)
end

function  ����_ȡ����װ����Ϣ(aaa)	--���
	local tem = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
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
	local tem =LUA_ȡ����ֵ(string.format([[ 
		TTAction =EnumAction(%d,"equip")
		local ID =TTAction:GetID()
		if ID > 0 then
			local name= TTAction:GetName()
			return name
		end
		return -1	
	]], aaa))
		return tostring(tem)
end

	
function  ����_ȡ����װ���ȼ�(index)
local aaa=  LUA_ȡ����ֵ(string.format([[ 
		return LifeAbility : Get_Equip_Level(%d);
	]], index))
	return tonumber(aaa)
end
--ȡ���ֵȼ�
function  ����_ȡ����������Ϣ(index)
	local aaa=  LUA_ȡ����ֵ(string.format([[ 
			local index = %d
			local nType,BaoZhu1,BaoZhu2,BaoZhu3,BaoZhu4,nQual = DataPool:GetLingPaiInfo()
			--local IconName,ItemName = DataPool:GetLingPaiBaoZhuIconName(1)
			if nType> 0 then
				if index == 1 then
					return BaoZhu1
				end
				if index == 2 then
					return BaoZhu2
				end
				if index == 3 then
					return BaoZhu3
				end
				if index == 4 then
					return BaoZhu4
				end	
				if index == 5 then
					return nQual
				end	
				if  index ==  0 then
					return nType
				end					
			end
			return -1
	]], index))
	return tonumber(aaa)
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

--------------------------------------------------------�ر�����-----------------------------------------------------------------

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






function ����_ȡ��װ����ȡ����(װ��λ������)
	for i =1,#SelfEuipList do
		if SelfEuipList[i].name == װ��λ������ then
				����_������ʾ("׼��ȡ��װ��λ��:"..װ��λ������)
				 if ����_ȡ����װ��ID(SelfEuipList[i].equipIndex) <=0 then
					return 0
				end
				local װ���־� =����_ȡ����װ���־�(SelfEuipList[i].equipIndex)
				if װ���־� <= 0 then
					����_������ʾ("װ���־ò���,��ȡ��")
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

-------------------------------------------------------------------------------------------------------

function ����_ȡ����������()--�������������ȡ���������ƣ�����-1û�г��� ��
           if �ж����ް���()==1 then
			   GuildCity_Name = LUA_ȡ����ֵ([[
					local CityName = Guild:GetMyGuildDetailInfo("CityName")
					return CityName
			   ]], "s")
	   if GuildCity_Name ~= "-1" then--֮ǰ�Ѿ��򿪹������棬���ѻ�ȡ�������У�ֱ�ӷ��أ�
	       return GuildCity_Name
	   end
	   LUA_Call("Guild:AskGuildDetailInfo()");��ʱ(5000)
			   GuildCity_Name = LUA_ȡ����ֵ([[
					local CityName = Guild:GetMyGuildDetailInfo("CityName")
					return CityName
			   ]], "s")
               ��ʱ(1000)
        if �����Ƿ����("NewBangHui_Bhxx") then
	        LUA_Call("setmetatable(_G, {__index = NewBangHui_Bhxx_Env}) NewBangHui_Bhxx_Close()")
	    end
	    return GuildCity_Name
    end  
end

-------------------------------------------------------------------------------------------------------

function ����_���������(XXX,YYY)
    for i=1,5 do
        if ��ȡ������Ϣ(16)== ����_ȡ����������() then
			Ѱ·(XXX,YYY,1);��ʱ(1000)
			break
		else
			��ͼѰ·("����",236,236);��ʱ(1000)
            �Ի�NPC("������");��ʱ(1000)
            NPC�����Ի�("���뱾�����");��ʱ(5000)
			�ȴ���ͼ���();��ʱ(2000)
    	end
	end
end

function  ����_���Ƶ�һ����ȡ()
	if ����_ȡ����װ������(20) == "-1" and  ��ȡ������Ʒ����(�������Ƽ���) <=0 then
		if tonumber(��ȡ������Ϣ(63)) >=100 then --�ﹱ
			����_������ʾ("��ǰװ�������� ,ǰ�������ȡ")
			����_���������(44,47)	
		for i=1,5 do
			if ��ȡ������Ʒ����("������") >=1 then
					����_����װ��("����","������")
					��ʱ(2000)
			end
			if ����_ȡ����װ������(20)=="������" then
				��ʱ(2000)
				break
			end
			if �Ի�NPC("������")==1 then
				��ʱ(2000)
				NPC�����Ի�("��ȡ����") 
				��ʱ(2000)
				����_���()
				��ʱ(2000)
			end
		end
	end
	else
	����_������ʾ("�Ѿ������� , ������ȡ")
	end
end

function  ����_�����Զ�����()
	if ����_ȡ����װ������(20)==���������б�[5] then
		����_������ʾ("��ǰ����Ϊ:"..���������б�[5] .."|�����ٽ�������")
		return
	end
	if ����_ȡ����װ���־�(20)<=0 then
		����_������ʾ("��ǰ����Ϊû�г־ò���������")
		return
	end
	����_���������(44,47)	
	for kk=1,4 do
	 if ����_ȡ����װ������(20)==���������б�[kk] then
		if  tonumber(��ȡ������Ϣ(63)) >=��ȡ��������ﹱ[kk] then
			����_������ʾ("��ǰ����Ϊ:"..���������б�[kk].."|Ҫ���׵�����Ϊ:"..���������б�[kk+1])
			����_ȡ��װ����ȡ����("����")
				for i=1,5 do
					if �Ի�NPC("������")==1 then
					��ʱ(2000)
					NPC�����Ի�("����װ������") 
					��ʱ(2000)
						 if �����Ƿ����("EquipLingPai_ShengJie") ==1 then
							�Ҽ�ʹ����Ʒ(���������б�[kk],1)     --����2:Ϊʹ�ô���
							  ��ʱ(2000)
							  LUA_Call ("setmetatable(_G, {__index = EquipLingPai_ShengJie_Env});EquipLingPai_ShengJie_OnOK();")
							 ��ʱ(2000)
							����_�жϹرմ���("EquipLingPai_ShengJie")
							��ʱ(2000)
							����_����װ��("����",���������б�[kk])
							 ����_����װ��("����",���������б�[kk+1])
							 ��ʱ(2000)
						end
						if ����_ȡ����װ������(20)==���������б�[kk+1] then
							break
						end
				   end
			  end
		  end
	   end
	 end
end

local lingqubaozhu ={
{"�������顤������","��ȡ��ɫ��������",0},
{"�������顤�𹥻�","��ȡ��ɫ��������",1},
{"�������顤������","��ȡ��ɫ��������",2},										
{"�������顤������","��ȡ��ɫ��������",3},			
		
{"���䱦�顤������","��ȡ��ɫ���䱦��",3},

{"�׻����顤����","��ȡ��ɫ�׻�����",4},

}
				
function  ����_��ȡ������(name)
	����_������ʾ("��ȡ:"..name)
	for i =1, 5 do
		if ��ȡ������Ʒ����(name) >=1 then
			����_������ʾ("�������б���"..name);��ʱ(2000)
			return 
		end
		if tonumber(��ȡ������Ϣ(63)) <=50 then
			return
		end
		for k=1, #lingqubaozhu do
			if lingqubaozhu[k][1] ==name then
				����_���������(44,47)	
				if �Ի�NPC("������")==1 then
					NPC�����Ի�("��ȡ������");��ʱ(2000)
					NPC�����Ի�(lingqubaozhu[k][2]);��ʱ(2000) 
					����_���(lingqubaozhu[k][3]);��ʱ(2000) 
					break
				end
			end
		end		
	end
end


function  ����_������Ƕ����(LPname,ZBname,index)
	if ��ȡ������Ʒ����(LPname) >=1 then
		if   ��ȡ������Ʒ����(ZBname) >=1 then
			local LPindex=��ȡ������Ʒλ��(LPname)-1
			local ZBindex =��ȡ������Ʒλ��(ZBname)-1
			LUA_Call(string.format([[
				Clear_XSCRIPT();
					Set_XSCRIPT_Function_Name( "RL_SetRs" );
					Set_XSCRIPT_ScriptID( 880001 );
					Set_XSCRIPT_Parameter( 0, %d);  
					Set_XSCRIPT_Parameter( 1, %d-1);  
					Set_XSCRIPT_Parameter( 2, %d );         --- ��Ʒ��������
					Set_XSCRIPT_ParamCount( 3 );
				Send_XSCRIPT();	
			]], LPindex,index,ZBindex))
		else
			����_������ʾ("���Ʊ��鲻��,�޷���Ƕ")
		end
	end
end


function  ����_ȡ�������Ʊ���ȼ�(LPname,index)
	local tem =LUA_ȡ����ֵ(string.format([[
		local nRsID =PlayerPackage:Lua_GetBagItemRl_Rs(%d , %d-1)
		if nRsID > 0 then
			return 1
		end 	
		return -1
	]], LPindex,index), "n")
	return tem
end


local ��������,��ǰ����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
local  ������Ƕ�� ={
{"����|��ɽ|�䵱|�һ���","��ȸ���顤Ѫ����","�������顤������","���䱦�顤������","�׻����顤����"},
{"����|����|ؤ��","��ȸ���顤Ѫ����","�������顤������","���䱦�顤������","�׻����顤����"},
{"����|����|���|Ľ��","��ȸ���顤Ѫ����","�������顤������","���䱦�顤������","�׻����顤����"},
{"��ң|����|","��ȸ���顤Ѫ����","�������顤������","���䱦�顤������","�׻����顤����"},
}

function ����_����ȫ�Զ���Ƕ����()
	����_������ʾ("����ȫ�Զ���Ƕ����") 
	if ����_ȡ����Ǯ() <= 10*10000  or  tonumber(��ȡ������Ϣ(63)) < ��ȡ��������ﹱ then
		����_������ʾ("����ȫ�Զ���Ƕ����,���ϲ���")
		return
	end
	for i =1, 4 do
		if ����_ȡ����������Ϣ(i) == 0 then
			local ��������=����_ȡ����װ������(20)
			if  ����_ȡ��װ����ȡ����("����")==0 then                
				return
			end
			local baozhiname = ""
			for k= 1,#������Ƕ�� do
				if string.find(������Ƕ��[k][1],��ǰ����,1,true) then
					baozhiname=������Ƕ��[k][i+1]
					����_������ʾ("��ʼ��Ƕ����:"..baozhiname..i)
					����_��ȡ������(baozhiname)
					����_������Ƕ����(��������,baozhiname,i);
					����_����װ��("����",��������)
				end
			end
		end
	end
end	
		

function ����_ȡ�������Ʊ���ȼ�(�������,�������)
	local aaa=  LUA_ȡ����ֵ(string.format([[ 
			local m_EquipBagIndex =%d
			local nIndex=%d
			local uLevel = PlayerPackage:Lua_GetBagItemRl_RsLevel(m_EquipBagIndex , nIndex - 1)
			return uLevel
		]], �������,�������))
		return tonumber(aaa)
end



function ����_���Ʊ������������(���,�ȼ�)
	 g_RsLevelUp_NeedItem_Num = {
				6,6,6,7,7,7,9,9,9,12,12,12,16,16,16,21,21,21,27,27,27,34,34,34,42,42,42,
				51,51,51,61,61,61,72,72,72,84,84,84,97,97,97,111,111,111,126,126,126,126
			}
	local ��ʾ =string.format("���Ʊ������[%d]Ŀ��ȼ�[%d]",���,�ȼ�)
	����_������ʾ(��ʾ) 
	ȡ����Ʒ("����ľ�")
	local ����ȼ� =����_ȡ����������Ϣ(���)
	if ����ȼ� <= 0 then
		����_������ʾ("û�б���") 
		return
	end	
	if ����ȼ�>=�ȼ� then
		local ��ʾ =string.format("���Ʊ������[%d]Ŀ��ȼ�[%d]��ǰ�ȼ�[%d],��������",���,�ȼ�,����ȼ�)
		����_������ʾ(��ʾ) 
		return
	end
	local ������������ = ��ȡ������Ʒ����("����ľ�")
	local ������Ҫ���� = g_RsLevelUp_NeedItem_Num[����ȼ�]
	local ��ǰ��� = ����_ȡ����Ǯ()
	if ������������ < ������Ҫ����  or ��ǰ��� <= 5*10000 then
		local ��ʾ =string.format("���Ʊ������[%d]Ŀ��ȼ�[%d]��ǰ�ȼ�[%d],��Ҫ����[%d]��ǰ����[%d],�������[%d]--���ϲ�����������",���,�ȼ�,����ȼ�,������Ҫ����,������������,��ǰ���)
		����_������ʾ(��ʾ) 
		--����Ʒ("����ľ�")
		return
	end	
	
	����_���������(44,47)	
	local ��������=����_ȡ����װ������(20)
	if  ����_ȡ��װ����ȡ����("����")==0 then        
		return
	end

    LPindex=��ȡ������Ʒλ��(��������)-1	
	if LPindex<0 then
		return
	end	
		for j=1,99 do
			local ��������ȼ� =����_ȡ�������Ʊ���ȼ�(LPindex,���) 
			if ��������ȼ� >= �ȼ� then
				local ��ʾ =string.format("���Ʊ������[%d]Ŀ��ȼ�[%d]��ǰ�ȼ�[%d],��������",���,�ȼ�,��������ȼ�)
					����_������ʾ(��ʾ) 
				break
			end
			local ������������ =��ȡ������Ʒ����("����ľ�")
			local ������Ҫ���� =g_RsLevelUp_NeedItem_Num[��������ȼ�]
			local ��ǰ��� =����_ȡ����Ǯ()
			if ������������<������Ҫ����  or ��ǰ���<=5*10000 then
		local ��ʾ =string.format("���Ʊ������[%d]Ŀ��ȼ�[%d]��ǰ�ȼ�[%d],��Ҫ����[%d]��ǰ����[%d],�������[%d]--���ϲ�����������",���,�ȼ�,����ȼ�,������Ҫ����,������������,��ǰ���)
				����_������ʾ(��ʾ) 
				break
			end		
			LUA_Call(string.format([[	
						local m_EquipBagIndex=%d
						local nIndex =%d
						Clear_XSCRIPT();
						Set_XSCRIPT_Function_Name( "RsLevelUp_RL" );
						Set_XSCRIPT_ScriptID( 880001 );
						Set_XSCRIPT_Parameter( 0, m_EquipBagIndex );         --- װ����������
						Set_XSCRIPT_Parameter( 1,nIndex - 1   );        --- ��Ƕ�ķ�ʯ����
						Set_XSCRIPT_ParamCount( 2 );
					Send_XSCRIPT();	
							]], LPindex,���))
					��ʱ(2000)
		end	
	��ʱ(2000)	
	����_����װ��("����",��������)	
end

function ����_ȡ����װ������(���)
	local tem =LUA_ȡ����ֵ(string.format([[
		local equipQual =PlayerPackage:GetSuperWeaponQual(%d)
		return equipQual
		]], ���), "n")
	return tonumber( tem)
end



function ����_�����Ǽ�����()
	����_������ʾ("�����Ǽ�����") 
	local ��ǰ�������Ƶȼ� =����_ȡ����������Ϣ(5) 
	if ��ǰ�������Ƶȼ�>=8 then
		local ��ʾ =string.format("�����Ǽ�������ǰ�ȼ�[%d],��������",��ǰ�������Ƶȼ�)
		����_������ʾ(��ʾ) 
		��ʱ(1000)
		ȡ����Ʒ("����Һ")
		����_������Ʒ("����Һ",2)
		return
	end	

	ȡ����Ʒ("����Һ")
	if ��ȡ������Ʒ����("����Һ")<= 0 or ����_ȡ����Ǯ()<=2*10000 then
		����_������ʾ("�����Ǽ��������ϲ�����������")
		return
	end	
	����_���������(44,47)	
	local ��������=����_ȡ����װ������(20)
	if  ����_ȡ��װ����ȡ����("����")==0 then        
		return
	end
	
    LPindex=��ȡ������Ʒλ��(��������)-1	
	if LPindex<0 then
		return
	end	

	for i =1,200 do
		if ����_ȡ����װ������(LPindex)>=8 then
			�Զ����("����Һ")
		end	
		if ��ȡ������Ʒ����("����Һ")<= 0 or  ����_ȡ����Ǯ()<=2*10000 then
			����_������ʾ("�����Ǽ��������ϲ�����������")
			break
		end	
		LUA_Call(string.format([[	
			Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name( "RL_StarLevelup" );
			Set_XSCRIPT_ScriptID( 880001 );
			Set_XSCRIPT_Parameter( 0, %d);         --- װ����������
			Set_XSCRIPT_Parameter( 1, 1);         ---�Զ�����ȷ��
			Set_XSCRIPT_ParamCount( 2 );
		Send_XSCRIPT();		
		]], LPindex))
		��ʱ(2000)
	end
	����_����װ��("����",��������)	
end




function ����_ȡ����������չȷ������(LPindex,����Ŀ�꿹)
		local tem =	LUA_ȡ����ֵ(string.format([[
			local  index= %d
			local kangxing = "%s"
			tem = 0 
			for i =0, 2 do
				local nExAttrID , nExAttrStr= PlayerPackage:Lua_GetBagRlExAttr(index, i)
				if string.find(nExAttrStr,"maxhp") or string.find(nExAttrStr,kangxing) then
					tem =tem+1
				end
			end
			PushDebugMessage("��������ȷ����������:"..tem)
			return tem
		]], LPindex,����Ŀ�꿹))
		return tonumber(tem)
end		


function ����_����������������(����ѡ��)
	��������={1,2,3,100}
	if not ����ѡ�� then
		����ѡ��=1 
	end	
	����_������ʾ("����������������") 
	if tonumber(����_����ɫ������("���쳬������", "������������"))>=3 then
		����_������ʾ("��������������������3��,��������")
		return
	end
	
	
	local ��������=����_ȡ��װ����ȡ����("����")
	if  ��������==0 then                 --ȡ�����������ȡ��ʧ���򷵻�
		LUA_Call("PushDebugMessage(\"ȡ������ʧ�ܣ���������!\")")
		return
	end
    LPindex=��ȡ������Ʒλ��(��������)-1	
	if LPindex<0 then
		return
	end	
	if ����ѡ�� ==1 then
		����Ŀ�꿹 ="maxhp"
	end
	if 	����ѡ�� ==2 then
		if ����_ȡ��������(1)=="��" then
			����Ŀ�꿹= "equip_attr_resistother_cold"
		elseif  ����_ȡ��������(1)=="��" then
			����Ŀ�꿹= "equip_attr_resistother_fire"
		elseif  ����_ȡ��������(1)=="��" then
			����Ŀ�꿹= "equip_attr_resistother_light"
		elseif  ����_ȡ��������(1)=="��" then
			����Ŀ�꿹= "equip_attr_resistother_poison"
		end
	end
		����_������ʾ("ȷ������Ϊ:"..����Ŀ�꿹)
	tem = ����_ȡ����������չȷ������(LPindex,����Ŀ�꿹)
	
	if tonumber(tem) >= 3 then
		����_д��ɫ������("���쳬������", "������������", "3")
		����_������ʾ("������������3�������Ѿ�ϴ���,��������")
		����_����װ��("����",��������)
		return
	end
	
	��������=��������[tem+1]
	��Ļ��ʾ("ȷ����������:"..tem.."|��ľ�ʯ:"..��������)
	ȡ����Ʒ("��ľ�ʯ")
	if ��ȡ������Ʒ����("��ľ�ʯ")< �������� or ����_ȡ����Ǯ()<=6*10000 then
		����_������ʾ("���ϲ�����������")
		����_����װ��("����",��������)
		����Ʒ("��ľ�ʯ")
		return
	end	
	
	����_���������(44,47)	
	for i=1,20 do
		tem = ����_ȡ����������չȷ������(LPindex,����Ŀ�꿹)
		��������=��������[tem+1]
		if ��ȡ������Ʒ����("��ľ�ʯ")< �������� or  ����_ȡ����Ǯ()<=6*10000 then
			����_������ʾ("���ϲ�����������")
			break
		end	

		 temtem =	LUA_ȡ����ֵ(string.format([[
			local  index= %d
			local kangxing = "%s"
			local nExAttrID111 , nExAttrStr111= PlayerPackage:Lua_GetBagRlExAttr(index, 0)
			if string.find(nExAttrStr111,"maxhp") or string.find(nExAttrStr111,kangxing) then
			  aaa=1
			else
			  aaa=0
			end
			local  nExAttrID222 , nExAttrStr222 = PlayerPackage:Lua_GetBagRlExAttr(index, 1)
			if string.find(nExAttrStr222,"maxhp") or string.find(nExAttrStr222,kangxing) then
			  bbb=1
			else
			  bbb=0
			end

			local  nExAttrID333 , nExAttrStr333 = PlayerPackage:Lua_GetBagRlExAttr(index, 2)
			if string.find(nExAttrStr333,"maxhp") or string.find(nExAttrStr333,kangxing) then
			  ccc=1
			else
			  ccc=0
			end

			PushDebugMessage("��������������ϴ|��һ��:"..nExAttrStr111.."|�ڶ���:"..nExAttrStr222.."|������:"..nExAttrStr333)

			if aaa+bbb+ccc ==1 then
				PushDebugMessage("��Ҫ�����ʯ2��")
			elseif  aaa+bbb+ccc ==2 then
				PushDebugMessage("��Ҫ�����ʯ3��")
			elseif  aaa+bbb+ccc ==3 then
				--PushDebugMessage("222")
				return 3
			end

			Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("RlResetExAttr");
			Set_XSCRIPT_ScriptID(880001);
			Set_XSCRIPT_Parameter(0,index);
			Set_XSCRIPT_Parameter(1,aaa);
			Set_XSCRIPT_Parameter(2,bbb);
			Set_XSCRIPT_Parameter(3,ccc);
			Set_XSCRIPT_Parameter(4,0);
			Set_XSCRIPT_ParamCount(5);
			Send_XSCRIPT();	
			return 1
			]], LPindex,����Ŀ�꿹))
		if tonumber(temtem) == 3 then
			��ʱ(3000)
			����_������ʾ("������������3�������Ѿ�ϴ���,��������")
			��ʱ(3000)
			break
		end
		��ʱ(3000)
	end
	����_����װ��("����",��������)
	����Ʒ("��ľ�ʯ")
end

function ����_�������Ʊ������������(�ȼ�)
	local ��������,����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	if ���� == "����" then
		����_���Ʊ������������(1,�ȼ�)  -- ���,ָ���ȼ�
		����_���Ʊ������������(2,�ȼ�)
		����_���Ʊ������������(3,�ȼ�)
		����_���Ʊ������������(4,�ȼ�)
	else
		����_���Ʊ������������(2,�ȼ�)  -- ���,ָ���ȼ�
		����_���Ʊ������������(1,�ȼ�)
		����_���Ʊ������������(3,�ȼ�)
		����_���Ʊ������������(4,�ȼ�)
	end
end

function ����_ȫ�Զ��������Ʊ������������()
	ȡ����Ʒ("����ľ�")
	if ����_ȡ����������Ϣ(1)>=50 and ����_ȡ����������Ϣ(2)>=50 and  ����_ȡ����������Ϣ(3)>=50 and  ����_ȡ����������Ϣ(4)>=50 then
		����_������Ʒ("����ľ�",2)
	else
		ȡ����Ʒ("���")
		--	����_�������Ʊ������������(30)
		---	����_�������Ʊ������������(40)
		����_�������Ʊ������������(50)
		����Ʒ("����ľ�")
		����Ʒ("���")
	end
end



if tonumber (�ж����ް���()) == 1  then
	����_������ʾ("���춨�������ı��ٷ�֮99�ı�")
	else
	����_������ʾ("�㻹û�а��,����������������")
	��ʱ(3000)
	return
end

����_���Ƶ�һ����ȡ()
����_�����Զ�����()
����_����ȫ�Զ���Ƕ����()
����_ȫ�Զ��������Ʊ������������()
����_�����Ǽ�����()
--����_����������������(2) --1  Ϊָ����Ѫ����        2ΪѪ���޺ͺ���
