function SwitchRoleMode(RoleModeType)
    -- �л���ָ��ģʽ
    --��Ļ��ʾ("����ģʽ"..RoleModeType)
    if RoleModeType == "��ƽ" then
        LUA_Call("Player:ChangePVPMode(0);")
    elseif RoleModeType == "����" then
        LUA_Call("Player:ChangePVPMode(1);")
    elseif RoleModeType == "���" then
        LUA_Call("Player:ChangePVPMode(3);")
    elseif RoleModeType == "���" then
        LUA_Call("Player:ChangePVPMode(4);")
    elseif RoleModeType == "�ƶ�" then
        LUA_Call("Player:ChangePVPMode(2);")
    end
end

SwitchRoleMode("��ƽ")