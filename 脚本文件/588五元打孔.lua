

function ����_�жϹرմ���(strWindowName)
      if �����Ƿ����(strWindowName)==1 then
	    LUA_Call(string.format([[
	        setmetatable(_G, {__index = %s_Env}) this:Hide()  
	  ]], strWindowName))  
	  end
end


function ����_�����̻Ṻ����Ʒ(����, ����, �ܼ۸�,�ж��Ƿ�����Ʒ)
     ȡ����Ʒ("���",200000)  
     ��Ļ��ʾ(����)
     if tonumber(�ж��Ƿ�����Ʒ)==1 then
      if ��ȡ������Ʒ����(����)>=1 then
       ��Ļ��ʾ("�������������Ʒ"..����)
	    return false
       end
	end 
    
      �ƴ�ѭ�� i=1,5 ִ��
             ��ͼѰ·("����",330,299)
             ��� �Ի�NPC("�Ǹ�ʢ")==1 ��
              ��ʱ (1000)
               NPC�����Ի�("�鿴�����̵�")
               ��ʱ (1000)
               ��� �����Ƿ����("PS_ShopList")==1 ��
                          	LUA_Call([[setmetatable(_G, {__index = PS_ShopList_Env}) PS_ShopList_ChangeTabIndex(3)]])	
                            ��ʱ (1000)
                    ����ѭ��
               ����    
          ����
    ����
	--������Ʒ
    
    
     ��ʱ (2000)
	LUA_Call(string.format([[	
         PlayerShop:PacketSend_Search(2 , 2, 1, "%s", 1)		
	]], ����))
	
	��ʱ(1500)
	--������һҳ��û�з�����������Ʒ
	local tem = LUA_ȡ����ֵ(string.format([[
	        setmetatable(_G, {__index = PS_ShopSearch_Env})
			for i = 1 ,10 do 
				local theAction = EnumAction( i - 1 , "playershop_cur_page")
				if theAction:GetID() ~= 0 then
					--��Ʒ��,������,�����̵�ID,����,�ܼ۸�
					local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )			
					if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
					    if pName == "%s" and pCount <= %d and pYB <= %d then
						   PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
						   --��������,ֱ�ӷ���
						   PlayerShop:SearchPageBuyItem(i - 1, "item")
						   return true
						end
					end
				end
			end
            return false
	]], ����, ����, �ܼ۸�), "b")
    
    ��ʱ (2000)
    ����_�жϹرմ���("PS_ShopSearch")
	����_�жϹرմ���("PS_ShopList")
	����_�жϹرմ���("Quest")	
	return tem
end

function ����_�򿪶һ�Ԫ������()
LUA_Call(string.format([[
		Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("AskOpenDuihuanWindow");
		Set_XSCRIPT_ScriptID(181000);
		Set_XSCRIPT_ParamCount(0);
		Send_XSCRIPT();
		]]))
	
end

function ����_ȡװ����ʯ����(װ������)
	if ��ȡ������Ʒ����(װ������)>0 then
         bHave=��ȡ������Ʒλ��(װ������)-1
		else
         return 5
    end  
    	 local tem=LUA_ȡ����ֵ(string.format([[
            local gemcount = LifeAbility:GetEquip_GemCount(%d)
				if gemcount==nil then
					return 0
				end
                return gemcount
            	]], bHave))	
			return tonumber(tem)
end

function ����_��ȡ�׳������()
LUA_Call(string.format([[
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "GetGiftsForSaveUp" ); 	-- �ű���������
		Set_XSCRIPT_ScriptID( 892676 );				-- �ű����
		Set_XSCRIPT_Parameter( 0, 1 );		-- ����һ
		Set_XSCRIPT_ParamCount( 1 );				-- ��������
	Send_XSCRIPT()
		]]))
end
	
ȡ����Ʒ"�챦ʯ(3��)"

