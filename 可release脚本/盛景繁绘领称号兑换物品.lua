-- ��ֵ���дǰ��
-- TODO �޸�
�һ���Ʒ = {25, 3}

-- ��һҳ��λ�����
-- 1  2  3
-- 4  5  6
-- 7  8  9
-- 10  11  12

-- �ڶ�ҳ��λ�����
-- 21   22  23
-- 24   25


function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end


function main()
    LUA_Call([[setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(48)]]) -- �򿪽���
    ��ʱ(1500)
    LUA_Call([[setmetatable(_G, {__index = ShengJingFanHui_Env});ShengJingFanHui_OnFenYeClick(2);]])  -- �е�ī������
    ��ʱ(1500)
    LUA_Call([[setmetatable(_G, {__index = ShengJingFanHui_Env});ShengJingFanHui_GetTit();]]) -- ��ȡ�ƺ�
    ��ʱ(500)

    for _, itemIndex in pairs(�һ���Ʒ) do
        local index = itemIndex
        if itemIndex > 20 then
            LUA_Call([[setmetatable(_G, {__index = ShengJingFanHui_Env});ShengJingFanHui_DownPageClick();]])
            ��ʱ(1000)
            index = itemIndex - 20
        else
            LUA_Call([[setmetatable(_G, {__index = ShengJingFanHui_Env});ShengJingFanHui_UpPageClick();]])
            ��ʱ(1000)
        end
        LUA_Call(string.format([[setmetatable(_G, {__index = ShengJingFanHui_Env});ShengJingFanHui_ExchangePrize(%s);]], index))
        ��ʱ(1000)
        LUA_Call([[setmetatable(_G, {__index = ShengJingFanHui_MBuy_Env});ShengJingFanHui_MBuy_CalMax()]])
        ��ʱ(1000)
        LUA_Call([[setmetatable(_G, {__index = ShengJingFanHui_MBuy_Env});ShengJingFanHui_MBuy_OK_Clicked()]])
        ��ʱ(500)
    end

    �Ҽ�ʹ����Ʒ("��ī����������")
    ��ʱ(500)

    LUA_Call([[setmetatable(_G, {__index = ShengJingFanHui_Env});ShengJingFanHui_OnClose();]])  -- �ر�ʢ������

end

-- main -----------------------------------------------
main()
