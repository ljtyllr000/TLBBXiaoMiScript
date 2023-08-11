function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function CaiLiaoCompound(numPerTime, materialType, compoundLevel)
    -- ����1���ϳɼ���
    -- ����2���ϳ��������޲�������(1��2��3)
    -- ����3���ϳɼ������ϣ�1,2,3,4
    LUA_Call(string.format([[
        Clear_XSCRIPT()
            local g_CurNum_PerTime = %d
            local nIndex = %d
            local nSubIndex = %d
            Set_XSCRIPT_Function_Name( "CaiLiaoCompound_New" )
            Set_XSCRIPT_ScriptID(701602)
            Set_XSCRIPT_Parameter(0,135)			--npcid
            Set_XSCRIPT_Parameter(1,g_CurNum_PerTime)	--ÿ�κϳɵ�����
            Set_XSCRIPT_Parameter(2,nIndex)				--����, �ϳ����ֲ��ϣ���Χ��1~3 (������ �޲��� ����)
            Set_XSCRIPT_Parameter(3,nSubIndex)			--������,�ϳɼ������ϣ���Χ��1~4
            Set_XSCRIPT_Parameter(4,0)					--����ȷ��
            Set_XSCRIPT_ParamCount(5)
        Send_XSCRIPT()
    ]], numPerTime, materialType, compoundLevel))
end

function GetMyMoney()
    local myMoney = LUA_ȡ����ֵ([[
        local myMoney = Player:GetData('MONEY') + Player:GetData('MONEY_JZ')
        return myMoney
    ]])
    return tonumber(myMoney)
end

function CompoundToThree(materialName, materialType)
    local level2Name = "2��" .. materialName
    local level1Name = "1��" .. materialName
    local level0Name = materialName .. "��Ƭ"

    local level2Count = ��ȡ������Ʒ����(level2Name)
    local level1Count = ��ȡ������Ʒ����(level1Name)
    local level0Count = ��ȡ������Ʒ����(level0Name)

    -- ----------------------- ������1����2������ �ϳ�Ϊ3�� --------------------------------
    -- ����1���ϳ�2��
    level1Count = ��ȡ������Ʒ����(level1Name)
    if level1Count > 5 then
        local canMergeNum = math.floor(level1Count / 5)
        if GetMyMoney() < canMergeNum * 1000 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(canMergeNum, materialType, 2)
        ��ʱ(1000)
    else
        MentalTip(string.format("%s ����С��5��, ����", level1Name))
    end

    -- ����2���ϳ�3��
    level2Count = ��ȡ������Ʒ����(level2Name)
    if level2Count > 5 then
        local canMergeNum = math.floor(level2Count / 5)
        if GetMyMoney() < canMergeNum * 1500 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(canMergeNum, materialType, 3)
        ��ʱ(1000)
    else
        MentalTip(string.format("%s ����С��5��, ����", level2Name))
    end

    -- ����ʣ��2������
    level2Count = ��ȡ������Ʒ����(level2Name)
    if level2Count > 0 then
        local lackLevel2To3Count = 5 - level2Count
        local lackLevel1To2Count = 5 * lackLevel2To3Count
        level1Count = ��ȡ������Ʒ����(level1Name)
        local realLackLevel1To2Count = lackLevel1To2Count - level1Count
        local lacklevel0Count = realLackLevel1To2Count * 5
        level0Count = ��ȡ������Ʒ����(level0Name)
        if level0Count < lacklevel0Count then
            MentalTip(materialName .. '��Ƭ��������')
            return
        end

        if GetMyMoney() < realLackLevel1To2Count * 500 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(realLackLevel1To2Count, materialType, 1) -- �ϳ�1������
        ��ʱ(1000)

        if GetMyMoney() < lackLevel2To3Count * 1000 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(lackLevel2To3Count, materialType, 2) -- �ϳ�2������
        ��ʱ(1000)

        if GetMyMoney() < 1500 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(1, materialType, 3) -- �ϳ�3������
    end

    ��ʱ(2000)

    -- ---------------------- ÿ125�����Ϻϳ�1��3���������Ĳ��ֲ��ϳ� --------------------------------
    level0Count = ��ȡ������Ʒ����(level0Name)
    local canCompLevel3Count = math.floor(level0Count / 125)
    if canCompLevel3Count > 0 then
        local canCompLevel2Count = canCompLevel3Count * 5
        local canCompLevel1Count = canCompLevel2Count * 5
        if GetMyMoney() < canCompLevel1Count * 500 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(canCompLevel1Count, materialType, 1) -- �ϳ�1������
        ��ʱ(1000)

        if GetMyMoney() < canCompLevel2Count * 1000 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(canCompLevel2Count, materialType, 2) -- �ϳ�2������
        ��ʱ(1000)

        if GetMyMoney() < canCompLevel3Count * 1500 then
            MentalTip("��Ǯ����, �˳�")
            return
        end
        CaiLiaoCompound(canCompLevel3Count, materialType, 3) -- �ϳ�3������
    end
end

function main()
    MentalTip('ֻ�й�125����Ƭ�źϳ�1��3������')
    ȡ����Ʒ('�޲���Ƭ|������Ƭ|1���޲�|1������|2���޲�|2������')
    ȡ����Ʒ('���')
    ����Ʒ("�޲���Ƭ", ������Ʒ, 0, 1, 0)  -- ��ֲ��󶨵�
    ����Ʒ("������Ƭ", ������Ʒ, 0, 1, 0)
    ����Ʒ("1���޲�", ������Ʒ, 0, 1, 0)
    ����Ʒ("1������", ������Ʒ, 0, 1, 0)
    ����Ʒ("2���޲�", ������Ʒ, 0, 1, 0)
    ����Ʒ("2������", ������Ʒ, 0, 1, 0)

    ��ͼѰ·("����", 280, 321)
    ��ʱ(2000)

    local materialType2Name = {
        [1] = "����",
        [2] = "�޲�",
        [3] = "����",
    }
    for typeIndex = 1, #materialType2Name do
        local materName = materialType2Name[typeIndex]
        MentalTip("��ʼ�ϳ�" .. materName)
        CompoundToThree(materName, typeIndex)
        ��ʱ(1000)
    end

    ����Ʒ("�޲���Ƭ")
    ����Ʒ("������Ƭ")
    ����Ʒ("1���޲�")
    ����Ʒ("1������")
    ����Ʒ("2���޲�")
    ����Ʒ("2������")
    ����Ʒ("3���޲�")
    ����Ʒ("3������")
    ����Ʒ("���")
end

-- -------------------------------------- Main ------------------------
main()
