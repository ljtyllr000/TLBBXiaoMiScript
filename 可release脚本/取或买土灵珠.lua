function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end



function BuyTLZByHongLi()
    local start = 0
	local needBuyCount = 1
    while start < needBuyCount do
        LUA_Call([[setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();]])  -- ��YB�̵�
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);]])  -- �е������̵�
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);]])  -- �е������̳�
        ��ʱ(500)
		LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(2);]])  -- �е������챦
        ��ʱ(500)
		LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();]]) -- ��һҳ
		��ʱ(500)

        local queRenGouMaiStatus = LUA_ȡ����ֵ([[return NpcShop:GetBuyDirectly()]])
        local clicked = false
        if tonumber(queRenGouMaiStatus) == 0 then
            -- 0��ʾ��ѡ����ȷ�ϣ��ᵯ��ȷ�Ͽ�����Ҫȡ����ѡ
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
            clicked = true
        end

        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);]])  -- ����������
        ��ʱ(500)
        if clicked then
            -- ����ȷ�ϰ�ť�ָ�ԭ״
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
        end
        start = start + 1
    end
	
	LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();]])

end


function BuyTLZByBindYB()
    local start = 0
	local needBuyCount = 1
    while start < needBuyCount do
        LUA_Call([[setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();]])  -- ��YB�̵�
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);]])  -- �е���Ԫ��
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);]])  -- �е������̳�
        ��ʱ(500)
		LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(2);]]) -- �е������챦
		��ʱ(500)
		LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();]]) -- ��һҳ
		��ʱ(500)

        local queRenGouMaiStatus = LUA_ȡ����ֵ([[return NpcShop:GetBuyDirectly()]])
        local clicked = false
        if tonumber(queRenGouMaiStatus) == 0 then
            -- 0��ʾ��ѡ����ȷ�ϣ��ᵯ��ȷ�Ͽ�����Ҫȡ����ѡ
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
            clicked = true
        end

        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);]])  -- ����������
        ��ʱ(500)
        if clicked then
            -- ����ȷ�ϰ�ť�ָ�ԭ״
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
        end
        start = start + 1
    end
	
	LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();]])

end



function BuyTLZByZhanGong()
    -- ��ȡս��, ��������������
	local curCityName = ��ȡ������Ϣ(16)
   if curCityName  == "����" then
      ��ͼѰ·("����",322,264)
	  ��ʱ(1000)
      �Ի�NPC("������")
   elseif curCityName  == "����" then
      ��ͼѰ·("����",179,121)
	  ��ʱ(1000)
      �Ի�NPC("������")
   elseif curCityName  == "����" then
      ��ͼѰ·("����",237,236)
	  ��ʱ(1000)
      �Ի�NPC("������")
   elseif curCityName  == "¥��" then
      ��ͼѰ·("¥��",190,130)
	  ��ʱ(1000)
      �Ի�NPC("�����v")
   else
      ִ�й���("����س�")
	  ��ʱ(1000)
	  ��ͼѰ·("����",179,121)
	  ��ʱ(1000)
      �Ի�NPC("������")
   end
   
   ��ʱ(500)
   NPC�����Ի�("���뱾�����")
   �ȴ���ͼ���()
   
   
   local guildCityName = LUA_ȡ����ֵ([[return Guild:GetMyGuildDetailInfo("CityName")]])
   
   while true do
       local  curMap = ��ȡ������Ϣ(16)
	   if curMap == guildCityName then
	       break
	   end
	   ��ʱ(1000)
   
   end
   
   while true do
      ��ͼѰ·(guildCityName, 94, 55)
	  ��ʱ(500)
	  local myX = ��ȡ������Ϣ(7)
	  local myY = ��ȡ������Ϣ(8)
	  if tonumber(myX) == 94 and tonumber(myY) == 55 then
	      break
	  end
   
   end
   
   
   ��ʱ(2000)

   ִ�й���("��ȡս��")
   ��ʱ(500)
   
   �Ի�NPC("����ѫ")
   ��ʱ(500)
   NPC�����Ի�("ս���̵�")
   ��ʱ(500)
   
   LUA_Call([[setmetatable(_G, {__index = JueweiShop_Env});JueweiShop_MultiBuyItem();]]) -- ��������
   ��ʱ(500)
   LUA_Call([[setmetatable(_G, {__index = JueweiShop_Env});JueweiShop_BuyItem(8);]])  -- ������
   ��ʱ(500)
   LUA_Call([[setmetatable(_G, {__index = NEWShop_MBuy_Env});NEWShop_MBuy_MaxButtonDwon()]])  -- ���
   ��ʱ(500)
   LUA_Call([[setmetatable(_G, {__index = NEWShop_MBuy_Env});NEWShop_MBuy_BuyMulti_Clicked();]])  -- ȷ�Ϲ���
   

end




function main()
    MentalTip("����: ȡ��������������, ȷ����������1��������")
    
    local backpackTLZCount = tonumber(��ȡ������Ʒ����("������"))
	-- �ֿ���ȡ��������
	if backpackTLZCount < 1 then
	    MentalTip("���ҡ��ֿ���ȡ��������")
	    ȡ����Ʒ("������", 1 - backpackTLZCount) 
	else
	    MentalTip("��������1��������")
	    return
	end
	
	
	-- ��������ս����
	backpackTLZCount = tonumber(��ȡ������Ʒ����("������"))
	if backpackTLZCount < 1 then 
	    MentalTip("ʹ��ս�����������飬�����������")
	    BuyTLZByZhanGong()
	else
	    MentalTip("��������1��������")
	    return
	end
	
	-- �������ð�Ԫ����
	backpackTLZCount = tonumber(��ȡ������Ʒ����("������"))
	if backpackTLZCount < 1 then 
	   MentalTip("ս������������ʧ��, ʹ�ð�Ԫ������1��")
	   BuyTLZByBindYB()
   else
        MentalTip("��������1��������")
	    return
	end
	
	-- �������ú�����
	backpackTLZCount = tonumber(��ȡ������Ʒ����("������"))
	if backpackTLZCount < 1 then 
	   MentalTip("��Ԫ������������ʧ��, ʹ�ú�������1��")
	   BuyTLZByHongLi()
    else
	    MentalTip("��������1��������")
	    return
	end

end


-- ִ�нű�
main()