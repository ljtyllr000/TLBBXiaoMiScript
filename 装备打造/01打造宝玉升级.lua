function ����_ȡ��������(����)
	local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
	if  ���� == 1 then
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
	if  ���� == 2 then
		if string.find("����|����|ؤ��", menpai) then
			���Թ���="��"
		elseif  string.find("��ң|����|", menpai) then
			���Թ���="��"
		elseif  string.find("����|��ɽ|", menpai) then
			���Թ���="��"
		elseif  string.find("����|����|���|Ľ��|�䵱", menpai) then
			���Թ���="��"
		end
	end
	if  ���� == 3 then
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
	end
	return ���Թ���
end

function ����_ȡ����ȼ�(index)
	local tem =LUA_ȡ����ֵ(string.format([[
		local bElementsLevel= Player:GetFiveElements_ElementsLevel(%d-1)
		return  bElementsLevel
		]],index), "n")
	return tonumber(tem)
end

function ����_ȡ����������Ҫ����()
	local tem =LUA_ȡ����ֵ(string.format([[
	local	g_CostMoney = {  20000 , 50000 , 80000 ,120000 ,160000 , 
		200000 , 250000 , 300000 , 400000 ,500000}
		
	local	g_CostItemCount = {  2 , 5 , 8 ,12 ,16 , 20 , 25 , 30 , 40 ,50}
	local num = 2
	local nIndex2Cohesion = Player:GetFiveElementsIndexCanDoCohesion()
	if nIndex2Cohesion >= 0 and nIndex2Cohesion < 5 then
		local bElementsLevel	= Player:GetFiveElements_ElementsLevel( nIndex2Cohesion )
		local nLevelGrade = math.floor ( bElementsLevel / 10 )
		if nLevelGrade >= 0 and nLevelGrade <= 9 then
			 num =g_CostItemCount[  nLevelGrade + 1 ] 
		end
	end
	
	return num
		]]), "n")
	return tonumber(tem)
end
function ����_ȡ����Ǯ()
	local ����Ǯ=��ȡ������Ϣ(52) +��ȡ������Ϣ(45)
	return ����Ǯ
end


function ����_ȡ����������Ҫ���()
	local tem =LUA_ȡ����ֵ(string.format([[
	local	g_CostMoney = {  20000 , 50000 , 80000 ,120000 ,160000 , 
		200000 , 250000 , 300000 , 400000 ,500000}
		
	local	g_CostItemCount = {  2 , 5 , 8 ,12 ,16 , 20 , 25 , 30 , 40 ,50}
	local num = 20000
	local nIndex2Cohesion = Player:GetFiveElementsIndexCanDoCohesion()
	if nIndex2Cohesion >= 0 and nIndex2Cohesion < 5 then
		local bElementsLevel	= Player:GetFiveElements_ElementsLevel( nIndex2Cohesion )
		local nLevelGrade = math.floor ( bElementsLevel / 10 )
		if nLevelGrade >= 0 and nLevelGrade <= 9 then
			 num =g_CostMoney[  nLevelGrade + 1 ] 
		end
	end
	
	return num
		]]), "n")
	return tonumber(tem)
end

	
function ����_ȡѡ����Ϣ()
	local tem =LUA_ȡ����ֵ(string.format([[
		setmetatable(_G, {__index = EquipBaoJian_YuLuan_Tips_Env});
		if this:IsVisible() hen
			local str =EquipBaoJian_YuLuan_Tips_Info:GetText()
			if string.find(str,'һ������Ч��',1,true) then
				return 1
			end
		end
		return -1
	]]))
	return tonumber(tem)
