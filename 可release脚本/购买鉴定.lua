function MoveToPos(NPCCity, x, y)
    while true do
        ��ͼѰ·(NPCCity, x, y)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

ȡ����Ʒ("3���޲�|3������|4���޲�|4������|5���޲�|5������|�����޲�|��������")
MoveToPos("����", 356, 236)

mianBuCount  = ��ȡ������Ʒ����("3���޲�") + ��ȡ������Ʒ����("4���޲�") + ��ȡ������Ʒ����("5���޲�") + ��ȡ������Ʒ����("�����޲�")
miYinCount  = ��ȡ������Ʒ����("3������") + ��ȡ������Ʒ����("4������") + ��ȡ������Ʒ����("5������") + ��ȡ������Ʒ����("��������")

needBuyShuNum = math.floor(tonumber(mianBuCount) / 5) + 1
needBuyFuNum = math.floor(tonumber(miYinCount) / 5) + 1

�Ի�NPC("������")
��ʱ(3000)
NPC�����Ի�("�ƽ���", 0)
��ʱ(2000)
for i=1, 4 do
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_PageDown();]])
    ��ʱ(200)
end
��ʱ(500)
LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_PageUp();]])
��ʱ(1000)

for i = 1, needBuyShuNum do
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_Clicked(6)]])
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy2_Env});ActivitySchedule_MBuy2_OK_Clicked();]])
    ��ʱ(500)
end

�Ի�NPC("������")
��ʱ(2000)
NPC�����Ի�("�ƽ���", 0)
��ʱ(2000)

for i=1, 4 do
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_PageDown();]])
    ��ʱ(200)
end

��ʱ(2000)
for i = 1, needBuyFuNum do
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_Clicked(1)]])
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy2_Env});ActivitySchedule_MBuy2_OK_Clicked();]])
    ��ʱ(500)
end

��ʱ(500)
LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_OnHiden();]])