function ����_�̻��ϼ�(nIndex,pirse)
	while true do
	LUA_Call(string.format([[
		setmetatable(_G, {__index = PS_ShopMag_Env})
		PS_ShopMag_Item%d:DoAction();
	]], nIndex))
	��ʱ(200)
	local tem=LUA_ȡ����ֵ(string.format([[
		setmetatable(_G, {__index = PS_ShopMag_Env})
		if PS_ShopMag_DownStall:GetText() == "�¼�" then
				for i =1,3 do
					PlayerShop:DownSale("item")
				end	
					return 1
		end
	]]))
	��ʱ(200)
	if tonumber(tem) ==1 then
		LUA_Call(string.format([[
		setmetatable(_G, {__index = PS_ShopMag_Env})
		PS_ShopMag_Item%d:DoAction();
	]], nIndex))
		��ʱ(200)
	end	
	LUA_Call(string.format([[
		setmetatable(_G, {__index = PS_ShopMag_Env})
		if PS_ShopMag_DownStall:GetText() == "�ϼ�" then
					PlayerShop:UpStall("item",%d)
		end
	]], pirse))
	end
end



function ����_�̻��ϼ���Ʒ(��Ʒ,����)
		��Ļ��ʾ(����)
	if �����Ƿ����("PS_ShopMag")==0 then
	 �ƴ�ѭ�� i=1,5 ִ��
             ��ͼѰ·("����",330,299)
             ��� �Ի�NPC("�Ǹ�ʢ")==1 ��
              ��ʱ (1000)
               NPC�����Ի�("����������̵�")
               ��ʱ (1000)
               ��� �����Ƿ����("PS_ShopList")==1 ��
                          		    LUA_Call(string.format([[
	        setmetatable(_G, {__index = PS_ShopList_Env});PS_ShopListAccept_Clicked("manage");
	  ]]))  
                            ��ʱ (1000)
                    ����ѭ��
               ����    
          ����
    ����
	��ʱ (5000)	
	end
	if �����Ƿ����("PS_ShopMag")==1 then
				 local tem =LUA_ȡ����ֵ(string.format([[
			
						setmetatable(_G, {__index = PS_ShopMag_Env})
					for i =1,20 do
					local actIndex = PlayerShop:UIIndexToLogicIndex(0, true)
					local theAction, bLocked = PlayerShop:EnumItem(actIndex, i-1, "self");
					local theID = theAction:GetID()
					local theName =theAction:GetName()
						if theID ~= 0 then
							if theName=="%s" then
								PushDebugMessage(theName)
								return i
							end
						end
				end
				return -1
			]] ,��Ʒ))	
			��ʱ(50)
			if tonumber(tem)>=1 then
				����_�̻��ϼ�(tem,����)
				 ��ʱ(500)
			end
	end
end



--����_�̻��ϼ���Ʒ("�ƾ�ʯ(1��)",5*10000)
����_�̻��ϼ���Ʒ("�߼�Ѫ��������",3*10000)
