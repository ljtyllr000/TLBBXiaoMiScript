

function ����_�жϹرմ���(strWindowName)
	if �����Ƿ����(strWindowName)==1 then
		LUA_Call(string.format([[
			setmetatable(_G, {__index = %s_Env}) this:Hide()  
		]], strWindowName))  
		��ʱ(1500)
	  end
end
function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ103900393��ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end



function ����_ȡ��������(����)  --1��������� 2������
	local ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
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
		����_������ʾ("����ȡ����������Թ���:"..���Թ���)
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
	return ���Թ���
end


function ����_ȡ����ֵ(index)
		LUA_Call ("MainMenuBar_SelfEquip_Clicked();");��ʱ(1500) -- ��������
	local tem=  LUA_ȡ����ֵ(string.format([[ 
			index=%d
			local iIceDefine  		= Player:GetData( "DEFENCECOLD" );
			local iFireDefine 		= Player:GetData( "DEFENCEFIRE" );
			local iThunderDefine	= Player:GetData( "DEFENCELIGHT" );
			local iPoisonDefine		= Player:GetData( "DEFENCEPOISON" );
			
			--����ʾ������ add by hukai#48117
			if (iIceDefine~=nil and iIceDefine < 0 ) then
				iIceDefine = 0
			end
			if (iFireDefine~=nil and iFireDefine < 0 ) then
				iFireDefine = 0
			end
			if (iThunderDefine~=nil and iThunderDefine < 0 ) then
				iThunderDefine = 0
			end
			if (iPoisonDefine~=nil and iPoisonDefine < 0 ) then
				iPoisonDefine = 0
			end	
			
			if index==1 then
				return iIceDefine
			elseif index==2 then
				return iFireDefine
			elseif index==3 then
				return iThunderDefine
			elseif index==4 then
				return iPoisonDefine
			end
			return -1
		]], index))
	if tem then 	
	return tonumber(tem)	
	end
	return  0
end	




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
				local txt=Item_MultiUse_ItemInfo_Text:GetText()
				if txt~="" and string.find("%s",txt,1,true) then
					PushDebugMessage("��������ʹ����Ʒ:"..txt)
					Item_MultiUse_BuyMulti_Clicked()
				end
			]],��Ʒ�б�))
		end
	end
end




function ����_������ʹ��()
	����_ʹ����Ʒ("��ľ|��Ʒ��ӡ��¼|���顤���ӡ|��Ʒ����|��ʿ������Ʒ",2)
	for i =1, 99 do
		��Ļ��ʾ("������-Ͷ������")
		if ��ȡ������Ʒ����("Ͷ������") <= 0 then
			����_�жϹرմ���("GiveGift")
			break
		end
		��ͼѰ·("����",270,116)
		if �Ի�NPC("��ʿܽ������")==1 then
            NPC�����Ի�("���Ͷ������",0)
			��ʱ(1000)
		end		
	end
	
	for i =1, 99 do
		��Ļ��ʾ("������-�������ǽ")
		if ��ȡ������Ʒ����("����ǽ") <= 0 then
			����_�жϹرմ���("GiveGift")
			break
		end	
		if �����Ƿ����("GiveGift")== 1 then
			LUA_Call("setmetatable(_G, {__index = GiveGift_Env});GiveGift_GiveOneTime();")	
			��ʱ(1000)
		else
			��ͼѰ·("����",174,136)
			if �Ի�NPC("��ʿ����ͬ")==1 then
				NPC�����Ի�("�������ǽ",0)
				��ʱ(1000)
			end		
		end
	end
	----------------------------------------------
	for i =1, 99 do
		��Ļ��ʾ("������-�����˿��")
		if ��ȡ������Ʒ����("��˿��") <= 0 then
			����_�жϹرմ���("GiveGift")
			break
		end	
		if �����Ƿ����("GiveGift")== 1 then
			LUA_Call("setmetatable(_G, {__index = GiveGift_Env});GiveGift_GiveOneTime();")	
			��ʱ(1000)
		else
			��ͼѰ·("����",270,116)
			if �Ի�NPC("��ʿܽ������")==1 then
				NPC�����Ի�("�����˿��",0)
				��ʱ(1000)
			end		
		end
	end
	--------------------------------
	for i =1, 99 do
		��Ļ��ʾ("������-��������")
		if ��ȡ������Ʒ����("�����") <= 0 then
			����_�жϹرմ���("GiveGift")
			break
		end	
		if �����Ƿ����("GiveGift")== 1 then
			LUA_Call("setmetatable(_G, {__index = GiveGift_Env});GiveGift_GiveOneTime();")	
			��ʱ(1000)
		else
			��ͼѰ·("����",270,116)
			if �Ի�NPC("��ʿܽ������")==1 then
				NPC�����Ի�("��������",0)
				��ʱ(1000)
			end		
		end
	end
