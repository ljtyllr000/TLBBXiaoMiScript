


��������,����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
if ���� == "����" then
	����ض����� ="������"
	else
	����ض����� ="������"
end

function ������ʾ(text,...)
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

function ����_ȡ������λ(nTheTabIndex)--��ȡ����������0�������1��������2�Ŀո����Լ�����������Ʒ���
    local szPacketName = ""
	local CurrNum = 0
	local BaseNum = 0
	local MaxNum = 0
	if(nTheTabIndex == 1) then
		szPacketName = "base";
		CurrNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_Num();", "n")--��ǰ������
		BaseNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_BaseNum();", "n")--����������
		MaxNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_MaxNum();", "n")--��������
	elseif(nTheTabIndex == 2) then
		szPacketName = "material";
		CurrNum = LUA_ȡ����ֵ("return DataPool:GetMatBag_Num();", "n")--��ǰ������
		BaseNum = LUA_ȡ����ֵ("return DataPool:GetMatBag_BaseNum();", "n")--����������
		MaxNum = LUA_ȡ����ֵ("return DataPool:GetMatBag_MaxNum();", "n")--��������		
	elseif(nTheTabIndex == 3) then
		szPacketName = "quest";
		CurrNum = LUA_ȡ����ֵ("return DataPool:GetTaskBag_Num();", "n")--��ǰ������
		BaseNum = LUA_ȡ����ֵ("return DataPool:GetTaskBag_BaseNum();", "n")--����������
		MaxNum = LUA_ȡ����ֵ("return DataPool:GetTaskBag_MaxNum();", "n")--��������		
	else
		szPacketName = "base";
		CurrNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_Num();", "n")--��ǰ������
		BaseNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_BaseNum();", "n")--����������
		MaxNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_MaxNum();", "n")--��������
	end

	local spacenum, maxnum, nIndex = LUA_ȡ����ֵ(string.format([[
	        local spacenum = 0
			local maxnum = 1
			local nIndex = -1
			for i=1, %d do
				local theAction,bLocked = PlayerPackage:EnumItem("%s", i-1);
				if theAction:GetID() ~= 0 then
				   spacenum = spacenum + 1
				   local nownum = theAction:GetNum()
                   if nownum > maxnum then
				      maxnum = nownum
					  nIndex = i
                   end	                  				   
				   --local g_NeedTipItem = theAction:GetDefineID()
				   --PushDebugMessage(theAction:GetID().."/"..g_NeedTipItem.."/"..theAction:GetName().."/"..theAction:GetNum().."/"..i-1)-- (i-1)���Ǳ������������
				end
			end
            return 	spacenum, maxnum, nIndex	
			
	]], CurrNum, szPacketName), "nnn")
	return CurrNum-spacenum, maxnum, nIndex
end





--ִ�й���("[�ű�]��������� ")

function ����_�һ����������Ʒ(index) --�������
	LUA_Call(string.format([[
		local theAction, bLocked =Bank:EnumTemItem(%d);
		if theAction:GetID() ~= 0 then
				setmetatable(_G, {__index = Packet_Env});
				local oldid = Packet_Space_Line1_Row1_button:GetActionItem();
				Packet_Space_Line1_Row1_button:SetActionItem(theAction:GetID());
				Packet_Space_Line1_Row1_button:DoAction();
				Packet_Space_Line1_Row1_button:SetActionItem(oldid);
		end
	]], index))
end

function ����_ȡ���������Ʒ(��Ʒ�б�,�Ƿ��)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	
	for i=0,119 do
		local tem = LUA_ȡ����ֵ(string.format([[
		tbangding =tostring("%s")
		i =%d
		ttname = "%s"
		local theAction, bLocked =Bank:EnumTemItem(i);
		if theAction:GetID() ~= 0 then
			local GetName=theAction:GetName()
			local szItemNum =theAction:GetNum();
			local Status=Bank:GetTemBankItemBindStatus(i);--�Ƿ��
			if GetName~=nil and GetName ~="" then
				if string.find(ttname,GetName,1,true ) then
					if string.find(tbangding,tostring(Status)) then
						PushDebugMessage("ȡ��������Ʒ:"..GetName.."|λ��:"..i)
						return szItemNum
					end	
				end
			end
		end	
		return -1
		]],tbangding, i,��Ʒ�б�))
  		if tonumber(tem)>= 1 then 
			if ����_ȡ������λ(1) <=1  or ����_ȡ������λ(2) <= 1 then
				break
			end
			����_�һ����������Ʒ(i)
			��ʱ(1500)
		end
		��ʱ(50)
	end
	��Ļ��ʾ("�����������,����")
	LUA_ȡ����ֵ("setmetatable(_G, {__index = Packet_Temporary_Env});Packet_Temporary_CleanButtonClk();") 	--�����������
	��ʱ(1000)
	LUA_Call("setmetatable(_G, {__index = Packet_Temporary_Env});Packet_Temporary_CloseFunction();")
	LUA_Call("setmetatable(_G, {__index = Packet_Temporary_Env});Packet_Temporary_OnHiden();")
	��ʱ(1500)
