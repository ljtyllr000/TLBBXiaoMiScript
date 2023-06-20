local SelfEquipList = {
    [1] = { name = "�·�", downIndex = 12, equipIndex = 2, equipName = "" }, --- �·�
    [2] = { name = "ñ��", downIndex = 1, equipIndex = 1, equipName = "" }, --- ñ��
    [3] = { name = "Ь��", downIndex = 6, equipIndex = 4, equipName = "" }, --- Ь��
    [4] = { name = "����", downIndex = 2, equipIndex = 15, equipName = "" }, --- ���
    [5] = { name = "����", downIndex = 4, equipIndex = 3, equipName = "" }, --- ����
    [6] = { name = "����", downIndex = 5, equipIndex = 5, equipName = "" }, --- ����
    [7] = { name = "����", downIndex = 13, equipIndex = 7, equipName = "" }, --- ����
    [8] = { name = "����", downIndex = 3, equipIndex = 14, equipName = "" }, --- ����
    [9] = { name = "��ָ��", downIndex = 7, equipIndex = 6, equipName = "" }, --- ��ָ���ϣ�
    [10] = { name = "��ָ��", downIndex = 8, equipIndex = 11, equipName = "" }, --- ��ָ���£�
    [11] = { name = "������", downIndex = 9, equipIndex = 12, equipName = "" }, --- �������ϣ�
    [12] = { name = "������", downIndex = 10, equipIndex = 13, equipName = "" }, --- �������£�
}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function CleanJTYS()
    -- �����������
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
        MentalTip("�����ȼ�����, �������پ�������")
        ȡ����Ʒ("��������")
        ��ʱ(1000)
        �Զ����("��������")
    end
end

function CleanJingJinShi()
    -- ������ʯ
    local level = tonumber(LUA_ȡ����ֵ("return Player:GetData('LEVEL')"))
    if level < 80 then
        MentalTip("���ĵȼ�С��80, ��������ʯ")
        return
    end

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
        MentalTip("�������о�ͨ����, �������پ���ʯ")
        ȡ����Ʒ("����ʯ")
        ��ʱ(1000)
        �Զ����("����ʯ")
    else
        MentalTip("�������о�ͨ��δȫ������")
    end
end

function CleanLiHuo()
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

            if tonumber(isJTMaxLevel) == 0 then
                needClean = 0
                break
            end
        end
    end

    if needClean == 1 then
        MentalTip("�������о�ͨ����ȫ������������, �����������")
        ȡ����Ʒ("���")
        ��ʱ(1000)
        �Զ����("���")
    else
        MentalTip("�����в���װ����Ҫ��ͨ��ϴ")
    end
end

