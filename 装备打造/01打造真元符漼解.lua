

function ����_ʹ����Ʒ(��Ʒ�б�,�Ƿ��)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	for i=0,200 do
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
			��ʱ(2000)
			LUA_Call(string.format([[
				setmetatable(_G, {__index = Item_MultiUse_Env});
				if if this:IsVisible() then
					local txt=Item_MultiUse_ItemInfo_Text:GetText()
					if string.find("%s",txt,1,true) then
						Item_MultiUse_BuyMulti_Clicked()
					end
				end
			]],��Ʒ�б�))
		end
	end
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


function ����_��Ԫ�y�Ᵽ��(��ɫ,������Ʒ�б�)
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

---------------------------------------------------------------------------------------------


local ��Ԫ����="|��Ԫ����Ѫ��|��Ԫ���ϱ���|��Ԫ���ϻ��|��Ԫ��������|��Ԫ���϶���|��Ԫ�������|��Ԫ��������|��Ԫ����׼��|��Ԫ���Ͼ���|��Ԫ�������|��Ԫ��������|��Ԫ�����ͷ�|��Ԫ���ϼ��|��Ԫ��������|��Ԫ���ϱ���|��Ԫ���϶���|��Ԫ��������|��Ԫ�����|��Ԫ��������|��ɫ��Ԫ����|������Կ|���౦ϻ|"

local �������϶����y��="#cFFFFFF��Ԫ��Ѫӿ����|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ�����|#cFFFFFF��Ԫ��ӡ��|#cFFFFFF��Ԫ���ƶ�|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ����������|#cFFFFFF��Ԫ���ٲ�����|#cFFFFFF��Ԫ���ھ�����|#cFFFFFF��Ԫ�����|#cFFFFFF��Ԫ��Ѹ��|#cFFFFFF��Ԫ��ǧת���|#cFFFFFF��Ԫ����������|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ����������|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ��������ͥ|#cFFFFFF��Ԫ���⹦���|#cFFFFFF��Ԫ������մ��|#c00D000��Ԫ��Ѫӿ����|#c00D000��Ԫ������|#c00D000��Ԫ�����|#c00D000��Ԫ��ӡ��|#c00D000��Ԫ���ƶ�|#c00D000��Ԫ������|#c00D000��Ԫ����������|#c00D000��Ԫ���ٲ�����|#c00D000��Ԫ���ھ�����|#c00D000��Ԫ�����|#c00D000��Ԫ��Ѹ��|#c00D000��Ԫ��ǧת���|#c00D000��Ԫ����������|#c00D000��Ԫ������|#c00D000��Ԫ����������|#c00D000��Ԫ������|#c00D000��Ԫ��������ͥ|#c00D000��Ԫ���⹦���|#c00D000��Ԫ������մ��|#c2980FF��Ԫ��Ѫӿ����|#c2980FF��Ԫ������|#c2980FF��Ԫ�����|#c2980FF��Ԫ��ӡ��|#c2980FF��Ԫ���ƶ�|#c2980FF��Ԫ������|#c2980FF��Ԫ����������|#c2980FF��Ԫ���ٲ�����|#c2980FF��Ԫ���ھ�����|#c2980FF��Ԫ�����|#c2980FF��Ԫ��Ѹ��|#c2980FF��Ԫ��ǧת���|#c2980FF��Ԫ����������|#c2980FF��Ԫ������|#c2980FF��Ԫ����������|#c2980FF��Ԫ������|#c2980FF��Ԫ��������ͥ|#c2980FF��Ԫ���⹦���|#c2980FF��Ԫ������մ��|#ccc33cc��Ԫ����������|#ccc33cc��Ԫ���ٲ�����|#ccc33cc��Ԫ���ھ�����|#ccc33cc��Ԫ�����|#ccc33cc��Ԫ��Ѹ��|#ccc33cc��Ԫ��ǧת���|#ccc33cc��Ԫ����������|#ccc33cc��Ԫ������|#ccc33cc��Ԫ����������|#ccc33cc��Ԫ������|#ccc33cc��Ԫ��������ͥ|#ccc33cc��Ԫ���⹦���|#ccc33cc��Ԫ������մ��|"


local ������Ԫ="��Ԫ��"..������Ԫ.."|".."��Ԫ��"..������Ԫ.."|".."��Ԫ��Ѫӿ����|��Ԫ��Ѫӿ����|��Ԫ������|��Ԫ������|"

--��Ԫ������Ʒ�б� =string.gsub(��Ԫ������Ʒ�б�,"%[��ɫ%]","#c2980FF")
--��Ԫ������Ʒ�б� =string.gsub(��Ԫ������Ʒ�б�,"%[��ɫ%]","#ccc33cc")
--��Ļ��ʾ(��Ԫ������Ʒ�б�)
--��ʱ(30000)
--��Ԫ������Ʒ�б� =��Ԫ������Ʒ�б�.."|"..string.gsub(��Ԫ������Ʒ�б�,"��","��")
--#ccc33cc ��ɫ
--#c00D000 ��ɫ
--#c2980FF ��ɫ 
--#cFFFFFF ��ɫ
--ǰ�������ɫҪ�ӽ�ȥ
--szName=string.gsub(szName, "#ccc33cc", "[��ɫ]")
------------------------------------------------------------------------------------------------------------------------------------------------------



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
---1�ǰ�ɫ 2��ɫ 3��ɫ 4��ɫ 5��ɫ
--����2 Ϊ���� �����ɫ ȫ������
����_��Ԫ�y�Ᵽ��(1)
����_��Ԫ�y�Ᵽ��(2)
����_��Ԫ�y�Ᵽ��(3,������Ԫ)
����_��Ԫ�y�Ᵽ��(4,������Ԫ)
ȡ����Ʒ(��Ԫ����)
����_ʹ����Ʒ(��Ԫ����)

--����_��Ԫ�y��¯(4,��Ԫ������Ʒ�б�)

--����_ȡ����Ʒ�Ҽ�ʹ��(��Ԫ����)


--����_ȡ����Ʒ�Ҽ�ʹ��(��Ԫ����)
--����_�y��¯(�������϶����y��,2)