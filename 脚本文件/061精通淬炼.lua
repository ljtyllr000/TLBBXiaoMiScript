--ִ�й���("[�ű�]�����ʼ��������")


ȡ��������Ϊ =1
-------------1,���������
-------------2,���ض����ɺ�����

------------------------------------------------
function  ȡװ���־�(aaa)
return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa)))
end

function  ȡװ��ID(aaa)
return ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], aaa)))
end

function  ȡװ������(aaa)
return  LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end

--------------------------------------------------------------
function  ȡ�����������()--300���
       if  ����ֵ( ȡװ��ID(18) )>0 then
			return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return DataPool:GetKfsData("LIFE")
	]])))
	else
	return -1
    end
end
function ������ȷ��()
for i=1,3 do
if  �����Ƿ����("MessageBox_Self")==1 then
    --��Ļ��ʾ("������ȷ��")
    LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
	��ʱ(2000)
    end
  end
end

--0=���� 1=���� 2=���� 3=���� 4=Ь�� 5=���� 6=��ָ1 7=���� 8=����1 9=���� 10=���� 11=��ָ2 12=����1 13=����2 14=���� 
--15=���� 16=ʱװ 17=���� 18=������ 19=���� 20=������� 21=��ӡ

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
		װ��ȡ�±��=""
		װ��λ��=18
		else
		��Ļ��ʾ("�����úö�Ӧ��װ��������ʹ�ô���װ��")
		return
	end

     �ƴ�ѭ�� i=1,5 ִ��
	    if װ��λ������=="���" then
		����_������()
		�Ҽ�ʹ����Ʒ(װ������,2) 
         ��ʱ(6000)
		else
		�Ҽ�ʹ����Ʒ(װ������,2) 
         ��ʱ(1000)
		end
		
		װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
		
		��ǰװ������ = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], װ��λ��))

        ��� ����ֵ(װ��ID)>0   ��
		��Ļ��ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ��)
              ����ѭ��   
         ����
     ����
end



--���촩��װ��("��������","����")
--SelfEquip_Equip_Click( 7,0 ); ����Ľ�ָ

