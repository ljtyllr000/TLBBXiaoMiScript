
-- �򿪰��
LUA_Call([[
    setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnOpenGruidClick();
]])

��ʱ(2000)

-- �е��������
LUA_Call([[
    setmetatable(_G, {__index = NewBangHui_Hygl_Env});NewBangHui_Hygl_HB_OnClicked();
]])
��ʱ(1000)
-- �����
LUA_Call([[
    -- �������(���˺��)
    setmetatable(_G, {__index = NewBangHui_Redenvelope_Env});NewBangHui_Redenvelope_Deliver_Left_Clicked()
    -- ��ֵ���(�踣���)
    setmetatable(_G, {__index = NewBangHui_Redenvelope_Env});NewBangHui_Redenvelope_Deliver_Right_Clicked()
]])
��ʱ(1000)
-- �رհ�����
LUA_Call([[
    setmetatable(_G, {__index = NewBangHui_Redenvelope_Env});NewBangHui_Redenvelope_Closed();
]])

��ʱ(3000)

-- �򿪺���������Ƿ����
LUA_Call([[
    -- �򿪺��
    setmetatable(_G, {__index = RedenvelopeMessage_Env});RedenvelopeMessage_ButtonOnClicked(0);
]])