function ����_ȡ�ɻ�ȡ��Ԫ������()
return LUA_ȡ����ֵ(string.format([[
setmetatable(_G, {__index = YuanbaoExchange_Env});
str =YuanbaoExchange_Text5 : GetText()
local n1 = string.find(str,"��")
	if n1 then
		return tonumber(string.sub(str, n1+2))
	end
	return 0
	]]), "n")
end

function ����_�����һ�Ԫ��(index)
 LUA_Call(string.format([[
	YB=%d
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("BuyYuanbao");
		Set_XSCRIPT_ScriptID(181000);
		Set_XSCRIPT_Parameter(0,tonumber(YB));
		Set_XSCRIPT_Parameter(1,1);
		Set_XSCRIPT_ParamCount(2);
	Send_XSCRIPT();
]],index), "n")
end

��Ļ��ʾ(����_ȡ�ɻ�ȡ��Ԫ������())	
����_�����һ�Ԫ��(200)
��ʱ(3000)
����_��ȡ�׳������()



���� ��ʯ�һ�()
ȡ����Ʒ("3����ʯ�һ�ȯ")
��� ��ȡ������Ʒ����("3����ʯ�һ�ȯ")>0 ��
��ͼѰ·("Ǯׯ",68,44)
     �ƴ�ѭ�� i=1,5 ִ��
         ��� �Ի�NPC("Ǯ����")==1  ��
              ��ʱ (1000)
              NPC�����Ի�("ʹ�ñ�ʯ�һ�ȯ",0)
              ��ʱ (1000)
              NPC�����Ի�("ʹ��3����ʯ�һ�ȯ",0)
              ��ʱ (1000)
                        ��ʱ (1000)
                        NPC�����Ի�("�챦ʯ(3��)",0)
                        ��ʱ (1000)
                        NPC�����Ի�("ͬ��",0)
                        ��ʱ (1000)
         ����
     ����   
  ���� 
����




function ����_ȡװ���������(װ������)
    local bHave=tonumber(��ȡ������Ʒλ��(װ������))-1
	if bHave< 0 then
        return 0
    end  
    	 local tem=LUA_ȡ����ֵ(string.format([[
				return LifeAbility:GetEquip_HoleCount(%d)
            	]], bHave))	
			return tonumber(tem)
end

function װ�����(װ������,��ײ���,��λ����)
	��ʱ(2000)
	local �Ѿ���׵Ŀ���= ����_ȡװ���������(װ������)
	��ʱ(2000)
	��Ļ��ʾ(װ������.."�Ѿ���׵Ŀ���:"..�Ѿ���׵Ŀ���)
	if �Ѿ���׵Ŀ��� >= ��λ���� then
		��Ļ��ʾ("��ǰĿ���λ����"..��λ����)
		��ʱ(1000)
		return
	end
	if ��ȡ������Ʒ����(װ������)>0 then
         bHave=��ȡ������Ʒλ��(װ������)-1
    end   
	
    if ��ȡ������Ʒ����(��ײ���)>0 then
         nIndex=��ȡ������Ʒλ��(��ײ���)-1
		else 
		��Ļ��ʾ("��ײ���"..��ײ���.."����")
		return
    end 
	��ʱ(3000)
    --��Ļ��ʾ(bHave..nIndex)
	
	if tonumber(��λ����) < 4 then
			LUA_Call(string.format([[
        Clear_XSCRIPT()
        Set_XSCRIPT_Function_Name("StilettoEx_3")
        Set_XSCRIPT_ScriptID(311200)
        Set_XSCRIPT_Parameter(0,%d)--װ��λ��
        Set_XSCRIPT_Parameter(1,%d)--����λ��
        Set_XSCRIPT_ParamCount(2)
        Send_XSCRIPT()
		]], bHave,nIndex))	
	else	
	if �Ѿ���׵Ŀ���~= 3 then
		return
	end	
	if ��ײ���=="���񾫴�" then
		four=2
		else
		four=1
	end
	LUA_Call(string.format([[
				Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("StilettoEx_4")
			Set_XSCRIPT_ScriptID(311200)
			Set_XSCRIPT_Parameter(0,%d)
			Set_XSCRIPT_Parameter(1,%d)
			Set_XSCRIPT_Parameter(2,%d)
			Set_XSCRIPT_ParamCount(3)
		Send_XSCRIPT()
				]], bHave,nIndex,four))	
	end	
