��λ�б� = {
    { page = 2, index = 1, scene = '̫��', posX = 271, posY = 200 },
    { page = 2, index = 2, scene = '̫��', posX = 234, posY = 275 },
    { page = 2, index = 3, scene = '��ɽ', posX = 65, posY = 45 },
    { page = 2, index = 4, scene = 'ʥ��', posX = 78, posY = 75 },
    { page = 2, index = 5, scene = '��Ѫ��', posX = 82, posY = 79 },
    { page = 2, index = 6, scene = '���ظ���', posX = 105, posY = 55 },
    { page = 2, index = 7, scene = '��Դ', posX = 227, posY = 75 },
    { page = 2, index = 8, scene = '����', posX = 272, posY = 270 },
    { page = 2, index = 9, scene = '�ػʵع��Ĳ�', posX = 160, posY = 188 },
    { page = 2, index = 10, scene = '������Ĺ�Ų�', posX = 55, posY = 77 },
    { page = 3, index = 1, scene = 'Į����ԭ', posX = 45, posY = 219 },
    { page = 3, index = 2, scene = 'Į����ԭ', posX = 178, posY = 200 },
    { page = 3, index = 3, scene = 'Į����ԭ', posX = 217, posY = 32 },
    { page = 3, index = 4, scene = 'Į����ԭ', posX = 210, posY = 129 },
    { page = 3, index = 5, scene = '����ϻ�', posX = 89, posY = 157 },
    { page = 3, index = 6, scene = '����ϻ�', posX = 52, posY = 70 },
    { page = 3, index = 7, scene = '�����ؾ�', posX = 135, posY = 173 },
    { page = 3, index = 8, scene = '��������', posX = 83, posY = 107 },
    { page = 3, index = 9, scene = '��������', posX = 24, posY = 225 },
    { page = 3, index = 10, scene = '��������', posX = 226, posY = 228 }
}
-- page: ���׷��ڼ�ҳ
-- index: ���׷���ǰҳ��һ��λ��, λ�����£�
-- 1    2
-- 3    4
-- 5    6
-- 7    8
-- 9    10
-- scene: ����
-- posX: X����
-- posY: Y����


LUA_RETURN = lua_ȡ����ֵ
sleep = ��ʱ

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

function MoveToPos(NPCCity, x, y)
    while true do
        ��ͼѰ·(NPCCity, x, y)
        sleep(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

function GetDJTSPosInfo(curPage, curIndex, DJTSIndex)
    local posInfo = LUA_RETURN(string.format([[
        g_CurSelectPage = %d
        g_CurIndex = %d
        g_Client_ItemIndex = %d
        local nIdx = (g_CurSelectPage - 1) * 10 + g_CurIndex - 1
        local sceneid, strText, count, posx, posy, init = PlayerPackage:GetDunJiaShuPosInfo(g_Client_ItemIndex, nIdx)
        if sceneid >=1 then
            posInfo = strText .. "|" .. posx .. "|" .. "posy"
        else
            posInfo = "||"
        end
        return posInfo
    ]], curPage, curIndex, DJTSIndex))
    return posInfo
end

function DJTSSetPosition(curPage, curIndex, DJTSItemKIndex)
    local index = (curPage - 1) * 10 + curIndex - 1
    LUA_Call(string.format([[
        Clear_XSCRIPT();
            Set_XSCRIPT_Function_Name("SetPosition");
            Set_XSCRIPT_ScriptID(330059);
            Set_XSCRIPT_Parameter(0, %d)
            Set_XSCRIPT_Parameter(1, %d)
            Set_XSCRIPT_ParamCount(2)
        Send_XSCRIPT();
    ]], DJTSItemKIndex, index))
end

function SetPosition()
    local DJTSPos = ��ȡ������Ʒλ��("���ط���")
    local DJTSIndex = DJTSPos - 1

    for _, posInfo in pairs(��λ�б�) do
        local curPage = tonumber(posInfo.page)
        local curIndex = tonumber(posInfo.index)
        local scene = posInfo.scene
        local posX = tonumber(posInfo.posX)
        local posY = tonumber(posInfo.posY)

        local posInfoStr = GetDJTSPosInfo(curPage, curIndex, DJTSIndex)
        local posInfoList = StringSplit(posInfoStr, '|')
        local needSetPos = false
        if posInfoList[1] == nil then
            needSetPos = true
        elseif (posInfoList[1] ~= scene) or( posInfoList[2] ~= tostring(posX)) or (posInfoList[3] ~= tostring(posY)) then
            needSetPos = true
        end

        if needSetPos then
            MentalTip(string.format([[����ǰ�� %s(%d,%d) ���ö�λ]], scene, posX, posY))
            MoveToPos(scene, posX, posY)
            sleep(1000)
            MentalTip(string.format([[�����ѳ��׷��ĵڡ�%s��ҳ�ĵڡ�%s������λ����Ϊ %s(%d,%d)]], curPage, curIndex, scene, posX, posY))
            DJTSSetPosition(curPage, curIndex, DJTSIndex)
        else
            MentalTip(string.format([[���׷��ĵڡ�%d��ҳ, �ڡ�%d����λ���Ѿ�Ϊ %s(%d,%d), ����]], curPage, curIndex, scene, posX, posY))
        end

        sleep(200)
    end
end

-- main -----------------------------------------------
ȡ����Ʒ("���ط���")
��ʱ(1000)
if ��ȡ������Ʒ����("���ط���") > 0 then
    SetPosition()
end
