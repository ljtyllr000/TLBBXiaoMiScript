-- ���ɵ�18*9=172

local exchangeCount=0

��Ļ��ʾ("����ҹ��Ʒ���Ǿ�Ʒ��ǰ������ͯ�Ѵ�")
��ͼѰ·("����",262,342)
��ʱ(2000)
��Ļ��ʾ("����ҹ��Ʒ���Ǿ�Ʒ��6������һ���ɫ��Ԫ������Ԥ�ƺ�ʱ1����")

�Ի�NPC("ͯ��")
��ʱ(500)
NPC�����Ի�("ʹ�ò�ɫ����һ�����")
��ʱ(500)
while true do
    if exchangeCount >= 28 then
	    break
	end
	NPC�����Ի�("6������һ���ɫ��Ԫ����")
	��ʱ(1000)
	LUA_Call("setmetatable(_G, {__index = WuhunQuest_Env});WuhunQuest_Bn1Click();")
	��ʱ(500)
	exchangeCount = exchangeCount + 1
end


local giftCount = tonumber(��ȡ������Ʒ����("��ɫ��Ԫ����"))

for i=1,giftCount do
   �Ҽ�ʹ����Ʒ("��ɫ��Ԫ����")
   ��ʱ(200)
end


