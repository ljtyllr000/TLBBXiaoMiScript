BOSS名称 = "玄击金刚"
BOSS坐标X, BOSS坐标Y = 264, 259   -- (264, 259),

使用八阵图 = 0  -- 0:不使用, 1:使用
使用诛仙阵 = 0  -- 0:不使用, 1:使用
使用移花接木 = 0

-- 同一个门派的同一时间使用的技能数量不要超过2个，否则第三个开始会失效，例如：天山 移花+抗失明2个技能已达上限
提前下八阵图时间 = 36  -- 这个时间需要包含运气时间，如果 使用八阵图 设置为0, 该配置不生效
提前下诛仙阵时间 = 16  -- 这个时间需要包含运气时间，如果 使用诛仙阵 设置为0, 该配置不生效
提前用惊涛时间 = 3   -- 提前3秒
提前用月落时间 = 3
提前开风雷时间 = 2
提前开移花时间 = 2
提前天山半怒抗失明 = 2

是否提前去定位 = 1  -- 0:不去定位, 1:去定位。不去定位需要把要飞的土灵珠放在最前面
提前秒钟去定位 = 600 -- 提前600秒去定位
提前秒钟飞定位 = 10  -- 提前10秒飞定位

是否开模式 = 1 -- (勿改)0:不开模式, 1:开模式
模式形式 = "帮会"   -- (勿改)和平、个人、组队、帮会、善恶
开始模式名单 = "" -- (勿改)多个为角色名用 | 分隔; "", 表示不判断名字，峨眉逍遥门派开模式

宝宝名字 = "．"

是否分散站位 = 1  -- (勿改)0:不分散，1:分散战位
分散站位距离 = 5   -- 6个点，如果是近战就站点上

使用土灵珠 = 1  -- (勿改)0:不使用, 1:使用
提前使用控制技能 = 1  -- (勿改)提前使用控制技能，月落、惊涛

存仓物品 = ""

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
人物名称, 门派, PID, 远近攻击, 内外攻击, 角色账号, 门派地址, 技能状态, 性别 = 获取人物属性()

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."【战为不负卿】".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function AcquireServerName()
    os.exit()
    local tem = LUA_取返回值([[
			local ZoneWorldID = DataPool:GetSelfZoneWorldID()
			local strName = DataPool:GetServerName( ZoneWorldID )
			return strName 
			]])
    return tem
end

-------------------------------------------------------------------------------------------------------
---------------------------------------------时间处理模块-------------------------------------------------
function GetCurrentTime()
    local cur_hour = tonumber(os.date("%H", os.time()))
    local cur_minute = tonumber(os.date("%M", os.time()))
    local cur_second = tonumber(os.date("%S", os.time()))
    local current_timestamp = tonumber(os.time())
    return cur_hour, cur_minute, cur_second, current_timestamp
end

function GetCurrentDate()
    local cur_year = tonumber(os.date("%Y", os.time()))
    local cur_month = tonumber(os.date("%m", os.time()))
    local cur_day = tonumber(os.date("%d", os.time()))
    return cur_year, cur_month, cur_day
end

function NiMa()
    -- 限定过期时间, 自己用不调用该函数
    local curDay = LUA_取返回值("return DataPool:GetServerDayTime();", "n", 1)
    if tonumber(curDay) >= 20230701 then
        return
    end
end

function GetBossRefreshInfo(cur_hour)
    -- 获取玄武岛、武夷、苍山、草原 boss下一波刷新时间, 以及地图
    if string.find(BOSS名称, "莽牯毒蛤") then
        if cur_hour < 12 then
            return 11, 30, "玄武岛"
        else
            return 20, 30, "玄武岛"
        end
    elseif string.find(BOSS名称, "冰妖") then
        if cur_hour < 12 then
            return 10, 30, "武夷"
        else
            return 17, 30, "武夷"
        end
    elseif string.find(BOSS名称, "玄击金刚") then
        if cur_hour < 12 then
            return 11, 30, "苍山"
        else
            return 22, 30, "苍山"
        end
    elseif string.find(BOSS名称, "冥虚奴") then
        if cur_hour < 12 then
            return 15, 30, "草原"
        else
            return 22, 30, "草原"
        end
    end
