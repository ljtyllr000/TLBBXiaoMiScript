�����б� = {}

ͷ���б� = {
    '��»����'
}



function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
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

function MoveToNPC(NPCCity, x, y)
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


-- main --------------------------------------
MoveToNPC('����', 336, 270)

for _, item in pairs(�����б�) do
    �Ի�NPC("��ʦʦ")
    ��ʱ(1000)
    NPC�����Ի�("�����")
    ��ʱ(1000)
    �Ҽ�ʹ����Ʒ(item)
    ��ʱ(1000)

    LUA_Call([[setmetatable(_G, {__index = DressPaint_TB_Env});DressPaint_TB_OK_Clicked();]])
end

for _, item in pairs(ͷ���б�) do
    �Ի�NPC("��ʦʦ")
    ��ʱ(1000)
    NPC�����Ի�("����ͷ��")
    ��ʱ(1000)
    �Ҽ�ʹ����Ʒ(item)
    ��ʱ(1000)

    LUA_Call([[setmetatable(_G, {__index = DressPaint_TB_Env});DressPaint_TB_OK_Clicked();]])
end