end


function MessageBoxOK()
	��ʱ(1000)
	if  �����Ƿ����("MessageBox_Self")==1 then

		LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
		��ʱ(1000)
	end
end


		
function Ԫ���̵깺��(AAA)
		LUA_Call("setmtatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();")
		��ʱ(2000)
		LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(0);")
		��ʱ(2000)
		LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(2);")
		��ʱ(2000)
		LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(6);")
		��ʱ(2000)
		if AAA==5 then
		LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();")
		��ʱ(2000)
		LUA_Call ("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);")
		��ʱ(2000)
		end
		MessageBoxOK()
		LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});this:Hide();")--�ر���Ƕ����
end

function ����_װ���ϱ�ʯ(װ������,��������,��ʯ����,��ʯλ��)

	if ��ȡ������Ʒ����(װ������)>0 then
         bHave=��ȡ������Ʒλ��(װ������)-1
		else
		return
    end   
	
    if ��ȡ������Ʒ����(��������)>0 then
         nIndex=��ȡ������Ʒλ��(��������)-1
				else
		��Ļ��ʾ("Ԫ���깺��:"..��������)		
		Ԫ���̵깺��(5)
    end 
    if ��ȡ������Ʒ����(��ʯ����)>0 then
         bIndex=��ȡ������Ʒλ��(��ʯ����)-1
				else
		return
    end 
	
	װ����λ������=����_ȡװ���������(װ������)
	if װ����λ������ <��ʯλ�� then
		return
	end
		
	
	װ����ʯ������=����_ȡװ����ʯ����(װ������)
	
	if װ����ʯ������+1 >��ʯλ�� then
		��Ļ��ʾ("��ʯ�����㹻 ��������")
		return 
	end	
	
	if ��ȡ������Ʒ����(��������)< 1 then
		Ԫ���̵깺��()
	end
	
		LUA_Call(string.format([[
        Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name("EnchaseEx_3")
		Set_XSCRIPT_ScriptID(701614)
		Set_XSCRIPT_Parameter(0,%d)--��ʯ
		Set_XSCRIPT_Parameter(1,%d)--װ��λ��
		Set_XSCRIPT_Parameter(2,%d)--����λ��
		Set_XSCRIPT_Parameter(3,-1)
		Set_XSCRIPT_Parameter(4,%d-1)--��ʯװ��λ��
		Set_XSCRIPT_ParamCount(5)
		Send_XSCRIPT()
		]], bIndex,bHave,nIndex,��ʯλ��))	
end



