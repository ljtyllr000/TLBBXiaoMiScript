myName = ��ȡ������Ϣ(12)
seperateGifts = {}
if myName == "���ƣ�" then
    -- �г���ǰ��ɫ��Ҫ��������
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�����", "�౦������", "��β��", "ɽˮͼ", "ʮ������", "�ϵ����", "������Ҥ��",
    }
elseif myName == "�䳾��" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ɽˮͼ", "�ϵ����", "������Ҥ��",
    }
elseif myName == "����" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ʮ������", "�ϵ����", "������Ҥ��",
    }
elseif myName == "���ǣ�" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ɽˮͼ", "ʮ������", "������Ҥ��",
    }
elseif myName == "��˪��" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "������", "ɽˮͼ", "ʮ������", "������Ҥ��",
    }
elseif myName == "��¶��" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "������", "ɽˮͼ", "ʮ������", "������Ҥ��",
    }
elseif myName == "�m���ã��f" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ɽˮͼ", "ʮ������", "������Ҥ��",
    }
elseif myName == "ؼ�����" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "������", "ʮ������", "�ϵ����", "������Ҥ��",
    }
elseif myName == "���볾��" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ɽˮͼ", "�ϵ����", "������Ҥ��",
    }
elseif myName == "����ؼ" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ʮ������", "�ϵ����", "������Ҥ��",
    }
elseif myName == "��Evil��Ϧ��" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ʮ������", "�ϵ����", "������Ҥ��",
    }
elseif myName == "��m���éf" then
    seperateGifts = {
        "������¯", "���÷��յ", "̫������", "�౦������", "��β��", "������", "ɽˮͼ", "�ϵ����", "������Ҥ��",
    }
end


-- ���
allGift = {
    "������¯", "���÷��յ", "̫������", "�����", "�౦������", "��β��", "������", "ɽˮͼ", "ʮ������", "�ϵ����", "������Ҥ��", "����ľ����"
}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

sepGiftStr = ""
if seperateGifts ~= nil then
    for k, v in pairs(seperateGifts) do
        sepGiftStr = v .. "|" .. sepGiftStr
    end
end
MentalTip(string.format([[����: %s, ������ʼ������õ�����]], myName))

function SeperateGift()
    for k, giftName in pairs(seperateGifts) do
        if tonumber(��ȡ������Ʒ����(giftName)) > 0 then
            MentalTip(string.format([[��ʼ���: %s]], giftName))
            �Ҽ�ʹ����Ʒ(giftName)
            ��ʱ(1000)

            LUA_Call([[
                setmetatable(_G, {__index = Gift_Reuse_Env});Gift_Reuse_ConfirmClick()
            ]])

            ��ʱ(1000)

            LUA_Call([[
                setmetatable(_G, {__index = MessageBox_Self3_Env});MessageBox_Self3_OnOk()
            ]])
            ��ʱ(1000)
        end
    end
end

function main()
    ȡ����Ʒ("������¯|���÷��յ|̫������|�����|�౦������|��β��|������|ɽˮͼ|ʮ������|�ϵ����|������Ҥ��|����ľ����")
    while true do
        ��ͼѰ·("����", 206, 53)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == 206 and tonumber(myY) == 53 then
            break
        end
    end

    �Ի�NPC("����¥")
    ��ʱ(1000)
    NPC�����Ի�("������")
    ��ʱ(2000)

    SeperateGift()

    ��ʱ(500)

    LUA_Call([[setmetatable(_G, {__index = Gift_Reuse_Env});Gift_Reuse_OnClose()]])

end

main()