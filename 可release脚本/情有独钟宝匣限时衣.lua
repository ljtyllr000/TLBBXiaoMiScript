��Ļ��ʾ("����ҹ��Ʒ, ���Ǿ�Ʒ����ȡ�����ж��ӱ�ϻ���е�30���·�")
local count = ��ȡ������Ʒ����("���ж��ӱ�ϻ")
for i=1, count do
    �Ҽ�ʹ����Ʒ("���ж��ӱ�ϻ")
    ��ʱ(1000)
    LUA_Call([[
        setmetatable(_G, {__index = DuanWu_BaoZongZi_DoubleChoice_Env});DuanWu_BaoZongZi_DoubleChoice_GetFree()
    ]])
end
��ʱ(1500)
�Ҽ�ʹ����Ʒ("�������貨����")
��ʱ(200)
�Ҽ�ʹ����Ʒ("���ж���")