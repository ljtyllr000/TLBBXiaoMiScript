function AudgeQmFu()
    local tmp = LUA_ȡ����ֵ([[
        local zoneworldid =  DataPool:GetSelfZoneWorldID()
        return zoneworldid
    ]])
    return tmp
end

ttpRet = AudgeQmFu()
if ttpRet ~= nil and ttpRet ~= "" then
    -- TODO ���� ServerIdNameList.json �޸�
    if tonumber(ttpRet) == 155 then
        ��Ļ��ʾ()
    else
        MentalTip("��ָ�����޷�ʹ��")
        return
    end
else
    return
end