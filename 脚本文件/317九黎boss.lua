	
BOSS����="����սʿ"
�������� ="����"
--------------------------------------------------------------------	
	
	
	
��������,����,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		DebugListBox_ListBox:AddInfo("#e0000ff#u#g28f1ff".."������������ʾ��%s")	--
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#u#g28f1ff
	]], strCode))
end

-------------------------------------------------------------------------------------------------------

function �ٻ�����(nIndex)
LUA_Call(string.format([[
          Pet : Go_Fight(%d)		
		]], nIndex), "n");
end

function GetPetIndexbyName(petName)
  local tem= LUA_ȡ����ֵ(string.format([[
		    local nPetCount = Pet : GetPet_Count();
		    if nPetCount == 0  then
			   return -1
			end
			for k = 0, nPetCount - 1 do
			    local strName,strName2 = Pet:GetName(k)
				if string.find("%s", strName) then
				   return k;
				end
			end			
			return -1			
		]], petName), "n");
	return tonumber(tem)
		
end

function ����_����ٻ�����(��������)
if tonumber(��ȡ������Ϣ(18))<=0  then
	ind = tonumber(GetPetIndexbyName(��������))
	if ind >=0 then
     �ٻ�����(ind)
      ��ʱ(3000)
	else
	��Ļ��ʾ("û���������"..��������)
	end
end
end

function Pet_GetHP(nIndex)
     return LUA_ȡ����ֵ(string.format([[
	            
	            local nIndex = %d
				local intTemp = Pet : GetHP(nIndex)
				local intTemp2 = Pet: GetMaxHP(nIndex)	
                local HP_Percent = intTemp/intTemp2*100			
	            return HP_Percent
	 ]], nIndex), "n")   
end


function Pet_GetHappy(nIndex)
     return LUA_ȡ����ֵ(string.format("return Pet : GetHappy(%d)", nIndex), "n")
end

function ����_��ȡ��ӱ��()
	��������,����1,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	for i=1,6 do
		����,�ȼ�,����,Ѫ��,��ͼ,X����,Y����=���_��ȡ��Ա��Ϣ(i)
		if ��������== ���� then
			return i
		end
	end
	return-1
end

function ����_��ⱦ����Ѫ�ӿ���(��������)
local index = tonumber(GetPetIndexbyName(��������))
	if index >=0 and index ~= nil then
	   if tonumber(Pet_GetHP(index)) <=90 then
		��Ļ��ʾ(��������.."Ѫ�����ڰٷ�֮90�Զ�ι��")
			LUA_Call(string.format([[
          Pet:Feed(%d)		
		]], index), "n");
	end
	if tonumber(Pet_GetHappy(index)) <=90 then
		if  tonumber(Pet_GetHappy(index)) <=60 then
						LUA_Call(string.format([[
          Pet:Feed(%d)		
		]], index), "n");
		end
		��Ļ��ʾ(��������.."�������ڰٷ�֮90�Զ�ι��")
		LUA_Call(string.format([[
          Pet:Dome(%d)		
		]], index), "n");
		��ʱ(200)
	end
end
end

function ����_ʹ�������鶨λ()
	if ��ȡ������Ʒ����("������") > 0 then
		����_������();��ʱ(1000)
		����_������();��ʱ(1000)
		�Ҽ�ʹ����Ʒ("������",1);��ʱ(3000)
		if �����Ƿ����("Item_TuDunZhu")==1 then
			����_������();��ʱ(1000)
			LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_Cancel_Clicked(1);") ;��ʱ(3000)
			--LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();") ;��ʱ(3000)
			--LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});this:Hide()") ;��ʱ(3000)
			end
		��ʱ(6000)
	end	
end

