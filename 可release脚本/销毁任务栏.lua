��������������� = {
    "ά��ľ��"
}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function MoveToPos(NPCCity, x, y)
    while true do
        ��ͼѰ·(NPCCity, x, y)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

function DestroyMissionItem()
    MentalTip("ǰ������(361, 183)׼�������������")
    MoveToPos('����', 361, 183)

    for taskItemPos = 200, 219 do
        MentalTip(string.format('��ʼ�ڡ�%d/20����������ҵ', taskItemPos - 199))
        for _, item in pairs(���������������) do
            LUA_Call(string.format([[
                taskItemPos = %d
                theAction,bLocked = PlayerPackage:EnumItem("quest", taskItemPos - 200);  -- szPacketName = "base"��"material"��"quest"
                if theAction:GetID() ~= 0 then
                    local sName = theAction:GetName();
                    if sName == "%s" then
                        Clear_XSCRIPT()
                            Set_XSCRIPT_ScriptID( 124 )
                            Set_XSCRIPT_Function_Name( "OnDestroy" )
                            Set_XSCRIPT_Parameter( 0, taskItemPos )
                            Set_XSCRIPT_ParamCount( 1 )
                        Send_XSCRIPT()
                    end
                end
            ]], taskItemPos, item))
        end
        ��ʱ(500)
    end
end

function UseQiZi()
    for i = 1, 20 do
        local row = math.floor(i / 10)
        local col = math.floor(i % 10)
        if col == 0 then
            col = 10
        else
            row = row + 1
        end
        LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))  -- �Ҽ�ʹ������
        ��ʱ(500)
    end
end

-- main ------------------------
UseQiZi()
DestroyMissionItem()