--1.�ж�����������ԣ�����ֵ��2000
--2������˳����ţ�Ͷ�ף��Ľ�������������1��10��
--3�����ľ���1��10��������ֵ��1500�������ţ�Ͷ�ף��Ľ�������˳����30��ӡ������5�ס�
--4�������ľ���������1��10����Ҫ��Լ100���ӣ���1��10������5�״�Լ��Ҫ600����
--5���뿴��4������ѡ���Ƿ�ʹ�ý�ң�0����1��
--6���ؼ�����û�е��ؼ��������е�4���ؼ����޸ģ����ֻ��4��


--��������������ѡ������Ҫ����1����Ҫ�������跽��2��������2�����--�ķ���ȥ����������һ�ļ��Ϸ��ż���
--������1���������ԣ����š�Ͷ�ס��Ľ�������
�Ƿ�ʹ�ý�� = 1
��Ʒ���� = {
	["��"] = {{xjName = "���š���", CyName  ="���š�����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס�����ӡ"}, {xjName = "�Ľ�����", CyName  = "�Ľ�������ӡ"}, {xjName = "��������", CyName  = "����������ӡ"}}, 
	["��"] = {{xjName = "���š���", CyName  ="���š����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס����ӡ"}, {xjName = "�Ľ�����", CyName  = "�Ľ������ӡ"}, {xjName = "��������", CyName  = "���������ӡ"}}, 
	["��"] = {{xjName = "���š���", CyName  ="���š�����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס�����ӡ"}, {xjName = "�Ľ�����", CyName  = "�Ľ�������ӡ"}, {xjName = "��������", CyName  = "����������ӡ"}}, 
	["��"] = {{xjName = "���š���", CyName  ="���š�����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס�����ӡ"}, {xjName = "�Ľ�����", CyName  = "�Ľ�������ӡ"}, {xjName = "��������", CyName  = "����������ӡ"}}, 
}	
�ؼ����� = {{mjName = "Ͷ������"},{mjName = "����ǧ��"},{mjName = "�����м�"},{mjName = "�������"}}
��Ʒ��ӡ = "���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|����������ӡ|���š����ӡ|Ͷ�ס����ӡ|�Ľ������ӡ|���������ӡ|���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|����������ӡ|���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|����������ӡ"


--������2������Ѫ�����š�Ͷ�ס��������˻�
--�Ƿ�ʹ�ý�� = 1
--��Ʒ���� = {
--	["��"] = {{xjName = "���š���", CyName  ="���š�����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס�����ӡ"}, {xjName = "��������", CyName  = "����������ӡ"},{xjName = "�˻�", CyName  = "�˻��ӡ"}}, 
--	["��"] = {{xjName = "���š���", CyName  ="���š����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס����ӡ"}, {xjName = "��������", CyName  = "���������ӡ"},{xjName = "�˻�", CyName  = "�˻��ӡ"}}, 
--	["��"] = {{xjName = "���š���", CyName  ="���š�����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס�����ӡ"}, {xjName = "��������", CyName  = "����������ӡ"},{xjName = "�˻�", CyName  = "�˻��ӡ"}}, 
--	["��"] = {{xjName = "���š���", CyName  ="���š�����ӡ"}, {xjName = "Ͷ�ס���", CyName  ="Ͷ�ס�����ӡ"}, {xjName = "��������", CyName  = "����������ӡ"},{xjName = "�˻�", CyName  = "�˻��ӡ"}}, 
--}	
--�ؼ����� = {{mjName = "Ͷ������"},{mjName = "����ǧ��"},{mjName = "�����м�"},{mjName = "�������"}}
--��Ʒ��ӡ = "���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|����������ӡ|���š����ӡ|Ͷ�ס����ӡ|�Ľ������ӡ|���������ӡ|���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|����������ӡ|���š�����ӡ|Ͷ�ס�����ӡ|�Ľ�������ӡ|����������ӡ"



