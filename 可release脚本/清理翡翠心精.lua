function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetWareLingPaiInfo(baoZhuIndex)
    -- ��ȡ��װ����������Ϣ
    local lingPaiInfo = LUA_ȡ����ֵ(string.format([[
			local index = %d
			local nType,BaoZhu1,BaoZhu2,BaoZhu3,BaoZhu4,nQual = DataPool:GetLingPaiInfo()
			--local IconName,ItemName = DataPool:GetLingPaiBaoZhuIconName(1)
			if nType> 0 then
				if index == 1 then
					return BaoZhu1
				end
				if index == 2 then
					return BaoZhu2
				end
				if index == 3 then
					return BaoZhu3
				end
				if index == 4 then
					return BaoZhu4
				end
				if index == 5 then
					return nQual
				end
				if  index ==  0 then
					return nType
				end
			end
			return -1
	]], baoZhuIndex))
    return tonumber(lingPaiInfo)
end

function GetPkgLingPaiBaoZhu(lingPaiPos, baoZhuIndex)
    -- ���������Ʊ���ȼ�
    local baoZhuLevel = LUA_ȡ����ֵ(string.format([[
        local m_EquipBagIndex = %d
        local nIndex = %d
        local uLevel = PlayerPackage:Lua_GetBagItemRl_RsLevel(m_EquipBagIndex , nIndex - 1)
        return uLevel
    ]], lingPaiPos, baoZhuIndex))
    return tonumber(baoZhuLevel)
end

function checkWareLingPaiBaoZhu()
    local allBaoZhuLevel = 0
    for i = 1, 4 do
        allBaoZhuLevel = allBaoZhuLevel + GetWareLingPaiInfo(i)
    end
    if allBaoZhuLevel >= 50 * 4 then
        MentalTip("���������Ƶı�����ȫ������")
        return 1
    else
        MentalTip("�����ϵ����Ʊ���δ����,����ʹ������ľ�")
        return -1
    end
end

function checkPkgLingPaiBaoZhu()
    local lingPaiList = { "������", "������", "������", "�Ѫ��", "������" }
    for i = 1, #lingPaiList do
        ȡ����Ʒ(string.format("%s", lingPaiList[i]))
        ��ʱ(100)
    end
    ��ʱ(1000)

    local unfinishedLingPaiCount = 0
    for j = 1, 4 do
        unfinishedLingPaiCount = unfinishedLingPaiCount + ��ȡ������Ʒ����(string.format("%s", lingPaiList[j]))
    end
    if unfinishedLingPaiCount > 0 then
        MentalTip("�����л��еͽ�����,����ʹ������ľ�")
        return -1
    end

    if ��ȡ������Ʒ����("������") > 0 then
        local LPIndex = ��ȡ������Ʒλ��("������") - 1
        local allBaoZhuLevel = 0
        for k = 1, 4 do
            allBaoZhuLevel = allBaoZhuLevel + GetPkgLingPaiBaoZhu(LPIndex, k)
        end
        if allBaoZhuLevel >= 50 * 4 then
            MentalTip("�����������Ƶı�����ȫ������")
            return 1
        else
            MentalTip("�����а������δ����,����ʹ������ľ�")
            return -1
        end
    else
        MentalTip("������û�еڶ���������")
        return 1
    end
end

--  Main ------------------------------------------------------------------------------------------
MentalTip("�������,����������ľ�")
local wareLP = checkWareLingPaiBaoZhu()
local pkgLP = checkPkgLingPaiBaoZhu()
if wareLP == 1 and pkgLP == 1 then
    ȡ����Ʒ("����ľ�")
    ��ʱ(1000)
    �Զ����("����ľ�")
end
