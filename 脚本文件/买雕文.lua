
function  �������(BDYB,LPname,DWname,shuliang)
     if BDYB == "��Ԫ��" then
         LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();");��ʱ(1500) -- ��Ԫ���̵�
             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);");��ʱ(1500)--�򿪰�Ԫ���̵�
                  LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);");��ʱ(1500)--�ϱ����
		 if LPname == "���ߵ���" then
             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);");��ʱ(1500)-- ���ߵ��Ƶ�
                 if DWname == "������������" then
                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(18);");��ʱ(1500) 
                         elseif DWname == "Ь����������" then 
                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);");��ʱ(1500)
                                     elseif DWname == "������������" then
                                         LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);");��ʱ(1500)
				 end 
		 elseif  LPname == "��ߵ���1" then
		     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);");��ʱ(1500)--	
				 if DWname == "������������" then
                    LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);");��ʱ(1500) 
			             elseif DWname == "�����𹥵���" then
		                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);");��ʱ(1500) 
			                     elseif DWname == "������������" then
                                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);");��ʱ(1500) 
			                             elseif DWname == "������������" then
                                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);");��ʱ(1500) 
				 
				 elseif DWname == "�����������" then
                    LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(17);");��ʱ(1500) 
			             elseif DWname == "����𹥵���" then
		                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(18);");��ʱ(1500) 
			                     elseif DWname == "������������" then
								     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                         LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);");��ʱ(1500) 
			                             elseif DWname == "���󶾹�����" then
										     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);");��ʱ(1500) 
									
		         end 
         elseif  LPname == "��ߵ���2" then
		     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);");��ʱ(1500)--
			     if DWname == "����ӡ��������" then
                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);");��ʱ(1500) 
			             elseif DWname == "�����������" then
                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);");��ʱ(1500)
			                     elseif DWname == "������������" then
				                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                         LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);");��ʱ(1500)
			                                 elseif DWname == "������������" then
				                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(10);");��ʱ(1500)	
			     elseif DWname == "���Ʊ�������" then
                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(10);");��ʱ(1500) 
			             elseif DWname == "���ƻ𹥵���" then
                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(11);");��ʱ(1500)
			                     elseif DWname == "������������" then
                                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(12);");��ʱ(1500)
			                             elseif DWname == "���ƶ�������" then
                                              LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(13);");��ʱ(1500)	
			 	 elseif DWname == "������������" then
			         LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                         LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);");��ʱ(1500) 
			                 elseif DWname == "�����𹥵���" then			
                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(7);");��ʱ(1500) 
			                             elseif DWname == "������������" then
			                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(8);");��ʱ(1500) 
			                                         elseif DWname == "������������" then
			                                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(9);");��ʱ(1500) 
			     elseif DWname == "������������" then
			         LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                         LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(12);");��ʱ(1500) 
			                 elseif DWname == "�����𹥵���" then
			                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(13);");��ʱ(1500) 
			                             elseif DWname == "������������" then
			                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                                 LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(14);");��ʱ(1500) 
			                                         elseif DWname == "������������" then
			                                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");��ʱ(1500)
                                                             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(15);");��ʱ(1500) 
				 end 
		 end 
	 end 
end 
�������("��Ԫ��","���ߵ���","������������")

	if tonumber (��ȡ������Ϣ(55)+��ȡ������Ϣ(62)) < 410 then
	 ��Ļ��ʾ("���İ�Ԫ���ͺ�������")
         return
end
     ȡ����Ʒ("���")
if tonumber (��ȡ������Ϣ(45)) < 500000 then
	 ��Ļ��ʾ("���Ľ�Ҳ���")
	 return
end
���ߵ��Ƶ�             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);
��ߵ��Ƶ�             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);
���Ƽӹ���             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);

��Ԫ��
Ԫ���̳Ǵ򿪽���       setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();
Ԫ���̳ǹرս���       setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();
Ԫ���̵�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(0);
��Ԫ���̵�           setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);
������������ 18 Ь��32  ����38


         LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();");��ʱ(1500) -- ��Ԫ���̵�
             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);");��ʱ(1500)--�򿪰�Ԫ���̵�
                  LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);");��ʱ(1500)--�ϱ����
             LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);");��ʱ(1500)-- ���ߵ��Ƶ�
