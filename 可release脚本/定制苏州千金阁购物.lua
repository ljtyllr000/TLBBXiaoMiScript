������Ʒ = {
    "3����ʯ�һ�ȯ", "���˿"
}


function MoveToPos(NPCCity, x, y)
    while true do
        ��ͼѰ·(NPCCity, x, y)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

function BuyGood(goodIndex)
    LUA_Call([[setmetatable(_G, {__index = GuiShi_Shop_Env});GuiShi_Shop_BuyMult();]])   -- ��Ч��������
    ��ʱ(1000)

    LUA_Call(string.format([[setmetatable(_G, {__index = GuiShi_Shop_Env});GuiShi_Shop_onGoods(%d);]], goodIndex))  -- 1 ��ʾ��ʯȯ��2 ��ʾ���˿
    ��ʱ(1000)

    LUA_Call([[setmetatable(_G, {__index = GuiShi_ShopMBuy_Env});GuiShi_ShopMBuy_OnMax();]])  -- ���������
    ��ʱ(1000)

    LUA_Call([[setmetatable(_G, {__index = GuiShi_ShopMBuy_Env});GuiShi_ShopMBuy_OnOK();]])  -- ����
    ��ʱ(1000)

    LUA_Call([[setmetatable(_G, {__index = GuiShi_Shop_Env});GuiShi_Shop_BuyMult();]])  -- �ر�ǧ���
    ��ʱ(400)
end

function Main()
    ��Ļ��ʾ("����ҹ��Ʒ, ���Ǿ�Ʒ����ǧ�����, Ĭ����ʯ�һ�ȯ�����˿")

    MoveToPos("����", 222, 235)
    ��ʱ(2000)
    �Ի�NPC("�����")
    ��ʱ(500)
    NPC�����Ի�("ǧ���")
    ��ʱ(1000)

    for k, value in pairs(������Ʒ) do
        if string.find("3����ʯ�һ�ȯ", value) then
            BuyGood(1)
        elseif string.find("���˿", value) then
            BuyGood(2)
        elseif string.find("������", value) then
            BuyGood(3)
        elseif string.find("��ҫʯ", value) then
            BuyGood(4)
        elseif string.find("׺����ʯ", value) then
            BuyGood(5)
        elseif string.find("���鵤", value) then
            BuyGood(6)
        elseif string.find("3������", value) then
            BuyGood(7)
        elseif string.find("3���޲�", value) then
            BuyGood(8)
        elseif string.find("�м�����ʺϳɷ�", value) then
            BuyGood(9)
        elseif string.find("��ɫ�伮���", value) then
            BuyGood(10)
        end
    end
end

Main()