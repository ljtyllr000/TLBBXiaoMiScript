��ʱʱ�� = 140


local curDay = LUA_ȡ����ֵ("return DataPool:GetServerDayTime();", "n", 1)
if tonumber(curDay) >= 20230914 then
    MentalTip("���ڣ�����")
    return
end
while true do
    LUA_Call([[City:OpenNewGuildWarDlg();]])
    LUA_Call([[City:SendAddEnemyMsg( 715,1 );]])
    ��ʱ(��ʱʱ��)
end