function ����ȡ��װ��(װ��λ������)
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
		װ��ȡ�±��=0
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
		װ��ȡ�±��=""
		װ��λ��=21
		
		elseif װ��λ������=="���" then
		װ��ȡ�±��=""
		װ��λ��=18
	end
	
     �ƴ�ѭ�� i=1,5 ִ��
         LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
         ��ʱ (1000)
         ��� �����Ƿ����("SelfEquip") ==1 ��   
              LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], װ��ȡ�±��))
			
              ��ʱ (1000)
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
              ��� װ��ID=="0" ��  --�������װ���ɹ�
                   LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
                   ��ʱ(500)  
                   ���� 1   
              ����
         ����      
     ����
     LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
     ��ʱ(500) 
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
     ��� װ��ID=="0" ��
          ���� 1   
     ����  
          ���� 0
     ����     
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

		local װ���־� =����ֵ( LUA_ȡ����ֵ(string.format([[ 
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
         ��� �����Ƿ����("SelfEquip") ��   
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
-------------------------------------------------------------------------------------

function ����װ������(װ��λ������,����,����)
		
	if ��ȡ������Ʒ����("���")< 15 then
	    ��Ļ��ʾ("��𲻹�15�� ������ͨ���")
		return
	end	
	if ����ֵ(��ȡ������Ϣ(45)+��ȡ������Ϣ(52)) <3*10000 then
			    ��Ļ��ʾ("��ͨ���,��Ҳ���")
		return
	end	
	
--����ж�
    if ����=="����" then
		JT_SHUXING="con"
		
		elseif ����=="��" then
		JT_SHUXING="attack_fire"
		
		elseif ����=="��" then
		JT_SHUXING="attack_light"
		
		elseif ����=="��" then
		JT_SHUXING="attack_cold"
		
		elseif ����=="��" then
		JT_SHUXING="attack_poison"
	else
				    ��Ļ��ʾ("��ͨ���,�����úò���")
	return		    
	end
	��Ļ��ʾ("װ����ȡ������Ϊ:"..����)
	��ͼѰ·("����",364,245)
	
	
      LPname= ����ȡ��װ����ȡ����(װ��λ������)

        if LPname==0 then
             return
         end
		      ��Ļ��ʾ("װ��λ������:"..LPname)
     LPindex=��ȡ������Ʒλ��(LPname)-1
	     ��Ļ��ʾ(LPindex)
	if LPindex<0 then
		    return
	end


		
        for iii=1,50 do

		
		local tem =LUA_ȡ����ֵ(string.format([[
	    local index = tonumber(%d)
		
		local equip_level = LifeAbility : Get_Equip_Level(index);
		if equip_level <80 then
				PushDebugMessage("װ���ȼ��������ܴ���")
					return 2
		end
		
		
		
		local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
		if selfMoney<50000 then
					PushDebugMessage("����Ҳ���")
					return 2
		end
		
		
		  --local curTime = OSAPI:GetTickCount()
		  --PushDebugMessage(curTime)

               local theAction = EnumAction(index, "packageitem")
			
			   JT_ABC=tostring("%s") 
			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(0);
						 if	string.find(pName, JT_ABC)  then	
								JT_AAA=1
								else
								JT_AAA=0
						end
			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(1);		
			 if	string.find(pName, JT_ABC)  then
								JT_BBB=1
				else
								JT_BBB=0
				end
				
			local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(2);		
			 if	string.find(pName,JT_ABC )  then
								JT_CCC=1
				else
								JT_CCC=0
			end	
			local JT_shuliang=JT_AAA+JT_BBB+JT_CCC
           if  JT_shuliang>=1 then
		   local itemneed=PlayerPackage:CountAvailableItemByIDTable(20700063) 
		    if itemneed < 15 then
			PushDebugMessage("��𲻹�")
			 return 2
			end
		   end
		
			PushDebugMessage(JT_AAA..JT_BBB..JT_CCC)
				    if JT_AAA+JT_BBB+JT_CCC>=%d then
						PushDebugMessage("��ͨ�����㹻����,���ٴ��")
						return 2
					end
					
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name("EquipCuiLian");
				Set_XSCRIPT_ScriptID(890088);
				Set_XSCRIPT_Parameter(0,%d);
				Set_XSCRIPT_Parameter(1,JT_AAA)
				Set_XSCRIPT_Parameter(2,JT_BBB)
				Set_XSCRIPT_Parameter(3,JT_CCC)
				Set_XSCRIPT_ParamCount(4);
			Send_XSCRIPT();	
		]], LPindex,JT_SHUXING,����,LPindex), "d")
		��Ļ��ʾ(tem)
		��ʱ(3000)
		 if tonumber(tem)==2 then
			����ѭ��
		 end
		end
		
		���촩��װ��(LPname,װ��λ������)
		���촩��װ��(LPname,װ��λ������)
end


local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()


if  ȡ��������Ϊ == 1 then
local tem =LUA_ȡ����ֵ(string.format([[
	local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
	local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
	local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
	local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
local tt={ iIceAttack, iFireAttack, iThunderAttack,iPoisonAttack}
if iIceAttack==math.max(unpack(tt)) then
   maxOfT ="��"
elseif  iFireAttack==math.max(unpack(tt)) then
maxOfT ="��"
elseif  iThunderAttack==math.max(unpack(tt)) then
maxOfT ="��"
elseif  iPoisonAttack==math.max(unpack(tt)) then
maxOfT ="��"
end

return maxOfT 
]]), "s")
���Թ���=tem
��Ļ��ʾ("���Թ���:"..���Թ���)
end

if  ȡ��������Ϊ == 2 then
if string.find("����|����|ؤ��", menpai) then
���Թ���="��"
elseif  string.find("��ң|����|", menpai) then
���Թ���="��"
elseif  string.find("����|��ɽ|", menpai) then
���Թ���="��"
elseif  string.find("����|����|���|Ľ��|�䵱", menpai) then
���Թ���="��"
end

local  ������������ = "111|aaa|"
local  ������������ = "111|aaa|"
local  ������������ = "111|aaa|"
local  ������������ = "111|aaa|"

if string.find(������������, ��������) then
���Թ���="��"
elseif  string.find(������������, ��������) then
���Թ���="��"
elseif  string.find(������������, ��������) then
���Թ���="��"
elseif  string.find(������������, ��������) then
���Թ���="��"
end
--��Ļ��ʾ("���Թ���:"..���Թ���)
end


function  ����_ȫ�Զ�����(index)
ȡ����Ʒ("���")
����Ʒ("���",������Ʒ,0,1,1)
if ��ȡ������Ʒ����("���")< 15 then
	    ��Ļ��ʾ("��𲻹�15�� ������ͨ���")
		return
end	
	
if string.find("����", menpai) then
����װ������("����","����",index)
����װ������("����","����",index)
����װ������("����","����",index)
����װ������("Ь��","����",index)
����װ������("ñ��","����",index)
����װ������("�·�","����",index)

--����װ������("���ָ",���Թ���,index) 
--����װ������("�ҽ�ָ",���Թ���,index) 
--����װ������("�󻤷�",���Թ���,index) 
--����װ������("�һ���",���Թ���,index) 
--����װ������("����",���Թ���,index) 
--����װ������("����",���Թ���,index) 

else 
����װ������("���ָ",���Թ���,index) 
����װ������("�ҽ�ָ",���Թ���,index) 
����װ������("�󻤷�",���Թ���,index) 
����װ������("�һ���",���Թ���,index) 
����װ������("����",���Թ���,index) 
����װ������("����",���Թ���,index) 

--����װ������("����","����",index)
--����װ������("����","����",index)
--����װ������("����","����",index)
--����װ������("Ь��","����",index)
--����װ������("ñ��","����",index)
--����װ������("�·�","����",index)
end
����Ʒ("���")
end

����_ȫ�Զ�����(1) --��������
����_ȫ�Զ�����(2)
����_ȫ�Զ�����(3)