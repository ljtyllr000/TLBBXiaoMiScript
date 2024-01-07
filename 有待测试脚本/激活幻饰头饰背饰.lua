ͷ���б� = {}
�����б� = {}
���������б� = {}

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

function ActiveHeadDecoration()
    local headDecorationStr = ''
    for _, headDecoration in pairs(ͷ���б�) do
        if headDecorationStr == '' then
            headDecorationStr = headDecoration
        else
            headDecorationStr = headDecorationStr .. '|' .. headDecoration
        end
    end

    if headDecorationStr ~= '' then
        ȡ����Ʒ(headDecorationStr)
        ȡ����Ʒ('���')

        local needActiveDecorationList = {}
        for _, headDecoration in pairs(ͷ���б�) do
            local decorationCount = ��ȡ������Ʒ����(headDecoration)
            if decorationCount > 0 then
                table.insert(needActiveDecorationList, headDecoration)
            end
        end

        MoveToPos('����', 1, 2)  -- TODO
        �Ի�NPC('')   -- TODO
        ��ʱ(1000)
        NPC�����Ի�('����ͷ��', 1)    -- TODO
        ��ʱ(1000)

        for _, decoration in pairs(needActiveDecorationList) do
            �Ҽ�ʹ����Ʒ(decoration)
            ��ʱ(1500)
            LUA_Call([[]])  -- TODO
        end
    end
end

function ActiveBackDecoration()
    local backDecorationStr = ''
    for _, backDecoration in pairs(�����б�) do
        if backDecorationStr == '' then
            backDecorationStr = backDecoration
        else
            backDecorationStr = backDecorationStr .. '|' .. backDecoration
        end
    end

    if backDecorationStr ~= '' then
        ȡ����Ʒ(backDecorationStr)
        ȡ����Ʒ('���')

        local needActiveDecorationList = {}
        for _, backDecoration in pairs(�����б�) do
            local decorationCount = ��ȡ������Ʒ����(backDecoration)
            if decorationCount > 0 then
                table.insert(needActiveDecorationList, backDecoration)
            end
        end

        MoveToPos('����', 1, 2)  -- TODO
        �Ի�NPC('')   -- TODO
        ��ʱ(1000)
        NPC�����Ի�('�����', 1)    -- TODO
        ��ʱ(1000)

        for _, decoration in pairs(needActiveDecorationList) do
            �Ҽ�ʹ����Ʒ(decoration)
            ��ʱ(1500)
            LUA_Call([[]])  -- TODO
        end
    end
end

function ActiveBackDecoration()
    local decorationWeaponStr = ''
    for _, decorationWeapon in pairs(���������б�) do
        if decorationWeaponStr == '' then
            decorationWeaponStr = decorationWeapon
        else
            decorationWeaponStr = decorationWeaponStr .. '|' .. decorationWeapon
        end
    end

    if decorationWeaponStr ~= '' then
        ȡ����Ʒ(decorationWeaponStr)
        ȡ����Ʒ('���')

        local needActiveDecorationList = {}
        for _, decorationWeapon in pairs(���������б�) do
            local decorationCount = ��ȡ������Ʒ����(decorationWeapon)
            if decorationCount > 0 then
                table.insert(needActiveDecorationList, decorationWeapon)
            end
        end

        MoveToPos('����', 1, 2)  -- TODO
        �Ի�NPC('')   -- TODO
        ��ʱ(1000)
        NPC�����Ի�('�����������', 1)    -- TODO
        ��ʱ(1000)

        for _, decoration in pairs(needActiveDecorationList) do
            �Ҽ�ʹ����Ʒ(decoration)
            ��ʱ(1500)
            LUA_Call([[]])  -- TODO
            ��ʱ(1500)
            �Ҽ�ʹ����Ʒ(decoration .. "��1����")  -- TODO
        end
    end
end

function main()
    ActiveHeadDecoration()
    ActiveBackDecoration()
    ActiveBackDecoration()
end

-- main ------------------------------------
main()