LUA_Call(string.format([[
setmetatable(_G, {__index = MiniMap_Env});
MiniMap_YuanBaoFunc();��ʱ(1000);

setmetatable(_G, {__index = YuanbaoShop_Env});
YuanbaoShop_ChangeTabIndex(1);��ʱ(1000);

setmetatable(_G, {__index = YuanbaoShop_Env});
YuanbaoShop_UpdateList_Bind(4);��ʱ(1000);

setmetatable(_G, {__index = YuanbaoShop_Env});
YuanbaoShop_UpdateShop_Bind(3);
	    
]]))
		 elseif  LPname == "���Ƽӹ���" then
		     LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(6);");��ʱ(1500)--
			    for i = 1,
				
				
	
		         end 
end 
end 
�������(Ь����������)
LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();")

 setmetatable(_G, {__index = YuanbaoShop_Env});
					 YuanbaoShop_Close();
					
	���ӣ�1����Ԫ���̵� 2��ѡ���Ԫ���̵� 3��ѡ�������̳� 4�����������̲��� 5���ر�Ԫ���̵�
LUA���� ("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(3);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();")
�ȴ� (2)
��Ϣ�� ("LUA�ű���ʾ��ϣ��ر���Ϣ���Զ�ֹͣ�ű�", "", ȡ��ɫ���� ())
�ű�ֹͣ ()				
					
setmetatable(_G, {__index = MiniMap_Env});
MiniMap_YuanBaoFunc();"

setmetatable(_G, {__index = YuanbaoShop_Env});
YuanbaoShop_ChangeTabIndex(1);

setmetatable(_G, {__index = YuanbaoShop_Env});
YuanbaoShop_UpdateList_Bind(4);

setmetatable(_G, {__index = YuanbaoShop_Env});
YuanbaoShop_UpdateShop_Bind(3);
setmetatable(_G, {__index = YuanbaoShop_Env});
YuanbaoShop_GoodButton_Clicked(4);
			½��������......

LUA���� ("LUA�ı�")
    �������ı��� LUA�ı�
  ����ֵ����


LUA����("setmetatable(_G, {__index = PetEquipSuitUp_Env});PetEquipSuitUp_Buttons_Clicked();")//���������Ǽ� �����Ǽ�

LUA����("setmetatable(_G, {__index = ConfraternitySkillsStudy_Env});Guild_Ability_LevelUp_Click();")//��������������ť

LUA���� ("setmetatable(_G, {__index = Bhls_Prize_Env});Bhls_Prize_Ok_Clicked();")//������ÿ����ȡ������ť

LUA���� ("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")//ȷ����ť
LUA���� ("setmetatable(_G, {__index = ZhenYuanNingLian_Env});ZYNL_NingLian_Click();")//��Ԫ
LUA���� ("setmetatable(_G, {__index = ZhenYuanNingLian_Env});ZYNL_AllNingLian_Click();")//����һ����Ԫ
LUA���� ("setmetatable(_G, {__index = XiulianStudy_Env});XiulianStudy_UpJingJie_Clicked();")//��������

ս���̵�
LUA���� ("setmetatable(_G, {__index = JueweiShop_Env});JueweiShop_BuyItem(0);")//��1����Ʒ
LUA���� ("setmetatable(_G, {__index = JueweiShop_Env});JueweiShop_BuyItem(1);")//��2����Ʒ....�Դ�����
LUA���� ("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")//����ȷ��


���ӣ�1������ȡÿ�ջ�Ծ������� 2�����1����ջ�Ծֵ���� 3���ر���ȡÿ�ջ�Ծ�������
LUA���� ("setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(6);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = Huoyuehaoli_Env});Huoyuehaoli_PlayHead(1);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = Huoyuehaoli_Env});Huoyuehaoli_Hide();")
�ȴ� (2)

���ӣ�1��VIP��Ȩ������� 2�����ȷ������VIP��Ȩ 3���رս���
LUA���� ("setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(5);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = VIP_Shop_Env});VIP_Shop_Close();")
��Ϣ�� ("VIP��Ȩ���ܼ������", "", ȡ��ɫ���� ())
�ű�ֹͣ ()

���ӣ�1����Ԫ���̵� 2��ѡ���Ԫ���̵� 3��ѡ�������̳� 4�����������̲��� 5���ر�Ԫ���̵�
LUA���� ("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(3);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();")
�ȴ� (2)
��Ϣ�� ("LUA�ű���ʾ��ϣ��ر���Ϣ���Զ�ֹͣ�ű�", "", ȡ��ɫ���� ())
�ű�ֹͣ ()

