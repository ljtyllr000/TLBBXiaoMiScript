
LUA_Call("setmetatable(_G, {__index =EquipStrengthen_Env});EquipStrengthen_Buttons_Close();")

ȡ����Ʒ("���ǿ������")  

if ��ȡ������Ʒ����("���ǿ������")>0 then
��ͼѰ·("����",306,290)
��ʱ(500)
��������=LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")
��ʱ(500)
��Ļ��ʾ(��������) 
LUA_Call("MainMenuBar_SelfEquip_Clicked();")
��ʱ(500)
LUA_Call("SelfEquip_Equip_Click(16,0);")
    �ƴ�ѭ�� i=1,5 ִ��
         ��� �Ի�NPC("�����")==1 ��
              ��ʱ(3000)
              NPC�����Ի�("װ��ǿ��") 
              ��ʱ(3000)
              NPC�����Ի�("ʹ��ǿ������ǿ��װ��") 
              ��ʱ(3000)
              ��� �����Ƿ����("EquipStrengthen")==1 and ��ȡ������Ʒ����("���ǿ������")>=1  ��
                   ��ʱ (1000)
                   �Ҽ�ʹ����Ʒ(��������,1)
                   ��ʱ (1000)
               �ƴ�ѭ�� i=1,5 ִ��
                   LUA_Call("setmetatable(_G, {__index = EquipStrengthen_Env});EquipStrengthen_Buttons_Clicked();")
                   ��ʱ (100)
                ����  
                   ����ѭ��
              ����
         ���� 
              ��ʱ(1000)
         ����
     ����  
end	




�ƴ�ѭ�� i=1,5 ִ��
         ��� �����Ƿ����("EquipStrengthen") ==1 �� 
              LUA_Call("setmetatable(_G, {__index =EquipStrengthen_Env});EquipStrengthen_OnCloseClicked();")
         ����
              ��ͼѰ·("����",346,248)    --�ܿ��ô����Զ��ر�
              ��ʱ(1000)
              �Ҽ�ʹ����Ʒ(��������,1)    --����2:Ϊʹ�ô���
         ����
         ��ʱ(1000)
         ��� ����ֵ(LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetID();"))>0 ��  --װ���ɹ�
              ����ѭ��   
         ����
����	

