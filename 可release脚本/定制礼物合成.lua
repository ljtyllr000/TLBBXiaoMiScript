giftQualityList = {
    '��Ʒ����',
    '��Ʒ����',
    '��Ʒ����',
    '��Ʒ����',
}

--giftQualityList = {
--    '��Ʒ����',
--    '��Ʒ����',
--    '��Ʒ����',
--    '��Ʒ����',
--}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

while true do
    ��ͼѰ·("����", 206, 53)
    ��ʱ(500)
    local myX = ��ȡ������Ϣ(7)
    local myY = ��ȡ������Ϣ(8)
    if tonumber(myX) == 206 and tonumber(myY) == 53 then
        break
    end
end
��ʱ(1000)

for _, giftQuality in pairs(giftQualityList) do
    MentalTip(string.format("�����ϳɡ�%s��", giftQuality))
    �Ի�NPC("����¥")
    ��ʱ(800)
    NPC�����Ի�('����ϳ�')
    ��ʱ(800)
    NPC�����Ի�(giftQuality, 1)
    ��ʱ(2000)
    LUA_Call([[
        setmetatable(_G, {__index = Gift_Synthesis_Env});Gift_Synthesis_ConfirmClick();
    ]])
    ��ʱ(500)
end