end	
----------------------------------------------------------------------------------------------

function ����_�������״���(index)
	for  i = 1,5 do
		if �����Ƿ����("Rune_Stars") ==1 then
			if index == 1 then
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Env});Rune_Stars_SubFenYe_Switch(0)")
			elseif index == 2  then
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Env});Rune_Stars_SubFenYe_Switch(1)")
			elseif index == 3 then
				����_������ʾ("���ľ�ǿ��")
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Env});Rune_Stars_FenYe_Switch(2)")
				��ʱ(1000)
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Reel_Env});Rune_Stars_Reel_SubFenYe_Switch(1)")
				��ʱ(1000)
			elseif index == 4 then
				����_������ʾ("���ľ�����")
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Env});Rune_Stars_FenYe_Switch(2)")
				��ʱ(1000)
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Reel_Env});Rune_Stars_Reel_SubFenYe_Switch(2)")
				��ʱ(1000)	
			end
			break
		else
			LUA_ȡ����ֵ(string.format([[
			setmetatable(_G, {__index = PlayerQuicklyEnter_Env});
			PlayerQuicklyEnter_Clicked(65)
			]])) ;��ʱ(2000)	
		end
	end
end



function ����_ȡ�Ϻ���()
	local tem = LUA_ȡ����ֵ(string.format([[
	local haveTokens = Player:GetData("SHANHAIBI")
	return  haveTokens 
	]])) 
	return tonumber(tem)
end

��Ļ��ʾ("�㵱ǰ�Ĺ�ɽ��:"..����_ȡ�Ϻ���())
��ʱ(2000)
function ����_ȡ�������ľ���Ϣ(name,xuhao)
	local tem = LUA_ȡ����ֵ(string.format([[
	TTname ="%s"
	xuhao =%d
	for idx =1,98 do
		local nXingJuanID = DataPool:LuaFnGetXingJuanID(idx - 1)	
		local strName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
		if strName==TTname then
			if xuhao == 1 then
				return nXingJuanID
			elseif xuhao == 2 then
				return strName
			elseif xuhao == 3 then
				local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
				return	nUnLocked
			elseif xuhao == 4 then
				local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
				return	nLevel	
			elseif xuhao == 5 then	
				local nOrder = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Order")
				return	nOrder
			end			
		end
	end	
	return -1
	]],name,xuhao)) 
	return tonumber(tem)
end

function ����_װ���������ľ�(name,index)
	����_�������״���(1)
	����_������ʾ("����װ��[%s]����[%d]",name,index)
	��ʱ(2000)
	LUA_ȡ����ֵ(string.format([[
	for idx =1,98 do
		local nXingJuanID = DataPool:LuaFnGetXingJuanID(idx - 1)	
		local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
		local strName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
		if nUnLocked == 1 and strName == "%s" then
			local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
			local nSlot = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Slot")
			if nSlot== 0 then
				PushDebugMessage(nXingJuanID)
				Clear_XSCRIPT()
					Set_XSCRIPT_Function_Name("InsertSlot")
					Set_XSCRIPT_ScriptID(888555)
					Set_XSCRIPT_Parameter(0, nXingJuanID)	
					Set_XSCRIPT_Parameter(1, %d)
					Set_XSCRIPT_Parameter(2, 0)			
					Set_XSCRIPT_ParamCount(3)
				Send_XSCRIPT()
			end
		end
	end
	]],name,index)) 
end


function ����_ȡ�������ľ���װ��ID()
	����_�������״���(1)
	local tem = LUA_ȡ����ֵ(string.format([[
	for idx =1,98 do
		local nXingJuanID = DataPool:LuaFnGetXingJuanID(idx - 1)	
		local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
		if nUnLocked == 1 then
			local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
			local nSlot = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Slot")
			if nSlot== 0 then
				return nXingJuanID
			end
		end
	end
	return -1
	]])) 
	return tonumber(tem)
end