-----------------------------------------��Ҫ����������---------------------------------------
-----------------------------------------��Ҫ����������---------------------------------------

function �رմ���(strWindowName)
	if �����Ƿ����(strWindowName)==1 then
	  LUA_Call(string.format([[
		setmetatable(_G, {__index = %s_Env}) this:Hide()  
	 ]], strWindowName))  
	end
end

function ������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		DebugListBox_ListBox:AddInfo("#eaf0c14#Y".."��QQ3707181��ʾ����%s")
	]], strCode))
end

--======================================================================
-- ͨ�ú���
--======================================================================


function ShanHaiBi()  
	return tonumber(LUA_ȡ����ֵ("return Player:GetData('SHANHAIBI')"))
end

function GetChipCount(strName)
	return tonumber(LUA_ȡ����ֵ(string.format([[
		for i = 1, 98 do
			local nXingJuanID = DataPool:LuaFnGetXingJuanID(i - 1)
			if nXingJuanID > 0 then
				local nName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
				if nName == "%s" then
					PushDebugMessage(nName.. "��ӡ")
					return DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ChipCount")
				end
			end
		end
	]],strName)))
end

function ��ȡ��������ʣ�����()
	local LimitCount = {}
	local tem = LUA_ȡ����ֵ([[
		local LimitCount = {}
		local limit1, limit2, limit3, _, _, _, _, _, _ = Player:GetData("SHShopLimit")
		local LimitNum, Limit = {120, 40, 8},{limit1, limit2, limit3}
		for i = 1,3 do 
			LimitCount[i] = LimitNum[i] - Limit[i]
		end
		return LimitCount[1] .. "|" .. LimitCount[2] .. "|" .. LimitCount[3]
	]])
	for w in string.gmatch(tem, "([^'|']+)") do        
		table.insert(LimitCount, w)
	end	
	return tonumber(LimitCount[1]),tonumber(LimitCount[2]),tonumber(LimitCount[3])
end

function ����ʹ����Ʒ(AAA)
	local t={}
	for w in string.gmatch(AAA,"([^'|']+)") do        
		table.insert(t,w)
	end
	for k,v in ipairs(t) do
		--ȡ����Ʒ(v)
		ִ�й���("�Զ����")
		--[[for i =1, 99 do
			if ��ȡ������Ʒ����(v) <=0 then
				break
			end
			������ʾ("ʹ����Ʒ:"..k..":"..v) 
			�Ҽ�ʹ����Ʒ(v);��ʱ(300)
			�Զ����();
		end]]
	end
end

function һ��ж���������ľ�()
	for i = 1, 4 do 
		LUA_Call(string.format([[
			local i = %d
			local nXingJuanID = DataPool:LuaFnGetActivedXingJuanID(i)
			if nXingJuanID ~= 0 then		
				local nName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
				PushDebugMessage("�㼴��ж���ľ�[ " .. nName .. " ]")
				Clear_XSCRIPT()
					Set_XSCRIPT_Function_Name("InsertSlot")
					Set_XSCRIPT_ScriptID(888555)
					Set_XSCRIPT_Parameter(0, nXingJuanID)	
					Set_XSCRIPT_Parameter(1, 0)	
					Set_XSCRIPT_Parameter(2, 0)
					Set_XSCRIPT_ParamCount(3)
				Send_XSCRIPT()
			else
				PushDebugMessage("�����׵�[ " .. i .. " ]��λû��װ���ľ�")
			end
		]], i))
		��ʱ(1000) 
	end 
end

function ��ȡ��װ���ľ���Ϣ(i, Val) -- i��ʾ��λ,ValΪ"Name","Level","Order"
	local tmp = {}
	local tem = LUA_ȡ����ֵ(string.format([[
		local i = %d
		local nXingJuanID = DataPool:LuaFnGetActivedXingJuanID(i) 			
		local nName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
		local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
		local nOrder = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Order")
		return nName .. "|" .. nLevel .. "|" .. nOrder
	]],i))
	for w in string.gmatch(tem, "([^'|']+)") do        
		table.insert(tmp, w)
	end
	if Val == "Name" then
		return tmp[1]
	elseif Val == "Level" then
		return tonumber(tmp[2])
	elseif Val == "Order" then
		return tonumber(tmp[3])
	end