end


--����_ȡ���������Ʒ(ȡ���б�,2)  --����1������Ʒ�����б� ����2:  0ȫ��1�Ƿǰ� 2�� 










function ����_ȡ�������ID()
	local tem =tonumber(LUA_ȡ����ֵ("return EnumAction(18,'equip'):GetID();"))
	return tem
end
			
function ����_ȡ�������ϳɵȼ�()
	local tem = LUA_ȡ����ֵ(string.format([[
		local id  =EnumAction(18,"equip"):GetID();
		if  id > 0 then
			local data = DataPool:GetKfsData("EXTRALEVEL")
			return data
		else
		  return -1
		end	
		]]))
	return tonumber(tem)
end

function ����_ȡ���н��()
	local tem =tonumber(��ȡ������Ϣ(45)+��ȡ������Ϣ(52)) --���+ ����
	return tem
end

function ����_ȡ�������ȼ�()
	if ����_ȡ�������ID() > 0 then
		local tem =tonumber(LUA_ȡ����ֵ("return DataPool:GetKfsData('LEVEL');"))  
		return tem
	else
		return -1
	end
end

function ����_ȡ�����������()
	local tem =LUA_ȡ����ֵ("return EnumAction(18,'equip'):GetName();")
	return tem
end

function  ����_ȡ�����������()  --300���
    if   ����_ȡ�������ID()>0 then
		return  tonumber(LUA_ȡ����ֵ(string.format([[ 
					return DataPool:GetKfsData("LIFE")
					]])))
	else
		return -1
    end
end


function ����_ȡ�����������()
	local tem =LUA_ȡ����ֵ("return EnumAction(18,'equip'):GetName();")
	return tem
end

function ����_ȡ�������ȼ����(����,�ȼ�)
	local tem = LUA_ȡ����ֵ(string.format([[
		for i=0,99 do
			 local theAction=EnumAction(i,"packageitem")
			 local ID =theAction:GetID();
			if ID > 0 then
			local GetName=theAction:GetName();
				  if string.find("%s",GetName) then		
						local level = PlayerPackage:GetBagKfsData(i,"LEVEL")
							if level  == %d  then 
								--PushDebugMessage(i)
								return i
							end	
						end
					end
				end
		return -1	
	]],����,�ȼ�))
	return tonumber(tem)
end






function ����_ȡ����������(�Ƿ��,�ϳɵȼ�,���,����)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	local tem = LUA_ȡ����ֵ(string.format([[
				local tbangding =tostring("%s")
				local ttLevel =%d
				local HoleNum =%d
				local ttLife=%d
				for i =0,99 do
					local theAction=EnumAction(i,"packageitem")
					local GetName=theAction:GetName()
					local szItemNum =theAction:GetNum();
					local Status=GetItemBindStatus(i);
					if GetName~=nil and GetName ~="" then
						if string.find("������|������",GetName ) and  string.find(tbangding,tostring(Status)) then
							local HoleCount=LifeAbility:GetEquip_HoleCount(i);
							if HoleCount >= HoleNum  then
								local level = PlayerPackage:GetBagKfsData(i ,"EXTRALEVEL")
								local curLife = PlayerPackage:GetBagKfsData(i, "LIFE")
								local maxLife = PlayerPackage:GetBagKfsData(i, "MAXLIFE")
								if level >=ttLevel and curLife <= ttLife then
									--PushDebugMessage("�������:"..GetName.."|����λ��:"..i)
									return i
								end	
							end	
						end
					end
				end	
				return -1
					]],tbangding,�ϳɵȼ�,���,����))
					
	return tonumber(tem)				
end


 LUA_ȡ����ֵ([[
			function qwhdj(ID)
				Lvelel =0
						if SetSuperTooltips then
							SetSuperTooltips(ID)
							Desc1 = SuperTooltips:GetDesc2()
							Lvelel = tonumber(string.gsub(Desc1 , "#cC8B88E�ȼ�:", ""))
						end
						return Lvelel
				end	
	]])
					
					
function ����_ȡ�������׼ȷ��Ϣ���(����,�ȼ�,�ϳɵȼ�,�������,����,�Ƿ��)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	local tem = LUA_ȡ����ֵ(string.format([[
			name ="%s"
			TTLvelel=%d
			TThcLvelel =%d
			HoleNum =%d
			shuxing ="%s"
			tbangding =tostring("%s")
			for i=0,99 do
				local theAction=EnumAction(i,"packageitem")
				 local GetName=theAction:GetName();
					local Status=GetItemBindStatus(i);
					  if string.find(name,GetName) then			
						local hcLvele = PlayerPackage:GetBagKfsData(i ,"EXTRALEVEL")
						Lvelel=qwhdj(theAction:GetID())
						
						if hcLvelel  == TThcLvelel and Lvelel =TTLvelel  then 
							local HoleCount=LifeAbility:GetEquip_HoleCount(i);
							if HoleCount == HoleNum  then
								if string.find(tbangding,tostring(Status)) then
									DQshuxing=""
									local attrNum = PlayerPackage:GetBagKfsAttrExNum(i)
									if attrNum >0 then
										for k=0,attrNum-1 do
											local iText , iValue = PlayerPackage:GetKfsAttrEx(i ,k)
											DQshuxing=DQshuxing..iText.."|"									
										end
									end
									if DQshuxing==shuxing then
										return i
									end	
								end
							end	
						end
					end
				end 
			 return -1
			]], ����,�ȼ�,�ϳɵȼ�,�������,����,tbangding), "n")
	return tonumber(tem)
