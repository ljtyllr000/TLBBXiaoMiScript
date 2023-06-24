function GetCityBattleTime()
    local year = tonumber(os.date("%Y", os.time()))
    local month = tonumber(os.date("%m", os.time()))
    local day = tonumber(os.date("%d", os.time()))
    local todayTimestamp = tonumber(os.time({ year = year, month = month, day = day, hour = 0, min = 0, sec = 0 }))
    local battleStartTimestamp = todayTimestamp + 20 * 60 * 60 + 15 * 60 + 2
    return battleStartTimestamp
end

function ׼����ս()
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
        ��ͼѰ·(myGuildCityName, 107, 55)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == 107 and tonumber(myY) == 55 then
            break
        end

    end
    ��ʱ(2000)

    �Ի�NPC("�����")
    ��ʱ(1000)
    NPC�����Ի�("�����������")
    ��ʱ(500)

    local cityBattleStartTime = GetCityBattleTime()
    while true do
        if os.time() < cityBattleStartTime then
            ��Ļ��ʾ(string.format("�����վ��ʼ����%d��", cityBattleStartTime - tonumber(os.time())))
            ��ʱ(5000)
        else
            NPC�����Ի�("ǰ����ս������-��")
            ��ʱ(1000)
            LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
            break
        end
    end


end


-- ִ�нű�
ִ�й���("ͬ����Ϸʱ��")
׼����ս()