end

function ȡ�������ľ���װ��ID()
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

function ȡ�������ؼ���װ��ID()
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
	return tonumber(tem)	
end

function װ��������(name, pos)
	LUA_Call(string.format([[
		local SetName = "%s"
		local SetSlot = %d
		local xuhao = -1
		local nID = -1
		local nCount = DataPool:LuaFnGetXingJuanListCount()
		for i = 1, nCount - 1 do 
			local nXingJuanID = DataPool:LuaFnGetXingJuanID(i - 1)
			if nXingJuanID > 0 then
				local nName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
				if SetName == nName then
					xuhao = 1
					nID = nXingJuanID
				end
			end
		end
		local nCount = DataPool:LuaFnGetSkillCardListCount()
		for i = 1, nCount - 1 do 
			local nSkillCardID = DataPool:LuaFnGetSkillCardID(i - 1)	
			if nSkillCardID > 0 then
				local nName = DataPool:LuaFnGetSkillCardInfo(nSkillCardID, "Name")
				if SetName == nName then
					xuhao = 2
					nID = nSkillCardID
				end
			end
		end
		if nID ~= -1 and xuhao ~= -1 then
			Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name("InsertSlot")
				Set_XSCRIPT_ScriptID(888555)
				Set_XSCRIPT_Parameter(0, nID)	
				Set_XSCRIPT_Parameter(1, SetSlot)		--������
				Set_XSCRIPT_Parameter(2, xuhao - 1)		--��ʾ0�ľ� 1����
				Set_XSCRIPT_ParamCount(3)
			Send_XSCRIPT()
		else 
			if xuhao == 1 then
				PushDebugMessage("û���ľ�[ " .. SetName .. " ]�޷�װ����")
			elseif xuhao == 2 then
				PushDebugMessage("û���ؼ�[ " .. SetName .. " ]�޷�װ����")
			end
		end
	]],name, pos))
end


function �������״���(index)
	for  i = 1,5 do
		if �����Ƿ����("Rune_Stars") ==1 then
			if index == 1 then
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Env});Rune_Stars_SubFenYe_Switch(0)")
			elseif index == 2  then
				LUA_Call("setmetatable(_G, {__index = Rune_Stars_Env});Rune_Stars_SubFenYe_Switch(1)")
			
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

function ��ɽ����(��Ʒ����,����)
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
				else 
				  ��ʱ(1000)
				end
		end	
	end	
	LUA_ȡ����ֵ(string.format([[
		setmetatable(_G, {__index = NewDungeon_DaibiShop_Env});NewDungeon_DaibiShop_CloseClicked();
		]]))   --�رչ�ɽ
end	

function �����׿�λȡ�ľ���Ϣ(λ��,���)		
	local tem = LUA_ȡ����ֵ(string.format([[
				weizhi =%d
				xuhao =%d
				nXingJuanID = DataPool:LuaFnGetActivedXingJuanID(weizhi)	
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
				elseif xuhao == 3 then
					return	nXingJuanID
				end
				]], λ��,���))  
	return tem
end	

function �����׿�λȡ�ؼ���Ϣ(λ��,���)		
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
		return tem
end	

function �ľ�����(index)	
	local IDDD =tonumber(�����׿�λȡ�ľ���Ϣ(index,3))		
	if IDDD > 0 then
        LUA_ȡ����ֵ(string.format([[
			g_CurrentSelXingJuanID =%d
			Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name("XingJuanLevelUp")
				Set_XSCRIPT_ScriptID(888555)
				Set_XSCRIPT_Parameter(0, g_CurrentSelXingJuanID)
				Set_XSCRIPT_Parameter(1, 1)
				Set_XSCRIPT_ParamCount(2)
			 Send_XSCRIPT()
		]],IDDD))  
		��ʱ(500)
	end
