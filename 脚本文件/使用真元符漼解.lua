��Ԫ����="|��Ԫ����Ѫ��|��Ԫ���ϱ���|��Ԫ���ϻ��|��Ԫ��������|��Ԫ���϶���|��Ԫ�������|��Ԫ��������|��Ԫ����׼��|��Ԫ���Ͼ���|��Ԫ�������|��Ԫ��������|��Ԫ�����ͷ�|��Ԫ���ϼ��|��Ԫ��������|��Ԫ���ϱ���|��Ԫ���϶���|��Ԫ��������|��Ԫ�����|��Ԫ��������|��ɫ��Ԫ����|������Կ|���౦ϻ|"

�������϶����y��="#cFFFFFF��Ԫ��Ѫӿ����|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ�����|#cFFFFFF��Ԫ��ӡ��|#cFFFFFF��Ԫ���ƶ�|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ����������|#cFFFFFF��Ԫ���ٲ�����|#cFFFFFF��Ԫ���ھ�����|#cFFFFFF��Ԫ�����|#cFFFFFF��Ԫ��Ѹ��|#cFFFFFF��Ԫ��ǧת���|#cFFFFFF��Ԫ����������|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ����������|#cFFFFFF��Ԫ������|#cFFFFFF��Ԫ��������ͥ|#cFFFFFF��Ԫ���⹦���|#cFFFFFF��Ԫ������մ��|#c00D000��Ԫ��Ѫӿ����|#c00D000��Ԫ������|#c00D000��Ԫ�����|#c00D000��Ԫ��ӡ��|#c00D000��Ԫ���ƶ�|#c00D000��Ԫ������|#c00D000��Ԫ����������|#c00D000��Ԫ���ٲ�����|#c00D000��Ԫ���ھ�����|#c00D000��Ԫ�����|#c00D000��Ԫ��Ѹ��|#c00D000��Ԫ��ǧת���|#c00D000��Ԫ����������|#c00D000��Ԫ������|#c00D000��Ԫ����������|#c00D000��Ԫ������|#c00D000��Ԫ��������ͥ|#c00D000��Ԫ���⹦���|#c00D000��Ԫ������մ��|#c2980FF��Ԫ��Ѫӿ����|#c2980FF��Ԫ������|#c2980FF��Ԫ�����|#c2980FF��Ԫ��ӡ��|#c2980FF��Ԫ���ƶ�|#c2980FF��Ԫ������|#c2980FF��Ԫ����������|#c2980FF��Ԫ���ٲ�����|#c2980FF��Ԫ���ھ�����|#c2980FF��Ԫ�����|#c2980FF��Ԫ��Ѹ��|#c2980FF��Ԫ��ǧת���|#c2980FF��Ԫ����������|#c2980FF��Ԫ������|#c2980FF��Ԫ����������|#c2980FF��Ԫ������|#c2980FF��Ԫ��������ͥ|#c2980FF��Ԫ���⹦���|#c2980FF��Ԫ������մ��|#ccc33cc��Ԫ����������|#ccc33cc��Ԫ���ٲ�����|#ccc33cc��Ԫ���ھ�����|#ccc33cc��Ԫ�����|#ccc33cc��Ԫ��Ѹ��|#ccc33cc��Ԫ��ǧת���|#ccc33cc��Ԫ����������|#ccc33cc��Ԫ������|#ccc33cc��Ԫ����������|#ccc33cc��Ԫ������|#ccc33cc��Ԫ��������ͥ|#ccc33cc��Ԫ���⹦���|#ccc33cc��Ԫ������մ��|"

��Ԫ������Ʒ�б� ="[��ɫ]��Ԫ��Ѫӿ����|[��ɫ]��Ԫ������|[��ɫ]��Ԫ������|[��ɫ]��Ԫ���ƶ�|"



