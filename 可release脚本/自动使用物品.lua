function FirstUse()
    -- ��һ��ʹ�ã������
    local pkgCount = LUA_ȡ����ֵ([[return GetActionNum("packageitem");]])
    local patternList = {
        '��Ԫ��.+��', '�������Ļ���', '�����ź�', '.+�˹����',
        '��֮����', '������ө',
        '��ͭ������',
        '����Ͳ��',
        '��������������',
        "�������"
    }

    ����_������()
    ��ʱ(1000)

    for i = 1, tonumber(pkgCount) do
        local pkgItem = LUA_ȡ����ֵ(string.format([[
            theAction,bLocked = PlayerPackage:EnumItem("base", %d - 1);  -- szPacketName = "base"��"material"��"quest"
            if theAction:GetID() ~= 0 then
                return theAction:GetName();
            end
            return -1
        ]], i))

        if pkgItem ~= -1 then
            for k, pattern in pairs(patternList) do
                if string.find(pkgItem, pattern) then
                    -- ��Ԫ��xx�����������Ļ��С������źС������˹����
                    while true do
                        if tonumber(��ȡ������Ʒ����(pkgItem)) <= 0 then
                            break
                        end
                        �Ҽ�ʹ����Ʒ(pkgItem)
                        ��ʱ(500)
                        LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
                        ��ʱ(100)
                    end
                end
            end
        end
    end
end

FirstUse()
��ʱ(1000)
FirstUse()
��ʱ(1000)
ִ�й���("�Զ����")