function ����ȡ��װ����ȡ����(װ��λ������)
     if װ��λ������=="���ָ" then
			װ��ȡ�±��=7
			װ��λ��=6
		elseif װ��λ������=="�ҽ�ָ" then
			װ��ȡ�±��=8
			װ��λ��=11
       elseif  װ��λ������=="�󻤷�" then
			װ��ȡ�±��=9
			װ��λ��=12
		elseif װ��λ������=="�һ���" then
			װ��ȡ�±��=10
			װ��λ��=13
       elseif  װ��λ������=="����" then
			װ��ȡ�±��=11
			װ��λ��=0
		elseif װ��λ������=="ñ��" then
			װ��ȡ�±��=1
			װ��λ��=1
	   elseif װ��λ������=="����" then
			װ��ȡ�±��=2
			װ��λ��=15	
		elseif װ��λ������=="����" then
			װ��ȡ�±��=3
			װ��λ��=14	
		elseif װ��λ������=="����" then
			װ��ȡ�±��=4
			װ��λ��=3	
		elseif װ��λ������=="����" then
			װ��ȡ�±��=5
			װ��λ��=5	
		elseif װ��λ������=="Ь��" then
			װ��ȡ�±��=6
			װ��λ��=4		
		elseif װ��λ������=="�·�" then
			װ��ȡ�±��=12
			װ��λ��=2
		elseif װ��λ������=="����" then
			װ��ȡ�±��=13
			װ��λ��=7
		elseif װ��λ������=="����" then
			װ��ȡ�±��=14
			װ��λ��=17
		
		elseif װ��λ������=="����" then
			װ��ȡ�±��=25
			װ��λ��=19
		
		elseif װ��λ������=="����" then
			װ��ȡ�±��=16
			װ��λ��=20
			
		--------------------------------------����װ��
		elseif װ��λ������=="����ӡ" then
			װ��ȡ�±��=""
			װ��λ��=21
		
		elseif װ��λ������=="���" then
			װ��ȡ�±��=""
			װ��λ��=18
	end
	-------------------------------------------

	local װ���־� = tonumber( LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], װ��λ��)))
	
	 if װ��λ������=="���" then
	    local װ���־�= ȡ�����������()
	 end
	
	if װ���־�<=0 then
		��Ļ��ʾ("װ���־ò���,��ȡ��")
		return 0
	end
	
     �ƴ�ѭ�� i=1,5 ִ��
         LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
         ��ʱ (1000)
         ��� �����Ƿ����("SelfEquip") ==1 ��   
		װ������ = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], װ��λ��))

		if װ������=="" then
			��Ļ��ʾ(װ��λ������.."������װ��")
			return 0
			else
             ��Ļ��ʾ("��Ҫ������װ��:"..װ��λ������.."|"..װ������)
		end
              if װ��λ������=="����ӡ" then
				
				 LUA_Call ("setmetatable(_G, {__index = Xiulian_Env});Xiulian_JueWei_Page_Switch();")
				 ��ʱ (2000)
				 LUA_Call ("setmetatable(_G, {__index = SelfJunXian_Env});SelfJunXian_Equip_Clicked(0);")
             	��ʱ (2000)
				�رմ���("SelfJunXian")
				elseif װ��λ������=="���" then
				 LUA_Call ("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Wuhun_Switch();")
				 ��ʱ (2000)
				 LUA_Call ("setmetatable(_G, {__index =  Wuhun_Env});Wuhun_Equip_Clicked(0);")
             	��ʱ (2000)
				�رմ���("Wuhun")
				else
				 LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], װ��ȡ�±��))
			end 
             
              ��ʱ (1000)
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
              ��� װ��ID=="0" ��  --�������װ���ɹ�
                   LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
                   ��ʱ(500)  
                   ���� װ������
              ����
         ����      
     ����
     LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
     ��ʱ(500) 
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
     ��� װ��ID=="0" ��
          ���� װ������
     ����  
          ���� 0
     ����     
end


