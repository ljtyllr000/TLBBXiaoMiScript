function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ103900393��ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
		--#Y
	]], strCode))
end

function �رմ���(strWindowName)
      if �����Ƿ����(strWindowName)==1 then
	    LUA_Call(string.format([[
	            setmetatable(_G, {__index = %s_Env}) this:Hide()  
	  ]], strWindowName))  
	  end
end
--------------------------------------------------------------
function  ȡװ���־�(aaa)
return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa)))
end
function  ȡװ��ID(aaa)
return  LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], aaa))
end

function  ȡװ������(aaa)
return  LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end

function  ȡ����װ���ȼ�(index)
local aaa=  LUA_ȡ����ֵ(string.format([[ 
		return LifeAbility : Get_Equip_Level(%d);
	]], index))
	return tonumber(aaa)
end



function  ȡ�����������()--300���
       if  ����ֵ( ȡװ��ID(18) )>0 then
			return  ����ֵ(LUA_ȡ����ֵ(string.format([[ 
		return DataPool:GetKfsData("LIFE")
	]])))
	else
	return -1
    end
end


function ���촩��װ��(װ������,װ��λ������)
     if װ������==""  then
		����_��Ļ��ʾ("��������,���촩��װ��")
		return
	end
	
	if ��ȡ������Ʒ����(װ������)<=0 then
		����_��Ļ��ʾ("û��װ���޷�ʹ��,���촩��װ��")
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
			����_��Ļ��ʾ("�����úö�Ӧ��װ��������ʹ�ô���װ��")
			return
	end

     for i=1,5 do
        if �����Ƿ����("SelfEquip") ==0 then
			LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
			��ʱ (1500)
		end
		if �����Ƿ����("Packet") ==0 then
			LUA_Call ("setmetatable(_G, {__index = Packet_Env});this:Show();")
			��ʱ (1500)
		end
		�رմ���("SuperWeaponUpNEW")
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
		      ����_������ʾ(" ����ɹ�����"..װ������.."|��λ��:"..װ��λ��)
              ����ѭ��   
         end
     end
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
			װ��λ��=2
			
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
		����_��Ļ��ʾ("װ���־ò���,��ȡ��")
		return 0
	end
	
     �ƴ�ѭ�� i=1,5 ִ��
         LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
         ��ʱ (1500)
         ��� �����Ƿ����("SelfEquip") ==1 ��   
		װ������ = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetName()
	]], װ��λ��))

		if װ������=="" then
			����_��Ļ��ʾ(װ��λ������.."������װ��")
			return 0
			else
             ����_������ʾ("��Ҫ������װ��:"..װ��λ������.."|"..װ������)
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
              ��ʱ (1500)
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
              ��� װ��ID=="0" ��  --�������װ���ɹ�
                   LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
                   ��ʱ(1500)  
                   ���� װ������
              ����
         ����      
     ����
     LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
     ��ʱ(1500) 
			װ��ID = LUA_ȡ����ֵ(string.format([[ 
		return EnumAction(%d,"equip"):GetID()
	]], װ��λ��))
	
     ��� װ��ID=="0" ��
          ���� װ������
     ����  
          ���� 0
     ����     
end

�������ּ���="�����ɷ���|���������|�̺����λ�|������Ӱ��|�ܽ����յ�||������Ƶ�|��ˮ�޺۽�|����ŪӰ��|����������|����������|�̺��貨��|̫�������||�ٴ������|�����ͬ��|"
-------------------------------------------------------------------------------------------
function ����_��������(װ��λ������)
		����_��Ļ��ʾ("����_��������:"..װ��λ������)
			local װ������ = ����ȡ��װ����ȡ����(װ��λ������)
					if string.find (�������ּ���,װ������) then
							����_��Ļ��ʾ("����_��ʼ��������")
						��ͼѰ·("����",354,240);��ʱ (1500)
	  �ƴ�ѭ�� i=1,5 ִ��
         ��� �Ի�NPC("ŷ����")==1 ��
              NPC�����Ի�("��������",0)      --����1���Ի��ı�  ����2:ģ���Ի���0��ʾ��ȷ 1��ʾģ��
              ��ʱ (1500)
              ��� �����Ƿ����("SuperWeaponUpNEW")==1 ��
                   �Ҽ�ʹ����Ʒ(װ������,1)  --����2Ϊʹ�ô���1�Σ���ʡ�ԣ�Ĭ��Ϊ1��
                   LUA_Call ("setmetatable(_G, {__index = SuperWeaponUpNEW_Env});SuperWeaponUpNEW_Buttons_Clicked();")
                   ��ʱ (1500)
                   ����ѭ��
              ����
         ���� 
              ��ʱ(1000)
         ����
     ����   	
					end
			
			���촩��װ��(װ������,װ��λ������);��ʱ(1500)  								
end

 ����_��������("����")