-- ��������
LUA_Call([[
    setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(23)
]])
��ʱ(1000)
-- �л����ľ�
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_Env});Rune_Stars_FenYe_Switch(2)
]])
��ʱ(1000)
-- �л����ľ��ϳ�
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_Reel_Env});Rune_Stars_Reel_SubFenYe_Switch(2)
]])
��ʱ(1000)
-- һ���ֽ�
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_Reel_Env});Rune_Stars_Reel_BatchSplit()
]])
��ʱ(1000)
-- �ֽ�ȷ��
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_BatchSplit_Env});Rune_Stars_BatchSplit_OKClicked()
]])
��ʱ(1000)
-- �ر������׽���
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_Reel_Env});Rune_Stars_Reel_OnCloseClicked();
]])
��ʱ(300)
��ͼѰ·("����", 206, 52)
��ʱ(2000)
�Ի�NPC("����¥")
��ʱ(500)
NPC�����Ի�("����ի")
��ʱ(1500)

-- �����������
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_Shop_Env});Rune_Stars_Shop_BuyMult();
]])
��ʱ(1000)
-- ѡ��Ŀ��
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_Shop_Env});Rune_Stars_Shop_onGoods(2);
]])
��ʱ(1000)

-- ���
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_BatchBuy_Env});Rune_Stars_BatchBuy_OnMax()
]])
��ʱ(1000)
-- ����ȷ��
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_BatchBuy_Env});Rune_Stars_BatchBuy_OnOK()
]])
��ʱ(1000)

-- �رջ���ի
LUA_Call([[
    setmetatable(_G, {__index = Rune_Stars_Shop_Env});Rune_Stars_Shop_OnClose();
]])
��ʱ(2000)

for i=1, ��ȡ������Ʒ����("�ľ���¼����") do
    �Ҽ�ʹ����Ʒ("�ľ���¼����")
    ��ʱ(500)
end
��ʱ(500)
ִ�й���("�Զ����")