end





function ����_ȡ�������ָ���������(����,�ȼ�,����,�Ƿ��)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	local tem = LUA_ȡ����ֵ(string.format([[
			tolvele =%d
			tbangding =tostring("%s")
			name ="%s"
			shuxing ="%s"
			for i=0,99 do
				local theAction=EnumAction(i,"packageitem")
				 local GetName=theAction:GetName();
					local Status=GetItemBindStatus(i);
					  if string.find(name,GetName) then			
						local level = PlayerPackage:GetBagKfsData(i ,"EXTRALEVEL")
						if level  ==tolvele then 
							if string.find(tbangding,tostring(Status)) then
								local attrNum = PlayerPackage:GetBagKfsAttrExNum(i)
								if attrNum >0 then
									for k=0,attrNum-1 do
										local iText , iValue = PlayerPackage:GetKfsAttrEx(i ,k)
										if string.find(iText,shuxing) then
											return i
										end										
									end
								end
							end	
						end
					end
				end 
			 return -1
			]], �ȼ�,tbangding,����,����), "n")
	return tonumber(tem)
end




function ����_ȡ���������(index)
	if not index then 
		if ����_ȡ�����������() <=0 then
			������ʾ("���û��������ִ��")
			return 0
		end	
	end	
	
	if ����_ȡ�������ID() > 0 then
		 �������=����_ȡ�����������()
		������ʾ(�������)
		else
		������ʾ("����û���")
		return 0
	end	
     for i=1,5 do
         LUA_Call ("MainMenuBar_SelfEquip_Clicked();",-1)
         ��ʱ (2000)
         if �����Ƿ����("SelfEquip") then   --ͬ������ �ȴ����ڳ���()
              LUA_Call("setmetatable(_G, {__index = Wuhun_Env});Wuhun_Equip_Clicked(0);")    
              ��ʱ (2000)
              if LUA_ȡ����ֵ("return EnumAction(18,'equip'):GetID();")=="0" then  --�������װ���ɹ�
                   LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();",-1)      
                   ��ʱ(500)  
                   return tostring(�������) 
              end
         end      
     end
     LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();",-1)      
     ��ʱ(1500) 
     if ����_ȡ�������ID()==0 then
          return tostring(�������)
     else  
          return 0
     end     
end


function ����_ȡ���������Ϣ(index)
	if not index then
		index = 1
	end	
	local tem = LUA_ȡ����ֵ(string.format([[
		local index=%d
		local tem = -1
		local wuhution=EnumAction(18,"equip")
		local id  =wuhution:GetID();
		if  id > 0 then
			if index == 1 then
				tem = 	DataPool:GetKfsData("NAME")
			elseif index == 2 then	
				 tem = DataPool:GetKfsData("EXTRALEVEL")  --�ϳɵȼ�
			elseif index == 3 then
				 tem =DataPool:GetKfsData("LEVEL");  --�ȼ�
			elseif index == 4 then
				 tem =DataPool:GetKfsData("LIFE");  --����		
			elseif index == 5 then
				 tem =LifeAbility:GetWearedEquip_HoleCount(18); --�������
			elseif index == 6 then
				 tem =DataPool:GetKfsData("EXP");  --��ǰ����
			elseif index == 7 then
				 tem =DataPool:GetKfsData("NEEDEXP");  --�����				
			elseif index == 8 then	  --���Թ���
					tem =""
					for i=1,10 do
						local iText , iValue = DataPool:GetKfsFixAttrEx(i - 1)		
						if iText ~= nil and iText ~= "" and iValue ~= nil and iValue > 0  then
							tem =tem..iText.."|"
						end		
					end
			elseif index == 9 then	
				return id
			end
		end	--ID 
			return tem
		]],index))
	return tem
end

