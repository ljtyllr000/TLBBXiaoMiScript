转团的队队长名字 = "′云．"
组团等待时间 = 120   -- 单位秒

BOSS名称 = "莽牯毒蛤"
BOSS坐标X, BOSS坐标Y = 70, 140

帮火黑名单 = "不灭神话"  -- 多个帮用 | 分开
城里等待任务结束时间 = 10 * 60   -- 单位秒, 有黑名单帮火时, 号在城里等待的时间

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."【雨夜出品,必是精品】".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function judgeInRaid()
    return LUA_取返回值([[return Player:IsInRaid()]])
end

function GetBossInfo()
    if string.find(BOSS名称, "莽牯毒蛤") then
        return "玄武岛"
    elseif string.find(BOSS名称, "冰妖") then
        return "武夷"
    elseif string.find(BOSS名称, "玄击神将") then
        return "苍山"
    elseif string.find(BOSS名称, "冥虚奴") then
        return "草原"
    end
end

function judgeGuildWar(enemyGuildName)
    LUA_Call([[
        City:AskEnemyList(0);
		City:AskEnemyList(1);
		City:GetGuildListWithCity();
    ]])
    延时(2000)

    local is_fight = LUA_取返回值(string.format([[
        local enemyGuildName = "%s"
        local nNum = City:GetEnemyNum(0);
        local ListIndex = nNum;
        local ButtonIndex;
        for i = 0, nNum-1 do
            local nGulidid      = City:EnumCityEnemy(0,i,"guildid");
            local szGuildName   = City:EnumCityEnemy(0,i,"name");
            local szLeftTime    = City:EnumCityEnemy(0,i,"lefttime");
            if string.find(enemyGuildName, szGuildName) then
                return 1
            end
        return 0
    ]], enemyGuildName))

    if tonumber(is_fight) == 1 then
        return true
    else
        return false
    end
end

function judgeGuildWar2(enemyGuildName)
    LUA_Call([[
        City:GetGuildListWithCity();
    ]])
    延时(2000)

    LUA_取返回值(string.format([[
        local enemyGuildName = "%s"
        local nRankListNum = City:GetBattleRankListNum();
        if nRankListNum == 0 then
            return 0;
        end

        for i = 0, nRankListNum-1 do
            local RivalGuildNameOnly = City:EnumBattleRankList(i,"RivalGuildNameOnly")
            local xzType             = City:EnumBattleRankList(i,"XuanZhanType")
            if string.find(enemyGuildName, szGuildName) then
                return 1
            end
        end
        return 0
    ]], enemyGuildName))

    if tonumber(is_fight) == 1 then
        return true
    else
        return false
    end
end

function GetTLZPos(TLZName, TLZNum)
    return LUA_取返回值(string.format([[
        local currNum = DataPool:GetBaseBag_Num();
        local TLZName = "%s"
        local TLCNum = %d
        local TLZCount = 0
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"、"material"、"quest"
            local sName = theAction:GetName();
            if string.find(TLZName, sName) ~= nil then
                TLZCount = TLZCount + 1
                if TLZCount == TLCNum then
                    return i
                end
            end
        end
        return -1
    ]], TLZName, tonumber(TLZNum)))
end

function UseTuLingZhuPositioning()
    -- 定位第1个土灵珠
    if 获取背包物品数量("土灵珠") > 0 then
        右键使用物品("土灵珠", 1);
        延时(1000)
        if 窗口是否出现("Item_TuDunZhu") == 1 then
            LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
            延时(1000)
            LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
        end
    end
    延时(1000)

    -- 定位第2个土灵珠
    local secondTLZPos = GetTLZPos("土灵珠", 2)
    if tonumber(secondTLZPos) == -1 then
        return
    end

    local row = math.floor(tonumber(secondTLZPos) / 10)
    local col = math.floor(tonumber(secondTLZPos) % 10)
    if col == 0 then
        col = 10
    else
        row = row + 1
    end
    LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))
    延时(1000)
    if 窗口是否出现("Item_TuDunZhu") == 1 then
        LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
        延时(1000)
        LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
    end
