

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function WritePlayerConfiguration(section, keyName, value)
    local playerName = ��ȡ������Ϣ(12)
    local configPath = string.format("C:\\����С��\\��ɫ����\\%s.ini", playerName)
    if section ~= nil and keyName ~= nil and value ~= nil then
        MentalTip("д��ɫ������|" .. section .. "|" .. keyName .. "|" .. value);
        ��ʱ(200)
        д������(configPath, section, keyName, value);
        ��ʱ(200)
    end
end

function ReadPlayerConfiguration(section, keyName)
    local playerName = ��ȡ������Ϣ(12)
    local configPath = string.format("C:\\����С��\\��ɫ����\\%s.ini", playerName)
    local tem = ��������(configPath, section, keyName)
    if tem then
        MentalTip(section .. "|" .. keyName .. "==" .. tem);
        ��ʱ(500)
    else
        return 0
    end
    return tem
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

function genRandomNum(minNum, maxNum)
    local tmp = math.random(minNum, maxNum)
    return tmp
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

function main()

end

-- main ---------------------------------------------
main()