function ����_ȡ���������Ϣ���(����,�ȼ�,�������,����,�Ƿ��)
	if �Ƿ�� ==0 or not �Ƿ�� then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	if not �������  then
		������� = -1
	end
	if not ����  then
		���� = ""
	end

	local tem = LUA_ȡ����ֵ(string.format([[
			 tolvele =tonumber(%d)
			 tbangding =tostring("%s")
			 name ="%s"
			 xuhao =tonumber(%d)
			shuxing = "%s"
			for i=0,99 do
				 local theAction=EnumAction(i,"packageitem")
				 local ID =theAction:GetID();
				if ID > 0 then
				 local GetName=theAction:GetName();
				  if string.find(name,GetName) then		
						--PushDebugMessage(GetName)
						local Status=GetItemBindStatus(i);	
						local level = PlayerPackage:GetBagKfsData(i,"EXTRALEVEL")
						if string.find(tbangding,tostring(Status)) then
							if level  == tolvele and tonumber(i) ~= xuhao then 
								local attrNum = PlayerPackage:GetBagKfsAttrExNum(i)
								if attrNum >0 then
									for k=0,attrNum-1 do
										local iText , iValue = PlayerPackage:GetKfsAttrEx(i ,k)
										if string.find(iText,shuxing) then
											return i
										end										
									end
								end
							end	
						end
					end
					end	
				end 
		return    -1
			]], �ȼ�,tbangding,����,�������,����))
	return tonumber(tem)
end

function ����_����ȷ��()     --������ȷ��
	if  �����Ƿ����("MessageBox_Self")==1 then
		LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
		��ʱ(2000)
	end
end

function ����_װ�����(��Ʒ�б�,�Ƿ��,�ϳɵȼ�,�������,����,����)
	--��Ʒ�б�="������|������"
	ȡ����Ʒ(��Ʒ�б�)
	if �Ƿ�� ==0 or �Ƿ�� == nil then
		tbangding =10
	elseif  �Ƿ�� ==1 then
		tbangding = 0
	elseif  �Ƿ�� ==2 then
		tbangding = 1
	end
	if not �ϳɵȼ�  then
		�ϳɵȼ�=1
	end	
	if not �������  then
		�������=1
	end	
	if not ����  then
		����=1
	end


	--������ʾ("�жϱ����ϳɵȼ���[%d],���������[%d]����>=[%d]���Ժ���[%s]",�ϳɵȼ�,�������,����,����)
	��ʱ(2000)
	
	for i=0,99 do
			local tem = LUA_ȡ����ֵ(string.format([[
				tbangding =tostring("%s")
				i =%d
				local ttname = "%s"
				local ttlevel =%d
				local HoleNum =%d
				local ttLife =%d
				local  shuxing ="%s"
				local theAction=EnumAction(i,"packageitem")
			    local GetName=theAction:GetName()
				local szItemNum =theAction:GetNum();
				local Status=GetItemBindStatus(i);
					if GetName~=nil and GetName ~="" then
						if string.find(ttname,GetName ) then
							local HoleCount=LifeAbility:GetEquip_HoleCount(i);
							local curLife = PlayerPackage:GetBagKfsData(i, "LIFE")
							local maxLife = PlayerPackage:GetBagKfsData(i, "MAXLIFE")
							if string.find(tbangding,tostring(Status)) and HoleCount >= HoleNum  then
									local level = PlayerPackage:GetBagKfsData(i ,"EXTRALEVEL")
									if level >=ttlevel  and curLife >= ttLife then
										
								local attrNum = PlayerPackage:GetBagKfsAttrExNum(i)
								if attrNum >0 then
									for k=0,attrNum-1 do
										local iText , iValue = PlayerPackage:GetKfsAttrEx(i ,k)
										if string.find(iText,shuxing) then
											PushDebugMessage("ʹ�����:"..GetName.."|����λ��:"..i)
											return 1
										end										
									end
								end
									
									end	
							end	
						end
					end
				return -1
					]],tbangding, i,��Ʒ�б�,�ϳɵȼ�,�������,����,����))
				if tonumber(tem)==1 then 
					for k=1,5 do
							����_�жϹرմ���("Shop")
							��ʱ(2000)
							����_������()
							��ʱ(2000)
							����_�һ�ʹ����Ʒ(i)
							��ʱ(2000)
							����_����ȷ��()
							��ʱ(10000)
							break
					end
					��ʱ(200)
			end
		end
end

function ����_�����̻Ṻ����ͨ���(����,����, ����, ��ߵ���)
		������ʾ("�����̻Ṻ����Ʒ:"..����)
		ȡ����Ʒ(����)
		��ʱ(3000)
		ȡ����Ʒ("���",1000000)  

		if �����Ƿ����("PS_ShopSearch") == 0 then
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
	end
	--������Ʒ
	  
	if �����Ƿ����("PS_ShopSearch") == 1 then	
			LUA_Call(string.format([[	
			Lexing=tonumber(%d)
			if Lexing == 1 then  
				soushuo = 1
			elseif   Lexing == 2 then 
				soushuo = 2
			else 
				soushuo = 10101
			end
		setmetatable(_G, {__index = PS_ShopSearch_Env})
         PlayerShop:PacketSend_Search(Lexing,soushuo, 1, "%s", tonumber(1))		
	]],����,����))
	��ʱ(2000)
	--������һҳ��û�з�����������Ʒ
	local tem = LUA_ȡ����ֵ(string.format([[
	        setmetatable(_G, {__index = PS_ShopSearch_Env})
			for i = 1 ,10 do 
				theAction = EnumAction( i - 1 , "playershop_cur_page")
				TTID=theAction:GetID() 
				if TTID~= 0 then
					--��Ʒ��,������,�����̵�ID,����,�ܼ۸�
					local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )		
					local holdMoney = Player:GetData( "MONEY" )
					if  pYB ~= nil  then 
					if pYB > holdMoney then 
						return false
					end	
					end		
					if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
					    if pName == "%s" and pCount <= %d and pYB/pCount <= %d then
						 --  PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
						   --��������,ֱ�ӷ���
							PlayerShop:SearchPageBuyItem(i - 1, "item")
							return true
						end
					end
				end
			end
            return false
	]], ����, ����, ��ߵ���), "b")
		if tem then 
			��ʱ (2000)
		end
	end
    --����_�жϹرմ���("PS_ShopSearch")
	--����_�жϹرմ���("PS_ShopList")
	--����_�жϹرմ���("Quest")	
	--return tem
