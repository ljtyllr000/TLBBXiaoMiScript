function FirstUse()
    -- ��һ��ʹ�ã������
    local pkgCount = LUA_ȡ����ֵ([[return GetActionNum("packageitem");]])
    local patternList = {'��Ԫ��.+��', '�������Ļ���', '�����ź�', '.+�˹����'}
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
                    �Ҽ�ʹ��(pkgItem)
                    ��ʱ(100)
                end
            end
        end
    end
end

function SecondUse()
    -- �ڶ���ʹ�ã�ʹ�õ��߻�������
    local pkgCount = LUA_ȡ����ֵ([[return GetActionNum("packageitem");]])
    local patternList = {'��Ԫ��.+��', '�������Ļ���', '�����ź�', '.+�˹����'}
    local savedItem = {'�������', '���Ǿ���', '������ɽ', '����ͼ', '������', '�����滨��', 'ӥ������'}
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
                    �Ҽ�ʹ��(pkgItem)
                    ��ʱ(100)
                end
            end
        end
    end
end