function ����_ȡ�������ؼ���װ��ID()
	����_�������״���(2)
	local tem = LUA_ȡ����ֵ(string.format([[

	for idx =1,46 do
		local nSkillCardID = DataPool:LuaFnGetSkillCardID(idx - 1)	
		local nUnLocked = DataPool:LuaFnGetSkillCardInfo(nSkillCardID, "UnLocked")
		if nUnLocked == 1 then
			local nLevel = DataPool:LuaFnGetSkillCardInfo(nSkillCardID, "Level")
			local nSlot = DataPool:LuaFnGetSkillCardInfo(nSkillCardID, "Slot")
			if nSlot== 0 then
				return nSkillCardID
			end
		end
	end
	return -1
	]])) 
	����_�жϹرմ���("Rune_Stars")
	return tonumber(tem)	
end

function ����_������װ������(ID,����,���)
		LUA_Call(string.format([[
		nSkillCardID=%d
		gongneng =%d
		xuhao =%d
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("InsertSlot")
			Set_XSCRIPT_ScriptID(888555)
			Set_XSCRIPT_Parameter(0, nSkillCardID)	
			Set_XSCRIPT_Parameter(1, gongneng)				--����1  0ж�� 1װ�� 
			Set_XSCRIPT_Parameter(2, xuhao-1)				--����2  0�ľ� 1����
			Set_XSCRIPT_ParamCount(3)
		Send_XSCRIPT()
	]],ID,����,���))  
end

function ����_�����׿�λȡ�ľ���Ϣ(λ��,���)		
	����_�������״���(1)
	local tem = LUA_ȡ����ֵ(string.format([[
				weizhi =%d
				xuhao =%d
				nXingJuanID = DataPool:LuaFnGetActivedXingJuanID(weizhi)	
				--xj_to_slot = DataPool:LuaFnHaveXingJuanToSlot()
				theAction = EnumAction(nXingJuanID,"xingjuan")
				ID = theAction:GetID() 
				if ID> 0 then
					  name = theAction:GetName() 
						local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
					else
					  name = 0
				end
				if xuhao == 1 then
					return ID
				elseif xuhao == 2 then
					return name
				elseif xuhao == 3 then
					return	nXingJuanID
				elseif xuhao == 4 then
					return	nXingJuanID	
				end
				]], λ��,���))  
				����_�жϹرմ���("Rune_Stars")
	return tem
end	

function ����_�����׿�λȡ�ؼ���Ϣ(λ��,���)		
	����_�������״���(2)
	local tem = LUA_ȡ����ֵ(string.format([[
				weizhi =%d
				xuhao =%d
				nXingJuanID = DataPool:LuaFnGetActivedSkillCardID(weizhi)	
				--xj_to_slot = DataPool:LuaFnHaveXingJuanToSlot()
				theAction = EnumAction(nXingJuanID,"xingjuan")
				ID = theAction:GetID() 
				if ID> 0 then
					  name = theAction:GetName() 
					else
					  name = 0
				end
				if xuhao == 1 then
					return ID
				elseif xuhao == 2 then
					return name
				end
				]], λ��,���))  
		����_�жϹرմ���("Rune_Stars")
		return tem
end	



--��Ļ��ʾ(����_�����׿�λȡ�ľ���Ϣ(1,1)) --ȡλ��1��ID
--��Ļ��ʾ(����_ȡ�������ľ���װ��ID())		--ȡ����װ����ID
--��Ļ��ʾ(����_�����׿�λȡ�ؼ���Ϣ(1,1)) 
--��Ļ��ʾ(����_ȡ�������ؼ���װ��ID()) 





function ����_ȫ�Զ�װ��������()
	����_�������״���(2)
	
	for i =1, 4 do
		if tonumber( ����_�����׿�λȡ�ľ���Ϣ(i,1))	== 0 then
			local ID =����_ȡ�������ľ���װ��ID()
			if ID > 0 then
				����_������ʾ("��ʼװ��[%d]λ��[%d]",ID,i)
				����_������װ������(ID,i,1)
				��ʱ(3000)
			end
		end
	end
	��ʱ(3000)
	for i =1, 4 do
		if tonumber( ����_�����׿�λȡ�ؼ���Ϣ(i,1))	== 0 then
			local ID =����_ȡ�������ؼ���װ��ID()
			if ID > 0 then
				����_������ʾ("��ʼװ��[%d]λ��[%d]",ID,i)
				����_������װ������(ID,i,2)
				��ʱ(3000)
			end
		end
	end
	����_�жϹرմ���("Rune_Stars")
end

