�ϳ�4�� = 0

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

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

function StringSplit(str, reps)
    -- �ַ����и�
    local resultStrList = {}
    string.gsub(str, '[^' .. reps .. ']+',
            function(w)
                table.insert(resultStrList, w)
            end
    )
    return resultStrList
end

function PackUpPacket(nTheTabIndex)
    if nTheTabIndex == 1 then
        MentalTip("�Զ����� <������>")
    elseif nTheTabIndex == 2 then
        MentalTip("�Զ����� <������>")
    end
    LUA_Call(string.format("PlayerPackage:PackUpPacket(%d);", nTheTabIndex))
end

function GemCarve(GemName, NeedItemName)
    MoveToPos("����", 281, 321)
    MentalTip("��ʯ����:%s ,%s", GemName, NeedItemName)
    ��ʱ(2000)
    local LPindex = ��ȡ������Ʒλ��(GemName) - 1
    local Needindex = ��ȡ������Ʒλ��(NeedItemName) - 1
    if LPindex >= 0 and Needindex >= 0 then
        local tem = LUA_ȡ����ֵ(string.format([[
		local g_GemItemPos =%d
		local itemcount = PlayerPackage:GetBagItemNum(g_GemItemPos)
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("OnGemCarve");
			Set_XSCRIPT_ScriptID(800117);
			Set_XSCRIPT_Parameter(0,g_GemItemPos);
			Set_XSCRIPT_Parameter(1,%d);
			Set_XSCRIPT_Parameter(2,135);
			Set_XSCRIPT_Parameter(3, 0);
			Set_XSCRIPT_Parameter(4,itemcount);
			Set_XSCRIPT_ParamCount(5);
		Send_XSCRIPT();
		]], LPindex, Needindex), "b")
    end
end

function Compose(gemIndex, HCFIndex)
    -- TODO
    local nSel = 0   -- 0�����һ    1���ĺ�һ    2������һ
    LUA_ȡ����ֵ(string.format([[
        g_GemTableIndex = %d
        g_ItemBagIndex = %d
        nSel = 0  -- 0
        LifeAbility:Do_Combine(g_GemTableIndex, g_ItemBagIndex, nSel, 100)
    ]], gemIndex, HCFIndex, nSel))
end

function GemCompose2Three(gemName)
    local twoGemNum = ��ȡ������Ʒ����('2��' .. gemName)
    local oneGemNum = ��ȡ������Ʒ����('1��' .. gemName)

    -- ��2���ϳ�3��
    local needTwo2Three = 5 - twoGemNum
    local needOne2Two = needTwo2Three * 5

    if oneGemNum < needOne2Two then
        MentalTip(string.format([[1��%s��������, �˳�]], gemName))
        return
    end

    -- ���� 2 -> 3 ȱ�ٵ�2��
    for i = 1, needTwo2Three do
        local gemIndex = tonumber(��ȡ������Ʒλ��('1��' .. gemName))
        local HCFIndex = tonumber(��ȡ������Ʒλ��('�ͼ���ʯ�ϳɷ�'))
        Compose(gemIndex, HCFIndex)
        ��ʱ(500)
    end

    ��ʱ(2000)

    -- ��1���ϳ�2��������25���źϳ�
    oneGemNum = ��ȡ������Ʒ����('1��' .. gemName)
    local canComposeNum = math.floor(oneGemNum / 25)
    for i = 1, canComposeNum do
        local gemIndex = tonumber(��ȡ������Ʒλ��('1��' .. gemName))
        local HCFIndex = tonumber(��ȡ������Ʒλ��('�ͼ���ʯ�ϳɷ�'))
        Compose(gemIndex, HCFIndex)
        PackUpPacket(2)
        ��ʱ(1000)
    end

    -- ��2���ϳ�3��
    twoGemNum = ��ȡ������Ʒ����('2��' .. gemName)
    canComposeNum = math.floor(twoGemNum / 5)
    for i = 1, canComposeNum do
        local gemIndex = tonumber(��ȡ������Ʒλ��('2��' .. gemName))
        local HCFIndex = tonumber(��ȡ������Ʒλ��('�ͼ���ʯ�ϳɷ�'))
        Compose(gemIndex, HCFIndex)
        PackUpPacket(2)
        ��ʱ(1000)
    end