end
-------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------
---------------------------------------------珍兽操作模块-------------------------------------------------
function GetPetIndexByName(petName)
    -- 根据珍兽名字获取珍兽index
    local tem = LUA_取返回值(string.format([[
		    local nPetCount = Pet : GetPet_Count();
		    if nPetCount == 0  then
			   return -1
			end
			for k = 0, nPetCount - 1 do
			    local strName,strName2 = Pet:GetName(k)
				if string.find("%s", strName) then
				   return k;
				end
			end
			return -1
		]], petName), "n");
    return tonumber(tem)

end

function CallPetByIndex(nIndex)
    -- 根据珍兽index召唤宝宝
    LUA_Call(string.format([[
              Pet : Go_Fight(%d)
            ]], nIndex), "n");
end

function CheckAndCallPet(MyPetName)
    -- 获取珍兽在背包中的位置即index，然后召唤宝宝
    if tonumber(获取人物信息(18)) <= 0 then
        ind = tonumber(GetPetIndexByName(MyPetName))
        if ind >= 0 then
            CallPetByIndex(ind)
            延时(3000)
        else
            屏幕提示("没有这个宝宝" .. MyPetName)
        end
    end
end

function Pet_GetHPPercent(nIndex)
    -- 获取宝宝血量百分比
    return LUA_取返回值(string.format([[
	            
	            local nIndex = %d
				local intTemp = Pet : GetHP(nIndex)
				local intTemp2 = Pet: GetMaxHP(nIndex)	
                local HP_Percent = intTemp/intTemp2*100			
	            return HP_Percent
	 ]], nIndex), "n")
end

function Pet_GetHappy(nIndex)
    -- 获取宝宝快乐度
    return LUA_取返回值(string.format("return Pet : GetHappy(%d)", nIndex), "n")
end

function CheckPetHPAndHappyThenFeed(MyPetName)
    -- 检测宝宝血量百分比和快乐度，并自动喂养
    -- 检测宝宝血量低于90%，自动喂养
    -- 使用背包第一个道具喂养
    local index = tonumber(GetPetIndexByName(MyPetName))
    local feed_count = 0
    if index >= 0 and index ~= nil then
        while true do
            if feed_count >= 5 then
                break
            end
            if tonumber(Pet_GetHPPercent(index)) <= 90 then
                屏幕提示(MyPetName .. "血量少于百分之90自动喂养")
                LUA_Call(string.format([[
                  Pet:Feed(%d)
                ]], index), "n");
                feed_count = feed_count + 1
                延时(200)
            else
                break
            end
        end

        -- 检测宝宝快乐度小于60，自动喂养
        if tonumber(Pet_GetHappy(index)) <= 60 then
            屏幕提示(MyPetName .. "快乐少于百分之90自动喂养")
            LUA_Call(string.format([[
          Pet:Dome(%d)
		]], index), "n");
        end

        延时(200)
    end
end

function UsePetSkillBySkillName(skillName)
    -- 根据珍兽技能名字使用技能
    --name: 冰爆
    MentalTip("珍兽使用技能:" .. skillName)
    LUA_Call(string.format([[
	local count =Pet:GetPetSkillBarItemCount();
	if count > 0 then
	for i=0,count-1 do
			local act = Pet:EnumPetSkillBarItem(i)
			local name = act:GetName()
			if string.find(name,"%s") then
				setmetatable(_G, {__index = MainMenuBar_3_Env});MainMenuBar_3_Clicked(i+1)
			end
		end
	end
	]], skillName), "n");
end

function UsePetSkillBySkillLocation(skillLocation)
    -- 根据珍兽技能位置使用技能，1 和 2
    --高级冰爆 位置1
    if 到数值(获取人物信息(18)) ~= 0 then
        if skillLocation == 1 then
            LUA_Call("MainMenuBar_3_Clicked(1)")
        elseif skillLocation == 2 then
            LUA_Call("MainMenuBar_3_Clicked(2)")
        end
    end
