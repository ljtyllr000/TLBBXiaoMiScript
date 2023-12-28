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

function RightUse(row, col)
    LUA_Call(string.format([[
        setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);
    ]], row, col))
end

function ClickConfirmBtn()
    LUA_Call([[setmetatable(_G, {__index = ZhenShouYao_AddNum_Env});ZhenShouYao_AddNum_ConfirmClick();]])
end

function List2String(targetList)
    local retString = ''
    for index, item in pairs(targetList) do
        retString = retString .. item
        if index ~= #targetList then
            retString = retString .. '|'
        end
    end
    return retString
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

function MergePetFoodCount(petFoodName)
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
    ]], petFoodName))
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
            ��ʱ(1000)
            ClickConfirmBtn()
        end
    end
end

function main()
    ִ�й���("ͬ����Ϸʱ��")
    local curDay = LUA_ȡ����ֵ("return DataPool:GetServerDayTime();", "n", 1)
    if tonumber(curDay) >= 20230914 then
		MentalTip("�����ı��ѵ��ڣ�����")
        return
    end

    local loopCount = 0
    while true do
        if loopCount >= 3 then
            break
        end

        MentalTip(string.format("������3�ֺϳ�, ��ǰ�ڡ�%d����", loopCount + 1))
        local petFoodList = { "���޻ش���", "���޻���", "�����̲���", "�����򲹵�", "���������̲���", "�������޻ش���" }
        local petFoodString = List2String(petFoodList)
        ȡ����Ʒ(petFoodString)

        MoveToPos("����", 275, 295)
        ��ʱ(3000)

        for i = 1, #petFoodList do
            local petFoodName = petFoodList[i]
            local petFoodCount = ��ȡ������Ʒ����(petFoodName)
            if petFoodCount < 2 then
                MentalTip(string.format("��%s����������2��, ����", petFoodName))
            else
                �Ի�NPC("������")
                ��ʱ(1000)
                NPC�����Ի�("����ҩ����ʹ�ô���")
                ��ʱ(2000)
                MergePetFoodCount(petFoodName)
            end
        end
        loopCount = loopCount + 1
    end
end


-- ִ�к��� ----------------------------------
main()