--��Ԫ������Ʒ�б� =string.gsub(��Ԫ������Ʒ�б�,"%[��ɫ%]","#c2980FF")
--��Ԫ������Ʒ�б� =string.gsub(��Ԫ������Ʒ�б�,"%[��ɫ%]","#ccc33cc")
--��Ļ��ʾ(��Ԫ������Ʒ�б�)
--��ʱ(30000)
--��Ԫ������Ʒ�б� =��Ԫ������Ʒ�б�.."|"..string.gsub(��Ԫ������Ʒ�б�,"��","��")
--#ccc33cc ��ɫ
--#c00D000 ��ɫ
--#c2980FF ��ɫ 
--#cFFFFFF ��ɫ
--ǰ�������ɫҪ�ӽ�ȥ
--szName=string.gsub(szName, "#ccc33cc", "[��ɫ]")
------------------------------------------------------------------------------------------------------------------------------------------------------
function ����_����ʹ����Ʒ(AAA)
	local t={}
	for w in string.gmatch(AAA,"([^'|']+)") do        
		table.insert(t,w)
	end
	for k,v in ipairs(t) do
		if ��ȡ������Ʒ����(v)>=1 then
			��Ļ��ʾ("��������ʹ����Ʒ:���:"..k..":"..v) 
			�Ҽ�ʹ����Ʒ(v);
			��ʱ(2000)	
		end
	end
end


function ����_ȡ����Ʒ�Ҽ�ʹ��(��Ʒ�б�)
	ȡ����Ʒ(��Ʒ�б�)
	����_����ʹ����Ʒ(��Ʒ�б�)
end

function ����_�y��¯(��Ʒ�б�,��ɫ)
	if not ��ɫ then
		��ɫ = 1
	end	
	for i=36,59 do
		local tem =LUA_ȡ����ֵ(string.format([[	
		 i=%d
		wupin = "%s"
		 yanseindex =%d
		if yanseindex == 1 then
			yanse ="#cFFFFFF"
		elseif yanseindex == 2 then 
			yanse ="#c00D000"
		elseif yanseindex == 3 then 
			yanse ="#c2980FF"	
		elseif yanseindex == 4 then 
			yanse ="#ccc33cc"	
		end
			
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			if string.find(wupin,szName) then
				PushDebugMessage("�y��"..szName)
				PushDebugMessage("�y��"..szName)
				return 1
			end
			if  string.find(szName,yanse) then
				PushDebugMessage("�y��"..szName)
				PushDebugMessage("�y��"..szName)
				return 1
			end
			PushDebugMessage("����"..szName)
		end
		return -1
		]],i ,��Ʒ�б�,��ɫ))
		if tonumber(tem) == 1 then
			LUA_ȡ����ֵ(string.format([[	
				Pneuma:SmeltPneumaItem(%d)
				]],i))			
			��ʱ(1500)
		end
	end
end


function ����_��Ԫ�y��¯(��ɫ,������Ʒ�б�)
	if not ��ɫ then
		��ɫ = 1
	end	
	for i=36,59 do
		local tem =LUA_ȡ����ֵ(string.format([[	
		 i=%d
		 yanseindex =%d
		blwp ="%s"
		if yanseindex == 1 then
			yanse ="#cFFFFFF"
		elseif yanseindex == 2 then 
			yanse ="#c00D000"
		elseif yanseindex == 3 then 
			yanse ="#c2980FF"	
		elseif yanseindex == 4 then 
			yanse ="#ccc33cc"	
		end
			
		local szName, nLevel, szAdd, nAdd, nNextAdd=Pneuma:GetPneumaAddingInfo(i)
		if szName~="" and szName~=nil then
			szName=string.gsub(szName, "#cFFFFFF", "[��ɫ]")
			szName=string.gsub(szName, "#c00D000", "[��ɫ]")
			szName=string.gsub(szName, "#c2980FF", "[��ɫ]")
			szName=string.gsub(szName, "#cFF6600", "[��ɫ]")
			szName=string.gsub(szName, "#ccc33cc", "[��ɫ]")
			if  string.find(szName,yanse) then
				if  not string.find(blwp,szName) then
					PushDebugMessage("�y��"..szName)
					return 1
				end
			PushDebugMessage("����"..szName)	
			end
			PushDebugMessage("û�д��������ɫ:"..szName)
		end
		return -1
		]],i ,��ɫ,������Ʒ�б�))
		if tonumber(tem) == 1 then
			LUA_ȡ����ֵ(string.format([[	
				Pneuma:SmeltPneumaItem(%d)
				]],i))			
			��ʱ(1500)
		end
	end
end
------------------------------------------
����_��Ԫ�y��¯(3,��Ԫ������Ʒ�б�)
����_��Ԫ�y��¯(4,��Ԫ������Ʒ�б�)

����_ȡ����Ʒ�Ҽ�ʹ��(��Ԫ����)
--����_�y��¯(�������϶����y��)
--����_ȡ����Ʒ�Ҽ�ʹ��(��Ԫ����)
--����_�y��¯(�������϶����y��,2)