function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
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


function main()
    MentalTip("ʹ�ô�������")
    while true do
        local itemCount = ��ȡ������Ʒ����("��������")
        if itemCount <= 0 then
            MentalTip("û�С��������ҡ�, �˳�")
            return
        end
        �Ҽ�ʹ����Ʒ("��������")
        ��ʱ(800)
        LUA_Call([[setmetatable(_G, {__index = SpringFestival_Redpacket2_Env});SpringFestival_Redpacket2_OpenBtn(1);]])
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = SpringFestival_Redpacket2_Env});SpringFestival_Redpacket2_OnCloseClicked();]])
    end
end

-- main ------------------------------------------------------
main()
