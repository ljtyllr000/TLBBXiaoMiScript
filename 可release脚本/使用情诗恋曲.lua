ȡ����Ʒ("��ʫ����")

��ͼѰ·("����", 230, 345)

LUA_Call([[setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_SelfEquip_Clicked();]])
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = SelfEquip_Env});Other_Info_Page_Switch();]])
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = OtherInfo_Env});this:Hide();]])

consortName = LUA_ȡ����ֵ([[
	local consortName = SystemSetup:GetPrivateInfo("self","Consort");
	return consortName
]])

��Ļ��ʾ("������ż��:" .. consortName)

-- consortName = ''   -- ָ���û����ֽӿ�

while true do
    ��Ʒ����, ��ƷID, ��ƷX����, ��ƷY����, ��ƷѪ��, ��Ʒ����, ��Ʒ���, ��Ʒ����, �����ж�, ͷ����ע = ������Χ��Ʒ(1, consortName, 15, "", 1)
    if ��ƷID ~= nil or ��ƷID ~= '' then
        ѡ�ж���(��ƷID)
        ��ʱ(1000)
        ѡ�ж���(��ƷID)
        ��ʱ(1000)

        local SHLQCount = ��ȡ������Ʒ����("��ʫ����")

        for i = 1, SHLQCount do
            �Ҽ�ʹ����Ʒ("��ʫ����")
            ��ʱ(500)
        end

        break
    else
        ��ʱ(1000)
    end
end

