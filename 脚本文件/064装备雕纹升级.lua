


function ȡ������Ʒ(���б�)
ȡ����Ʒ(���б�)
����Ʒ(���б�,������Ʒ,0,1,1)
end
--------------------------------------------------------------------------------------------------
function PushDebugMessage(AAA)
   ��Ļ��ʾ(AAA)
end

function Sleep(AAA)
   ��ʱ(AAA)
end

-----------------------------------------------

ȡ������Ʒ("���˿|����")

---------------------------------------------
function ������ȷ��()
for i=1,3 do
if  �����Ƿ����("MessageBox_Self")==1 then
    --��Ļ��ʾ("������ȷ��")
    LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
	��ʱ(2000)
end
end
end

function ���촩��װ��(װ������,װ��λ������)
     if װ������==""  then
		��Ļ��ʾ("��������,���촩��װ��")
				��Ļ��ʾ("��������,���촩��װ��")
						��Ļ��ʾ("��������,���촩��װ��")
		return
	end
	
	if ��ȡ������Ʒ����(װ������)<=0 then
	��Ļ��ʾ("û��װ���޷�ʹ��,���촩��װ��")
		��Ļ��ʾ("û��װ���޷�ʹ��,���촩��װ��")
			��Ļ��ʾ("û��װ���޷�ʹ��,���촩��װ��")
			return
	end	
		
	
     if װ��λ������=="���ָ"  then
		--װ��ȡ�±��=7
		װ��λ��=6
		elseif װ��λ������=="�ҽ�ָ" then
		--װ��ȡ�±��=8
		װ��λ��=11
       elseif  װ��λ������=="�󻤷�" then
		--װ��ȡ�±��=9
		װ��λ��=12
		elseif װ��λ������=="�һ���" then
		--װ��ȡ�±��=10
		װ��λ��=13
       elseif  װ��λ������=="����" then
		--װ��ȡ�±��=0
		װ��λ��=0
		elseif װ��λ������=="ñ��" then
		--װ��ȡ�±��=1
		װ��λ��=1
	   elseif װ��λ������=="����" then
		--װ��ȡ�±��=2
		װ��λ��=15	
			   elseif װ��λ������=="����" then
		--װ��ȡ�±��=3
		װ��λ��=14	
			   elseif װ��λ������=="����" then
		--װ��ȡ�±��=4
		װ��λ��=3	
			   elseif װ��λ������=="����" then
		--װ��ȡ�±��=5
		װ��λ��=5	
					   elseif װ��λ������=="Ь��" then
		--װ��ȡ�±��=6
		װ��λ��=4
		
		elseif װ��λ������=="�·�" then
		--װ��ȡ�±��=12
		װ��λ��=2
			elseif װ��λ������=="����" then
		--װ��ȡ�±��=13
		װ��λ��=7
		
		elseif װ��λ������=="����" then
		--װ��ȡ�±��=14
		װ��λ��=17
		
		elseif װ��λ������=="����" then
		--װ��ȡ�±��=25
		װ��λ��=19
		
		elseif װ��λ������=="����" then
		--װ��ȡ�±��=16
		װ��λ��=20
		
		elseif װ��λ������=="����ӡ" then
		--װ��ȡ�±��=""
		װ��λ��=21
		
		elseif װ��λ������=="���" then
		--װ��ȡ�±��=""
		װ��λ��=18
		else
		��Ļ��ʾ("�����úö�Ӧ��װ��������ʹ�ô���װ��")
		return
	end

     �ƴ�ѭ�� i=1,5 ִ��
         ��ʱ(2000)
		 �Ҽ�ʹ����Ʒ(װ������,2) 
         ��ʱ(2000)


		װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
		
		��ǰװ������ = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], װ��λ��))

        ��� ����ֵ(װ��ID)>0   ��--װ���ɹ�
		��Ļ��ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ��)
              ����ѭ��   
         ����
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
	-------------------------------------------
		local װ���־� =����ֵ( LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], װ��λ��)))
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
		end

              LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], װ��ȡ�±��))
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

function �����������(װ��λ������,�ȼ�)
	if ����ֵ(��ȡ������Ϣ(45)+��ȡ������Ϣ(52)) <5*10000 then
			    ��Ļ��ʾ("��ͨ��������,��Ҳ���")
		return
	end
