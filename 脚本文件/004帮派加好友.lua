local ���ɺ������� = "#cff66cc..����û���ļӺ��ѣ��߿Ƽ���ף��"
if �ж����ް���() == 1 then
    LUA_Call("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnOpenGruidClick();")
    ��ʱ(3000)
    LUA_Call("setmetatable(_G, {__index = ChatFrame_Env});Talk : SendChatMessage('guild', '" .. ���ɺ������� .. "');")
    local BangHuiMembersNum = ������(LUA_ȡ����ֵ("setmetatable(_G, {__index = NewBangHui_Hygl_Env});return Guild:GetMembersNum(3);"))
    ��Ļ��ʾ("��ǰ���߰���[" .. tostring(BangHuiMembersNum) .. "]��")
    for i = 0, BangHuiMembersNum - 1 do
        local guildIdx = ������(LUA_ȡ����ֵ("setmetatable(_G, {__index = NewBangHui_Hygl_Env});return Guild:GetShowMembersIdx(" .. tostring(i) .. ");"))
        local szMsg = LUA_ȡ����ֵ("setmetatable(_G, {__index = NewBangHui_Hygl_Env});return Guild:GetMembersInfo(" .. tostring(guildIdx) .. ", 'Name');")
        LUA_Call("DataPool:AddFriend(0, '" .. szMsg .. "')")
        --��Ļ��ʾ(szMsg)
        ��ʱ(1000)
    end
    LUA_Call("setmetatable(_G, {__index = ChatFrame_Env});Talk : SendChatMessage('guild', '" .. ���ɺ������� .. "');")
end
