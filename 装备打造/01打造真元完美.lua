ִ�й���("[�ű�]���캯����")
����ȼ�=tonumber(��ȡ������Ϣ(26))
if ����ȼ�<80 then
	return
end

function ����_ȡ��Ԫ��������()
	local tem =LUA_ȡ����ֵ(string.format([[	
			local ZhenYuanActivation_MF={589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600}
			local index = 0
			for i = 1,table.getn(ZhenYuanActivation_MF) do
				if Pneuma:GetMF(ZhenYuanActivation_MF[i]) == 1 then
					index = index + 1
				end
			end
			return index
				]]))		
	return tonumber(tem)		
end

function ȫ�Զ�������Ԫ����(index)
	if not index then
		index = 12 
	end
		
	local ���������� =����_ȡ��Ԫ��������()
	if ���������� >=index then
		��Ļ��ʾ("��Ԫ�Ѿ�����"..����������)
		��ʱ(2000)
		return
	end	
	��ͼѰ·("����",350,228)
	for i =1,index do
	 local tem =LUA_ȡ����ֵ(string.format([[
			local ZhenYuanActivation_MF={589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600}
			local ZhenYuanActivation_Mid = 1602
			local ZhenYuanActivation_JiaoZi={
			10,
			15,
			20,
			25,
			30,
			35,
			40,
			45,
			50,
			56,
			61,
			66,
			0,
			}
				function ZhenYuanActivation_GetActiveCount()
					local ac = 0
					for i = 1,table.getn(ZhenYuanActivation_MF) do
						if Pneuma:GetMF(ZhenYuanActivation_MF[i]) == 1 then
							ac = ac + 1
						end
					end
					return ac
				end
				local shuliang =  ZhenYuanActivation_GetActiveCount()
				PushDebugMessage("�Ѿ�����ȫ����Ԫ��������:"..shuliang)
				if shuliang>=12 then
					PushDebugMessage("[����] �Ѿ�����ȫ����Ԫ����")
					return 1
				end
				jtt=%d
				local nActive = ZhenYuanActivation_GetActiveCount()
				local needjiaozi = ZhenYuanActivation_JiaoZi[nActive+1]*10000
				PushDebugMessage(needjiaozi)
				local needChip = nActive*30
				if nActive==12 then
					needChip=0
				end
				if Pneuma:GetPneumaChip() < needChip then
					return 2
				end
				if tonumber(DataPool:GetLeftProtectTime()) > 0 then --��ȫ�¼�
					PushDebugMessage("#{ZYXT_120528_16}")
					return  5
				end
				local playerMoneyPlusJZ = Player:GetData("MONEY_JZ") + Player:GetData("MONEY")
				 if playerMoneyPlusJZ < needjiaozi then
					return 3
				end
				if (Pneuma:GetMF(ZhenYuanActivation_MF[jtt]) ~= 1) then
						Clear_XSCRIPT();
						Set_XSCRIPT_Function_Name("OnActivePneumaSlot");
						Set_XSCRIPT_ScriptID(889903);
						Set_XSCRIPT_Parameter(0,jtt);
						Set_XSCRIPT_ParamCount(1);
						Send_XSCRIPT();
						return 5
				end
	
				]], i), "n",1)
				tem =tonumber(tem)
				if tem == 1 then
					��Ļ��ʾ("�Ѿ�����")
					return
				elseif tem ==2 then
					��Ļ��ʾ("��Դ����")
					return
				elseif tem ==3 then
					��Ļ��ʾ("��Ҳ���")
					return	
				end
				��ʱ(2000)
		end
end




function ����_ȫ�Զ�װ����Ԫ()
	for AAA =1,12 do
		local tem =  LUA_ȡ����ֵ(string.format([[ 
		AAA=%d
		local ZhenYuanActivation_MF={589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 600}
		if (Pneuma:GetMF(ZhenYuanActivation_MF[AAA]) ~= 1) then
			PushDebugMessage(AAA.."û�п���")
			return -1
		end	
		local szName, nLevel, szAdd, nAdd,nNextAdd=Pneuma:GetPneumaAddingInfo(AAA-1)
		if szName =="" then 
			return 1
		end
		return -1
		]],AAA))
		if tonumber(tem)>=1 then
			LUA_ȡ����ֵ(string.format([[ 
			for k=36,59 do
				local szName, nLevel, szAdd, nAdd,nNextAdd=Pneuma:GetPneumaAddingInfo(k)
				if szName ~="" then 
					PushDebugMessage(szName.."װ����λ��:"..AAA)
					SetZhenYuan(%d,k-35)
					return 
				end
			end
			]],AAA))
			��ʱ(1500)
		end
	end
end	


function ����_ȡ������Ԫ����()
			local tem =LUA_ȡ����ֵ(string.format([[ 
			n= 0
			for k=36,59 do
				local szName, nLevel, szAdd, nAdd,nNextAdd=Pneuma:GetPneumaAddingInfo(k)
				if szName ~="" then 
					if string.find(szName,"#ccc33cc") then 
						n=n+1 
					end
				end
			end
			return n
			]],AAA))
	return tonumber(tem)
end	


function ����_����ʹ����Ʒ(AAA)
local t={}
for w in string.gmatch(AAA,"([^'|']+)") do        
	table.insert(t,w)
end

for k,v in ipairs(t) do
	if ��ȡ������Ʒ����(v)>=1 then
		����_������ʾ(k..":"..v) 
		�Ҽ�ʹ����Ʒ(v);��ʱ(1000)
		����_����ȷ��()		
		��ʱ(1000)
	end
end
end

function ����_ȡ����Ʒ�Ҽ�ʹ��(��Ʒ�б�)
	ȡ����Ʒ(��Ʒ�б�)
	����_����ʹ����Ʒ(��Ʒ�б�)
end

function ����_�y��¯(��Ʒ�б�)

for i=36,59 do
	LUA_Call(string.format([[	
 i=%d
local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
if szName~="" and szName~=nil then
	if string.find("%s",szName) then
		PushDebugMessage("�y��"..szName)
		Pneuma:SmeltPneumaItem(i)
	end
end
	]],i ,��Ʒ�б�))
	��ʱ(20)
	end
end

--#ccc33cc ��ɫ
--#c00D000 ��ɫ
--#c2980FF ��ɫ 
--#cFFFFFF ��ɫ
--ǰ�������ɫҪ�ӽ�ȥ

��Ԫ����="|��Ԫ����Ѫ��|��Ԫ���ϱ���|��Ԫ���ϻ��|��Ԫ��������|��Ԫ���϶���|��Ԫ�������|��Ԫ��������|��Ԫ����׼��|��Ԫ���Ͼ���|��Ԫ�������|��Ԫ��������|��Ԫ�����ͷ�|��Ԫ���ϼ��|��Ԫ��������|��Ԫ���ϱ���|��Ԫ���϶���|��Ԫ��������|��Ԫ�����|��Ԫ��������|��ɫ��Ԫ����|������Կ|���౦ϻ|"


����_ȡ����Ʒ�Ҽ�ʹ��(��Ԫ����)

for i =1,12 do
	local ��Ԫ������ =����_ȡ��Ԫ��������()
	if ��Ԫ������ < 12 then 
		if ����_ȡ������Ԫ����()>0 then 	
			ȡ����Ʒ("���")
			ȫ�Զ�������Ԫ����(��Ԫ������+1)
			����_ȫ�Զ�װ����Ԫ()
		end
	end
end

--ִ�й���("[�ű�]036���ս���")


����Ʒ("���")