end



function ����_���������ϳ�(�ȼ�,�Ƿ��)
	������ʾ("�������ϳɵ��ȼ�:"..�ȼ�+1)
	for i =1,15 do
		��������= ����_ȡ���������Ϣ���("������|������",�ȼ�)
		if �������� < 0 then
			return
		end
			�������� = ����_ȡ���������Ϣ���("������|������",�ȼ�,��������,�Ƿ��)
			if �������� < 0 then
				return
			end

		LUA_Call(string.format([[
			PlayerPackage:Kfs_Op_Do(3,%d,%d)
		]], ��������,��������), "n")
		��ʱ(1000)
	end
end

function ����_���ܺϳɱ������(�ȼ�,�Ƿ������)
	������ʾ("���ܺϳɱ������")
	if not �ȼ� then
		�ȼ� =2
	end	
	if not �Ƿ������ then
		�ȼ� =0
	end	
	
	for kkk = 1, 9 do
		local ��� =����_ȡ���������Ϣ���("������|������",�ȼ�)
		if  ���>= 0 then
				break
		end
		ȡ����Ʒ("���")
		ȡ����Ʒ("������|������")
		��ʱ(2000)
		if ����_ȡ���н��() <= 10000 then 
			������ʾ("ȫ�Զ��ϳ����,Ǯ����1����������")
			break 
		end	
		����_ȡ���������Ʒ("������|������")
		for K =1,�ȼ�-1 do
			����_���������ϳ�(K)
		end
		local ��� =����_ȡ���������Ϣ���("������|������",�ȼ�)
		if  ���>= 0 then
				break
		end
		if tonumber( ��ȡ������Ϣ(45)) <  10*10000 then 
			������ʾ("��Ҳ���,�����������")
			return 
		end	
		if  �Ƿ������ == 1 then
			����_�����̻Ṻ����ͨ���(3,"������",1, 10*10000)
			����_�����̻Ṻ����ͨ���(3,"������",1, 10*10000)
		end
		
		for K =1,�ȼ�-1 do
			����_���������ϳ�(K)
		end
		
	end
end


function ����_ȫ�Զ��ϳ����(Ŀ��ϳɵȼ�,�������)
	if not  ������� then
		������� = 0 
	end	

	for i =1,7 do	
		local �������ȼ� = tonumber(����_ȡ���������Ϣ(3))
		local ������� = ����_ȡ���������Ϣ(1)   
		local ���ϳɵȼ� = tonumber(����_ȡ���������Ϣ(2) )
		local ������� =����_ȡ���������Ϣ(4)   
		local ��������� =����_ȡ���������Ϣ(5)   
		
		--if �������ȼ�<=1 then
		--	������ʾ("�������ȼ�[%d]���������ϳ�",�������ȼ�)
			--return
		--end	
		if 	 tonumber (���ϳɵȼ� ) >= Ŀ��ϳɵȼ� then
			������ʾ("�������[%d]���������ϳ�",Ŀ��ϳɵȼ�)
			��ʱ(1000)
			return
		end
		ȡ����Ʒ("���")
		if ����_ȡ���н��() <= 10000 then 
			������ʾ("ȫ�Զ��ϳ����,Ǯ����1����������")
			return 
		end	
		
		����_���ܺϳɱ������(���ϳɵȼ�,�������)
		
		local �������� =����_ȡ���������Ϣ���("������|������",���ϳɵȼ�)
		if �������� < 0 then
			������ʾ("������겻���Ϻϳ�")
				��ʱ(5000)
			return
			else
			������ʾ("��������:"..��������)
		end
		local ��������� = ����_ȡ���������()
		��ʱ(5000)		
		local ��������=����_ȡ�������ָ���������(���������,���ϳɵȼ�,"����")
		��Ļ��ʾ(��������)
		--����_ȡ�������ȼ����(���������,�������ȼ�)
		if �������� < 0 then
			������ʾ("�����������Ų����Ϻϳ�")
			��ʱ(5000)
			return
		end
		LUA_Call(string.format([[
				PlayerPackage:Kfs_Op_Do(3,%d,%d)
		]], ��������,��������), "n")
		��ʱ(1000)
		����_װ�����(���������,0,���ϳɵȼ�+1,0,1,"����")
		��ʱ(3000)
	end