end

function �ľ�ǿ��(index)	
	local IDDD =tonumber(�����׿�λȡ�ľ���Ϣ(index,3))		
	if IDDD > 0 then
		������ʾ("�ľ�ǿ��"..IDDD)
		for k = 1,10 do
			LUA_ȡ����ֵ(string.format([[
			    g_CurrentSelXingJuanID =%d
			    Clear_XSCRIPT()
				    Set_XSCRIPT_Function_Name("XingJuanLevelUp")
				    Set_XSCRIPT_ScriptID(888555)
				    Set_XSCRIPT_Parameter(0, g_CurrentSelXingJuanID)
				    Set_XSCRIPT_Parameter(1, 0)
				    Set_XSCRIPT_ParamCount(2)
			    Send_XSCRIPT()
			]],IDDD))  
			��ʱ(500)
		end 
		�ľ�����(index)
	end 
end

function �����ľ�()
	LUA_ȡ����ֵ(string.format([[
	for i =1,98 do
		local nXingJuanID = DataPool:LuaFnGetXingJuanID(i-1)
		local nUnLocked = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "UnLocked")
		local nLevel = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Level")
		local nSlot = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Slot")
		local nOrder = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Order")
		local nChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ChipCount")
		local nActiveNeedChipCount = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "ActiveNeedChipCount")
		local nQuality = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Quality")
		local strName = DataPool:LuaFnGetXingJuanInfo(nXingJuanID, "Name")
		if nUnLocked ==0 and nChipCount >= nActiveNeedChipCount then
			Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name("ActiveXingJuan")
				Set_XSCRIPT_ScriptID(888555)
				Set_XSCRIPT_Parameter(0, nXingJuanID)
				Set_XSCRIPT_ParamCount(1)
			Send_XSCRIPT()
		end	
	end	
			]]))  
end

function ������װ������(ID,����,���)
		LUA_Call(string.format([[
		
		nSkillCardID=%d
		gongneng =%d
		xuhao =%d
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("InsertSlot")
			Set_XSCRIPT_ScriptID(888555)
			Set_XSCRIPT_Parameter(0, nSkillCardID)	
			Set_XSCRIPT_Parameter(1, gongneng)				--����2  0ж�� 1װ�� 
			Set_XSCRIPT_Parameter(2, xuhao-1)				--����2  0�ľ� 1����
			Set_XSCRIPT_ParamCount(3)
		Send_XSCRIPT()
	]],ID,����,���))  
end

��������,����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
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
	
function ��Ʒ�����װ�װ()	
    �������״���(1)
    ������ʾ("����ȡ����������Թ���:"..���Թ���.."�������ľ���װ")
	for i = 1,4 do
		������ʾ("��ʼװ��"..��Ʒ����[���Թ���][i].xjName.."λ��"..i)
        װ��������(��Ʒ����[���Թ���][i].xjName, i)
		��ʱ(3000)
	end   
end

function ��װ�������װ��������()
    �������״���(1)
	for i = 1,4 do		
	    if ��ȡ��װ���ľ���Ϣ(i, "Name") ~= ��Ʒ����[���Թ���][i].xjName  then 
		    local ID = ȡ�������ľ���װ��ID()
			if ID > 0 then
				������ʾ("��ʼװ��[%d]λ��[%d]",ID,i)
				������װ������(ID,i,1)
				��ʱ(3000)
		    end
		end 
	end 
	
	�������״���(2)   
	for i =1, 4 do
		������ʾ("��ʼװ��"..�ؼ�����[i].mjName.."λ��"..i)
        װ��������(�ؼ�����[i].mjName, i)
		��ʱ(2000)
	end
end 

