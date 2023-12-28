Ŀ�����ֹؼ��� = {}
-- Ŀ�����ֹؼ��� = { "����", "����", "�����ʿ"}

ɱ���������� = 5



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


function SearchMinHPTarget(filterTargetList)
    local mainTargetInfo = LUA_ȡ����ֵ(string.format([[
        function HavaUnbeatableBuff()
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
        end

        local filterTargetList = "%s"

        local minHP = -1
        local mainTargetID = -1
        local mainTargetName = -1
        for i=1,2000 do
            if SetMainTargetFromList(i ,false, false) == 1 then   -- TODO
                local playerName = Target:GetName()
                local flag = false
                if filterTargetList ~= nil and filterTargetList ~= '' then
                    if string.find(filterTargetList, mainTargetName) then
                        flag = true
                    end
                else
                    flag = true
                end

                if flag then
                    local isUnbeatable = HavaUnbeatableBuff()
                    if isUnbeatable ~= 1 then
                        local RaidHP = Target:TargetFrame_Update_HP_Raid();
                        if RaidHP ~= nil and RaidHP ~= 0 then
                            if minHP == -1 and  then
                                minHP = RaidHP
                                mainTargetID = i
                                mainTargetName = playerName
                            else
                                if RaidHP < minHP then
                                    minHP = RaidHP
                                    mainTargetID = i
                                    mainTargetName = playerName
                                end
                            end
                        end
                    end
                end
            end
        end
        return mainTargetID .. "|" .. mainTargetName
    ]], filterTargetList))

    local tmpList = StringSplit(mainTargetInfo, '|')
    local mainTargetID, mainTargetName = tmpList[1], tmpList[2]
    return mainTargetID, mainTargetName
end

while true do
    local mainTargetID, mainTargetName = SearchMinHPTarget()

    if mainTargetID ~= -1 and mainTargetName ~= -1 then
        ѡ�ж���(mainTargetID)

        local waitTime = 0
        while true do
            if waitTime >= ɱ���������� then
                MentalTip("5����δ��ɱ, �л�����һ��Ŀ��")
                break
            end

            local name, curID, x, y, curHP, tDistance, tType, tOwner, tJudge, tTitle = ������Χ��Ʒ(5, mainTargetName, 15)
            if curID ~= nil and curHP > 0 then
                ѡ�ж���(mainTargetID)
                ��ʱ(1000)
            else
                break
            end

            waitTime = waitTime + 1
        end
    end
    ��ʱ(200)
end

