function TXPLevelUp()
    �Ի�NPC("XXX")  -- TODO
    ��ʱ(1000)
    NPC�����Ի�("����", 0)  -- TODO
    ��ʱ(1000)

    for i = 1, 3 do
        LUA_Call(string.format([[setmetatable(_G, {__index = Armor_Upgrade_Env});Armor_Upgrade_Choose_ItemClicked(%d);]], i))
        ��ʱ(1000)
        for i = 1, 10 do
            LUA_Call([[setmetatable(_G, {__index = Armor_Upgrade_Env});Armor_Upgrade_OKClicked();]])
            ��ʱ(300)
        end
        ��ʱ(1000)
    end
end

function TXPShengJie()
    �Ի�NPC("XXX")  -- TODO
    ��ʱ(1000)
    NPC�����Ի�("����Ʒ��", 0)  -- TODO
    ��ʱ(1000)

    for i = 1, 3 do
        LUA_Call(string.format([[setmetatable(_G, {__index = Armor_Upstage_Env});Armor_Upstage_Choose_ItemClicked(%d);]], i))
        ��ʱ(1000)
        LUA_Call([[setmetatable(_G, {__index = Armor_Upstage_Env});Armor_Upstage_OKClicked();]])
        ��ʱ(500)
    end
end

function TXPUpStars()
    �Ի�NPC("XXX")  -- TODO
    ��ʱ(1000)
    NPC�����Ի�("�����Ǽ�", 0)  -- TODO
    ��ʱ(1000)

    for i = 1, 3 do
        LUA_Call(string.format([[setmetatable(_G, {__index = Armor_Upstars_Env});Armor_Upstars_Choose_ItemClicked(%d);]], i))
        ��ʱ(1000)
        for i = 1, 10 do
            LUA_Call([[setmetatable(_G, {__index = Armor_Upstars_Env});Armor_Upstars_OKClicked();]])
        end
    end
end

function main()
    ȡ����Ʒ("")  -- TODO ȡ�����������ǡ����ײ���
    ȡ����Ʒ("���")
    ��ͼѰ·("������", 1, 2)
    ��ʱ(2000)
    �Ҽ�ʹ����Ʒ("")  -- TODO

    TXPLevelUp()
    ��ʱ(1000)
    TXPShengJie()
    ��ʱ(1000)
    TXPUpStars()
end

-- ִ�� ---------------------------------------
main()