function �������������ǿ��()
    �������״���(1)
    if ShanHaiBi() < 1750 then
	    ������ʾ("��ֻ��"..ShanHaiBi().."����ֵ,����ǿ������������")
	    ��ʱ(2000)
	    ������ʾ("��ֻ��"..ShanHaiBi().."����ֵ,����ǿ������������")
	    ��ʱ(2000)
	    ������ʾ("��ֻ��"..ShanHaiBi().."����ֵ,����ǿ������������")
	    ��ʱ(2000)
	    return
    end 

    if ����ֵ(��ȡ������Ϣ(45)+��ȡ������Ϣ(52)) < 700*10000 then
		������ʾ("��Ҳ���ǿ�������׵�5��0��")
		return
	end 
	
	local Lpcs,Jpcs,Zpsc = ��ȡ��������ʣ�����()
	if ����ֵ(Jpcs) < 35 then
		������ʾ("�㱾��ʣ�µĹ���Ʒ�Ĵ�����������һ����������Ʒ������")
		return
	end
	
	--һ��ж���������ľ�()
	--��ʱ(2000)
	--��Ʒ�����װ�װ()
	--��ʱ(2000)
	--��װ�������װ��������()
    
	for i = 1,4 do
		�������״���(1)
		local Lpcs,Jpcs,Zpsc = ��ȡ��������ʣ�����()
		if  ����ֵ(Jpcs) < 35 then
			������ʾ("�㱾�ܹ���Ʒ�����Ѵ����ޣ�����������")
			break 
		end
		
	    if ��ȡ��װ���ľ���Ϣ(i, "Name") == ��Ʒ����[���Թ���][i].xjName  then 
		    --while ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))~= 5 and ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Level"))~= 0 do 
			while true do
			    if ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 5 and ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Level"))== 0 then 
					������ʾ("���"..��ȡ��װ���ľ���Ϣ(i, "Name").."�Ѿ�"..��ȡ��װ���ľ���Ϣ(i,"Order").."��"..��ȡ��װ���ľ���Ϣ(i,"Level").."��")
					break
				end
			    if ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 0 then 
					local  mun = GetChipCount(��Ʒ����[���Թ���][i].xjName)
					������ʾ("����"..��Ʒ����[���Թ���][i].CyName..mun.."��")
				    ��ʱ(1000)
				    ��ɽ����(��Ʒ����[���Թ���][i].CyName,35- mun)--0
					��ʱ(1000)
				    ����ʹ����Ʒ(��Ʒ��ӡ)
					��ʱ(1000)
					for kkk = 1, 5 do 
						�ľ�ǿ��(i)
					end
				elseif ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 1 then 
				    local  mun = GetChipCount(��Ʒ����[���Թ���][i].xjName)
					������ʾ("����"..��Ʒ����[���Թ���][i].CyName..mun.."��")
				    ��ʱ(1000)
				    ��ɽ����(��Ʒ����[���Թ���][i].CyName,30- mun)--1
					��ʱ(1000)
				    ����ʹ����Ʒ(��Ʒ��ӡ)
					��ʱ(1000)
					for kkk = 1, 5 do 
						�ľ�ǿ��(i)
					end
				elseif 	����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 2 then 
				    local  mun = GetChipCount(��Ʒ����[���Թ���][i].xjName)
					������ʾ("����"..��Ʒ����[���Թ���][i].CyName..mun.."��")
				    ��ɽ����(��Ʒ����[���Թ���][i].CyName,35- mun)--2
					��ʱ(1000)
				    ����ʹ����Ʒ(��Ʒ��ӡ)
					��ʱ(1000)
					for kkk = 1, 5 do 
						�ľ�ǿ��(i)
					end
				elseif 	����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 3 then 
				    local  mun = GetChipCount(��Ʒ����[���Թ���][i].xjName)
					������ʾ("����"..��Ʒ����[���Թ���][i].CyName..mun.."��")
				    ��ʱ(1000)
				    ��ɽ����(��Ʒ����[���Թ���][i].CyName,17- mun)--3
					��ʱ(1000)
				    ����ʹ����Ʒ(��Ʒ��ӡ)
					��ʱ(1000)
					for kkk = 1, 5 do 
						�ľ�ǿ��(i)
					end
				elseif ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 4 then 
				    local  mun = GetChipCount(��Ʒ����[���Թ���][i].xjName)
					������ʾ("����"..��Ʒ����[���Թ���][i].CyName..mun.."��")
				    ��ʱ(1000)
				    ��ɽ����(��Ʒ����[���Թ���][i].CyName,9- mun)--4
					��ʱ(1000)
				    ����ʹ����Ʒ(��Ʒ��ӡ)
					��ʱ(1000)
					for kkk = 1, 5 do 
						�ľ�ǿ��(i)
					end
				end 
			end
		end 
	end  
