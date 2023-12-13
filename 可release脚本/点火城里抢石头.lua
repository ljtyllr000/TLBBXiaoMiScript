�������� = "������|������֮�ۡ�|����ɽׯ|������"  -- ������� | �ֿ�, �����֧��ģ��ƥ��, "" ��ʾ���жϰ��


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

function GetCurrentTime()
    local cur_hour = tonumber(os.date("%H", os.time()))
    local cur_minute = tonumber(os.date("%M", os.time()))
    local cur_second = tonumber(os.date("%S", os.time()))
    local current_timestamp = tonumber(os.time())
    return cur_hour, cur_minute, cur_second, current_timestamp
end

function judgeGuildWar(enemyGuildName)
    LUA_Call([[
        setmetatable(_G, {__index = MiniMap_Env});MiniMap_XuanZhanList();
    ]])
    ��ʱ(5000)
    LUA_Call([[setmetatable(_G, {__index = NewBangHui_RankingList_Env});NewBangHui_RankingList_Close();]])

    local is_fight = LUA_ȡ����ֵ(string.format([[
        local enemyGuildName = "%s"
        local nRankListNum = City:GetBattleRankListNum();
        if nRankListNum == 0 then
            return 0;
        end

        for i = 0, nRankListNum-1 do
            local RivalGuildNameOnly = City:EnumBattleRankList(i,"RivalGuildNameOnly")
            local xzType             = City:EnumBattleRankList(i,"XuanZhanType")
            if string.find(RivalGuildNameOnly, enemyGuildName) then
                return 1
            end
        end
        return 0
    ]], enemyGuildName))

    if tonumber(is_fight) == 1 then
        MentalTip(string.format("��ǰ�С�%s���Ļ�", enemyGuildName))
        return true
    else
        return false
    end
end

-- ������ ------------------------------------------------------------------------
-- �ж��Ƿ��к��������
waitInCity = false
local guildFireBlack = StringSplit(��������, "|")
for i = 1, #guildFireBlack do
    local hasBlackFire = judgeGuildWar(guildFireBlack[i])
    if hasBlackFire then
        waitInCity = true
        break
    end
end

if waitInCity then
    MentalTip("���İ����ں����������, �س�����ʯ��")
    ִ�й���("�سǴ���")
    ִ�й���("ͬ����Ϸʱ��")
    while true do
        LUA_Call([[setmetatable(_G, {__index = ChatFrame_Env});Chat_ChangeTabIndex(2);]])
        local cur_h, cur_m, cur_s, _ = GetCurrentTime()
        if cur_h == 23 and cur_m == 55 and cur_s == 59 then
            ִ�й���("��ֲ���")
            break
        end
        ִ�й���("��������")
        ִ�й���("��ֲ���")
        ��ʱ(60000)
    end
end