���ӣ�1����Ԫ���̵� 2��ѡ���Ԫ���̵� 3��ѡ���ϱ���� 4��ѡ���ɵ���ҩ 5������𵤺�« 6���ر�Ԫ���̵�
LUA���� ("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(1);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);")
�ȴ� (2)
LUA���� ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();")
�ȴ� (2)
��Ϣ�� ("LUA�ű���ʾ��ϣ��ر���Ϣ���Զ�ֹͣ�ű�", "", ȡ��ɫ���� ())
�ű�ֹͣ ()

����ȡÿ�ջ�Ծ����   setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(5);
�ر���ȡÿ�ջ�Ծ����   setmetatable(_G, {__index = Huoyuehaoli_Env});Huoyuehaoli_Hide();
��ȡÿ�ջ�Ծ����һ     setmetatable(_G, {__index = Huoyuehaoli_Env});Huoyuehaoli_PlayHead(1);
��ȡÿ�ջ�Ծ�����     setmetatable(_G, {__index = Huoyuehaoli_Env});Huoyuehaoli_PlayHead(2);
��ȡÿ�ջ�Ծ������     setmetatable(_G, {__index = Huoyuehaoli_Env});Huoyuehaoli_PlayHead(3);
��ȡÿ�ջ�Ծ������     setmetatable(_G, {__index = Huoyuehaoli_Env});Huoyuehaoli_PlayHead(4);

����ȡÿ�ܻ�Ծ����   setmetatable(_G, {__index = PlayerQuicklyEnter_Env});PlayerQuicklyEnter_Clicked(6);
�ر���ȡÿ�ܻ�Ծ����   setmetatable(_G, {__index = Weekhuoyuehaoli_Env});Weekhuoyuehaoli_Hide();
��ȡÿ�ܻ�Ծ����һ     setmetatable(_G, {__index = Weekhuoyuehaoli_Env});Weekhuoyuehaoli_PlayHead(1);
��ȡÿ�ܻ�Ծ�����     setmetatable(_G, {__index = Weekhuoyuehaoli_Env});Weekhuoyuehaoli_PlayHead(2);
��ȡÿ�ܻ�Ծ������     setmetatable(_G, {__index = Weekhuoyuehaoli_Env});Weekhuoyuehaoli_PlayHead(3);

�����¯ת��           setmetatable(_G, {__index = TheFireStove_Env});TheFireStove_FireButton_OnClick();
�����¯ȡʯ           setmetatable(_G, {__index = TheFireStove_Env});TheFireStove_StoneButton_OnClick();


Ԫ���̳Ǵ򿪽���       setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();
Ԫ���̳ǹرս���       setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_Close();
Ԫ���̵�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(0);
��Ԫ���̵�           setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);
��װ�̳�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(2);
�����̵�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(3);
�����̵�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(4);
�����̵�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);

Ԫ���̵���ࣺ
������                 setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(1);
��ʯ�̳�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(2);
�����̳�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(3);
�ϱ����               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);
����㳡               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);
�����˼�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(6);
�书�ؼ�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(7);
����ͼ                 setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(8);

Ԫ���̵����ͼ���ࣺ
������ǹ��             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(1);
���̺�˫��             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(2);
�����һ������ͼ       setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);
����ڶ�������ͼ       setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);


��Ԫ���̵���ࣺ
������                 setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(1);
��ʯ�̳�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(2);
�����̳�               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(3);
�ϱ����               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(4);

��Ԫ���̵�-�ϱ�������ࣺ(Ԫ���̵�ķ�������ͬ���ַ�)
�ɵ���ҩ               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(1);
�����챦               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(2);
���ߵ��Ƶ�             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(3);
��ߵ��Ƶ�             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(4);
���Ƽӹ���             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop_Bind(5);

��Ԫ���̵�-�����̳�-������Ʒ������Ŵ�1��ʼ�������Ժ�������ţ�
���鵤                 setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);
С�鵤                 setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);
�����̲���             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);
���޻ش���             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);
�������굤             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);

��Ԫ���̵�-�ϱ����-�ɵ���ҩ-������Ʒ������Ŵ�1��ʼ�������Ժ�������ţ�
���鵤                 setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);
Сϴ�赤               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);
��ϴ�赤               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(3);
�𵤺�«               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(4);
��Һ��ƿ               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);
�ɵ���«               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(6);
��¶��ƿ               setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(7);

�̵��һҳ             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();

�����̵꣺���򷽷����������򷽷�һ��
����������             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(1);
������ʯ��             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(2);
�������޵�             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(3);
���������             setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(4);


		