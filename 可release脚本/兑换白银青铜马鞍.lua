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

ȡ����Ʒ("��|�ƽ���")
MoveToPos("����", 228, 325)
��ʱ(1000)
�Ի�NPC("������")
��ʱ(500)
NPC�����Ի�("�һ�������")
��ʱ(800)
if �����Ƿ����("MessageBox_Self") == 1 then
    LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
end
��ʱ(200)
NPC�����Ի�("�һ���ͭ��")
��ʱ(800)
if �����Ƿ����("MessageBox_Self") == 1 then
    LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
end