end


function ����_�����̻Ṻ�����(����,����, ����, ��ߵ���,����)
		������ʾ("�����̻Ṻ����Ʒ:"..����)
		if ����_ȡ�������ָ���������(����,1,����) > 0 then
				������ʾ("��궾��������")
				return
		end
		
		ȡ����Ʒ(����)
		��ʱ(3000)
		ȡ����Ʒ("���",1000000)  
		for kkk = 1, 10 do
		if �����Ƿ����("PS_ShopSearch") == 0 then
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
	end
	--������Ʒ
	  
	if �����Ƿ����("PS_ShopSearch") == 1 then	
			LUA_Call(string.format([[	
			Lexing=tonumber(%d)
			if Lexing == 1 then  
				soushuo = 1
			elseif   Lexing == 2 then 
				soushuo = 2
			else 
				soushuo = 10101
			end
		setmetatable(_G, {__index = PS_ShopSearch_Env})
         PlayerShop:PacketSend_Search(Lexing,soushuo, 1, "%s", tonumber(%d))		
	]],����,����,kkk))
	��ʱ(2000)
	--������һҳ��û�з�����������Ʒ
	local tem = LUA_ȡ����ֵ(string.format([[
	        setmetatable(_G, {__index = PS_ShopSearch_Env})
			for i = 1 ,10 do 
				theAction = EnumAction( i - 1 , "playershop_cur_page")
				TTID=theAction:GetID() 
				if TTID~= 0 then
					--��Ʒ��,������,�����̵�ID,����,�ܼ۸�
					local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
					if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
					    if pName == "%s" and pCount <= %d and pYB/pCount <= %d then
						 --  PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
						   --��������,ֱ�ӷ���
							if SetSuperTooltips then
								SetSuperTooltips(TTID)
								local Propertys =SuperTooltips:GetPropertys()
								if string.find(Propertys,"%s") then
									PlayerShop:SearchPageBuyItem(i - 1, "item")
									return true
								end	
							end	
						end
					end
				end
			end
            return false
	]], ����, ����, ��ߵ���,����), "b")

		if tem then 
			��ʱ (2000)
			if ����_ȡ�������ָ���������(����,1,����) > 0 then
				������ʾ("��궾��������")
				break
			end
		end
	end
	end
    --����_�жϹرմ���("PS_ShopSearch")
	--����_�жϹرմ���("PS_ShopList")
	--����_�жϹرմ���("Quest")	
	--return tem
end

--------------------------------------------------


function ����_�����̻Ṻ����Ʒ(����,����, ��С����,�������, ����,��Ҫ����)
     ȡ����Ʒ("���",200000)  
	for kkkkk=1,9 do
		 ������ʾ("�����̻Ṻ����Ʒ:����:%d|����:%s|��С����:%d|�������:%d|����:%d|��Ҫ����:%d",����,����,��С����,�������,����,��Ҫ����)
		if ��ȡ������Ʒ����(����)>=��Ҫ���� then
			������ʾ("�������������Ʒ"..����)
			��ʱ (1000)
			break
		end
		if �����Ƿ����("PS_ShopSearch")== 0 then
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
		end
		
		��ʱ (2000)
		if ����== 2 then
				LUA_Call(string.format([[	
			 PlayerShop:PacketSend_Search(2,2, 1, "%s", %d)		
		]], ����,kkkkk))
		elseif  ���� == 1 then
								LUA_Call(string.format([[	
				PlayerShop:PacketSend_Search(1,1, 1, "%s", %d)		
		]], ����,kkkkk))
		elseif ���� == 3  then
					LUA_Call(string.format([[	
				PlayerShop:PacketSend_Search(3 , 10101, 1, "%s", %d)		
		]], ����,kkkkk))
		
		elseif ���� == 4  then
					LUA_Call(string.format([[	
				PlayerShop:PacketSend_Search(4 , 10101, 1, "%s", %d)		
		]], ����,kkkkk))
		elseif ���� == 5  then
					LUA_Call(string.format([[	
				PlayerShop:PacketSend_Search(5 , 10101, 1, "%s", %d)		
		]], ����,kkkkk))	
		end
		��ʱ(1500)
		--������һҳ��û�з�����������Ʒ
		local tem = LUA_ȡ����ֵ(string.format([[
				setmetatable(_G, {__index = PS_ShopSearch_Env})
				TTname ="%s"
				minCount =tonumber(%d)
				maxCount =tonumber(%d)
				danYB =tonumber(%d)
				for i = 1 ,10 do 
					local theAction = EnumAction( i - 1 , "playershop_cur_page")
					if theAction:GetID() ~= 0 then
						local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo(i - 1)			
						if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
							if pName == TTname then 
								--PushDebugMessage(pName.."|"..pShopName.."|����:"..pCount.."|�ܼ�:"..pYB)
								if tonumber( pYB/pCount) <=danYB then	
									if 	pCount >=minCount and  pCount <= maxCount  then
										--	PushDebugMessage(pName.."|"..pShopName.."|����:"..pCount.."|�ܼ�:"..pYB)
										PlayerShop:SearchPageBuyItem(i - 1, "item")
										return true
									end
								end
							end
						end
					end
				end
				return false
		]],����,��С����,�������,����), "b")
		��ʱ (2000)
	end
    ����_�жϹرմ���("PS_ShopSearch")
	����_�жϹرմ���("PS_ShopList")
	����_�жϹرմ���("Quest")	