end
--------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------
-------------------------------------------人物信息操作---------------------------------------------------------
function GetTeamMemberId()
    -- 获取本号在队伍中的位置，1~6
    人物名称, 门派1, PID, 远近攻击, 内外攻击, 角色账号, 门派地址, 技能状态, 性别 = 获取人物属性()
    for i = 1, 6 do
        名称, 等级, 门派, 血量, 地图, X坐标, Y坐标 = 组队_获取队员信息(i)
        if 人物名称 == 名称 then
            return i
        end
    end
    return -1
end


--去小状态
function CleanSmallBuff(mingcheng)
    LUA_Call(string.format([[
	local buff_num = Player:GetBuffNumber();
	for j = 1, buff_num do
		local szToolTips = Player:GetBuffToolTipsByIndex(j - 1);
		if string.find(szToolTips,"%s") then
			Player:DispelBuffByIndex(j - 1);
		end
	end
		]], mingcheng))
end

function GetRolePositionXY()
    -- 生成站位坐标
    local meleeSects = { '明教', '天山', '慕容', '丐帮', '少林' }
    for i = 1, #meleeSects do
        if 门派 == meleeSects[i] then
            return BOSS坐标X, BOSS坐标Y
        end
    end

    local positionX = BOSS坐标X
    local positionY = BOSS坐标Y
    if 是否分散站位 == 1 then
        if GetTeamMemberId() == 1 then
            positionX, positionY = BOSS坐标X + 分散站位距离, BOSS坐标Y + 分散站位距离  -- (x+n, y+n)
        elseif GetTeamMemberId() == 2 then
            positionX, positionY = BOSS坐标X + 分散站位距离, BOSS坐标Y  -- (x+n, y)
        elseif GetTeamMemberId() == 3 then
            positionX, positionY = BOSS坐标X - 分散站位距离, BOSS坐标Y  -- (x-n, y)
        elseif GetTeamMemberId() == 4 then
            positionX, positionY = BOSS坐标X, BOSS坐标Y + 分散站位距离  -- (x, y+n)
        elseif GetTeamMemberId() == 5 then
            positionX, positionY = BOSS坐标X - 分散站位距离, BOSS坐标Y - 分散站位距离  -- (x-n, y-n)
        elseif GetTeamMemberId() == 6 then
            positionX, positionY = BOSS坐标X + 分散站位距离, BOSS坐标Y - 分散站位距离  -- (x+n, y-n)
        end
    end
    return positionX, positionY
end
--------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------
-----------------------------------------人物攻击操作------------------------------------------------------
function UseRoleSkills(RoleSkill, skillTarget)
    -- 使用任务技能
    if tonumber(判断技能冷却(RoleSkill)) == 1 then
        SkillID = 获取技能ID(RoleSkill)
        使用技能(SkillID, skillTarget);
        延时(500)
    end
end

