function ����_�жϹرմ���(strWindowName)
      if �����Ƿ����(strWindowName)==1 then
	    LUA_Call(string.format([[
	        setmetatable(_G, {__index = %s_Env}) this:Hide()  
	  ]], strWindowName))  
	  end
end


function ����_�����̻Ṻ����Ʒ(����,����, ����, ��ߵ���,ID)   --ָ���̻�ID
	if not ID then
		ID =789
	end	
     ȡ����Ʒ("���",200000)  
     ��Ļ��ʾ("�����̻Ṻ����Ʒ:"..����)
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
	--������Ʒ
    
     ��ʱ (2000)
	if ����== 2 then
			LUA_Call(string.format([[	
         PlayerShop:PacketSend_Search(2,2, 1, "%s", 1)		
	]], ����))
	elseif  ���� == 1 then
							LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(1,1, 1, "%s", 1)	
			]], ����))
	elseif ���� == 3  then
				LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(3 , 10101, 1, "%s", 1)	
			]], ����))	
	
	elseif ���� == 4  then
				LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(4 , 10101, 1, "%s", 1)	
			]], ����))	
	elseif ���� == 5  then
				LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(5 , 10101, 1, "%s", 1)	
			]], ����))	
	
	end

	
	
	��ʱ(1500)
	--������һҳ��û�з�����������Ʒ
	local tem = LUA_ȡ����ֵ(string.format([[
			ID =%d
	        setmetatable(_G, {__index = PS_ShopSearch_Env})
			for i = 1 ,10 do 
				local theAction = EnumAction( i - 1 , "playershop_cur_page")
				if theAction:GetID() ~= 0 then
					--��Ʒ��,������,�����̵�ID,����,��ߵ���
					local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
					if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
						if pShopID ==ID then
							if pName == "%s" and pCount <= %d and pYB/pCount <= %d then
							   PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
									--��������,ֱ�ӷ���
									PlayerShop:SearchPageBuyItem(i - 1, "item")
							   return true
							end
						end
					end
				end
			end
            return false
	]], ID,����, ����, ��ߵ���), "b")
    ��ʱ (2000)
    ����_�жϹرմ���("PS_ShopSearch")
	����_�жϹرմ���("PS_ShopList")
	����_�жϹرմ���("Quest")	
	return tem
end


function ����_����ID�����̻Ṻ����Ʒ(����,����,����,��ߵ���,����ID)
	
     ȡ����Ʒ("���",200000)  
     ��Ļ��ʾ("�����̻Ṻ����Ʒ:"..����)
	if �����Ƿ����("PS_ShopSearch")==0  then
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
	--������Ʒ
     ��ʱ (2000)
	end
	if �����Ƿ����("PS_ShopSearch")==1  then
	if ����== 2 then
			LUA_Call(string.format([[	
         PlayerShop:PacketSend_Search(2,2, 1, "%s", 1)		
	]], ����))
	elseif  ���� == 1 then
							LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(1,1, 1, "%s", 1)	
			]], ����))
	elseif ���� == 3  then
				LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(3 , 10101, 1, "%s", 1)	
			]], ����))	
	
	elseif ���� == 4  then
				LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(4 , 10101, 1, "%s", 1)	
			]], ����))	
	elseif ���� == 5  then
				LUA_Call(string.format([[	
			PlayerShop:PacketSend_Search(5 , 10101, 1, "%s", 1)	
			]], ����))	
	
	end
	
	��ʱ(1500)
	--������һҳ��û�з�����������Ʒ
	local tem = LUA_ȡ����ֵ(string.format([[
	        setmetatable(_G, {__index = PS_ShopSearch_Env})
			for i = 1 ,10 do 
				local theAction = EnumAction( i - 1 , "playershop_cur_page")
				if theAction:GetID() ~= 0 then
					--��Ʒ��,������,�����̵�ID,����,��ߵ���
					local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
					if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
					    if pName == "%s" and pCount <= %d and pYB/pCount <= %d and  pShopID~= %d then
						   PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
								--��������,ֱ�ӷ���
								PlayerShop:SearchPageBuyItem(i - 1, "item")
						   return true
						end
					end
				end
			end
            return false
	]], ����, ����, ��ߵ���,����ID), "b")
		��ʱ (1000)
	end
end

function ����_�����Լҵ���()
	ȡ����Ʒ("���")
	����_�����̻Ṻ����Ʒ(2,"���������", 1, 400*10000,243) 
end

function ����_�һ�����Ԫ��(index)
	if not index then
		index = 0 
	end
	local ��ǰԪ������=tonumber(��ȡ������Ϣ(46))
	if ��ǰԪ������>index then
		��ͼѰ·("Ǯׯ",65,40)
		LUA_Call(string.format('Player:YuanBaoToTicket(tonumber(%d))',��ǰԪ������))
	end
end

--����_�һ�����Ԫ��(200)   --����200���һ�
--����_�����Լҵ���()
--����_���ܾ����̻Ṻ����Ʒ(����,����, ����, ��ߵ���,����ID)
--����_�����̻Ṻ����Ʒ(4,"����", 1,40*10000,1)   --��Ů
--����_�����̻Ṻ����Ʒ(2,"������", 200, 8,1)		--��Ʒ
--����_�����̻Ṻ����Ʒ(3,"����߲�¹", 1,40*10000,1)  --װ��



for i =1 , 99 do
	--����_���ܾ����̻Ṻ����Ʒ(2,"�ƾ�ʯ(1��)", 1, 20000,243)   --����,����, ����, ��ߵ���,�����Լ��ҵĵ�ID
	����_����ID�����̻Ṻ����Ʒ(2,"�߼�Ѫ��������", 1, 40000,243)  
end