function ����_��ɽ����(��Ʒ����,����)	
	for  i = 1, 5 do
		if �����Ƿ����("NewDungeon_DaibiShop") == 1 then
			local tem =LUA_ȡ����ֵ(string.format([[
			TTname ="%s"
			TTnum = %d
			 for i=0,67 do
				local theAction = EnumAction(i, "boothitem")
				local ID = theAction:GetID() 
				if ID~= 0 then
					local  name =  theAction:GetName()
					if TTname == name then
							local nPrice = NpcShop:EnumItemPrice(i) --�۸�
							local haveTokens = Player:GetData("SHANHAIBI")
						 	local nMaxCanBuyByMoney = math.floor(haveTokens/nPrice)
							if TTnum>=nMaxCanBuyByMoney then
								local num =nMaxCanBuyByMoney
								else
								local  num = TTnum
							end
							NpcShop:BulkBuyItem(i, TTnum, 0)
							return 1
					end
				end
			end
			return -1 	
			]],��Ʒ����,����))  
			if tonumber(tem) == 1 then
				break
			end			
		else
				��ͼѰ·("����",210,53)
				if �Ի�NPC("����")==1 then
					NPC�����Ի�("��ɽ��"); ��ʱ(2000)
					LUA_ȡ����ֵ(string.format([[
			setmetatable(_G, {__index = NewDungeon_DaibiShop_Env});
			NewDungeon_DaibiShop_ChangeShowTab(1);
			]]))  ; ��ʱ(2000)
				if ����_ȡ�Ϻ���() < 50 then
					����_������ʾ("�Ϻ�������50")
					break
				end	
				else 
				  ��ʱ(1000)
				end
		end	
	end	
	LUA_ȡ����ֵ(string.format([[
		setmetatable(_G, {__index = NewDungeon_DaibiShop_Env});NewDungeon_DaibiShop_CloseClicked();
		]]))   --�رչ�ɽ
end	

function ����_�ľ�ǿ��(name)
	����_������ʾ("�ľ�ǿ��:"..name)
	LUA_ȡ����ֵ(string.format([[
	for idx =1,98 do
		local nXingJuanID = DataPool:LuaFnGetXingJuanID(idx - 1)	
		local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
		if   nUnLocked ==1 then
			local strName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
			if strName =="%s" then
				local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
				local nOrder = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Order")
				PushDebugMessage("��ǰ�ȼ�:"..nOrder.."��"..nLevel)
				if nLevel ==10 then

					Clear_XSCRIPT()
						Set_XSCRIPT_Function_Name("XingJuanLevelUp")
						Set_XSCRIPT_ScriptID(888555)
						Set_XSCRIPT_Parameter(0, nXingJuanID)
						Set_XSCRIPT_Parameter(1, 1)
						Set_XSCRIPT_ParamCount(2)
					Send_XSCRIPT()
					return
				else
					Clear_XSCRIPT()
						Set_XSCRIPT_Function_Name("XingJuanLevelUp")
						Set_XSCRIPT_ScriptID(888555)
						Set_XSCRIPT_Parameter(0, nXingJuanID)
						Set_XSCRIPT_Parameter(1, 0)
						Set_XSCRIPT_ParamCount(2)
					Send_XSCRIPT()
				end
			end
		end
	end	
	]],name))  
	����_�жϹرմ���("Rune_Stars")
	��ʱ(1000)
end

function ����_�����ľ�()
	����_�������״���(4)
	����_������ʾ("�������ľ�����")
	��ʱ(2000)
	for i =1,98 do
		local tem =	LUA_ȡ����ֵ(string.format([[
		local i=%d
		local nXingJuanID =-1
		nXingJuanID = DataPool:LuaFnGetXingJuanID(i-1)
		local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
		local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
		local nSlot = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Slot")
		local nOrder = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Order")
		local nChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ChipCount")
		local nActiveNeedChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ActiveNeedChipCount")
		local nQuality = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Quality")
		local strName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
		if nUnLocked ==0 and nChipCount >= nActiveNeedChipCount then
			return nXingJuanID
		end
		return -1	
			]],i))  	
		if  tonumber( tem ) >0 then
				LUA_ȡ����ֵ(string.format([[
						Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name("ActiveXingJuan")
				Set_XSCRIPT_ScriptID(888555)
				Set_XSCRIPT_Parameter(0, %d)
				Set_XSCRIPT_ParamCount(1)
				Send_XSCRIPT()
					]],tem))  
				��ʱ(2000)	
		end	
	end		
	����_�жϹرմ���("Rune_Stars")
