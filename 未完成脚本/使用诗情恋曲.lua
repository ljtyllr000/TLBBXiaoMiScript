ȡ����Ʒ("ʫ������")

��ͼѰ·("����", 222, 235)
��ʱ(2000)

consortName = LUA_ȡ����ֵ([[
	local consortName = SystemSetup:GetPrivateInfo("self","Consort");
	return consortName
]])

-- consortName = ''   -- ָ���û����ֽӿ�

while true do
    ��Ʒ����, ��ƷID, ��ƷX����, ��ƷY����, ��ƷѪ��, ��Ʒ����, ��Ʒ���, ��Ʒ����, �����ж�, ͷ����ע = ������Χ��Ʒ(1, consortName, 15, "", 1)
    if ��ƷID ~= nil or ��ƷID ~= '' then
        ѡ�ж���(��ƷID)
        ��ʱ(1000)
        ѡ�ж���(��ƷID)
        ��ʱ(1000)

        local SHLQCount = ��ȡ������Ʒ����("ʫ������")

        for i = 1, SHLQCount do
            �Ҽ�ʹ����Ʒ("ʫ������")
            ��ʱ(500)
        end

        break
    else
        ��ʱ(1000)
    end
end

