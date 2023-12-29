-- ����ʹ�ð�Ԫ������

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
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

function GetDJTSLeftCount(curPage, curIndex, DJTSIndex)
    local leftCount = LUA_RETURN(string.format([[
        g_CurSelectPage = %d
        g_CurIndex = %d
        g_Client_ItemIndex = %d
        local nIdx = (g_CurSelectPage - 1) * 10 + g_CurIndex - 1
        local sceneid, strText, count, posx, posy, init = PlayerPackage:GetDunJiaShuPosInfo(g_Client_ItemIndex, nIdx)
        return count
    ]], curPage, curIndex, DJTSIndex))
    return tonumber(leftCount)
end

function AddCountByYBBind(DJTSIndex)
    LUA_Call(string.format([[
        Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("YuanbaoBind_AddFuZhou");
			Set_XSCRIPT_ScriptID(330059);
			Set_XSCRIPT_Parameter(0,%d);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
    ]], DJTSIndex))
end

function AddCountByYB(DJTSIndex)
    LUA_Call(string.format([[
        Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("Yuanbao_AddFuZhou");
			Set_XSCRIPT_ScriptID(330059);
			Set_XSCRIPT_Parameter(0,%d);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
    ]], DJTSIndex))
end

function AddCount(DJTSIndex)
    LUA_Call(string.format([[
        Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("AddFuZhou");
			Set_XSCRIPT_ScriptID(330059);
			Set_XSCRIPT_Parameter(0, %d)
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
    ]], DJTSIndex))
end

function AddDJTSCount()
    local DJTSPos = ��ȡ������Ʒλ��("���ط���")
    local DJTSIndex = DJTSPos - 1

    local leftCount = GetDJTSLeftCount(1, 1, DJTSIndex)

    local needAddCount = 50 - leftCount

    local needBuyCount = math.floor(needAddCount / 10)
    if needBuyCount == 0 then
        MentalTip('ʣ���������40, ���貹��')
        return
    end

    MentalTip(string.format([[��Ҫ���䡾%d����, ����ʹ��������40]], addNum))

    local curYBBind = tonumber(��ȡ������Ϣ(62))
    local YBBindCanBuyCount = math.floor(curYBBind / 110)
    local minCount = needBuyCount
    if YBBindCanBuyCount < needBuyCount then
        minCount = YBBindCanBuyCount
        for i = 1, minCount do
            MentalTip(string.format([[�ڡ�%d����ʹ�ð�Ԫ������]]))
            AddCountByYBBind(DJTSIndex)
            ��ʱ(1000)
        end
    end

    local needHLBugCount = needBuyCount - YBBindCanBuyCount
    if needHLBugCount > 0 then
        local curHL = tonumber(��ȡ������Ϣ(55))
        local HLCanBuyCount = math.floor(curHL / 110)
        local minCount = needHLBugCount
        if HLCanBuyCount < needHLBugCount then
            minCount = HLCanBuyCount
            for i = 1, minCount do
                MentalTip(string.format([[�ڡ�%d���ι���]]))
                AddCount(DJTSIndex)
                ��ʱ(1000)
            end
        end
    end
end

-- main ------------------------------------------------
ȡ����Ʒ("���ط���")
��ʱ(1000)
if ��ȡ������Ʒ����("���ط���") > 0 then
    AddDJTSCount()
end