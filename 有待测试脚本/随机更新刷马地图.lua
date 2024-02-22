local ShuaMaMapCombination = {
    [1] = { map1 = "��Ϫ", map2 = "ʯ��", waitMap = "��Ϫ", waitX = 51, waitY = 53 },
    [2] = { map1 = "��گ", map2 = "�置", waitMap = "�置", waitX =, waitY = },
    [3] = { map1 = "����ɽ", map2 = "������", waitMap = "������", waitX =, waitY = },
    [4] = { map1 = "����", map2 = "��ɽ", waitMap = "��ɽ", waitX =, waitY = },
    [5] = { map1 = "�Ϻ�", map2 = "����", waitMap = "����", waitX =, waitY = },
    [6] = { map1 = "����", map2 = "�㱱", waitMap = "�㱱", waitX =, waitY = },
    [7] = { map1 = "��ԭ", map2 = "����", waitMap = "����", waitX =, waitY = },
    [8] = { map1 = "����", map2 = "÷��", waitMap = "÷��", waitX =, waitY = },
}

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
    local totalMap = { "��ɽ", "̫��", "����", "����", "��Ȫ", "����",
                       "÷��", "�Ϻ�", "����", "�ػ�", "����", "�㱱",
                       "��ԭ", "����", "����ɽ", "������", "����",
                       "��ɽ", "ʯ��", "��Ϫ", "��گ", "�置" }

    local selectNum = genRandomNum(1, #ShuaMaMapCombination)

    local map1 = ShuaMaMapCombination[selectNum].map1
    local map2 = ShuaMaMapCombination[selectNum].map2
    local waitMap = ShuaMaMapCombination[selectNum].waitMap
    local waitX = ShuaMaMapCombination[selectNum].waitX
    local waitY = ShuaMaMapCombination[selectNum].waitY

    MentalTip(string.format([[����ˢ���ͼΪ��%s����%s��, �ȴ��ص�Ϊ��%s��(%s, %s)]], map1, map2, waitMap, waitX, waitY))
    MentalTip(string.format([[����ˢ���ͼΪ��%s����%s��, �ȴ��ص�Ϊ��%s��(%s, %s)]], map1, map2, waitMap, waitX, waitY))
    MentalTip(string.format([[����ˢ���ͼΪ��%s����%s��, �ȴ��ص�Ϊ��%s��(%s, %s)]], map1, map2, waitMap, waitX, waitY))

    for _, mapName in pairs(totalMap) do
        local choice = ReadPlayerConfiguration("ˢ��", mapName)
        if tonumber(choice) ~= 0 then
            WritePlayerConfiguration("ˢ��", mapName, 0)
        end
    end

    WritePlayerConfiguration("ˢ��", map1, 1)
    WritePlayerConfiguration("ˢ��", map2, 1)
    WritePlayerConfiguration("ˢ��", "ˢ��ȴ���ͼ", waitMap)
    WritePlayerConfiguration("ˢ��", "ˢ��ȴ�X", waitX)
    WritePlayerConfiguration("ˢ��", "ˢ��ȴ�Y", waitY)


end

-- main ---------------------------------------------
main()

