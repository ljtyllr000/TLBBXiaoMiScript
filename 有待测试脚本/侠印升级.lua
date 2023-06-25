function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetHXYLevel()
    local HXYLevel = LUA_ȡ����ֵ([[
		local ActionHXY = EnumAction(21,"equip")
		if ActionHXY and ActionHXY:GetID() ~= 0 then
			local nEquipLevel = DataPool:Lua_GetHXYLevel()
			return  nEquipLevel
		else
			return 0
		end
	]])
    return tonumber(HXYLevel)
end

function GetJianMianLevel(effectIndex)
    -- JMIndex Ϊ 0~6
    local effectLevel = LUA_ȡ����ֵ(string.format([[
		local effectIndex = %d
		local nIndex , iEffectLevel, iCost , iNeedHXYLevel , iValue = DataPool:Lua_GetHXYEffect( effectIndex )
		if nIndex ~= nil then
			return iEffectLevel
		end
		return -1
	]], effectIndex))
    return tonumber(effectLevel)
end

function GetGongXun()
    local gongXun = LUA_ȡ����ֵ([[
		return Player:GetData( "MILITARYXIUWEI" );
	]])
    return tonumber(gongXun)
end

function GetHXYLevelUpCost()
    -- ��ӡ�����������ѫ������
    local nUpgradeCost = LUA_Call([[
		local nUpgradeCost = DataPool:Lua_GetHXYUpgradeCost(  )
		return nUpgradeCost
	]])
    return tonumber(nUpgradeCost)
end

function BuyHAYMaterial(itemIndex)
    -- ��ȡս��, ������Ʒ
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
        MentalTip("�ű��������ʧ��")
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
    LUA_Call(string.format([[setmetatable(_G, {__index = JueweiShop_Env});JueweiShop_BuyItem(%d);]], itemIndex))
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NEWShop_MBuy_Env});NEWShop_MBuy_MaxButtonDwon()]])  -- ���
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NEWShop_MBuy_Env});NEWShop_MBuy_BuyMulti_Clicked();]])  -- ȷ�Ϲ���
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = NEWShop_MBuy_Env});JueweiShop_OnHiden();]])  -- TODO �ر�ս���̵�
end

function HXYLeveUp()
    LUA_Call([[
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name( "HXY_LevelUp" )
			Set_XSCRIPT_ScriptID( 880006 )
			Set_XSCRIPT_ParamCount( 0 );
		Send_XSCRIPT();
	]])
end

function HXYEffectLevelUp(effectIndex)
    local ret = LUA_ȡ����ֵ(string.format([[
        local effectIndex = %d
        local myGongXun = Player:GetData( "MILITARYXIUWEI" )
        local nIndex , iEffectLevel, iCost , iNeedHXYLevel , iValue = DataPool:Lua_GetHXYEffect( effectIndex )
		if nIndex ~= nil then
		    if iEffectLevel < 20 and myGongXun > iCost then
		        -- PushDebugMessage("")
                Clear_XSCRIPT()
                    Set_XSCRIPT_ScriptID( 880006 )
                    Set_XSCRIPT_Function_Name( "HXY_EffectLevelUp" )
                    Set_XSCRIPT_Parameter( 0, effectIndex )
                    Set_XSCRIPT_Parameter( 1 , 1)
                    Set_XSCRIPT_ParamCount( 2 )
                Send_XSCRIPT()
                return 1
            end
		end
        return -1
    ]], effectIndex))
    return tonumber(ret)
end

function main()
    MentalTip("��ʼ����ӡ����ӡ����Ч������������")
    if GetHXYLevel() == 0 then
        MentalTip("������ȡ��װ���Ϻ���ӡ")
        return
    end

    local HXYLevelMax = 0
    local HXYEffectMax = 0
    -- �����ӡ�ȼ�������
    if GetHXYLevel() == 100 then
        HXYLevelMax = 1
        MentalTip("���ĺ���ӡ�Ѵ�����, ��ʼ������������")
    else
        ȡ����Ʒ("����ѫ��")
    end

    local allEffectLevel = 0
    for i = 1, 7 do
        local effectLevel = GetJianMianLevel(i - 1)
        if effectLevel == -1 then
            return
        end
        allEffectLevel = allEffectLevel + effectLevel
    end
    if allEffectLevel >= 7 * 20 then
        HXYEffectMax = 1
        MentalTip("���ĺ���ӡ���м���Ч���ȼ��Ѵ�����")
        return
    else
        ȡ����Ʒ("��������")
        ��ʱ(1000)
        �Ҽ�ʹ����Ʒ("��������")
    end

    if HXYLevelMax ~= 1 then
        -- ��ʹ�õ����еĺ���ѫ��
        MentalTip("��ʼ��������ӡ�ȼ�")
        while true do
            local curXYXZCount = ��ȡ������Ʒ����("����ѫ��")
            local needXYXZCount = GetHXYLevelUpCost()
            if curXYXZCount < needXYXZCount then
                break
            end
            if GetHXYLevel() == 100 then
                break
            end
            HXYLeveUp()
            ��ʱ(200)
        end

        -- ���еĺ���ѫ��ʹ���껹û100����ȥս���̵깺��ʹ��
        if GetHXYLevel() < 100 then
            MentalTip("ǰ��ս���̵깺�򡾺���ѫ�¡���������ӡ�ȼ�")
            BuyHAYMaterial(0)  -- ս���̵깺�����ѫ��  -- TODO �޸ĺ���ѫ��index
            ��ʱ(1000)
            while true do
                local curXYXZCount = ��ȡ������Ʒ����("����ѫ��")
                local needXYXZCount = GetHXYLevelUpCost()
                if curXYXZCount < needXYXZCount then
                    break
                end
                HXYLeveUp()
                ��ʱ(500)
            end
        end
    end
    MentalTip("����ӡ�ȼ��������")

    if HXYEffectMax ~= 1 then
        MentalTip("��ʼ��������ӡ����Ч���ȼ�")
        -- ʹ�����еĹ�ѫ��������Ч��
        for i = 1, 7 do
            while true do
                local levelUpRet = HXYEffectLevelUp(i - 1)
                if levelUpRet == -1 then
                    break
                end
                ��ʱ(200)
            end
        end

        -- ��鵱ǰ����Ч���ȼ��Ƿ�������û����ȥ����������
        for i = 1, 7 do
            local effectLevel = GetJianMianLevel(i - 1)
            if effectLevel == -1 then
                return
            end
            allEffectLevel = allEffectLevel + effectLevel
        end
        if allEffectLevel < 7 * 20 then
            MentalTip("ǰ��ս���̵깺���������͡�����������Ч��")
            BuyHAYMaterial(1)   -- TODO �������͵�Index
            ��ʱ(1000)
            �Ҽ�ʹ����Ʒ("��������")
            ��ʱ(500)

            -- ʹ�ù�ѫ��������Ч��
            for i = 1, 7 do
                while true do
                    local levelUpRet = HXYEffectLevelUp(i - 1)
                    if levelUpRet == -1 then
                        break
                    end
                    ��ʱ(200)
                end
            end
        end
    end
    MentalTip("����ӡ����Ч���������")
end


-- ------------------------------ MAIN ------------------------------------
main()