end








function ����_�Զ��жϹ��򶾿����()
		������ʾ("�Զ��жϹ��򶾿����")
		��ʱ(2000)
		if ����_ȡ�������ϳɵȼ�() >=3 then
			������ʾ("�Զ��жϹ��򶾿����,���ϵĺϳɵȼ�����3��,�����жϹ���")
			��ʱ(2000)
			return
		end	
		if not  string.find(tostring(����_ȡ���������Ϣ(8)),"������")  then
			local ��������=����_ȡ�������ָ���������(����ض�����,1,"������")
			
			if �������� >= 0 then 
				������ʾ("���ض������:%s",����ض�����)
				
				����_װ�����(����ض�����,0,1,0,0,"������")
			else
				����_�����̻Ṻ�����(3,����ض�����,1, 50*10000,"������") --��ҪС���߼ӳ�
				��ʱ(3000)
			end
		end
end


function ����_���ϳ����(�ȼ�)
		������ʾ("���ϳ����ȼ���[%d]",�ȼ�)
		��ʱ(2000)
		local �������ϳɵȼ� =����_ȡ�������ϳɵȼ�()
		if  �������ϳɵȼ�>=�ȼ� then
			������ʾ("���ϳ����ȼ���%d,��������",�ȼ�)
			��ʱ(2000)
			return
		end
		if  string.find(tostring(����_ȡ���������Ϣ(8)),"������") or ����_ȡ�������ϳɵȼ�()>=5  then
			ȡ����Ʒ("������|������")
			����_ȫ�Զ��ϳ����(�ȼ�,0)  ---����2 Ϊ1ʱ�������
		else
			for k =1, 7 do
				local ��������=����_ȡ�������ָ���������(����ض�����,k,"������")
				if ��������>= 0 then
					������ʾ("������Ϊ%d",��������)
					����_װ�����(����ض�����,0,1,0,0,"������")
				end
			end	
		end
end

function ����_��������ȼ�()
	for i= 1, 99 do
		if string.find(tostring(����_ȡ���������Ϣ(8)),"������")  then	
				if tonumber(����_ȡ���������Ϣ(3))  >=tonumber(��ȡ������Ϣ(26)) then			
					������ʾ("��������ȼ�,���ȼ��Ѿ�������ȼ���,�Զ����������Ƭ����|�����Ƭ����|�����Ƭ����,��������")
					�Զ����("�����Ƭ����|�����Ƭ����|�����Ƭ����")
					��ʱ(2000)
					return
				end	
				ȡ����Ʒ("�����Ƭ����|�����Ƭ����|�����Ƭ����")
				local ���� =��ȡ������Ʒ����("�����Ƭ����|�����Ƭ����|�����Ƭ����")
				if ����> 0 then
					for i= 1, ���� do 
						if tonumber(����_ȡ���������Ϣ(3))  >=tonumber(��ȡ������Ϣ(26)) then
							return
						end	
						�Ҽ�ʹ����Ʒ("�����Ƭ����")
						�Ҽ�ʹ����Ʒ("�����Ƭ����")
						�Ҽ�ʹ����Ʒ("�����Ƭ����")
						��ʱ(300)
					end
				else
					����_�����̻Ṻ����Ʒ(2,"�����Ƭ����",50,250, 60000,1)
					local ���� =��ȡ������Ʒ����("�����Ƭ����|�����Ƭ����|�����Ƭ����")
						if ����<= 0 then
							break
						end	
				end
			--end
		end	
	end
	�Զ����("�����Ƭ����|�����Ƭ����|�����Ƭ����")
end

function ����_�������(���λ��,����λ��)
	��ͼѰ·("����",138,195)
		LUA_Call(string.format([[
			PlayerPackage:Kfs_Op_Do(4 ,%d ,%d,1,1) 
	]], ���λ��,����λ��))
end



