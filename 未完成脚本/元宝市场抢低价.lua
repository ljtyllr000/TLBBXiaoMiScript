fuckItem = {
    [1] = { name = "���ʯ����", perPrice = 0.1, nType = 2 },
    [2] = { name = "��������������", perPrice = 0.1, nType = 2 }
}
-- perPrice�� ��Ʒ����
-- nType: �Ϸ�3��ѡ����Ʒ�г��������г���װ���г��� 2 is item, 1 is pet, 3 is equip

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function SearchItem(nSubType, strKey)
    -- ������Ʒ
    -- TODO ȷ��nSubTypeΪ1�Ƿ�Ϊ��ѡ���Ӳ˵�����
    LUA_Call(string.format([[
        Auction:PacketSend_Search(2, %d, 1, "%s", 1)
    ]], nSubType, strKey), "s", 1)
    ��ʱ(2000)
end

function GetItemPerPrice(strKey, perPrice)
    -- ��ȡ��ǰҳÿ����Ʒ��Ϣ
    local itemPerPrice = LUA_ȡ����ֵ(string.format([[
        local itemName = "%s"
        local targetPerPrice = %f
        for i = 0, 9 do
            local pName , pSeller ,pCount ,pYB = Auction:GetItemAuctionInfo(i)
            if pName == itemName and pSeller ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
                local perPrice = pYB / pCount
                if perPrice <= targetPerPrice then

                end
            end
        end
    ]], strKey, perPrice), "s", 1)
end

function main()
    MentalTip('ǰ��ǮׯԪ���г����ͼ���Ʒ')
    if tonumber(��ȡ������Ϣ(46)) <= 0 then
        MentalTip("Ԫ������, �˳�")
        return
    end
    ��ͼѰ·("Ǯׯ", 60, 30);
    ��ʱ(500)
    �Ի�NPC("��۲�");
    ��ʱ(500)
    NPC�����Ի�("Ԫ�������г�", 1);
    ��ʱ(1000)
    if �����Ƿ����("YbMarket") == 1 then
        for i = 1, #fuckItem do
            local itemType = fuckItem[i].nType
            SearchItem(itemType, fuckItem[i].name)
            ��ʱ(500)


        end
    end


end