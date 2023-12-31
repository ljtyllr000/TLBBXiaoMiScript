function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."【雨夜出品,必是精品】".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function JudgeHasAgname(Agname)
    -- 判断是否有该称号
    local hasChengHao = LUA_取返回值(string.format([[
        local targetAgname = "%s"
        local nAgnameNum = Player:GetAgnameNum();
        for k=0, nAgnameNum-1 do
            local szAgnameName, _ = Player:EnumAgname(k, "name", 0);
            -- local effect = Player:EnumAgname(k, "effect", 0, 0)
            if string.find(szAgnameName, targetAgname) then
                return 1
            end
        end
        return 0
    ]], Agname))
    return hasChengHao
end

function MoveToNPC(NPCCity, x, y)
    while true do
        跨图寻路(NPCCity, x, y)
        延时(500)
        local myX = 获取人物信息(7)
        local myY = 获取人物信息(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

function PiaoMiaoFengAgname()
    取出物品("缥缈玄符")
    local AgnameList = { '缥缈之锋芒初现', '缥缈之豪情无双', '缥缈之战无不胜', '缥缈之我意纵横', '缥缈之唯我独尊', '缥缈之独步天下' }
    if tonumber(JudgeHasAgname("缥缈之独步天下")) == 1 then
        MentalTip("您已拥有【缥缈之独步天下】称号, 即将销毁缥缈玄符")
        取出物品("缥缈玄符")
        延时(1000)
        自动清包("缥缈玄符")
    else
        MentalTip("前往 楼兰（193, 224）程青霜处兑换【缥缈峰】称号")
        MoveToNPC("楼兰", 193, 224)
        延时(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                对话NPC("程青霜")
                延时(1000)
                NPC二级对话("缥缈玄符兑换奖励")
                延时(1000)
                NPC二级对话(agname)
                延时(1000)
                NPC二级对话("我要兑换")
                延时(1000)
            end
        end

    end
end

function BingShengQiZhenAgname()
    local AgnameList = { '侠者仁心', '杀阵行者', '雄才伟略', '先圣遗风', '鬼谷无双' }
    取出物品("征南先锋印")
    if tonumber(JudgeHasAgname("鬼谷无双")) == 1 then
        MentalTip("您已拥有【鬼谷无双】称号, 即将销 征南先锋印")
        取出物品("征南先锋印")
        延时(1000)
        自动清包("征南先锋印")
    else
        MentalTip("前往 洛阳（271, 202）郭天信处兑换【兵圣奇阵】称号")
        MoveToNPC("洛阳", 271, 202)
        延时(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                对话NPC("郭天信")
                延时(1000)
                NPC二级对话("兑换称号")
                延时(1000)
                NPC二级对话('兑换称号' .. agname)
                延时(1000)
                NPC二级对话("确定")
                延时(1000)
            end
        end
    end
end

function FuDiAgname()
    local AgnameList = { '无量洞天锋芒现', '逍遥仙府武凌云', '琅嬛玉宇纵乾坤', '傲凌天山震九州' }
    取出物品("无崖丹青")
    if tonumber(JudgeHasAgname("傲凌天山震九州")) == 1 then
        MentalTip("您已拥有【傲凌天山震九州】称号, 即将销 无崖丹青")
        取出物品("无崖丹青")
        延时(1000)
        自动清包("无崖丹青")
    else
        MentalTip("前往 大理（293, 92）李青萝处兑换【琅嬛福地】称号")
        MoveToNPC("大理", 293, 92)
        延时(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                对话NPC("李青萝")
                延时(1000)
                NPC二级对话("兑换琅嬛福地称号")
                延时(1000)
                NPC二级对话(agname)
                延时(1000)
            end
        end
    end
end

function LaoSanAgname()
    local AgnameList = { '剿匪义士', '破匪侠士', '镇匪英侠', '天下匪见愁' }
    if tonumber(JudgeHasAgname("天下匪见愁")) == 1 then
        MentalTip("您已拥有【天下匪见愁】称号，跳过")
    else
        MentalTip("前往 苏州 钱宏宇（134, 260）钱宏宇处领取【三才峡谷】称号")
        MoveToNPC("苏州", 134, 260)
        延时(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                对话NPC("钱宏宇")
                延时(1000)
                NPC二级对话("领取称号")
                延时(1000)
                NPC二级对话("领取新的称号")
                延时(1000)
            end
        end
    end
end

function FanZeiAgname()
    local AgnameList = { '平贼士兵', '平贼队长', '平贼统领', '荡寇将军', '荡寇元帅' }
    if tonumber(JudgeHasAgname("荡寇元帅")) == 1 then
        MentalTip("您已拥有【荡寇元帅】称号，跳过")
    else
        MentalTip("前往 洛阳（296, 243）章惇处领取【反贼入侵】称号")
        MoveToNPC("洛阳", 296, 243)
        延时(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                对话NPC("章惇")
                延时(1000)
                NPC二级对话("我要兑换我的称号")
                延时(1000)
            end
        end
    end
end

function SongLiaoAgname()
    local AgnameList = { '过河卒', '拐脚马', '隔山炮', '纵横車', '国士无双' }
    if tonumber(JudgeHasAgname("国士无双")) == 1 then
        MentalTip("您已拥有【国士无双】称号，跳过")
    else
        MentalTip("前往 苏州（293, 241）刘博处领取【宋辽大战】称号")
        MoveToNPC("苏州", 293, 241)
        延时(1000)

        for _, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                对话NPC("刘博")
                延时(1000)
                NPC二级对话("领取宋辽大战称号")
                延时(1000)
                NPC二级对话(agname, 1)
                延时(1000)
            end
        end
    end
end

function ShuaXingAgname()
    local AgnameList = {'持国天王' }
    local itemIndex = { 1 }
    if tonumber(JudgeHasAgname("持国天王")) == 1 then
        MentalTip("您已拥有【持国天王】称号，跳过")
    else
        MentalTip("前往 洛阳（355, 236）付云伤处 云锦行中购买【刷星】称号")
        MoveToNPC("洛阳", 355, 236)
        延时(1000)

        for index, agname in pairs(AgnameList) do
            if tonumber(JudgeHasAgname(agname)) ~= 1 then
                对话NPC("付云伤")
                延时(1000)
                NPC二级对话("云锦行")
                延时(1000)
                if index == 4 then
                    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_PageDown();]])
                    延时(1000)
                end
                LUA_Call(string.format([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_Clicked(%d)]], itemIndex[index]))  -- 点击
                延时(100)
                LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy2_Env});ActivitySchedule_MBuy2_OK_Clicked();]])  -- 点击购买
            end
        end

        右键使用物品("称号：广目天王")
        右键使用物品("称号：多闻天王")
        右键使用物品("称号：增长天王")
        右键使用物品("称号：持国天王")

    end

end

-- main ---------------------------------------------------------------
PiaoMiaoFengAgname()
LaoSanAgname()
SongLiaoAgname()
FanZeiAgname()
BingShengQiZhenAgname()
FuDiAgname()
ShuaXingAgname()