function UseRoleSkillAttack(attackTargetID)
    -- 人物组合技能，并使用
    --MentalTip('怪物ID:'..tostring(attackTargetID))
    if 门派 == "逍遥" then
        UseRoleSkills("宇越星现", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
        UseRoleSkills("溪山行旅", attackTargetID);
    elseif 门派 == "唐门" then
        UseRoleSkills("落日追星", attackTargetID);
        UseRoleSkills("九天揽月", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
        UseRoleSkills("铁蒺藜", attackTargetID);
    elseif 门派 == "武当" then
        UseRoleSkills("宙耀七星", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
        UseRoleSkills("游刃有余", attackTargetID);
    elseif 门派 == "天龙" then
        UseRoleSkills("黄龙怒鸣", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "鬼谷" then
        UseRoleSkills("万宿辰光", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("一气三清", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "天山" then
        UseRoleSkills("洪涛碧浪", attackTargetID);
        UseRoleSkills("阳歌天钧", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
    elseif 门派 == "明教" then
        UseRoleSkills("天火穹燃", attackTargetID);
        UseRoleSkills("炎龙无双", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "星宿" then
        UseRoleSkills("荒野幽魂", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("天地同寿", attackTargetID);
        UseRoleSkills("一日丧命散", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "峨嵋" then
        UseRoleSkills("混江破崖", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "慕容" then
        UseRoleSkills("沌异潮落", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "少林" then
        UseRoleSkills("玄印悟佛", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "丐帮" then
        UseRoleSkills("地沉陷痕", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("横扫乾坤", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "桃花岛" then
        UseRoleSkills("良夜游", attackTargetID);
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("人之可诛", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    elseif 门派 == "绝情谷" then
        UseRoleSkills("诛仙万象", attackTargetID);
        UseRoleSkills("暗器连击", attackTargetID);
    end
end

function UseRoleHideSkill()
    -- 使用初级影身
    if 判断技能冷却("初级隐遁") == 1 then
        MentalTip("我将自动隐身")
        local HideSkillID = 获取技能ID("初级隐遁")
        使用技能(HideSkillID)
    end
end

function SwitchRoleMode(RoleModeType)
    -- 切换到指定模式
    --屏幕提示("更换模式"..RoleModeType)
    if RoleModeType == "和平" then
        LUA_Call("Player:ChangePVPMode(0);")
    elseif RoleModeType == "个人" then
        LUA_Call("Player:ChangePVPMode(1);")
    elseif RoleModeType == "组队" then
        LUA_Call("Player:ChangePVPMode(3);")
    elseif RoleModeType == "帮会" then
        LUA_Call("Player:ChangePVPMode(4);")
    elseif RoleModeType == "善恶" then
        LUA_Call("Player:ChangePVPMode(2);")
    end
end

function OpenRoleMode()
    -- 指定人物开模式; 当开始模式名单为空时，有峨眉、逍遥、武当、丐帮开模式
    if 开始模式名单 == "" or string.find(开始模式名单, 人物名称, 1, true) then
        MentalTip(人物名称 .. "打开模式: " .. 模式形式)
        SwitchRoleMode(模式形式);
        延时(20)
    end
end

function GetCurTargetHPPercent()
    -- 获取挡圈对象血量
    if 窗口是否出现("TargetFrame") == 1 then
        local num = LUA_取返回值("return Target:GetHPPercent()")
        return tonumber(num)
    end
    return -1
end
--------------------------------------------------------------------------------------------------------------


function GoToStore()
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
    end
    跨图寻路("洛阳", 185, 335)
    对话NPC("龙霸天")
    延时(1000)
    NPC二级对话("满怒治疗")
    延时(1000)
    NPC二级对话("是")
    延时(500)
    NPC二级对话("给珍兽恢复气血")
    延时(1000)
    NPC二级对话("是")
    延时(500)

    跨图寻路("苏州", 343, 246)
    延时(500)
    --if 对话NPC("梁伙计") == 1 then
    --    NPC二级对话("打开银行", 0)
    --    延时(1000)
    --    if 窗口是否出现("Bank") == 1 then
    --        LUA_Call("setmetatable(_G, {__index = Bank_Env});Bank_ShowAll_Clicked();")  --变大仓库
    --    end
    --    if 窗口是否出现("BigBank") == 1 then
    --        延时(1000)
    --        LUA_Call("setmetatable(_G, {__index = BigBank_Env});BigBank_PackUp_Clicked();") --整理仓库
    --        延时(1000)
    --        LUA_Call("setmetatable(_G, {__index = BigBank_Env});BigBank_PackUp_Clicked();") --整理仓库
    --        延时(1000)
    --        坐骑_下坐骑();
    --        延时(1000)
    --        存物品(存仓物品)
    --        break
    --    end
    --end
end

--------------------------------------------------------------------------------------------------------------
------------------------------------------------土灵珠操作模块----------------------------------------------------
function UseTuLingZhuTransmit()
    -- 使用土灵珠传送
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

function UseTuLingZhuPositioning()
    -- 使用土灵珠定位
    if 获取背包物品数量("土灵珠") > 0 then
        右键使用物品("土灵珠", 1);
        延时(1000)
        if 窗口是否出现("Item_TuDunZhu") == 1 then
            LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
            延时(1000)
            LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
        end
    end
end

function main()
    执行功能("同步游戏时间")
    MentalTip("此脚本仅用于学习研究使用，用于其它途径与本人无关，出现任何问题概不负责！！！")
    local 人物名称, 门派, PID, 远近攻击, 内外攻击, 角色账号, 门派地址, 技能状态, 性别 = 获取人物属性()

    local cur_hour, _, _, _ = GetCurrentTime()

    -- 生成下一波boss刷新的时间戳
    local year, month, day = GetCurrentDate()
    local todayTimestamp = tonumber(os.time({ year = year, month = month, day = day, hour = 0, min = 0, sec = 0 }))
    local bossRefreshHour, bossRefreshMinute, bossLocation = GetBossRefreshInfo(cur_hour)
    local bossRefreshTimestamp = todayTimestamp + bossRefreshHour * 60 * 60 + bossRefreshMinute * 60
    local bossRefreshTimeString = tostring(bossRefreshHour) .. ":" .. tostring(bossRefreshMinute)

    MentalTip(string.format("选择的BOSS名称:%s,地图:%s: (%d,%d)", BOSS名称, bossLocation, BOSS坐标X, BOSS坐标Y));

    -- 生成6个队员分散站位的坐标点, 近战站点上，远攻分散站
    local positionX, positionY = GetRolePositionXY()

    -- 倒计时定位时间
    local leftTimestamp = bossRefreshTimestamp - tonumber(os.time())
    if 是否提前去定位 == 1 then
        while true do
            leftTimestamp = bossRefreshTimestamp - tonumber(os.time())
            if leftTimestamp >= 提前秒钟去定位 then
                MentalTip(string.format("%s:刷新时间:%s|刷新时间戳:%d|倒计时:%d|提前[%d]秒出发", BOSS名称, bossRefreshTimeString, bossRefreshTimestamp, leftTimestamp, 提前秒钟去定位))
                延时(1000)
            elseif leftTimestamp >= 300 and leftTimestamp < 提前秒钟去定位 then
                MentalTip(string.format("%s:刷新时间:%s|刷新时间戳:%d|开始出发定位啦!!!", BOSS名称, bossRefreshTimeString, bossRefreshTimestamp))
                MentalTip("默认使用【背包最前面的土灵珠定位】，脚本运行期间请勿整理背包！！！")
                if 使用土灵珠 == 1 then
                    while true do
                        -- 确保到达预定的坐标点
                        跨图寻路("苍山", 193, 108)
                        跨图寻路(bossLocation, positionX, positionY)
                        延时(2000)
                        local now_x = 获取人物信息(7)
                        local now_y = 获取人物信息(8)
                        if tonumber(now_x) == tonumber(positionX) and tonumber(now_y) == tonumber(positionY) then
                            break
                        end
                    end
                    UseTuLingZhuPositioning()
                    延时(5000)
                    break
                end
            else
                MentalTip("当前距离Boss刷新时间小于5分钟，不再去定位，防止被敌对发现")
                break
            end
        end
    end


    -- 定位后回城
    延时(2000)
    执行功能("大理回城")
    延时(2000)
    跨图寻路("大理", 159, 51)
    延时(2000)
    坐骑_下坐骑()
    延时(2000)

    -- 召唤宝宝, 并喂养
    CheckPetHPAndHappyThenFeed(宝宝名字)
    CheckAndCallPet(宝宝名字)
    CheckPetHPAndHappyThenFeed(宝宝名字)
    延时(2000)

    -- 提前n秒飞定位到点
    local flyLeftTimestamp = bossRefreshTimestamp - tonumber(os.time())
    while true do
        if flyLeftTimestamp > 提前秒钟飞定位 then
            flyLeftTimestamp = bossRefreshTimestamp - tonumber(os.time())
            MentalTip(string.format("%s:刷新时间:%s|刷新时间戳:%d|倒计时:%d|提前[%d]秒飞定位到点", BOSS名称, bossRefreshTimeString, bossRefreshTimestamp, flyLeftTimestamp, 提前秒钟飞定位))
            延时(1000)
        else
            MentalTip(门派 .. " 开始飞定位!!!")
            if 门派 == "逍遥" then
                OpenRoleMode()  -- 起飞前 逍遥开模式
            elseif 门派 == "峨嵋" then
                OpenRoleMode()  -- 起飞前 峨嵋开模式
            end
            延时(500)
            UseTuLingZhuTransmit()  -- 起飞
            延时(500)
            break
        end
    end

    -- 打Boss
    while true do
        怪物名称, 怪物ID, 物品X坐标, 物品Y坐标, 目标血量, 物品距离, 物品类别, 物品归属, 怪物判断, 头顶标注 = 遍历周围物品(4, BOSS名称, 15.5)
        屏幕提示(怪物ID)
        屏幕提示(目标血量)
        -- 提前扔控制技能，如月落、八阵等，开状态，如风雷、移花等
        if 提前使用控制技能 == 1 then
            local refreshLeftTime = bossRefreshTimestamp - tonumber(os.time())
            if refreshLeftTime > 0 then
                MentalTip(string.format("%s:刷新倒计时:%d", BOSS名称, refreshLeftTime))
            end

            -- 提前使用门派控制
            if 门派 == "逍遥" then
                if os.time() == bossRefreshTimestamp - 提前下八阵图时间 and 使用八阵图 == 1 then
                    --MentalTip("八阵图")
                    八阵图技能ID = 获取技能ID("八阵图")
                    使用技能(八阵图技能ID);
                    延时(500)
                elseif os.time() == bossRefreshTimestamp - 提前下诛仙阵时间 and 使用诛仙阵 == 1 then
                    --MentalTip("诛仙阵")
                    诛仙阵技能ID = 获取技能ID("诛仙阵")
                    使用技能(诛仙阵技能ID);
                    延时(500)
                elseif os.time() == bossRefreshTimestamp - 提前用惊涛时间 then
                    --MentalTip("惊涛骇浪")
                    惊涛骇浪技能ID = 获取技能ID("惊涛骇浪")
                    使用技能(惊涛骇浪技能ID);
                    延时(500)
                end
            elseif 门派 == "唐门" then
                if os.time() == bossRefreshTimestamp - 提前开风雷时间 then
                    MentalTip("风雷万钧")
                    风雷阵技能ID = 获取技能ID("风雷万钧")
                    使用技能(风雷阵技能ID);
                    延时(500)
                end
            elseif 门派 == "峨嵋" then
                if os.time() == bossRefreshTimestamp - 提前用月落时间 then
                    --MentalTip("月落西山")
                    月落西山技能ID = 获取技能ID("月落西山")
                    使用技能(月落西山技能ID);
                    延时(500)
                end
            elseif 门派 == "天山" then
                if os.time() == bossRefreshTimestamp - 提前天山半怒抗失明 then
                    阳春白雪技能ID = 获取技能ID("阳春白雪")
                    使用技能(阳春白雪技能ID, -1);
                    延时(500)
                end
                if os.time() == bossRefreshTimestamp - 提前开移花时间 and 使用移花接木 == 1 then
                    --MentalTip("移花接木")
                    移花接木技能ID = 获取技能ID("移花接木")
                    使用技能(移花接木技能ID, -1);
                    延时(500)
                end
            end
        end

        if 怪物ID > 0 then
            if 目标血量 > 0 then
                UseRoleSkillAttack(怪物ID)
                延时(150)
                UseRoleSkillAttack(怪物ID);
                延时(150)
                UseRoleSkillAttack(怪物ID);
                延时(150)
                UseRoleSkillAttack(怪物ID);
                延时(150)
            else
                MentalTip("BOSS怪物死亡啦")
                延时(2000)
                自动捡包();
                延时(500)
                自动捡包();
                延时(500)
                自动捡包();
                延时(500)
                自动捡包();
                延时(500)
                break
            end
        end

        -- 死亡出窍，自动定位回点捡包
        if 判断人物死亡() == 1 then
            死亡出窍()
            出监狱地府()
            延时(500)
            UseTuLingZhuTransmit()
            延时(2000)
            自动捡包();
            延时(500)
            自动捡包();
            延时(500)
        end
        延时(150)
    end

end


main()
自动捡包();
延时(150)
GoToStore() -- 回城存仓
SwitchRoleMode("和平")