end





function ����_ȡ�ľ���ӡ��������(name)
	local tem = LUA_ȡ����ֵ(string.format([[
	for i =1,98 do
		local nXingJuanID = DataPool:LuaFnGetXingJuanID(i-1)
		local strName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
		if  strName=="%s" then 
			local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
			local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
			local nSlot = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Slot")
			local nOrder = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Order")
			local nChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ChipCount")
			local nActiveNeedChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ActiveNeedChipCount")
			local nQuality = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Quality")
			if nActiveNeedChipCount>nChipCount then
				return	nActiveNeedChipCount-nChipCount
			end
		end			
	end	
	return -1
			]],name))  
			return tonumber(tem)
end


function ����_ȡ�ľ���ӡ����(name)
	local tem = LUA_ȡ����ֵ(string.format([[
	for i =1,98 do
		local nXingJuanID = DataPool:LuaFnGetXingJuanID(i-1)
		local strName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
		if  strName=="%s" then 
			local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
			local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
			local nSlot = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Slot")
			local nOrder = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Order")
			local nChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ChipCount")
			local nActiveNeedChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ActiveNeedChipCount")
			local nQuality = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Quality")
			return	nChipCount
		end			
	end	
	return 0
			]],name))  
			return tonumber(tem)
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
		����_������ʾ("����ȡ����������Թ���:"..���Թ���)
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
	return ���Թ���
end

if  ����_ȡ��������(1)=="��" then
	��ӡ ="���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|������ӡ|�����ӡ"
end
if  ����_ȡ��������(1)=="��" then
	��ӡ ="���š����ӡ|Ͷ�ס����ӡ|�Ľ������ӡ|������ӡ|�����ӡ"
end
if  ����_ȡ��������(1)=="��" then
	��ӡ ="���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|������ӡ|�����ӡ"
end
if  ����_ȡ��������(1)=="��" then
	��ӡ ="���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|������ӡ|�����ӡ"
end


function ����_�������ľ�(name)
	for i =1, 8 do
		if ����_ȡ�������ľ���Ϣ(name,3) ==1 then  --���ھ��� û�оͶһ�1 
			local �׼�= ����_ȡ�������ľ���Ϣ(name,5)
			if tonumber(�׼�)	>= 5 then
				��Ļ��ʾ("�׼�5����������")
				��ʱ(2000)
				return
			end	
			����_������ʾ("�������ľ�%s",name)
			for kkk = 1,20 do
				����_�ľ�ǿ��(name)
                ��ʱ(500)
			end
			if 	����_ȡ�������ľ���Ϣ(name,4)	==10 then 
				local �׼�= ����_ȡ�������ľ���Ϣ(name,5)
				if �׼�>=5 then
					break
				end	
				����_������ʾ("%s�׼�%d",name,�׼�)
				if �׼� == 0 then
					��Ҫ���� = 5
				elseif �׼� == 1 then
					��Ҫ���� = 6
				elseif �׼� == 2 then
					��Ҫ���� = 7
				elseif �׼� == 3 then
					��Ҫ���� = 8
				elseif �׼� == 4 then	
					��Ҫ���� = 9
				elseif �׼� == 5 then	
					��Ҫ���� = 10
				end
			local Ŀǰ���� =����_ȡ�ľ���ӡ����(name)
			��ʱ(1000)
			if Ŀǰ����>= ��Ҫ���� then
				����_�ľ�ǿ��(name)
			else
				��Ļ��ʾ(��Ҫ����-Ŀǰ����)
				����_��ɽ����(name.."��ӡ",��Ҫ����-Ŀǰ����)
				��ʱ(2000)
				����_ʹ����Ʒ(name.."��ӡ")
				end
			end
		else
			local �Ϻ��ȹ������ =math.floor(����_ȡ�Ϻ���()/50)
			local ����Ҫ����=  ����_ȡ�ľ���ӡ��������(name) 
			local ����Ҫ���� =math.min(�Ϻ��ȹ������,����Ҫ����)
			if ����Ҫ����>0 then 
				��ʱ(5000)
				����_��ɽ����(name.."��ӡ",����Ҫ����)
				����_ʹ����Ʒ(name.."��ӡ")
				��ʱ(2500)
			else 
				break
			end
		end
	end	
end

---------------------------------------------------------------------------------С2021��10��17��

ִ�й���("����������")
����_�������״���(1)
����_�����ľ�()
if tonumber(��ȡ������Ϣ(26))<90 then
if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)