------------------------------------------------------------------------------------------------------------
function ����_����ģʽ(ģʽ)
	if ģʽ=="��ƽ" then
		LUA_ȡ����ֵ("Player:ChangePVPMode(0);","",0);
	elseif ģʽ=="����" then
		LUA_ȡ����ֵ("Player:ChangePVPMode(1);","",0);
	elseif ģʽ=="���" then
		LUA_ȡ����ֵ("Player:ChangePVPMode(3);","",0);
	elseif ģʽ=="���" then
		LUA_ȡ����ֵ("Player:ChangePVPMode(4);","",0);
	elseif ģʽ=="�ƶ�" then
		LUA_ȡ����ֵ("Player:ChangePVPMode(2);","",0);
	end
end
----------------------------------------------------------------------------------------------------------------
function ����_������ָ�()
	��ͼѰ·("������",123,172)
	�Ի�NPC("ξ������");��ʱ(3000)       
	NPC�����Ի�("��״̬����");��ʱ(3000)       		
	NPC�����Ի�("��");��ʱ(3000)       
	�Ի�NPC("ξ������");��ʱ(3000)       
	NPC�����Ի�("�����޻ָ���Ѫ");��ʱ(3000)       		
	NPC�����Ի�("�õ�");��ʱ(3000)       
end



function ����_ʹ�����޼���(λ��)   --����1 
	if ����ֵ(��ȡ������Ϣ(18))~=0 then
		if λ��==1 then
			LUA_Call("MainMenuBar_3_Clicked(1)")
		elseif λ��==2 then
			LUA_Call("MainMenuBar_3_Clicked(2)")
		end
	end
end


function ����_ʹ�ü���(����,��������,Ŀ��ID)
	if ����=="��ң" then
		if tonumber(�жϼ�����ȴ(��������))==1 then
			����ID=��ȡ����ID(��������)
			ʹ�ü���(����ID,Ŀ��ID);��ʱ(500) 
		end

	elseif ����=="���" then
		if tonumber(�жϼ�����ȴ(��������))==1 then
			����ID=��ȡ����ID(��������)
			ʹ�ü���(����ID,Ŀ��ID);��ʱ(500) 
		end
		
	elseif ����=="���" then
		if tonumber(�жϼ�����ȴ(��������))==1 then
			����ID=��ȡ����ID(��������)
			ʹ�ü���(����ID,Ŀ��ID);��ʱ(500) 
		end		
		
	elseif ����=="����" then
		if tonumber(�жϼ�����ȴ(��������))==1 then
			����ID=��ȡ����ID(��������)
			ʹ�ü���(����ID,Ŀ��ID);��ʱ(500) 
		end		
		
	elseif ����=="�һ���" then
		if tonumber(�жϼ�����ȴ(��������))==1 then
			����ID=��ȡ����ID(��������)
			ʹ�ü���(����ID,Ŀ��ID);��ʱ(500) 
		end				
	end
end

function ����_�����鹥��(Ŀ��ID)
	����_ʹ�ü���("��ң","Ϫɽ����",Ŀ��ID);
	����_ʹ�ü���("��ң","��ָ��",Ŀ��ID);	
	����_ʹ�ü���("��ң","����ҹ��",Ŀ��ID);	
	����_ʹ�ü���("����","���ͬ��",Ŀ��ID);
	����_ʹ�ü���("����","һ��ɥ��ɢ",Ŀ��ID);
	����_ʹ�ü���("����","����뷢",Ŀ��ID);
	����_ʹ�ü���("�һ���","��֮����",Ŀ��ID);
	����_ʹ�ü���("����","�����ˮ",Ŀ��ID);
	����_ʹ�ü���("���","̫������",Ŀ��ID);
end

--ʹ����Ʒ("������")

