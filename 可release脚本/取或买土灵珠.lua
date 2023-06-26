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
    -- ����򿪰����棬�л������ܻ�ȡ�����Ϣ
    LUA_Call([[setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnOpenGruidClick();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Hygl_Env});NewBangHui_Hygl_Bhxx_Clicked();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Bhxx_Env});NewBangHui_Bhxx_Tmxx_Clicked();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Tmxx_Env});NewBangHui_Tmxx_Closed();]])

    ����_������()

    local myGuildCityName = LUA_ȡ����ֵ([[
       local guildID, clanID = DataPool:GetGuildClanID()
       local myCityName = Guild:GetMyGuildDetailInfo("CityName")
       PushDebugMessage("myCityName: " .. myCityName)
       return myCityName
   ]])

    if tonumber(myGuildCityName) == -1 then
        MentalTip("�ű��������ʧ��, ʹ�ð�Ԫ������λ")
        return
    end

    local inBangHui = 0
    local curCityName = ��ȡ������Ϣ(16)
    if curCityName == "����" then
        ����_������()
        while true do
            ��ͼѰ·("����", 322, 264)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 322 and tonumber(myY) == 264 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("������")
    elseif curCityName == "����" then
        ����_������()
        while true do
            ��ͼѰ·("����", 179, 121)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 179 and tonumber(myY) == 121 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("������")
    elseif curCityName == "����" then
        ����_������()
        while true do
            ��ͼѰ·("����", 237, 236)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 237 and tonumber(myY) == 236 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("������")
    elseif curCityName == "¥��" then
        ����_������()
        while true do
            ��ͼѰ·("¥��", 190, 130)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 190 and tonumber(myY) == 130 then
                break
            end
        end
        ��ʱ(1000)
        �Ի�NPC("�����v")
    elseif curCityName == myGuildCityName then
        inBangHui = 1
        ����_������()
    else
        ִ�й���("����س�")
        ��ʱ(3000)
        ����_������()
        while true do
            ��ͼѰ·("����", 179, 121)
            ��ʱ(500)
            local myX = ��ȡ������Ϣ(7)
            local myY = ��ȡ������Ϣ(8)
            if tonumber(myX) == 179 and tonumber(myY) == 121 then
                break
            end
        end
        ��ʱ(3000)
        �Ի�NPC("������")
    end

    if inBangHui == 0 then
        ��ʱ(500)
        NPC�����Ի�("���뱾�����")
        �ȴ���ͼ���()
        ��ʱ(3000)
    end

    while true do
        local curMap = ��ȡ������Ϣ(16)
        if curMap == myGuildCityName then
            ��ʱ(2000)
            break
        end
        ��ʱ(1000)
    end

    while true do
        ��ͼѰ·(myGuildCityName, 94, 55)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == 94 and tonumber(myY) == 55 then
            break
        end

    end
    ��ʱ(2000)

    ִ�й���("��ȡս��")
    ��ʱ(2000)

    �Ի�NPC("����ѫ")
    ��ʱ(500)
    NPC�����Ի�("ս���̵�")
    ��ʱ(1000)

    LUA_Call([[setmetatable(_G, {__index = JueweiShop_Env});JueweiShop_MultiBuyItem();]]) -- ��������
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = JueweiShop_Env});JueweiShop_BuyItem(8);]])  -- ������
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NEWShop_MBuy_Env});NEWShop_MBuy_MaxButtonDwon()]])  -- ���
    ��ʱ(1000)
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

    ��ʱ(2000)
    -- ��������ս����
    backpackTLZCount = tonumber(��ȡ������Ʒ����("������"))
    if backpackTLZCount < 1 then
        MentalTip("ʹ��ս�����������飬�����������")
        BuyTLZByZhanGong()
    else
        MentalTip("��������1��������")
        return
    end

    ��ʱ(2000)
    -- �������ð�Ԫ����
    backpackTLZCount = tonumber(��ȡ������Ʒ����("������"))
    if backpackTLZCount < 1 then
        MentalTip("ս������������ʧ��, ʹ�ð�Ԫ������1��")
        BuyTLZByBindYB()
    else
        MentalTip("��������1��������")
        return
    end

    ��ʱ(2000)
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