function BackToBangHui()
    -- ����򿪰����棬�л������ܻ�ȡ�����Ϣ
    LUA_Call([[setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnOpenGruidClick();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Hygl_Env});NewBangHui_Hygl_Bhxx_Clicked();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Bhxx_Env});NewBangHui_Bhxx_Tmxx_Clicked();]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_Tmxx_Env});NewBangHui_Tmxx_Closed();]])

    ����_������()

    myGuildCityName = LUA_ȡ����ֵ([[
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
end

function GoToLingPaiNPC()
    while true do
        ��ͼѰ·(myGuildCityName, 111, 222)  -- TODO �޸�NPC����
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == 111 and tonumber(myY) == 222 then
            -- TODO �޸�NPC����
            break
        end
    end
end

function BaoZhuShengJi(row, col)
    �Ի�NPC("���")  -- TODO �޸�NPC����
    ��ʱ(1000)
    NPC�����Ի�("")  -- TODO �Ի�����
    ��ʱ(2000)
    LUA_Call([[]])  -- TODO �Ҽ��������, row col��֪λ��
    ��ʱ(500)
    for i = 0, 3 do
        LUA_Call([[]])  -- TODO ѭ��ѡ��4�������е�
        ��ʱ(500)
        for j = 1, 20 do
            LUA_Call([[]])  -- TODO �������, ÿ�����Ե�20��
            ��ʱ(200)
        end
    end
end


function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."��սΪ�����䡿".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function main()
    MentalTip("�԰�������б�������")

    -- ���������
    LUA_Call([[setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();]])
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_SelfEquip_Clicked();]])
    ��ʱ(500)
    -- ������
    LUA_Call([[setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click( 16,0 );]])
    ��ʱ(500)
    -- �رս���
    LUA_Call([[setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();]])

    ��ʱ(2000)

    local BWLLocation = ��ȡ������Ʒλ��("������")
    if BWLLocation < 1 then
        return
    end

    local row = math.floor(tonumber(BWLLocation) / 10)
    local col = math.floor(tonumber(BWLLocation) % 10)
    if col == 0 then
        col = 10
    else
        row = row + 1
    end

    ȡ����Ʒ("����ľ�")
    ��ʱ(500)
    ȡ����Ʒ("����ľ����")
    �Ҽ�ʹ����Ʒ("����ľ����")

    BackToBangHui()
    ��ʱ(1000)
    GoToLingPaiNPC()
    ��ʱ(2000)
    BaoZhuShengJi(row, col)

end























