function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end


MentalTip("��ʼ���񡾳�ʶԪ����ȫò��")
��ͼѰ·("����", 177, 230)
��ʱ(1000)

-- ����1
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("��ʶԪ��", 1)
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});QuestAccept_Clicked();]])  -- �������񣬵������
��ʱ(1000)
NPC�����Ի�("������ʲô��", 1)
��ʱ(1000)
NPC�����Ի�("�Ǹõ����", 1)
��ʱ(1000)
NPC�����Ի�("��ΪԪ��", 1)
��ʱ(1000)
NPC�����Ի�("����֪��", 1)
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});MissionContinue_Clicked();]])  -- ������
��ʱ(1000)
MentalTip("�������񡾳�ʶԪ����ȫò��")


-- ����2
MentalTip("��ʼ���񡾵�������ǿ���ǡ�")
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("��������", 1)
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});QuestAccept_Clicked();]])  -- �������񣬵������
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_Pet_Clicked();]])  -- �����޽���
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Pet_Env});Pet_NeiDan_Page_Switch()]])   -- �е�Ԫ������
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = PetNeidan_Env});PetNeidan_NeiDanRClicked(1)]])  -- װ���ڵ�
��ʱ(1000)
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("��������", 1)
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});MissionContinue_Clicked();]])  -- ������
��ʱ(1000)
MentalTip("�������񡾵�������ǿ���ǡ�")


-- ����3
MentalTip("��ʼ����Ԫ�����������䡿")
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("Ԫ������������")
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});QuestAccept_Clicked();]])  -- �������񣬵������
��ʱ(1000)
ȡ����Ʒ("���", 50)
��ͼѰ·("����", 177, 230)
��ʱ(1000)
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("Ԫ����")
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = PetNeidan_Shop_Env});PetNeidan_Shop_Clicked(1)]])  -- ��� ��Ʒ��Ԫͼ
��ʱ(1000)
--LUA_Call([[setmetatable(_G, {__index = Shop_MBuy_Env});Shop_MBuy_CalMax();]])  -- ������
--��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Shop_MBuy_Env});Shop_MBuy_BuyMulti_Clicked();]])  -- ��� ��������ȷ��
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = MessageBox_Self3_Env});MessageBox_Self3_OnOk()]])  -- ��� ȷ��
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = PetNeidan_Shop_Env});PetNeidan_Shop_OnHiden();]])  -- �ر� Ԫ����
��ʱ(1000)
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("Ԫ������������")
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});MissionContinue_Clicked();]])  -- ������
��ʱ(1000)
MentalTip("��������Ԫ�����������䡿")


-- ����4
MentalTip("��ʼ���񡾰�ͼ���������֡�")
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("��ͼ����������")
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});QuestAccept_Clicked();]])  -- �������񣬵������
��ʱ(1000)
ִ�й���("��Ʒ��Ԫͼ")
��ʱ(1000)
��ͼѰ·("����", 177, 230)
��ʱ(1000)
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("��ͼ����������")
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});MissionContinue_Clicked();]])  -- ������
��ʱ(1000)
MentalTip("�������񡾰�ͼ���������֡�")



-- ����5
MentalTip("��ʼ���񡾳����Ե�̽��ȡ�")
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("�����Ե�̽���")
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});QuestAccept_Clicked();]])  -- �������񣬵������
��ʱ(1000)
MentalTip("���񡾳����Ե�̽��ȡ���Ҫͨ�ؾ����")
�Ի�NPC("�Ƶ���")
��ʱ(1000)
NPC�����Ի�("�����Ե�̽���")
��ʱ(1000)
LUA_Call([[setmetatable(_G, {__index = Quest_Env});MissionContinue_Clicked();]])  -- ������
MentalTip("�������񡾳����Ե�̽��ȡ�")


-- ��ȡ����
MentalTip("��ȡ���ַ���¼����")
LUA_Call([[
    local currentSelect = 11
    Clear_XSCRIPT()
        Set_XSCRIPT_Function_Name("GetBonus")
        Set_XSCRIPT_ScriptID(290099)
        Set_XSCRIPT_Parameter(0,tonumber(currentSelect - 1))
        Set_XSCRIPT_ParamCount(1)
    Send_XSCRIPT()
]])




