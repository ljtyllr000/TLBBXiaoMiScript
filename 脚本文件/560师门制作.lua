

ʦ����Ʒ = "" 




function ����_ȡ����ʣ��λ��(nTheTabIndex)--��ȡ����������0�������1��������2�Ŀո����Լ�����������Ʒ���
    local szPacketName = ""
	local CurrNum = 0
	local BaseNum = 0
	local MaxNum = 0
	if(nTheTabIndex == 0) then
		szPacketName = "base";
		CurrNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_Num();", "n")--��ǰ������
		BaseNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_BaseNum();", "n")--����������
		MaxNum = LUA_ȡ����ֵ("return DataPool:GetBaseBag_MaxNum();", "n")--��������
	elseif(nTheTabIndex == 1) then
		szPacketName = "material";
		CurrNum = LUA_ȡ����ֵ("return DataPool:GetMatBag_Num();", "n")--��ǰ������
		BaseNum = LUA_ȡ����ֵ("return DataPool:GetMatBag_BaseNum();", "n")--����������
		MaxNum = LUA_ȡ����ֵ("return DataPool:GetMatBag_MaxNum();", "n")--��������		
	elseif(nTheTabIndex == 2) then
		szPacketName = "quest";
		CurrNum = LUA_ȡ����ֵ("return DataPool:GetTaskBag_Num();", "n")--��ǰ������
		BaseNum = LUA_ȡ����ֵ("return DataPool:GetTaskBag_BaseNum();", "n")--����������
		MaxNum = LUA_ȡ����ֵ("return DataPool:GetTaskBag_MaxNum();", "n")--��������		
	else
		return 0, -1;
	end

	local spacenum, maxnum, nIndex = LUA_ȡ����ֵ(string.format([[
	        local spacenum = 0
			local maxnum = 1
			local nIndex = -1
			for i=1, %d do
				local theAction,bLocked = PlayerPackage:EnumItem("%s", i-1);
				if theAction:GetID() ~= 0 then
				   spacenum = spacenum + 1
				   local nownum = theAction:GetNum()
                   if nownum > maxnum then
				      maxnum = nownum
					  nIndex = i
                   end	                  				   
				   --local g_NeedTipItem = theAction:GetDefineID()
				   --PushDebugMessage(theAction:GetID().."/"..g_NeedTipItem.."/"..theAction:GetName().."/"..theAction:GetNum().."/"..i-1)-- (i-1)���Ǳ������������
				end
			end
            return 	spacenum, maxnum, nIndex	
			
	]], CurrNum, szPacketName), "nnn")
	return CurrNum-spacenum, maxnum, nIndex
end



function ����_ȡ��ɫ����()
	 local tem=  LUA_ȡ����ֵ(string.format([[
	      return   Player:GetData("VIGOR")
	  ]]))  
	return tonumber(tem)
end


function ����_����ʦ��(index,����,����,����ֵ)
	����б� ="��Ǯ|�̶���|������|֥���|����|���ĵ�|"
	if index == 1 then
		ID =163
		����="�ͼ���ҩ"
	elseif index == 2 then
		ID = 164 
		����="�м���ҩ"
	elseif index == 3 then
		ID = 165
		����="�߼���ҩ"	
	elseif index == 4 then
		ID = 558
		����="����ʳ��"		
	elseif index == 5 then
		ID = 559
		����="�м�ʳ��"			
	elseif index == 6 then
		ID = 560
		����="�߼�ʳ��"		
	elseif index == 7 then
		ID = 477
		����="���������䷽"				
	elseif index == 8 then
		ID = 479
		����="�м������䷽"				
	elseif index == 9 then
		ID = 481
		����="�߼������䷽"					
	else
		��Ļ��ʾ("�����ú�")
		return
	end
	for i =1,299 do	
		ȡ����Ʒ(����)
		��ͼѰ·("����",237,306)
		����_������();��ʱ(300)
		�Զ����(����б�)
		��Ļ��ʾ("Ŀǰ��������:"..����)
			LUA_Call(string.format([[
	           ComposeItem_Begin(%d,1,1)
		]], ID))  
		��ʱ(4000)
		if ��ȡ������Ʒ����(����) < ���� then
			break
		end
		if ����_ȡ����ʣ��λ��(1) <=  1 then 
			����Ʒ(ʦ����Ʒ)
		end	
		if ����_ȡ��ɫ����()<= ����ֵ then
			break
		end
	end
	
end

����_����ʦ��(2,"���",7,5);
����_����ʦ��(2,"����",7,5);
����_����ʦ��(7,"����",7,5);

--���� 7 ������һ��   1234567 �����Ӧ��
--�������� 
--��Ҫ��������
--��Ҫ����