end 


		
function ����_�����Զ�ѧϰ()
	local index =1
	local  �����������= ����_ȡ��������(1)
	if �����������=="��" then
		index= 1
	elseif  �����������=="��" then
		index= 2
	elseif  �����������=="��" then
		index=3	
	elseif  �����������=="��" then
		index=4
	end
	for  i =1,9 do
		if ����_ȡ����ȼ�(1) >= 1 and ����_ȡ����ȼ�(2) >= 1 and ����_ȡ����ȼ�(3) >= 1 and ����_ȡ����ȼ�(4) >= 1 and ����_ȡ����ȼ�(5) >= 1 then
			��Ļ��ʾ("���񶼴���1�˲���ѧϰ��!!~~")
			break
		end	
		ȡ����Ʒ("��������")
		ȡ����Ʒ("���",999999)
		if �����Ƿ����("EquipBaoJian_Cohesion")==1 then
			��Ļ��ʾ("��ʼѧϰ!!~~")
			LUA_Call("setmetatable(_G, {__index = EquipBaoJian_Cohesion__Env});EquipBaoJian_Cohesion_OnOK();")
			��ʱ (3000)
			if ����_ȡ����ȼ�(i)== 0  then
				--ѡ������
				if �����Ƿ����("EquipBaoJian_YuLuan_Tips") ==1 then	
						��Ļ��ʾ("����ѡ��"..index)
						LUA_Call(string.format([[
						setmetatable(_G, {__index = EquipBaoJian_YuLuan_Tips_Env});EquipBaoJian_YuLuan_Tips_OnSelect(%d);
						setmetatable(_G, {__index = EquipBaoJian_TianHuo_Tips_Env});this:Hide()
					]],index), "n")
					��ʱ(3000)
				end
				--����ѡ��
				if �����Ƿ����("EquipBaoJian_YunShui_Tips") ==1 then	
					��Ļ��ʾ("����ѡ��"..index)
					LUA_Call(string.format([[
						setmetatable(_G, {__index = EquipBaoJian_YunShui_Tips_Env});EquipBaoJian_YunShui_Tips_OnSelect(%d);
						setmetatable(_G, {__index = EquipBaoJian_TianHuo_Tips_Env});this:Hide()
					]],index), "n")
					��ʱ(3000)
				end
				--
				if �����Ƿ����("EquipBaoJian_TianHuo_Tips") ==1 then		
						��Ļ��ʾ("����ѡ��:����")
						LUA_Call(string.format([[
						setmetatable(_G, {__index = EquipBaoJian_TianHuo_Tips_Env});EquipBaoJian_TianHuo_Tips_OnSelect(1);
						setmetatable(_G, {__index = EquipBaoJian_TianHuo_Tips_Env});this:Hide()
					]],index), "n")
					��ʱ(3000)
				end	
			end
		else
			��ͼѰ·("������",113,200)
			if �Ի�NPC("������")==1 then
				NPC�����Ի�("���б�������",0)
			end
			��ʱ(3000)	
		end
	end
end



function ����_���б�������()
    for k=1,999 do
		ȡ����Ʒ("��������")
		local neednum =����_ȡ����������Ҫ����()
		if ��ȡ������Ʒ����("��������") <neednum then
			��Ļ��ʾ("���ϲ���,����");��ʱ (1000)
			break
		end
		ȡ����Ʒ("���",9999999)
		local needmenoy = ����_ȡ����������Ҫ���()
		if ����_ȡ����Ǯ()< needmenoy then
			��Ļ��ʾ("��Ҳ���,����");��ʱ (1000)
			break
		end
       if �����Ƿ����("EquipBaoJian_Cohesion")==1 then
			LUA_Call("setmetatable(_G, {__index = EquipBaoJian_Cohesion__Env});EquipBaoJian_Cohesion_OnOK();")
			��ʱ(200)	
			local ��ʾ =��ȡ������Ϣ(37)
			if ��ʾ then
				--д������("C:\\����С��\\��ʾ.ini","��ʾ","��ʾ",��ʾ)
				--��Ҳ���
				if string.find(��ʾ,"#{ZZZB_150811_188}",1,true) then
					��Ļ��ʾ("��Ҳ���,����")
					��ʱ (1000)
					break
				elseif  string.find(��ʾ,"#{ZZZB_150811_187}",1,true) then
					��Ļ��ʾ("���ϲ���,����")
					��ʱ (1000)
					break
				end
			end
        else 
			��ͼѰ·("������",113,200)
             if �Ի�NPC("������")==1 then
				NPC�����Ի�("���б�������",0)
				��ʱ (1000)
			end
         end
	end 
	����Ʒ("��������")
	����Ʒ("���")
end

����_�����Զ�ѧϰ()
����_���б�������()
