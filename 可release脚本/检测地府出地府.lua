function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

curMap = ��ȡ������Ϣ(16)
if string.find(curMap, "�ظ�") then
    MentalTip("���ڵظ�, �������ظ���")
    �������ظ�()
else
    MentalTip("���ĺúõģ�")
end