-- ���ɵ�18*9=172

local exchangeCount=0

��Ļ��ʾ("����ҹ��Ʒ���Ǿ�Ʒ��ǰ������ͯ�Ѵ�")
��ͼѰ·("����",262,342)
��ʱ(2000)
��Ļ��ʾ("����ҹ��Ʒ���Ǿ�Ʒ��12������һ�ͯȤ������У�Ԥ�ƺ�ʱ1����")

�Ի�NPC("ͯ��")
��ʱ(500)
NPC�����Ի�("ʹ�ò�ɫ����һ�����")
��ʱ(500)
while true do
    if exchangeCount >= 14 then
	    break
	end
	NPC�����Ի�("12������һ�ͯȤ�������")
	��ʱ(1000)
	LUA_Call("setmetatable(_G, {__index = WuhunQuest_Env});WuhunQuest_Bn1Click();")
	��ʱ(500)
	exchangeCount = exchangeCount + 1
end

local giftCount = tonumber(��ȡ������Ʒ����("ͯȤ�������"))

for i=1,giftCount do
   �Ҽ�ʹ����Ʒ("ͯȤ�������")
   ��ʱ(200)
end


if tonumber(��ȡ������Ʒ����("�����")) > 0 then
   �Ҽ�ʹ����Ʒ("�����")
end