function ������ʱ��()
	local curTime = LUA_ȡ����ֵ([[local curTime = DataPool:GetServerMinuteTime();
		    local temp = math.floor(curTime/10000)
    local curHour = math.mod(temp, 100)
    temp = math.mod(curTime, 10000)
    local curMin = math.floor(temp/100)
	str=tostring(curHour)..":"..tostring(curMin)
	return  str
	]], "s", 1)
   local cursec=string.sub(LUA_ȡ����ֵ("return DataPool:GetServerMinuteTime();", "n", 1),7,-1)  
   local curmiao=string.sub(LUA_ȡ����ֵ("return DataPool:GetServerMinuteTime();", "n", 1),5,-1)  
   str=tostring(curTime)..":"..cursec..curmiao
return  str
end

-----------------------------------------------------------------------------------------------
����_��ⱦ����Ѫ�ӿ���(��������)
����_����ٻ�����(��������)
ִ�й���("ͬ����Ϸʱ��")

����_������ʾ(������ʱ��())
��ͼѰ·("����",141,210)
����_������()

	����ʱ��ʼʱ�� = os.time()
	while true do
		���ٹ���ID=������Χ����(1,BOSS����,15.5)
		while ���ٹ���ID> 0 do
			����_�����鹥��(���ٹ���ID);
			��������(���ٹ���ID);
			local ��������,����ID,��ƷX����,��ƷY����,Ŀ��Ѫ��,��Ʒ����,��Ʒ���,��Ʒ����,�����ж�,ͷ����ע=������Χ��Ʒ(4,BOSS����,15.5,ID����,ģ������,���ƹ���)
			 if ����ID == ���ٹ���ID  then
				if  tonumber(Ŀ��Ѫ��) > 0 then
					��������(���ٹ���ID);
					else
					�Զ����();
					��ʱ(500);
					break
				end
			end
			��ʱ(200);
			�Զ����();
		end
		
		
       
		if string.find("23:26:57|",������ʱ��()) then
				����_ʹ�����޼���(2)
			end
	if string.find("23:26:57|16:4:57|16:9:57|16:14:57|16:19:57|19:59:57|20:4:57|20:9:57|20:14:57|20:19:57",������ʱ��()) then
		����_����ģʽ("���")
		if ����=="��ң" then
				����_������ʾ("���κ���")
				���κ��˼���ID=��ȡ����ID("���κ���")
				ʹ�ü���(���κ��˼���ID)
			end
			if ����=="����" then
				����_������ʾ("������ɽ")
				������ɽ����ID=��ȡ����ID("������ɽ")
				ʹ�ü���(������ɽ����ID)
			end
			if ����=="�䵱" then
				����_������ʾ("���Ǿ���")
				���Ǿ��׼���ID=��ȡ����ID("���Ǿ���")
				ʹ�ü���(���Ǿ��׼���ID)
			end
			if ����=="ؤ��" then	
				����_������ʾ("��ɨǬ��")
				��ɨǬ������ID=��ȡ����ID("��ɨǬ��")
				ʹ�ü���(��ɨǬ������ID)
			end
			if ����=="����" then	
				���뷢����ID=��ȡ����ID("���뷢")
				ʹ�ü���(���뷢����ID)
			end
			if ����=="����" then	
				������̩����ID=��ȡ����ID("������̩")
				ʹ�ü���(������̩����ID)
			end
	end
			
			if string.find("23:26:57|16:4:57|16:9:57|16:14:57|16:19:57|19:59:57|20:4:57|20:9:57|20:14:57|20:19:57",������ʱ��()) then
				����_ʹ�����޼���(2)
			end
		
		����ʱ=tonumber(os.time() - ����ʱ��ʼʱ��)
		����_������ʾ("�����boss��ʱ:"..����ʱ.."|�ܹ�300����������...�ȴ��趨ʱ��-�鿴�����Ƿ��ж�λ���ɻ�")
		if  ����ʱ > 300 then 
			�Զ����();��ʱ(500)
			����_������ʾ("����BOSSʱ�䵽��,�ط�����")
			break
		end
		��ʱ(200);
    end
	
����_����ģʽ("��ƽ")
����_������ָ�()


	
