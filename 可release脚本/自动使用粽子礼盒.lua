function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function CheckJingTong()
    local needClean = 1
    for i = 1, #SelfEquipList do
        local isJTMaxLevel = LUA_ȡ����ֵ(string.format([[
            local equipIndex = %d
            local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(equipIndex)
            if tonumber(AttrLevel1) + tonumber(AttrLevel2) + tonumber(AttrLevel3) < 300 then
                return 0
            end
            return 1
        ]], SelfEquipList[i].equipIndex))

        if tonumber(isJTMaxLevel) == 0 then
            needClean = 0
            break
        end
    end

    if needClean == 1 then
        MentalTip("��ͨ����������ѡ��ʯ")
        return 1
    else
        return -1
    end
end

function CheckJTYS()
    local isMaxLevel = LUA_ȡ����ֵ([[
        local totalLevel = 0
        for i = 0, 4 do
            local BaoYuLevel = Player:GetFiveElements_ElementsLevel(i)
            totalLevel = totalLevel + BaoYuLevel
        end

        if totalLevel < 500 then
            return 0
        end
        return 1
    ]])

    if tonumber(isMaxLevel) == 1 then
        MentalTip("��������������ѡ��������")
        return 1
    end
    return -1
end

function CheckLiHuo()
    -- �������
    local level = tonumber(LUA_ȡ����ֵ("return Player:GetData('LEVEL')"))
    if level < 80 then
        MentalTip("���ĵȼ�С��80, ��������ʯ")
        return
    end

    local mainAttr = LUA_ȡ����ֵ(string.format([[
        local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
        local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
        local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
        local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
        local tt = { iIceAttack, iFireAttack, iThunderAttack, iPoisonAttack}
        if iIceAttack == math.max(unpack(tt)) then
           maxOfT = "attack_cold"
        elseif  iFireAttack==math.max(unpack(tt)) then
            maxOfT = "attack_fire"
        elseif  iThunderAttack==math.max(unpack(tt)) then
            maxOfT = "attack_light"
        elseif  iPoisonAttack==math.max(unpack(tt)) then
            maxOfT = "attack_poison"
        end
        return maxOfT
    ]]), "s")
    local attrName = "�޷�ʶ��"
    if mainAttr == "attack_cold" then
        attrName = "��"
    elseif mainAttr == "attack_fire" then
        attrName = "��"
    elseif mainAttr == "attack_light" then
        attrName = "��"
    elseif mainAttr == "attack_poison" then
        attrName = "��"
    end
    MentalTip("�����������ǣ�" .. attrName)
    if string.find(attrName, "�޷�ʶ��") then
        return
    end

    local needClean = 1
    -- ��������
    for i = 1, 6 do
        local JTAttrOK = LUA_ȡ����ֵ(string.format([[
            local equipIndex = %d
            local mainAttr = "%s"
            local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(equipIndex)
            if string.find(AttrName1, mainAttr) and string.find(AttrName2, mainAttr) and string.find(AttrName3, mainAttr) then
                return 1
            end
            return 0
        ]], SelfEquipList[i].equipIndex, 'con'))

        if tonumber(JTAttrOK) == 0 then
            needClean = 0
            break
        end
    end

    if needClean == 1 then
        -- ������Ʒ
        for i = 7, #SelfEquipList do
            local JTAttrOK = LUA_ȡ����ֵ(string.format([[
                local equipIndex = %d
                local mainAttr = "%s"
                local AttrLevel1,AttrName1,AttrLevel2,AttrName2,AttrLevel3,AttrName3 = DataPool:GetJingTongAttrInfo(equipIndex)
                if string.find(AttrName1, mainAttr) and string.find(AttrName2, mainAttr) and string.find(AttrName3, mainAttr) then
                    return 1
                end
            ]], SelfEquipList[i].equipIndex, mainAttr))

            if tonumber(JTAttrOK) == 0 then
                needClean = 0
                break
            end
        end
    end

    if needClean == 1 then
        MentalTip("��ͨ��ȫ��ϴ�ã���ѡ���")
        return 1
    else
        return -1
    end
end

-- -----------------------------------Main ---------------------------------------------------
ȡ����Ʒ("����Ͳ��")
ȡ����Ʒ("����Ʈ�����")
local ZXTZCount = ��ȡ������Ʒ����("����Ͳ��")
local PXGiftCount = ��ȡ������Ʒ����("����Ʈ�����")
if ZXTZCount > 0 then
    for i = 1, ZXTZCount do
        �Ҽ�ʹ����Ʒ("����Ͳ��")
        ��ʱ(100)
    end
end

PXGiftChoice = {
    [1] = "��ʯ",
    [2] = "������",
    [3] = "���",
    [4] = "��������"
}

if PXGiftCount > 0 then
    local choiceIndex
    if CheckJTYS() == -1 then
        MentalTip("ѡ���������")
        choiceIndex = 4
    elseif CheckJingTong() == -1 then
        MentalTip("ѡ���ʯ")
        choiceIndex = 1
    elseif CheckLiHuo() == -1 then
        MentalTip("ѡ�����")
        choiceIndex = 3
    else
        MentalTip("ѡ�������")
        choiceIndex = 2
    end
    for j = 1, PXGiftCount do
        �Ҽ�ʹ����Ʒ("����Ʈ�����")
        ��ʱ(1000)

        LUA_Call(string.format([[
            setmetatable(_G, {__index = DuanWu_BaoZongZi_PickOne_Env});DuanWu_BaoZongZi_PickOne_Select_Clicked(%d)
        ]], choiceIndex))  -- 1,2,3,4
        ��ʱ(500)
        LUA_Call([[
            setmetatable(_G, {__index = DuanWu_BaoZongZi_PickOne_Env});DuanWu_BaoZongZi_PickOne_OK_Clicked()
        ]])

    end
end