if tonumber(index)==3 then
	��Ҫ������=9
	elseif tonumber(index)==4 then
	��Ҫ������=50
		elseif tonumber(index)==5 then
			��Ҫ������=87
				elseif tonumber(index)==6 then
			��Ҫ������=165
			else 
				��Ҫ������=10
end
if ��ȡ������Ʒ����("���˿")< ��Ҫ������ then
	    ��Ļ��ʾ("��ͨ������������ ������ͨ��������")
		return
end

	��Ļ��ʾ("�Զ�ǰ������װ����������")
	��ͼѰ·("����",318,313)
	
      LPname= ����ȡ��װ����ȡ����(װ��λ������)
	     ��ʱ(2000) 
        if LPname==0 then
             return
         end

	  ��Ļ��ʾ("װ��λ������:"..LPname)
     LPindex=��ȡ������Ʒλ��(LPname)-1
	     ��Ļ��ʾ("����ͨ�����ı������:"..LPindex)
	if LPindex<0 then
		    return
	end

local tem =LUA_ȡ����ֵ(string.format([[
      
		local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
		if selfMoney<50000 then
					PushDebugMessage("��ͨ����������Ҳ���")
					return 2
		end
		
	    local index = tonumber(%d)
	    local todwlevel= tonumber(%d)	
		local IsHaveDiaowen = LifeAbility:IsEquipHaveDiaowen(index)
	    local IsHaveDiaowenEx = LifeAbility:IsEquipHaveDiaowenEx(index)
		if  tonumber(IsHaveDiaowen)~=1 then
				PushDebugMessage("װ��û�е���")
				return 2
		end
		
			local dwId,dwlevel = LifeAbility:GetEquitDiaowenID(index)
			local dwIdEx,dwlevelEx = LifeAbility:GetEquitDiaowenIDEx(index)
			
         if dwlevel>=todwlevel then
				PushDebugMessage("�����Ѿ������õȼ�:"..todwlevel)
				return 2
          end
		
Clear_XSCRIPT()
Set_XSCRIPT_Function_Name("DoEquipDWLevelUp")
Set_XSCRIPT_ScriptID(809272)
Set_XSCRIPT_Parameter(0, index) --���������
Set_XSCRIPT_Parameter(1, todwlevel)  --��һ������Ҫ�����ĵȼ�
Set_XSCRIPT_Parameter(2, 0) --�ڶ�������Ҫ�����ĵȼ�
Set_XSCRIPT_Parameter(3, 0)  --0������ʾֱ���� 1��������ʾ
Set_XSCRIPT_ParamCount(4)
Send_XSCRIPT()
			
			

		]], LPindex,�ȼ�),"n")


 ���촩��װ��(LPname,װ��λ������)

end

local  aaaaa,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()

function  ����ȫ�Զ���������(index)
��Ļ��ʾ("�����������:  "..index)
��Ļ��ʾ("�����������:  "..index)
��Ļ��ʾ("�����������:  "..index)
if tonumber(index)==3 then
	��Ҫ������=9
	elseif tonumber(index)==4 then
	��Ҫ������=50
		elseif tonumber(index)==5 then
			��Ҫ������=87
				elseif tonumber(index)==6 then
			��Ҫ������=165
			else 
				��Ҫ������=10
end
if ��ȡ������Ʒ����("���˿")< ��Ҫ������ then
	    ��Ļ��ʾ("��ͨ������������ ������ͨ��������")
		return
end

if string.find("����", menpai) then
�����������("����",index)
�����������("����",index)
�����������("����",index)
�����������("Ь��",index)
�����������("ñ��",index)
�����������("�·�",index)

�����������("�󻤷�",index)
�����������("�һ���",index)
�����������("���ָ",index)
�����������("�ҽ�ָ",index)
�����������("����",index)
�����������("����",index)
else 

�����������("�󻤷�",index)
�����������("�һ���",index)
�����������("���ָ",index)
�����������("�ҽ�ָ",index)
�����������("����",index)
�����������("����",index)

�����������("����",index)
�����������("����",index)
�����������("����",index)
�����������("Ь��",index)
�����������("ñ��",index)
�����������("�·�",index)
end

end
 ����ȫ�Զ���������(4)
 ����ȫ�Զ���������(5)
 ����ȫ�Զ���������(6)