function ����_ȡ��������(index)
	local ����=""
	local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	if  index == 1 then
		���� =LUA_ȡ����ֵ(string.format([[
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
	elseif  index == 2 then
		if string.find("����|����|ؤ��", menpai) then
			����="��"
		elseif  string.find("��ң|����|", menpai) then
			����="��"
		elseif  string.find("����|��ɽ|", menpai) then
			����="��"
		elseif  string.find("����|����|���|Ľ��|�䵱", menpai) then
			����="��"
		end
	elseif index == 3 then
		local  ������������ = "111|aaa|"
		local  ������������ = "111|aaa|"
		local  ������������ = "111|aaa|"
		local  ������������ = "111|aaa|"
		if string.find(������������, ��������) then
			����="��"
		elseif  string.find(������������, ��������) then
			����="��"
		elseif  string.find(������������, ��������) then
			����="��"
		elseif  string.find(������������, ��������) then
			����="��"
		end
	end	
	return ����
end



local maxAttack=����_ȡ��������(1)
if maxAttack=="" then
	return 
end	
if maxAttack =="��" then
	������Ԫ="����"
elseif maxAttack =="��" then
	������Ԫ="���"
elseif maxAttack =="��" then
	������Ԫ="ӡ��"
elseif maxAttack =="��" then
	������Ԫ="�ƶ�"				
end

local zhenyuan={
	{"��Ԫ��Ѫӿ����"},
	{"��Ԫ��"..������Ԫ},
	{"��Ԫ��"..������Ԫ},
	{"��Ԫ������"},		
	{"��Ԫ��"..������Ԫ},
	{"��Ԫ��"..������Ԫ},
	{"��Ԫ��Ѫӿ����"},
	{"��Ԫ������"},	
	{"��Ԫ������"},	
	{"��Ԫ������"},	
	{"��Ԫ������"},	
	{"��Ԫ������"},
}


function ����_ȡ��Ԫװ����Ϣ(���,���)
		local tem =LUA_ȡ����ֵ(string.format([[	
		local i=%d-1
		local bianhao=%d
		local index=0
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			if string.find(szName,"#cFFFFFF",1,true) then 
				index =1 
				szName=string.gsub(szName, "#cFFFFFF", "")
			elseif string.find(szName,"#c00D000",1,true) then 
				index =2
				szName=string.gsub(szName, "#c00D000", "")
			elseif string.find(szName,"#c2980FF") then 
				index =3
				szName=string.gsub(szName, "#c2980FF", "")
			elseif string.find(szName,"#ccc33cc",1,true)  then 
				index =4
				szName=string.gsub(szName, "#ccc33cc", "")		
			elseif string.find(szName,"#cFF6600",1,true)  then 
				index =5
				szName=string.gsub(szName, "#cFF6600", "")		
			end
			if bianhao ==1 then
				return index
			elseif bianhao ==2 then
				return szName
			end
		end
		return -1
		]],���,���))
	return tem
end

function ����_�ȶ���Ԫ()
	local str=""
	for i =1,# zhenyuan do
		for kk=1,5 do
			local ��Ԫ��ɫ�ȼ� = tonumber(����_ȡ��Ԫװ����Ϣ(i,1))
			local ��Ԫ���� = tostring(����_ȡ��Ԫװ����Ϣ(i,2))
			if ��Ԫ��ɫ�ȼ�<=kk then
				--��Ļ��ʾ("��ǰ��Ԫ��ɫ�ȼ�"..��Ԫ��ɫ�ȼ�.."<="..kk)
				local ��Ԫ=zhenyuan[i][1] 
				local ��Ԫ=string.gsub(��Ԫ, "��", "��")
				local �ϼ� =��Ԫ.."|"..��Ԫ
				if not string.find(�ϼ�,��Ԫ����,1,true) then
					if not string.find(str,�ϼ�,1,true) then
						str=str.."|"..�ϼ�
					end	
				end	
			end
		end
	end	
	return 	str
end	



function ����_ȡ��Ԫװ����Ϣ2()
	for i=1,12 do
		local tem =LUA_ȡ����ֵ(string.format([[	
		local i=%d-1
		local index=0
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			if string.find(szName,"#cFFFFFF",1,true) then 
				index =1 
				szName=string.gsub(szName, "#cFFFFFF", "")
			elseif string.find(szName,"#c00D000",1,true) then 
				index =2
				szName=string.gsub(szName, "#c00D000", "")
			elseif string.find(szName,"#c2980FF") then 
				index =3
				szName=string.gsub(szName, "#c2980FF", "")
			elseif string.find(szName,"#ccc33cc",1,true)  then 
				index =4
				szName=string.gsub(szName, "#ccc33cc", "")		
			elseif string.find(szName,"#cFF6600",1,true)  then 
				index =5
				szName=string.gsub(szName, "#cFF6600", "")		
			end
			PushDebugMessage("λ��:".."��ɫ"..index.."|���"..i..szName)
			return 1
		end
		return -1
		]],i))
		if tonumber(tem) ==  1 then
			��ʱ(3000)
		end
	end	
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
							PushDebugMessage("�һ���Ʒ:"..GetName.."|����λ��:"..i)
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




function �����Ԫ()
	��ͼѰ·("����",350,228)
	LUA_Call(string.format([[ 
	local nChip =Pneuma:GetPneumaExp()
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("QuickOnceNingYuanClk");
			Set_XSCRIPT_ScriptID(889902);
			Set_XSCRIPT_Parameter(0, 1);--1234
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
	]]))
end

function  ����_ȡԪ������()
	local tem = LUA_ȡ����ֵ(string.format([[ 
			return Pneuma:GetPneumaExp()
	]], aaa))
	return  tonumber(tem)
end

function  ����_ȡ��Ԫ��������()
	local tem = LUA_ȡ����ֵ(string.format([[ 
		return Pneuma:GetPneumaChip()
	]], aaa))
	return  tonumber(tem)
end

function ����_��Ԫ����()
	LUA_Call(string.format([[ 
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("ApplyNiangLian");
			Set_XSCRIPT_ScriptID(889902);
			Set_XSCRIPT_Parameter(0, -1);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
		]]))
end

function  ����_ȡ��Ԫ����ʣ������()
	local tem = LUA_ȡ����ֵ(string.format([[ 
		local nSpace=Pneuma:GetSmeltBag_SpaceCount()	
		return nSpace
	]], aaa))
	return  tonumber(tem)
end

---1 ��ɫ ����
function ����_��Ԫ��Ԫ����(index)
	local tem = LUA_ȡ����ֵ(string.format([[ 
		Pneuma:SmeltAllItem_WithCuijie(%d)	
	]], index))
end
	



	

function ����_��Ԫ����(index)
	��ͼѰ·("����",350,228)
      LUA_Call(string.format([[ 
	BBB=tonumber(%d)
	PushDebugMessage("����ȫ�Զ�������Ԫ�ȼ�:"..BBB)
		for i=0,11 do
		local nChip =Pneuma:GetPneumaExp()
		--PushDebugMessage(nChip)
		local theAction,bLocked = Pneuma:EnumPneumaItem("pneuma", i)
		local AAid= theAction:GetID() 
		local needExp = Pneuma:GetPneumaProperty(i,6)--��ҪԪ��
		--PushDebugMessage(needExp)
		local curLevel = Pneuma:GetPneumaItemProperty(0,6)
		local szName, nLevel, szAdd, nAdd,nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		--PushDebugMessage(curLevel )
		if AAid >0 then 
			 if  nChip >needExp  then
				if BBB>nLevel   then
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("OnUpgradeClicked");
		Set_XSCRIPT_ScriptID(889900);
		Set_XSCRIPT_Parameter(0,i);--���
		Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
		end
		end
		end
		end
	]], index))
end


function ����_��Ԫ���(��ɫ,������Ʒ�б�)
	if not ��ɫ then
		��ɫ = 1
	end	
	if not ������Ʒ�б� then
		������Ʒ�б� =""
	end	
	for i=0,23 do
		local tem =LUA_ȡ����ֵ(string.format([[	
		local i=72+%d
		local yanse =%d
		blwp ="%s"	
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			if string.find(szName,"#cFFFFFF",1,true) then 
				index =1 
				szName=string.gsub(szName, "#cFFFFFF", "")
			elseif string.find(szName,"#c00D000",1,true) then 
				index =2
				szName=string.gsub(szName, "#c00D000", "")
			elseif string.find(szName,"#c2980FF") then 
				index =3
				szName=string.gsub(szName, "#c2980FF", "")
			elseif string.find(szName,"#ccc33cc",1,true)  then 
				index =4
				szName=string.gsub(szName, "#ccc33cc", "")		
			elseif string.find(szName,"#cFF6600",1,true)  then 
				index =5
				szName=string.gsub(szName, "#cFF6600", "")		
			end
			--PushDebugMessage(szName)
			if  index== yanse then  
				if blwp=="" then
					return 1
				end
				if  not string.find(blwp,szName,1,true) then
					PushDebugMessage("���"..szName..i)
					return 1
				else
					PushDebugMessage("������:"..szName..i)
					return 2
				end
			end
		end
		return -1
		]],i ,��ɫ,������Ʒ�б�))
		if tonumber(tem) == 1 then
			LUA_ȡ����ֵ(string.format([[	
				Pneuma:SmeltPneumaItem(72+%d)
				]],i))			
				--��ʱ(200)
		elseif tonumber(tem) == 2 then
			
		end
	end
end


function ����_��Ԫ���뱳��(��ɫ,������Ʒ�б�)
	if not ��ɫ then
		��ɫ = 1
	end	
	if not ������Ʒ�б� then
		������Ʒ�б� =""
	end	
	for i=0,23 do
		local tem =LUA_ȡ����ֵ(string.format([[	
		local i=72+%d
		local yanse =%d
		blwp ="%s"	
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			if string.find(szName,"#cFFFFFF",1,true) then 
				index =1 
				szName=string.gsub(szName, "#cFFFFFF", "")
			elseif string.find(szName,"#c00D000",1,true) then 
				index =2
				szName=string.gsub(szName, "#c00D000", "")
			elseif string.find(szName,"#c2980FF") then 
				index =3
				szName=string.gsub(szName, "#c2980FF", "")
			elseif string.find(szName,"#ccc33cc",1,true)  then 
				index =4
				szName=string.gsub(szName, "#ccc33cc", "")		
			elseif string.find(szName,"#cFF6600",1,true)  then 
				index =5
				szName=string.gsub(szName, "#cFF6600", "")		
			end
			--PushDebugMessage(szName)
			if  index== yanse then  
				if blwp=="" then
					return 1
				end
				if  string.find(blwp,szName,1,true) then
					PushDebugMessage("���뱳��"..szName..i)
					return 1
				else
					PushDebugMessage("������:"..szName..i)
					return 2
				end
			end
		end
		return -1
		]],i ,��ɫ,������Ʒ�б�))
		if tonumber(tem) == 1 then
			LUA_ȡ����ֵ(string.format([[	
				Pneuma:PickPneumaUpToBag(%d)
				]],i))			
				��ʱ(1000)
		elseif tonumber(tem) == 2 then
				--LUA_ȡ����ֵ(string.format([[	
				--Pneuma:SmeltPneumaItem(72+%d)
				--]],i))			
				--��ʱ(1000)
		end
	end
end




function ����_��Ԫ��������(aa)
	��ͼѰ·("����",350,228)
	for i =1,99999 do
		local ��Ԫ��������= ����_ȡ��Ԫ��������()
		if ��Ԫ�������� <20 then
			��Ļ��ʾ("��Ԫ������������")
			��ʱ()
			break
		end
		����_��Ԫ����()
		if ����_ȡ��Ԫ����ʣ������() <1 then
			����_��Ԫ���뱳��(3,aa)
			����_��Ԫ���뱳��(4)
			����_��Ԫ���뱳��(5)
			����_��Ԫ���(1)
			����_��Ԫ���(2)
			����_��Ԫ���(3,aa)
		end
	end
	����_��Ԫ���뱳��(3,aa)
	����_��Ԫ���뱳��(4)
	����_��Ԫ���뱳��(5)
	����_��Ԫ���(1)
	����_��Ԫ���(2)
	����_��Ԫ���(3,aa)
end








function ����_�y����Ԫ(��Ʒ�б�)
	for i=36,59 do
		local tem =LUA_ȡ����ֵ(string.format([[	
		 i=%d
		wupin = "%s"
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			szName=string.gsub(szName, "#cFFFFFF", "[��ɫ]")
			szName=string.gsub(szName, "#c00D000", "[��ɫ]")
			szName=string.gsub(szName, "#c2980FF", "[��ɫ]")
			szName=string.gsub(szName, "#ccc33cc", "[��ɫ]")
			szName=string.gsub(szName, "#cFF6600", "[��ɫ]")
			PushDebugMessage(szName)
			if string.find("|"..wupin.."|","|"..szName.."|",1,true) then
				PushDebugMessage("�y��"..szName.."|���:"..i)
				return 1
			end
		end
		return -1
		]],i ,��Ʒ�б�))
		if tonumber(tem) == 1 then
			LUA_ȡ����ֵ(string.format([[	
				Pneuma:SmeltPneumaItem(%d)
			]],i))			
			��ʱ(1000)	
		end
	end
end





function ����_��Ԫ�y��¯(��ɫ,������Ʒ�б�)
	if not ��ɫ then
		��ɫ = 1
	end	
	if not ������Ʒ�б� then
		������Ʒ�б� =""
	end	
	for i=36,59 do
		local tem =LUA_ȡ����ֵ(string.format([[	
		local i=%d
		local yanse =%d
		blwp ="%s"	
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			if string.find(szName,"#cFFFFFF",1,true) then 
				index =1 
				szName=string.gsub(szName, "#cFFFFFF", "")
			elseif string.find(szName,"#c00D000",1,true) then 
				index =2
				szName=string.gsub(szName, "#c00D000", "")
			elseif string.find(szName,"#c2980FF") then 
				index =3
				szName=string.gsub(szName, "#c2980FF", "")
			elseif string.find(szName,"#ccc33cc",1,true)  then 
				index =4
				szName=string.gsub(szName, "#ccc33cc", "")		
			elseif string.find(szName,"#cFF6600",1,true)  then 
				index =5
				szName=string.gsub(szName, "#cFF6600", "")		
			end
			--PushDebugMessage(szName)

				
			
			if  index== yanse then  
				if blwp=="" then
					return 1
				end
				if  not string.find(blwp,szName,1,true) then
					PushDebugMessage("�y��"..szName)
					return 1
				else
					PushDebugMessage("������:"..szName)
					return 2
				end
			end
		end
		return -1
		]],i ,��ɫ,������Ʒ�б�))
		if tonumber(tem) == 1 then
			LUA_ȡ����ֵ(string.format([[	
				Pneuma:SmeltPneumaItem(%d)
				]],i))			
				��ʱ(1000)
		elseif tonumber(tem) == 2 then
			��ʱ(1000)		
		end
	end
end


--------------------------------------------------------------------------------------

��Ļ��ʾ("������Ԫ��ʼ")

local ������Ԫ=����_�ȶ���Ԫ()
local ��Ԫ����="|��Ԫ����Ѫ��|��Ԫ���ϱ���|��Ԫ���ϻ��|��Ԫ��������|��Ԫ���϶���|��Ԫ�������|��Ԫ��������|��Ԫ����׼��|��Ԫ���Ͼ���|��Ԫ�������|��Ԫ��������|��Ԫ�����ͷ�|��Ԫ���ϼ��|��Ԫ��������|��Ԫ���ϱ���|��Ԫ���϶���|��Ԫ��������|��Ԫ�����|��Ԫ��������|��ɫ��Ԫ����|������Կ|���౦ϻ|"

function ��Ҫ������ɫ����()
	for k= 1, 3 do
		����_��Ԫ�y��¯(1)
		����_��Ԫ�y��¯(2)
		����_��Ԫ�y��¯(3,������Ԫ)
		--����_��Ԫ�y��¯(4,������Ԫ)
		ȡ����Ʒ(��Ԫ����)
		����_ʹ����Ʒ(��Ԫ����)
	end

	����_��Ԫ��������(������Ԫ)
	����_��Ԫ���(1)
	����_��Ԫ���(2)
	����_��Ԫ���(3,������Ԫ)

	����_��Ԫ��������()
	����_��Ԫ���뱳��(3,������Ԫ)
	����_��Ԫ���뱳��(4)
	����_��Ԫ���뱳��(5)


	����_��Ԫ����(3)
	����_��Ԫ����(4)
	����_��Ԫ����(5)
	����_��Ԫ����(6)
end



 ��Ҫ������ɫ����()