end

function GemCompose2Four(gemName)
    -- 3���ϳ�4��
    local canComposeNum = math.floor(twoGemNum / 5)
    for i = 1, canComposeNum do
        local gemIndex = tonumber(��ȡ������Ʒλ��('3��' .. gemName))
        local HCFIndex = tonumber(��ȡ������Ʒλ��('�ͼ���ʯ�ϳɷ�'))
        Compose(gemIndex, HCFIndex)
        PackUpPacket(2)
        ��ʱ(1000)
    end
end

function main(gemName)
    GemCompose2Three(gemName)

    local DJFCount = ��ȡ������Ʒ����('��ʯ������3��')
    local gemCount = ��ȡ������Ʒ����('3��' .. gemName)

    if DJFCount > 0 and gemCount > 0 then
        for i= 1, math.min(DJFCount, gemCount) do
            GemCarve('3��' .. gemName, '��ʯ������3��')
            ��ʱ(500)
        end
    end

    if �ϳ�4�� == 1 then
        if string.find('����ʯ|�쾧ʯ|�ƾ�ʯ|�̾�ʯ|�ʯ|�¹�ʯ|����|����', gemName) then
            gemName = '����' .. gemName
        end

        GemCompose2Four(gemName)
    end


end



-- main -------------------------------------------------------------------------------------------------------------

ȡ����Ʒ('�ͼ���ʯ�ϳɷ�|��ʯ������3��|��ʯ������4��|1���챦ʯ|2���챦ʯ|3���챦ʯ|4���챦ʯ|1������ʯ|2������ʯ|3������ʯ|4������ʯ|1���쾧ʯ|2���쾧ʯ|3���쾧ʯ|4���쾧ʯ|1���ƾ�ʯ|2���ƾ�ʯ|3���ƾ�ʯ|4���ƾ�ʯ|1���̾�ʯ|2���̾�ʯ|3���̾�ʯ|4���̾�ʯ|1���ʯ|2���ʯ|3���ʯ|1���¹�ʯ|2���¹�ʯ|3���¹�ʯ|1������|2������|3������|1������|2������|3������|1���̱�ʯ|2���̱�ʯ|3���̱�ʯ|4���̱�ʯ|1����ĸ��|2����ĸ��|3����ĸ��|4����ĸ��')
ȡ����Ʒ("���")

����Ʒ("1���챦ʯ|1������ʯ|1���쾧ʯ|1���ƾ�ʯ|1���̾�ʯ|1���ʯ|1���¹�ʯ|1������|1������|1���̱�ʯ|1����ĸ��", ������Ʒ, 0, 1, 1)
����Ʒ("1���챦ʯ|1������ʯ|1���쾧ʯ|1���ƾ�ʯ|1���̾�ʯ|1���ʯ|1���¹�ʯ|1������|1������|1���̱�ʯ|1����ĸ��", ������Ʒ, 0, 1, 1)
����Ʒ("1���챦ʯ|1������ʯ|1���쾧ʯ|1���ƾ�ʯ|1���̾�ʯ|1���ʯ|1���¹�ʯ|1������|1������|1���̱�ʯ|1����ĸ��", ������Ʒ, 0, 1, 1)

���Ա�ʯ = '1������ʯ|2������ʯ|3������ʯ|4������ʯ|1���쾧ʯ|2���쾧ʯ|3���쾧ʯ|4���쾧ʯ|1���ƾ�ʯ|2���ƾ�ʯ|3���ƾ�ʯ|4���ƾ�ʯ|1���̾�ʯ|2���̾�ʯ|3���̾�ʯ|4���̾�ʯ'

main()