end

function ��������ǿ��������()
    if ShanHaiBi() < 2000 then
	    ������ʾ("��ֻ��"..ShanHaiBi().."����ֵ,������������������")
	    ��ʱ(2000)
	    ������ʾ("��ֻ��"..ShanHaiBi().."����ֵ,������������������")
	    ��ʱ(2000)
	    ������ʾ("��ֻ��"..ShanHaiBi().."����ֵ,������������������")
	    ��ʱ(2000)
	    return
    end 
	
	if ����ֵ(��ȡ������Ϣ(45)+��ȡ������Ϣ(52)) <100*10000 then
		������ʾ("��Ҳ��㹺�����������׵�1��10��")
		return
	end 
	
	local Lpcs,Jpcs,Zpsc = ��ȡ��������ʣ�����()
	if ����ֵ(Jpcs) < 40 then
		������ʾ("�㱾��ʣ�µĹ���Ʒ�Ĵ�����������һ����������Ʒ������")
		return
	end
		
	һ��ж���������ľ�()
	��ʱ(2000)
	��Ʒ�����װ�װ()
	��ʱ(2000)

	for i = 1,4 do		
	    if ��ȡ��װ���ľ���Ϣ(i, "Name") ~= ��Ʒ����[���Թ���][i].xjName  then 
			local Lpcs,Jpcs,Zpsc = ��ȡ��������ʣ�����()
			if  ����ֵ(Jpcs) < 40 then
			    ������ʾ("�㱾�ܹ���Ʒ�����Ѵ����ޣ�����������")
				break 
			end 
			    ��ʱ(1000)
		        ������ʾ("û��"..��Ʒ����[���Թ���][i].xjName.."�ľ������ھ�ȥ����")
		        ��ɽ����(��Ʒ����[���Թ���][i].CyName,40)
		        ��ʱ(1000)
	            ����ʹ����Ʒ(��Ʒ��ӡ)
		        ��ʱ(1000)
		        �����ľ�()
		        ��ʱ(1000)
			    װ��������(��Ʒ����[���Թ���][i].xjName, i)
			    ��ʱ(1000)
			--while ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))~= 1 and ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Level"))~= 10 do 
			--while true do 
		        for tt = 1,5  do
					if ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 1 and ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Level"))== 10 then
						break  
					end 
					if ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Order"))== 2 and ����ֵ(��ȡ��װ���ľ���Ϣ(i,"Level"))== 0 then
						break  
					end
		            �ľ�ǿ��(i)
				end 
			--end 
		end 
	end 
	��ʱ(1000)
	��װ�������װ��������()
end

if �Ƿ�ʹ�ý�� == �� then
	������ʾ("��ѡ���˲�ʹ�ý�����������ף����ڴ�ֽ��")
	����Ʒ("���")
elseif �Ƿ�ʹ�ý�� == �� then
	������ʾ("��ѡ����ʹ�ý�����������ף�����ȡ�����")
	ȡ����Ʒ("���")
end 


��������ǿ��������()
�������������ǿ��()
�رմ���("Rune_Stars")



