function FirstUse()
    -- ��һ��ʹ�ã������
    local pkgCount = LUA_ȡ����ֵ([[return GetActionNum("packageitem");]])
    local patternList = {
        '��Ԫ��.+��', '�������Ļ���', '�����ź�', '.+�˹����',
		'��Ʒ����', '��Ʒ����',
        '��֮����', '������ө', "������ӡ", "��֮Բ��", "ӫ��з�", "��������", "�����ө", "���豦��", "��������", "����ͬ��","ʮ������",
        '��Ӣ�ͷ�',
		'��ͭ������',
        '����Ͳ��',
        '��������������',
        "�������",
		"ѩ֥ҩɢ",
        '��������', '��Ϧ�����','ʢ��ͬ�����',
        "���������", "�����������", "�����������", "�����������",
        "���������񡤺���", "��������񡤺���", "����������ӥ��", "���������ӥ��", "���������񡤻�Х", "��������񡤻�Х", "��������������", "�������������",
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
                        if �����Ƿ����("MessageBox_Self") == 1 then
                            LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
                            ��ʱ(1000)
                        end
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
FirstUse()
��ʱ(1000)
ִ�й���("�Զ����")
