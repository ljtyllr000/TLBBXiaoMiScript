��������ɫ = {
    "�m���ã��f",
    "��m���éf"
}

function BuyHSL()
    local �������� = ��ȡ������Ϣ(12)
    local matched = 0
    for k, v in pairs(��������ɫ) do
        if string.find(��������, v) then
            matched = 1
            break
        end
    end

    if matched ~= 1 then
		��Ļ��ʾ("��ǰ��ɫû�м��빺�����������")
        return
    end

    if tonumber(��ȡ������Ʒ����("��Ϣ������")) > 0 then
	    ��Ļ��ʾ("������������Ϣ������")
        return
    end

    -- �򿪾��ʻ����
    LUA_Call([[setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(1);]])
    ��ʱ(500)

    -- �򿪻���
    LUA_Call([[setmetatable(_G, {__index = TodayCampaignListNew_Env});TodayCampaignListNew_WeeklyShop_Clicked();]])
    ��ʱ(500)

    -- �����һҳ
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop_Env});ActivitySchedule_Shop_PageDown();]])
    ��ʱ(500)
    -- �����Ϣ������
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop_Env});ActivitySchedule_Shop_Clicked(1)]])
    ��ʱ(500)

    -- ���ȷ��
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy_Env});ActivitySchedule_MBuy_OK_Clicked();]])
    ��ʱ(500)

    -- �رս���
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop_Env});ActivitySchedule_Shop_OnHiden();]])
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = TodayCampaignListNew_Env});TodayCampaignListNew_OnClosed();]])
end

BuyHSL()

��ʱ(2000)

ִ�й���("������Ϣ�һ�")