end

function UseTuLingZhuTransmit()
    if 获取背包物品数量("土灵珠") > 0 then
        坐骑_下坐骑();

        右键使用物品("土灵珠", 1);   -- 默认使用第一个
        延时(1000)
        if 窗口是否出现("Item_TuDunZhu") == 1 then
            LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_Cancel_Clicked(1);");
            延时(2000)
        end
    end
end

function UseRoleSkills(RoleSkill, skillTarget)
    if tonumber(判断技能冷却(RoleSkill)) == 1 then
        SkillID = 获取技能ID(RoleSkill)
        使用技能(SkillID, skillTarget);
        延时(150)
    end
end

function UseRoleSkills2(RoleSkill)
    if tonumber(判断技能冷却(RoleSkill)) == 1 then
        local SkillID = 获取技能ID(RoleSkill)
        使用技能(SkillID);
        延时(150)
    end
end

function UseRoleSkillAttack(attackTargetID)
    -- 人物组合技能，并使用
    if 门派 == "逍遥" then
        UseRoleSkills("宇越星现", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("落英剑", attackTargetID);
    elseif 门派 == "唐门" then
        UseRoleSkills("九天揽月", attackTargetID);
        UseRoleSkills("落日追星", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("孔雀翎", attackTargetID);
        UseRoleSkills("铁蒺藜", attackTargetID);
        UseRoleSkills("流云矢", attackTargetID);
    elseif 门派 == "丐帮" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("亢龙有悔", attackTargetID);
        UseRoleSkills("暗器投掷", attackTargetID);
        UseRoleSkills("棒打狗头", attackTargetID);
        UseRoleSkills("蟠龙击", attackTargetID);
    elseif 门派 == "鬼谷" then
        UseRoleSkills("万宿辰光", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("一气三清", attackTargetID);
        UseRoleSkills("未老先衰", attackTargetID);
        UseRoleSkills("乾坤引", attackTargetID);
    elseif 门派 == "天山" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("洪涛碧浪", attackTargetID);
        UseRoleSkills("阳歌天钧", attackTargetID);
        UseRoleSkills("内劲攻击", attackTargetID);
        UseRoleSkills("雁南飞", attackTargetID);
    elseif 门派 == "峨嵋" then
        UseRoleSkills("混江破崖", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("貂蝉拜月", attackTargetID);
    elseif 门派 == "星宿" then
        UseRoleSkills("天地同寿", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("笑里藏刀", attackTargetID);
        UseRoleSkills("化骨绵掌", attackTargetID);
        UseRoleSkills("蓝砂手", attackTargetID);
    elseif 门派 == "武当" then
        UseRoleSkills("宙耀七星", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("仙人指路", attackTargetID);
        UseRoleSkills("玉女穿梭", attackTargetID);
        UseRoleSkills("游刃有余", attackTargetID);
        UseRoleSkills("八卦掌", attackTargetID);
    elseif 门派 == "天龙" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("中冲剑", attackTargetID);
        UseRoleSkills("少泽剑", attackTargetID);
        UseRoleSkills("商阳剑", attackTargetID);
        UseRoleSkills("黄龙怒鸣", attackTargetID);
        UseRoleSkills("万岳朝宗", attackTargetID);
        UseRoleSkills("一阳指", attackTargetID);
        UseRoleSkills("正阳手", attackTargetID);
    elseif 门派 == "慕容" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("内劲攻击", attackTargetID);
        UseRoleSkills("凌神式", attackTargetID);
        UseRoleSkills("沌异潮落", attackTargetID);
        UseRoleSkills("柳拂衣", attackTargetID);
    elseif 门派 == "少林" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("内劲攻击", attackTargetID);
        UseRoleSkills("调虎离山", attackTargetID);
        UseRoleSkills("玄印悟佛", attackTargetID);
        UseRoleSkills("大力金刚掌", attackTargetID);
        UseRoleSkills("伏虎拳", attackTargetID);
    elseif 门派 == "明教" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("内劲攻击", attackTargetID);
        UseRoleSkills("天火燃穹", attackTargetID);
        UseRoleSkills("火烧赤壁", attackTargetID);
        UseRoleSkills("炎龙无双", attackTargetID);
        UseRoleSkills("水淹七军", attackTargetID);
        UseRoleSkills("摧心掌", attackTargetID);
    elseif 门派 == "桃花岛" then
        UseRoleSkills("人之可诛", attackTargetID);
        UseRoleSkills("良夜游", attackTargetID);
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("雅颂之音", attackTargetID);
    elseif 门派 == "绝情谷" then
        if tonumber(myLevel) >= 90 then
            UseRoleSkills("诛仙万象", attackTargetID);
            UseRoleSkills("暗器连击", attackTargetID);
        end
        UseRoleSkills("烈火燎情", attackTargetID);
        UseRoleSkills("刃击千里", attackTargetID);
    end
end

function UseEnhancedSkill()
    if 门派 == "唐门" then
        UseRoleSkills2("风雷万钧")
    elseif 门派 == "星宿" then
        UseRoleSkills2("经脉逆行")
    elseif 门派 == "慕容" then
        UseRoleSkills2("七霞映日")
    elseif 门派 == "明教" then
        UseRoleSkills2("怒火连斩")
        UseRoleSkills2("纯阳无极")
    elseif 门派 == "峨嵋" then
        UseRoleSkills2("斩情诀")
    end
end

function StringSplit(str, reps)
    -- 字符串切割
    local resultStrList = {}
    string.gsub(str, '[^' .. reps .. ']+',
            function(w)
                table.insert(resultStrList, w)
            end
    )
    return resultStrList
end

function BackToCity()
    -- 回城
    local current_map = 获取人物信息(16)
    local mainCity = { '大理', '洛阳', '苏州', '楼兰' }
    local inMainCity = 0
    for k, value in pairs(mainCity) do
        if value == current_map then
            inMainCity = 1
            break
        end
    end
    if inMainCity == 1 then
        -- 在主城就不使用定位回城，节省纸飞机
        return
    end

    local downZQ = 0
    while true do
        if downZQ >= 3 then
            break
        end
        if tonumber(获取人物信息(13)) == 0 then
            坐骑_下坐骑()
            延时(1000)
        else
            break
        end
        downZQ = downZQ + 1
    end

    if 获取背包物品数量("紫色定位符") > 0 then
        右键使用物品("紫色定位符")
        延时(1500)
    elseif 获取背包物品数量("红色定位符") > 0 then
        右键使用物品("红色定位符")
        延时(1500)
    elseif 获取背包物品数量("蓝色定位符") > 0 then
        右键使用物品("蓝色定位符")
        延时(1500)
    elseif 获取背包物品数量("白色定位符") > 0 then
        右键使用物品("白色定位符")
        延时(1500)
    elseif 获取背包物品数量("绿色定位符") > 0 then
        右键使用物品("绿色定位符")
        延时(1500)
    elseif 获取背包物品数量("黄色定位符") > 0 then
        右键使用物品("黄色定位符")
        延时(1500)
    elseif 获取背包物品数量("门派召集令") > 0 then
        右键使用物品("门派召集令")
        延时(1500)
    else
        执行功能("大理回城")
        延时(1500)
    end
end

function AddBuff()
    local downZQ = 0
    -- 下坐骑
    while true do
        if downZQ >= 3 then
            break
        end
        if tonumber(获取人物信息(13)) == 0 then
            坐骑_下坐骑()
            延时(1000)
        else
            break
        end
        downZQ = downZQ + 1
    end

    -- 使用暗器护体
    if 判断技能冷却("暗器护体") == 1 then
        local HideSkillID = 获取技能ID("暗器护体")
        使用技能(HideSkillID)
        延时(2000)
    end

    -- 判断是否结拜、使用阵法
    local jieBaiCount = LUA_取返回值([[
        local m_DataCount = DataPool:GetBrotherCount()
        return m_DataCount
    ]])
    LUA_Call([[DataPool:AskBrotherInfo()]])
    延时(1000)
    if tonumber(jieBaiCount) > 1 then
        if 判断技能冷却("天覆阵") == 1 then
            local HideSkillID = 获取技能ID("天覆阵")
            使用技能(HideSkillID)
            延时(2000)
        end
    end
end



-- 执行区域 ----------------------------------------------------------------------------------------------------
-- 执行区域 ----------------------------------------------------------------------------------------------------
-- 执行区域 ----------------------------------------------------------------------------------------------------
执行功能("同步游戏时间")
myName = 获取人物信息(12)
myLevel = 获取人物信息(26)

-- 判断是否有黑名单帮火
waitInCity = false
local guildFireBlack = StringSplit(帮火黑名单, "|")
for i = 1, #guildFireBlack do
    local hasBlackFire = judgeGuildWar(guildFireBlack[i])
    if hasBlackFire then
        waitInCity = true
        break
    end
end


-- 转团、申请进团
if myName == 转团的队队长名字 then
    LUA_Call([[setmetatable(_G, {__index = Union_Ensure_Env});Union_Ensure_OnEvent("OPNE_CREATE_RAID_CONFIRM");]])
    延时(2000)
    LUA_Call([[setmetatable(_G, {__index = Union_Ensure_Env});Union_Ensure_ConfirmClick();]])
    延时(1000)

    startTime = os.time()
    while true do
        if os.time() - startTime > 组团等待时间 then
            break
        end
        LUA_Call([[Player:SendAgreeRaidApplication(0);]])
        延时(800)
    end
else
    延时(10000)
    while true do
        if judgeInRaid() == '0' then
            执行功能("申请固定团长")
        else
            break
        end
        延时(1000)
    end
end


-- 回城加状态、满血满怒
BackToCity()
延时(2000)
AddBuff()
延时(1000)
执行功能("洛阳加血")


-- 没黑火的号上点等待、打怪
if not waitInCity then
    BossLocation = GetBossInfo()
    if string.find(BOSS名称, "苍山") then
        跨图寻路("洱海", 113, 130)
    end
    跨图寻路(BossLocation, BOSS坐标X, BOSS坐标Y)

    while true do
        local now_x = 获取人物信息(7)
        local now_y = 获取人物信息(8)
        if tonumber(now_x) == tonumber(BOSS坐标X) and tonumber(now_y) == tonumber(BOSS坐标Y) then
            break
        end
        跨图寻路(BossLocation, BOSS坐标X, BOSS坐标Y)
        延时(1000)
    end

    UseTuLingZhuPositioning()
    延时(500)

    坐骑_下坐骑()

    _, 门派, _, _, _, _, _, _, _ = 获取人物属性()
    while true do
        _, 怪物ID, _, _, 目标血量, _, _, _, _, _ = 遍历周围物品(4, BOSS名称, 15)

        if 判断人物死亡() == 1 then
            -- 死亡出窍，自动定位回点捡包，只回点一次，捡完包回城
            死亡出窍()
            出监狱地府()
            延时(1000)
            UseTuLingZhuTransmit()
            延时(2000)
        end

        UseEnhancedSkill()  -- 无脑开风雷万钧、经脉逆行、斩情诀等

        if 怪物ID > 0 then
            if 目标血量 > 0 then
                UseRoleSkillAttack(怪物ID)
                延时(110)
                UseRoleSkillAttack(怪物ID);
            else
                MentalTip("BOSS怪物死亡, 准备退团!")
                MentalTip("BOSS怪物死亡, 准备退团!")
                MentalTip("BOSS怪物死亡, 准备退团!")
                延时(2000)
                break
            end
        end

        延时(200)  -- 防止发包过快
    end

    延时(1000)

else
    local sleepCount = 0
    while true do
        if sleepCount >= 城里等待任务结束时间 then
            break
        end
        MentalTip(string.format("存在黑名单帮会帮火, 等待【%d】秒退出团队结束任务！", (城里等待任务结束时间 - sleepCount)))
        sleepCount = sleepCount + 1
        延时(1000)
    end
end

执行功能("退出团队")
