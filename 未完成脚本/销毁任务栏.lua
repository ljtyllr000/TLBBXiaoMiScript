


local taskNum = LUA_ȡ����ֵ([[
    local currNum = DataPool:GetTaskBag_Num();
    return currNum
]])


for i = 1, tonumber(taskNum) do
    local isTarget = LUA_ȡ����ֵ(string.format([[
        local theAction,bLocked = PlayerPackage:EnumItem("quest", %d-1);
		if theAction:GetID() ~= 0 then
			local itemName = theAction:GetName()
			-- local itemNum = theAction:GetNum()
            if string.find(itemName, "ά��ľ��") then
				return 1
			elseif string.find(itemName, "��") then
				return 2
			elseif string.find(itemName, "��") then
				return 2
			end
		end
		return -1
    ]], i))


	local row = math.floor(i / 10)
    local col = math.floor(i % 10)
    if col == 0 then
        col = 10
    else
        row = row + 1
    end

	if tonumber(isTarget) == 1 then
		��ͼѰ·("����", 360, 183)
		��ʱ(2000)
		�Ի�NPC("����Ԩ")
		��ʱ(500)
		NPC�����Ի�("����ɾ���������")
		��ʱ(1000)
		LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))  -- �Ҽ�ѡ����Ʒ
		��ʱ(500)
		LUA_Call(string.format([[]]))  -- TODO ������ٰ�ť
		��ʱ(500)
		LUA_Call([[]]) -- TODO �ر����ٽ���
	elseif tonumber(isTarget) == 2 then
		LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))  -- �Ҽ�ʹ������
	end
end