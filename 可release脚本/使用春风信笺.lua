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

function UseCFXJ()
    local itemCount = ��ȡ������Ʒ����("�����ż�")
    ��ʱ(500)
    for index = 1, itemCount do
        �Ҽ�ʹ����Ʒ("�����ż�")
        ��ʱ(800)
        LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
        ��ʱ(800)

    end
end

function SendCFXJ()
    ��ͼѰ·("����", 178, 258)

    ��ʱ(3000)

    local exist_player = {}

    local myX = ��ȡ������Ϣ(7)
    local myY = ��ȡ������Ϣ(8)

    local nearbyPlayer = ��ȡ��Χ���(������, myX, myY, 15)
    MentalTip(string.format([[��Χ���: %s]], nearbyPlayer))
    local nearbyPlayerList = StringSplit(nearbyPlayer, '|')

    for i = 1, #nearbyPlayerList do
        local playerName = nearbyPlayerList[i]

        local exist = 0
        for j = 1, #exist_player do
            if exist_player[j] == playerName then
                exist = 1
            end
        end

        if exist == 0 then
            table.insert(exist_player, playerName)

            local name, ID, x, y, HP, tDistance, tType, tOwner, tJudge, tTitle = ������Χ��Ʒ(5, playerName, 5)
            ѡ�ж���(ID)

            MentalTip(string.format([[��ʼ���Զԡ�%s��ʹ�� �����ż�]], playerName))

            local itemCount = ��ȡ������Ʒ����("�����ż�")
            if itemCount > 0 then
                UseCFXJ()
            else
                MentalTip("û�� �����ż�, �˳�")
                return
            end

        end


    end
end

function main()
    MentalTip("����ǰ�� ���ݣ�178, 258��ʹ�ô����ż�")
    ��ͼѰ·("����", 178, 258)
    while true do
        local itemCount = ��ȡ������Ʒ����("�����ż�")
            if itemCount <= 0 then
                MentalTip("û�С������ż㡿, �˳�")
                return
            end
        SendCFXJ()
        ��ʱ(5000)
    end
end

-- main ------------------------------------------------------
main()