����_�������ľ�("����")
��ʱ(2000)
����_�������ľ�("���š���")
��ʱ(2000)

for i=1,3 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)
����_װ���������ľ�("�˻�",3)
��ʱ(2000)
����_װ���������ľ�("���",4)
��ʱ(2000)
end
end


if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)

����_�������ľ�("����")
��ʱ(2000)
����_�������ľ�("���š���")
��ʱ(2000)

for i=1,3 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)
����_װ���������ľ�("�˻�",3)
��ʱ(2000)
����_װ���������ľ�("���",4)
��ʱ(2000)
end
end


if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)

����_�������ľ�("����")
��ʱ(2000)
����_�������ľ�("���š���")
��ʱ(2000)

for i=1,3 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)
����_װ���������ľ�("�˻�",3)
��ʱ(2000)
����_װ���������ľ�("���",4)
��ʱ(2000)
end
end


if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)

����_�������ľ�("����")
��ʱ(2000)
����_�������ľ�("���š���")
��ʱ(2000)

for i=1,3 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("����",1)
��ʱ(2000)
����_װ���������ľ�("���š���",2)
��ʱ(2000)
����_װ���������ľ�("�˻�",3)
��ʱ(2000)
����_װ���������ľ�("���",4)
��ʱ(2000)
end
end
end
---------------------------------------------------------------------------------��

if tonumber(��ȡ������Ϣ(26))>=90 then

if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)


����_�������ľ�("���š���")
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_�������ľ�("����")
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_�������ľ�("����")
��ʱ(2000)
end
����_�������ľ�("Ͷ�ס���")
��ʱ(2000)
����_�������ľ�("�Ľ�����")
��ʱ(2000)



for i=1,2 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)
����_װ���������ľ�("�˻�",2)
��ʱ(2000)
����_װ���������ľ�("���",2)
��ʱ(2000)
for i=1,10 do
����_�ľ�ǿ��("�˻�")
��ʱ(1000)
����_�ľ�ǿ��("���")
��ʱ(1000)
end
end
end


if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)


����_�������ľ�("���š���")
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_�������ľ�("����")
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_�������ľ�("����")
��ʱ(2000)
end
����_�������ľ�("Ͷ�ס���")
��ʱ(2000)
����_�������ľ�("�Ľ�����")
��ʱ(2000)


for i=1,2 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)
����_װ���������ľ�("�˻�",2)
��ʱ(2000)
����_װ���������ľ�("���",2)
��ʱ(2000)
for i=1,10 do
����_�ľ�ǿ��("�˻�")
��ʱ(1000)
����_�ľ�ǿ��("���")
��ʱ(1000)
end
end
end



if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)


����_�������ľ�("���š���")
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_�������ľ�("����")
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_�������ľ�("����")
��ʱ(2000)
end
����_�������ľ�("Ͷ�ס���")
��ʱ(2000)
����_�������ľ�("�Ľ�����")
��ʱ(2000)


for i=1,2 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)
����_װ���������ľ�("�˻�",2)
��ʱ(2000)
����_װ���������ľ�("���",2)
��ʱ(2000)
for i=1,10 do
����_�ľ�ǿ��("�˻�")
��ʱ(1000)
����_�ľ�ǿ��("���")
��ʱ(1000)
end
end
end


if  ����_ȡ��������(1)=="��" then
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)


����_�������ľ�("���š���")
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_�������ľ�("����")
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_�������ľ�("����")
��ʱ(2000)
end
����_�������ľ�("Ͷ�ס���")
��ʱ(2000)
����_�������ľ�("�Ľ�����")
��ʱ(2000)


for i=1,2 do
����_�����ľ�()
��ʱ(2000)
����_װ���������ľ�("���š���",1)
��ʱ(2000)
if tonumber(��ȡ������Ϣ(26))>=100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
elseif tonumber(��ȡ������Ϣ(26))<100 then
����_װ���������ľ�("����",2)
��ʱ(2000)
end
����_װ���������ľ�("Ͷ�ס���",3)
��ʱ(2000)
����_װ���������ľ�("�Ľ�����",4)
��ʱ(2000)
����_װ���������ľ�("�˻�",2)
��ʱ(2000)
����_װ���������ľ�("���",2)
��ʱ(2000)
for i=1,10 do
����_�ľ�ǿ��("�˻�")
��ʱ(1000)
����_�ľ�ǿ��("���")
��ʱ(1000)
end
end
end
end
--����_������ʹ��()



