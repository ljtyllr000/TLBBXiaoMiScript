Ŀ�����ֹؼ��� = {}
-- Ŀ�����ֹؼ��� = { "����", "����", "�����ʿ"}

ɱ���������� = 5

�����ٶ� = 110 -- ��������, ԽСԽ��, С��110���׵���, ���Ǿ���Խ��; Խ��Խ��, ���Ǿ���Խ��


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

function GetTargetRelation()
    local tmp = LUA_ȡ����ֵ([[
		return Target:GetData( "RELATION" )
	]])

    if tmp == nil then
        tmp = LUA_ȡ����ֵ([[
			Target:SendAskDetail();
			return Target:GetData( "RELATION" )
		]])
    end
    return tmp
end


function HavaUnbeatableBuff()
    local tem = LUA_ȡ����ֵ([[
        local TARGET_BUFF_MAX = 6;
        local TARGET_IMPACT_NUM = 20; --��ѯʱҪ��20������ѡ�����ȼ���ߵ�6��

        local nBuffNum = Target:GetBuffNumber();
        local nFindNum = nBuffNum --������nBuffNum֮ǰ�������ֵ
        if(nFindNum > TARGET_IMPACT_NUM) then nFindNum = TARGET_IMPACT_NUM; end
        if(nBuffNum > TARGET_BUFF_MAX) then nBuffNum = TARGET_BUFF_MAX; end

        local tmp = 0
        for jj = 1, nFindNum then
            szIconName,szTipInfo = Target:GetBuffIconNameByIndex(jj-1);
            PushDebugMessage(szTipInfo)
            if string.find(szTipInfo, '�޵�') then
                tmp = 1
                break
            end
        end
        return tmp
    ]])
    return tonumber(tem)
end

while true do
    local myX = ��ȡ������Ϣ(7)
    local myY = ��ȡ������Ϣ(8)
    local minHP = -1
    local tID = -1
    local tPlayerName = -1
    local nearbyPlayer = ��ȡ��Χ���(������, myX, myY, 15)
    if nearbyPlayer ~= nil then
        local nearbyPlayerList = StringSplit(nearbyPlayer, '|')
        for i = 1, #nearbyPlayerList do
            local playerName = nearbyPlayerList[i]
            local flag = false
            if #Ŀ�����ֹؼ��� ~= 0 then
                for _, pattern in pairs(Ŀ�����ֹؼ���) do
                    if string.find(playerName, pattern) then
                        flag = true
                        break
                    end
                end
            else
                flag = true
            end

            if flag then
                local name, ID, x, y, HP, tDistance, tType, tOwner, tJudge, tTitle = ������Χ��Ʒ(5, playerName, 15)
                if name ~= nil and ID ~= nil then
                    ѡ�ж���(ID)
                    ��ʱ(�����ٶ�)
                    local relation = GetTargetRelation()
                    local isUnbeatable = HavaUnbeatableBuff()
                    if (relation == '4' or relation == '5') and isUnbeatable ~= 1 then
                        if minHP == -1 then
                            minHP = HP
                            tID = ID
                            tPlayerName = name
                        else
                            if HP < minHP then
                                minHP = HP
                                tID = ID
                                tPlayerName = name
                            end
                        end
                    end
                    -- ��Ļ��ʾ(tPlayerName .. '|' .. ID .. '|Ѫ���ٷֱȣ�' .. minHP)
                end
            end
        end
        MentalTip('��ǰѪ�����ٵ�Ŀ��Ϊ��' .. tPlayerName .. '|' .. tID .. '|Ѫ���ٷֱȣ�' .. minHP)
        ѡ�ж���(tID)

        local waitTime = 0
        while true do
            if waitTime >= ɱ���������� then
                MentalTip("5����δ��ɱ, �л�����һ��Ŀ��")
                break
            end

            local name, curID, x, y, curHP, tDistance, tType, tOwner, tJudge, tTitle = ������Χ��Ʒ(5, tPlayerName, 15)
            if curID ~= nil and curHP > 0 then
                ѡ�ж���(tID)
                ��ʱ(1000)
            else
                break
            end

            waitTime = waitTime + 1
        end
    end

    ��ʱ(120)
end