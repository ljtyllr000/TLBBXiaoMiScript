function �رմ���(strWindowName)
      if �����Ƿ����(strWindowName)==1 then
	    LUA_Call(string.format([[
	            setmetatable(_G, {__index = %s_Env}) this:Hide()  
	  ]], strWindowName))  
	  end
end

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

function ����_ȡ��Ů�ȼ�()
		local tem=LUA_ȡ����ֵ(string.format([[
			TTCount = Infant:GetInfantCount()
			if TTCount<= 0 then
				return 0
			end
			return Infant:GetInfantLevel(0)
			]]))  
		return tonumber(tem)
end


function ����_ȡ��Ů����(index)
		local tem =LUA_ȡ����ֵ(string.format([[
			index = %d
	        local znsl =  Infant:GetInfantCount();
			if znsl>= 0 then
				Level=Infant:GetInfantLevel(0)  --�ȼ� 
				Type=Infant:GetHeroType(0)  --�׶� 
			end
			if index == 1 then
				return znsl
			elseif index == 2 then
				return Level
			elseif index == 3 then 
				return Type       --û��ѡ��־��ǰΪ0 ѡ���Ϊ1 
			end			
	  ]],index));
	return tonumber(tem)
end




function �����̻���Ʒ(����, ����, �۸�,�ж��Ƿ�����Ʒ)
     ȡ����Ʒ("���",200000)  
     if ����ֵ(��ȡ������Ϣ(45))<100000 then
		����_������ʾ("��Ҳ����޷�����:"..����)
		����Ʒ("���")
     	    return false
     end     
     if tonumber(�ж��Ƿ�����Ʒ)==1 then
      if ��ȡ������Ʒ����(����)>=1 then
       ����_������ʾ("�������������Ʒ"..����)
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
					--��Ʒ��,������,�����̵�ID,����,�۸�
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
	]], ����, ����, �۸�), "b")
    
    ��ʱ (2000)
	�رմ���("PS_ShopSearch")
	�رմ���("PS_ShopList")
	�رմ���("Quest")	
	return tem
end





function ����_��Ůѡ��־��(index)   --1 �� --2��--3�� 4��
	LUA_Call(string.format([[
	--�ж��Ƿ�����Ů
	local InfantCount = Infant:GetInfantCount();
	if tonumber(InfantCount) <= 0 then
		return
        else
	end
	--�Ƿ�ﵽ91��
	local level = Infant:GetInfantLevel(0)
	if tonumber(level) < 91 then
		PushDebugMessage("#{YXPY_20131118_36}")
		return
	end
    local heroType = tonumber(Infant:GetHeroType(0))
	if heroType ~= 0 then
        PushDebugMessage("[����] ��ǰ�Ѿ���־��")
		return
	elseif heroType == 0 then
        PushDebugMessage("[����]   ����ѡ��־��")
	    Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("ChoseInfantHeroType");
		Set_XSCRIPT_ScriptID(890630);
		Set_XSCRIPT_Parameter(0,%d);
	 	Set_XSCRIPT_ParamCount(1);
	    Send_XSCRIPT();
	end
	]], index))
end

function ����_��Ů�Զ�ѡ��־��()
	if ����_ȡ��Ů����(3)==0 and ����_ȡ��Ů����(2)== 91 then
		��������,����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
		��ͼѰ·("����",151,176)
		if string.find("����|����|ؤ��", ����) then  
			����_��Ůѡ��־��(1)
		elseif  string.find("��ң|����|", ����) then
			����_��Ůѡ��־��(2)
		elseif  string.find("����|��ɽ|�䵱", ����) then
			����_��Ůѡ��־��(3)
		 elseif  string.find("����|����|���|Ľ��", ����) then
			����_��Ůѡ��־��(4)
		end

		else
			����_������ʾ("��ǰ�Ѿ�����Ů�Ѿ�ѡ��־����������")      		
      end  
			    ��ʱ(3000)
end

function ����_��Ů�Զ�����119()
	 if ����_ȡ��Ů����(2)< 119 and  ����_ȡ��Ů����(2)>=91 then
		����="�伮��ҳ"
		ȡ����Ʒ(����)
		for i=1,5 do
			if   ��ȡ������Ʒ����(����)== 0 then
				����_������ʾ("û����������:"..����)
				�����̻���Ʒ("�伮��ҳ", 250,80*10000,1)
			end
		 while ����_ȡ��Ů����(2)< 119 and  ��ȡ������Ʒ����(����)>=1 do

					  ����_������ʾ("��ʹ����Ʒ�������鵽119")	  
					  �Ҽ�ʹ����Ʒ(����)
					  ��ʱ(200)
			end
		end 
	end
end


function ����_��Ů�Զ�91()
  if ����_ȡ��Ů����(1)>=1  and ����_ȡ��Ů����(2)< 91 then
	����="�����¶"
	--�����¶|��ϼ��¶|
	ȡ����Ʒ(����)
	--���ӹ���
       while  ��ȡ������Ʒ����(����)>=1 and  ����_ȡ��Ů����(2)< 91 do
              ����_������ʾ("������Ů"..����)	  
               �Ҽ�ʹ����Ʒ(����)
               ��ʱ(300)
        end
		while  ��ȡ������Ʒ����("��ϼ��¶")>=1 and  ����_ȡ��Ů����(2)< 91 do
              ����_������ʾ("������Ů��ϼ��¶")	  
               �Ҽ�ʹ����Ʒ("��ϼ��¶")
               ��ʱ(300)
        end
	else
	   ����_������ʾ("��Ů�ȼ�>=91|��������")	  
	end	
	��ʱ(3000)
end

function ����_�Զ�������Ů()
	 if ����_ȡ��Ů����(1)<=0  then
		ִ�й���("����������Ů")
		else
		����_������ʾ("��ǰ�Ѿ�����Ů��������")      
	end
	��ʱ(3000)
end

function ����_��Ůȫ�Զ�����()
	����_�Զ�������Ů()
	����_��Ů�Զ�91()
	����_��Ů�Զ�ѡ��־��()
	����_��Ů�Զ�����119()
	--ִ�й���("��Ů��������")     
end


����_��Ůȫ�Զ�����()