function ���촩��װ��(װ������,װ��λ������)
     if װ������==""  then
		��Ļ��ʾ("��������,���촩��װ��")
		return
	end
	
	if ��ȡ������Ʒ����(װ������)<=0 then
		��Ļ��ʾ("û��װ���޷�ʹ��,���촩��װ��")
		return
	end	
		
     if װ��λ������=="���ָ"  then
		װ��ȡ�±��=7
		װ��λ��=6
		elseif װ��λ������=="�ҽ�ָ" then
		װ��ȡ�±��=8
		װ��λ��=11
       elseif  װ��λ������=="�󻤷�" then
		װ��ȡ�±��=9
		װ��λ��=12
		elseif װ��λ������=="�һ���" then
		װ��ȡ�±��=10
		װ��λ��=13
       elseif  װ��λ������=="����" then
		װ��ȡ�±��=11
		װ��λ��=0
		elseif װ��λ������=="ñ��" then
		װ��ȡ�±��=1
		װ��λ��=1
	   elseif װ��λ������=="����" then
		װ��ȡ�±��=2
		װ��λ��=15	
	    elseif װ��λ������=="����" then
		װ��ȡ�±��=3
		װ��λ��=14	
		elseif װ��λ������=="����" then
		װ��ȡ�±��=4
		װ��λ��=3	
		elseif װ��λ������=="����" then
		װ��ȡ�±��=5
		װ��λ��=5	
		elseif װ��λ������=="Ь��" then
		װ��ȡ�±��=6
		װ��λ��=4
		elseif װ��λ������=="�·�" then
		װ��ȡ�±��=12
		װ��λ��=2
		elseif װ��λ������=="����" then
		װ��ȡ�±��=13
		װ��λ��=7
		elseif װ��λ������=="����" then
		װ��ȡ�±��=14
		װ��λ��=17
		elseif װ��λ������=="����" then
		װ��ȡ�±��=25
		װ��λ��=19
		elseif װ��λ������=="����" then
		װ��ȡ�±��=16
		װ��λ��=20
		elseif װ��λ������=="����ӡ" then
		װ��ȡ�±��="100"
		װ��λ��=21
		elseif װ��λ������=="���" then
		װ��ȡ�±��="100"
		װ��λ��=18
		else
			��Ļ��ʾ("�����úö�Ӧ��װ��������ʹ�ô���װ��")
			return
	end

     for i=1,5 do
        if �����Ƿ����("SelfEquip") ==0 then
			LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
			��ʱ (1000)
		end
		if �����Ƿ����("Packet") ==0 then
			LUA_Call ("setmetatable(_G, {__index = Packet_Env});this:Show();")
			��ʱ (1000)
		end
		
	    if װ��λ������=="���" then
			����_������()
			LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
			�Ҽ�ʹ����Ʒ(װ������,1) 
			��ʱ(6000)
		else
			LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
			�Ҽ�ʹ����Ʒ(װ������,2) 
			��ʱ(2000)
			�Ҽ�ʹ����Ʒ(װ������,2) 
			��ʱ(2000)
		end
		
		װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
		
		��ǰװ������ = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], װ��λ��))

     if tonumber(װ��ID)>0 then
		      ��Ļ��ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ��)
              ����ѭ��   
         end
     end
end

---------------------------------------------------------------------------


function ����_�Զ���ʯ(װ��λ������,��ײ���,��Ƕ����,��ʯ����,��λ����)

	��ͼѰ·("����",282,321)
	��ִ��װ������= ����ȡ��װ����ȡ����(װ��λ������)
	��ʱ(3000)
    if װ������=="" or  װ������==nil then
            return
     end
	��Ļ��ʾ("װ��λ������:"..��ִ��װ������)
     LPindex=��ȡ������Ʒλ��(��ִ��װ������)-1
	��Ļ��ʾ("����׵ı������:"..LPindex)
	if LPindex<0 then
		    return
	end
	��ʱ(3000)
	װ�����(��ִ��װ������,��ײ���,��λ����)
	��ʱ(6000)
	����_װ���ϱ�ʯ(��ִ��װ������,��Ƕ����,��ʯ����,��λ����)
	
	��ʱ(6000)
	���촩��װ��(��ִ��װ������,װ��λ������)
end




��Ļ��ʾ("������")
�Զ����("�ɻ�ʯ")
����_�Զ���ʯ("����","��ţ��","��ʯ��Ƕ��","�챦ʯ(3��)",1)
����_�Զ���ʯ("����","��ţ��","��ʯ��Ƕ��","�챦ʯ(3��)",1)



����_�Զ���ʯ("����","��ţ��","��ʯ��Ƕ��","�챦ʯ(3��)",1)

