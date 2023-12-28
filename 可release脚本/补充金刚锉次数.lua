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

function PickOutJGC()
    ȡ����Ʒ("����")
    MoveToPos("����", 354, 234)
    ��ʱ(2000)
    �Ի�NPC("ŷұ��")
    ��ʱ(1000)
    NPC�����Ի�("�������ʹ�ô���")
end

function RightUse(row, col)
    LUA_Call(string.format([[
        setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);
    ]], row, col))
end

function ClickConfirmBtn()
    LUA_Call([[
        setmetatable(_G, {__index = JinGangCuo_AddNum_Env});
        JinGangCuo_AddNum_ConfirmClick();
    ]])
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

function MergeJGCCount()
    local posString = LUA_ȡ����ֵ(string.format([[
        local itemName = "%s"
        local currNum = DataPool:GetBaseBag_RealMaxNum();
        local pos = ""
        for i=1, currNum do
            local theAction,bLocked = PlayerPackage:EnumItem("base", i-1);
			if theAction:GetID() ~= 0 then
				local sName = theAction:GetName();
				if itemName == sName then
                    pos = pos .. tostring(i) .. "|"
                end
			end
        end
        return pos
    ]], "����"))
    local posList = StringSplit(posString, "|")

    for i = 1, #posList do
        if posList[i] ~= nil and posList[i] ~= '' then
            local pos = tonumber(posList[i])
            local row = math.floor(tonumber(pos) / 10)
            local col = math.floor(tonumber(pos) % 10)
            if col == 0 then
                col = 10
            else
                row = row + 1
            end

            RightUse(row, col)
            ��ʱ(800)
            ClickConfirmBtn()
            ��ʱ(500)
        end
    end
end

function main()
    for i = 1, 3 do
        MentalTip(string.format("������3�ֲ�����ﱴ���, ��ǰ�ڡ�%d����", i))
        PickOutJGC()

        if ��ȡ������Ʒ����("����") < 1 then
            MentalTip("û�н���, �˳�")
            break
        end

        ��ʱ(1000)
        MergeJGCCount()
    end

    MoveToPos("����", 343, 245)
end

main()