function ����_�����������()
	������ʾ("�����������")
	if ����_ȡ������λ(1)<= 1 then 
		������ʾ("�����������,������λ����,��������");��ʱ(1000)
		return 
	end	
	
	if ����_ȡ���������Ϣ(9) >0 then
		local ������� = tonumber(����_ȡ���������Ϣ(4))
		������ʾ("����������%d",�������);��ʱ(1000)
		if �������== 0 then
			--- or	tonumber(����_ȡ�������ϳɵȼ�() )>=5 
			if string.find(tostring(����_ȡ���������Ϣ(8)),"������") then 	
				������ʾ("��ʼ�������ϵ����")
				��ʱ(2000)	
				����_�����̻Ṻ����Ʒ(2,"������ٵ�", 1,10, 30*10000,1)
				if ��ȡ������Ʒ���� ("������ٵ�") >=1 then
					����������ٵ���� =��ȡ������Ʒλ��("������ٵ�")-1
					��ʱ(3000)
				else
					������ʾ("��Ҳ����򲻵�������ٵ�,��������")
					return
				end
				
				local �������ȼ� = tonumber(����_ȡ���������Ϣ(3))
				local ������� = ����_ȡ���������Ϣ(1)   
				local ���ϳɵȼ� = tonumber(����_ȡ���������Ϣ(2) )
				local ��������� =����_ȡ���������Ϣ(5)   
				��ʱ(2000)
				local ������� = ����_ȡ���������(1)
				��ʱ(3000)
				local ������=	����_ȡ����������(2,���ϳɵȼ�,���������,0)
				if ������>=0 then
					����_�������(������,����������ٵ����)
					��ʱ(2000)
					����_װ�����(�������,2,���ϳɵȼ�,���������,300,"")
					����Ʒ("������ٵ�",������Ʒ,0,0,0)
					��ʱ(2000)
				else	
					return		
				end
			end
		else
			local ������=	����_ȡ����������(2,1,4,0)
			if ������>0 then
				������ʾ("�������д�״���4 �ϳɴ���2�� 0������� ��ʼ����");��ʱ(1000)
				����_�����̻Ṻ����Ʒ(2,"������ٵ�", 1,10, 30*10000,1)
				if ��ȡ������Ʒ���� ("������ٵ�") >=1 then
					����������ٵ���� =��ȡ������Ʒλ��("������ٵ�")-1;��ʱ(3000)
					����_�������(������,����������ٵ����)
					����_������();��ʱ(2000)
					����_�һ�ʹ����Ʒ(������);��ʱ(5000)
				
				else
					������ʾ("��Ҳ����򲻵�������ٵ�,��������")
					return
				end
			end
			
			
		end	
	end	
end




function ����_�����������(�Ƿ��,�ϳɵȼ�,�������,����)
	�������˵������� =����_ȡ����������(�Ƿ��,�ϳɵȼ�,�������,����) 
	if �������˵������� >=0 then
			--������ʾ("�����кϳɵȼ���[%d],��ס�[%d],����<=[%d]�����...׼������",�ϳɵȼ�,�������,����)
			ȡ����Ʒ("���")
		if ����_ȡ���н��() <= 50000 then 
			������ʾ("���������˵����..׼������Ǯ����5����������")
			return 
		end	
		����_�����̻Ṻ����Ʒ(2,"������ٵ�", 1,10, 30*10000,1)
		if ��ȡ������Ʒ���� ("������ٵ�") >=1 then
			����������ٵ���� =��ȡ������Ʒλ��("������ٵ�")-1
			��ʱ(3000)
			else
			return
		end
		����_�������(�������˵�������,����������ٵ����)
		��ʱ(5000)
		����_װ�����("������|������",2,�ϳɵȼ�,�������,300,"")
		����Ʒ("������ٵ�")
			
	else
		������ʾ("ȫ�Զ��������,������û�����˵����,��������")
		--����_װ�����("������|������",2,�ϳɵȼ�,�������,300,"")
		return 
	end

end


-------------------------------------------------------------
function ����_ȡ������꼼��ID(index)
		local tem = LUA_ȡ����ֵ(string.format([[
			local skillID = DataPool:GetKfsSkill(index - 1)
			return skillID
	]],index))
	return tonumber(tem)
end

function ����_��꼼��ѧϰ()
	
	if ����_ȡ������꼼��ID(1) ==-1 then
		������ʾ("�㻹û�м���11111")
		��ʱ(2000)
	end
	local ����������� = ����_ȡ���������Ϣ(1)   
	local �������ȼ� = tonumber(����_ȡ���������Ϣ(3))
	local �������ϳɵȼ� = tonumber(����_ȡ���������Ϣ(2) )
	local ������������� =����_ȡ���������Ϣ(5)   
	local �������������Ϣ=����_ȡ���������Ϣ(8)   
	������ʾ("�㵱ǰ���������[%s]�ȼ�[%d]�ϳɵȼ�[%d]�������[%d]�������������Ϣ[%s]",�����������,�������ȼ�,�������ϳɵȼ�,�������������,�������������Ϣ)
	��ʱ(2000)
	����_ȡ���������(1)
	��ʱ(2000)
	local ������� =����_ȡ�������׼ȷ��Ϣ���(�����������,�������ȼ�,�������ϳɵȼ�,�������������,�������������Ϣ,2)
	
	������ʾ(�������)
	��ʱ(2000)
end

--����_��꼼��ѧϰ()
------�Ƿ��,�ϳɵȼ�,�������,����
--����_�����������(2,3,0,0)
����_�����������()
--����_�Զ��жϹ��򶾿����()
����_���ϳ����(7)
����_��������ȼ�()

-------------------------------------------------------------