function JudgeHasAgname(Agname)
    -- �ж��Ƿ��иóƺ�
    local hasChengHao = LUA_ȡ����ֵ(string.format([[
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

function CleanAgnameMaterial()
    -- ����ƺŶһ�����
    if tonumber(JudgeHasAgname("���֮��������")) == 1 then
        MentalTip("����ӵ�С����֮�������¡��ƺ�, ���������������")
        ȡ����Ʒ("�������")
        ��ʱ(1000)
        �Զ����("�������")
    else
        MentalTip("����δӵ�С����֮�������¡��ƺ�")
    end
    ��ʱ(500)

    if tonumber(JudgeHasAgname("������ɽ�����")) == 1 then
        MentalTip("����ӵ�С�������ɽ����ݡ��ƺ�, �����������µ���")
        ȡ����Ʒ("���µ���")
        ��ʱ(1000)
        �Զ����("���µ���")
    else
        MentalTip("����δӵ�С�������ɽ����ݡ��ƺ�")
    end
    ��ʱ(500)

    if tonumber(JudgeHasAgname("�����˫")) == 1 then
        MentalTip("����ӵ�С������˫���ƺ�, �������������ȷ�ӡ")
        ȡ����Ʒ("�����ȷ�ӡ")
        ��ʱ(1000)
        �Զ����("�����ȷ�ӡ")
    else
        MentalTip("����δӵ�С������˫���ƺ�")
    end
    ��ʱ(500)
end

function GetEquipStar(equipIndex)
    -- ��ȡװ������
    local tem = LUA_ȡ����ֵ(string.format([[
        local equipIndex = %d
		local ID = EnumAction(equipIndex,"equip"):GetID()
		if ID > 0 then
			local nQua = DataPool:GetEquipQual(equipIndex)
			return nQua
		end
		return -1
	]], tonumber(equipIndex)))
    return tonumber(tem)
end

function CleanAnQiMaterial()
    -- ������Ȫ��Ӣ�����嶾��
    local level = tonumber(LUA_ȡ����ֵ("return Player:GetData('LEVEL')"))
    if level < 80 then
        MentalTip("���ĵȼ�С��80, ��������Ȫ��Ӣ�����嶾��")
        return
    end

    local tem = GetEquipStar(17)
    if tonumber(tem) ~= -1 then
        if tonumber(tem) == 8 then
            MentalTip("���İ����Ѵ�8��, ����������Ȫ��Ӣ")
            ȡ����Ʒ("��Ȫ��Ӣ")
            ��ʱ(1000)
            �Զ����("��Ȫ��Ӣ")
        end
    end
    ��ʱ(1000)

    -- �����嶾��
    local anQiCuiduHP = LUA_ȡ����ֵ([[
        return LifeAbility:GetWearedDarkLY_CuiduHP(17) --ʵ�ʰ���Ѫ����
    ]])
    local anQiCuiduPro = LUA_ȡ����ֵ([[
        return LifeAbility:GetWearedDarkLY_CuiduPro(17) --ʵ�ʰ������Թ�
    ]])
    local anQiCuiduHit = LUA_ȡ����ֵ([[
        return LifeAbility:GetWearedDarkLY_CuiduHit(17) --ʵ�ʰ�������
    ]])

    if tonumber(anQiCuiduHP) >= 10688 then
        MentalTip("���İ���Ѫ�����Ѵ����ֵ, ���ٰ��嶾�顤Ԫ��")
        ȡ����Ʒ("�嶾�顤Ԫ��")
        ����Ʒ("�嶾�顤Ԫ��", ������Ʒ, 0, 1, 0)
        ��ʱ(500)
        �Զ����("�嶾�顤Ԫ��")
    end
    if tonumber(anQiCuiduPro) >= 176 then
        MentalTip("���İ���Ѫ�����Ѵ����ֵ, ���ٰ��嶾�顤����")
        ȡ����Ʒ("�嶾�顤����")
        ����Ʒ("�嶾�顤����", ������Ʒ, 0, 1, 0)
        ��ʱ(500)
        �Զ����("�嶾�顤����")
    end
    if tonumber(anQiCuiduHit) >= 2175 then
        MentalTip("���İ���Ѫ�����Ѵ����ֵ, ���ٰ��嶾�顤����")
        ȡ����Ʒ("�嶾�顤����")
        ����Ʒ("�嶾�顤����", ������Ʒ, 0, 1, 0)
        ��ʱ(500)
        �Զ����("�嶾�顤����")
    end
end

function CleanXBS()
    local weaponStarInfo = GetEquipStar(0)
    local weaponStar = tonumber(string.sub(tostring(weaponStarInfo), 1, 1))
    if weaponStar == 8 or weaponStar == 9 then
        MentalTip("�����ϵ������Ѵ�8�ǻ�9��, ��������ʯ")
        ȡ����Ʒ("����ʯ")
        ȡ����Ʒ("����ʯ��Ƭ")
        ��ʱ(500)
        �Զ����("����ʯ")
        �Զ����("����ʯ��Ƭ")
    else
        MentalTip("�����ϵ���δ8��")
    end
end

function GetLongWebExAttLevel(longWebExAttIndex)
    local tem = LUA_ȡ����ֵ(string.format([[
        local longWenAttrLevel = 0
        local ID =EnumAction(19,"equip"):GetID()
        if ID > 0 then
            local nExAttLevel = LifeAbility:GetWearedLongWen_AttLevel(19, %d-1)
            return nExAttLevel
        end
        return -1
	]], tonumber(longWebExAttIndex)))
    return tonumber(tem)
end

function DestroyMaterialBindItem(itemNameList)
    LUA_Call(string.format([[
        local targetItemName = "%s"
        local currNum = DataPool:GetMatBag_Num();
        for i=1, currNum do
            local theAction,bLocked = PlayerPackage:EnumItem("material", i-1);
            if theAction:GetID() ~= 0 then
                local itemName = theAction:GetName()   -- ��Ʒ����
                local szItemNum = theAction:GetNum();   -- ��Ʒ����
                local itemStatus = GetItemBindStatus(i);   -- ��Ʒ��״̬���ж�������
                if string.find(targetItemName, itemName) then
                    if itemStatus == 1 then
                        Clear_XSCRIPT()
                            Set_XSCRIPT_ScriptID( 124 )
                            Set_XSCRIPT_Function_Name( "OnDestroy" )
                            Set_XSCRIPT_Parameter( 0, i )
                            Set_XSCRIPT_ParamCount( 1 )
                        Send_XSCRIPT()
                    end
                end
            end
        end
    ]], itemNameList))
end

function CleanZLS()
    -- ���ٰ�׺��ʯ
    if GetLongWebExAttLevel(1) + GetLongWebExAttLevel(2) + GetLongWebExAttLevel(3) >= 30 then
        MentalTip("�����ϵ�������չ����ȫ����, ���ٰ�׺��ʯ")
        ȡ����Ʒ("׺��ʯ��Ԫ")
        ����Ʒ("׺��ʯ��Ԫ", ������Ʒ, 0, 1, 0)
        ȡ����Ʒ("׺��ʯ����")
        ����Ʒ("׺��ʯ����", ������Ʒ, 0, 1, 0)
        ȡ����Ʒ("׺��ʯ����")
        ����Ʒ("׺��ʯ����", ������Ʒ, 0, 1, 0)
        ��ʱ(500)
        �Զ����("׺��ʯ��Ԫ")
        �Զ����("׺��ʯ����")
        �Զ����("׺��ʯ����")
    else
        MentalTip("�����ϵ�������չ������δȫ����")
    end
end


-- ִ���߼� -------------------------------------------------------------------------
CleanLiHuo()  -- ���
��ʱ(1000)
CleanJingJinShi() -- ����ʯ
��ʱ(1000)
CleanJTYS()  -- ��������
��ʱ(1000)
CleanAgnameMaterial()  -- �ƺŶһ�����
��ʱ(1000)
CleanAnQiMaterial()  -- �������ǡ���չ������������
��ʱ(1000)
CleanXBS()  -- ����ʯ
��ʱ(1000)
CleanZLS()  -- ׺��ʯ

