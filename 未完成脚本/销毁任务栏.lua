


local taskNum = LUA_ȡ����ֵ([[
    local currNum = DataPool:GetTaskBag_Num();
    return currNum
]])


LUA_Call([[]])  -- �򿪱������л���������
LUA_Call([[]]) -- �������

for i = 1, tonumber(taskNum) do
    local isTarget = LUA_ȡ����ֵ(string.format([[
        local targetItemName = "%s"
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
    ]], targetItemName, i))
	if tonumber(isTarget) == 1 then
		��ͼѰ·("����", 360, 183)
		��ʱ(2000)
		�Ի�NPC("����Ԩ")
		��ʱ(500)
		NPC�����Ի�("����ɾ���������")
		��ʱ(1000)
		LUA_Call()
	elseif tonumber(isTarget) == 2 then
		
	end
	
	
end