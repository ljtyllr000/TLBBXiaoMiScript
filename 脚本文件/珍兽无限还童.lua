function ��ѯ���޳ɳ���(��������)
��Ļ��ʾ("���޲�ѯ�ɳ���:"..��������)
       LUA_Call(string.format([[
	for i=0, 9 do
		if Pet:IsPresent(i) then
					local Petchengzhanglv = Pet : GetGrowRate(i);
                     local PetName=Pet:GetName(i)

                      if PetName==PetDoName then
						if tonumber(Petchengzhanglv) < 500 then
								local hid,lid = Pet:GetGUID(i);
								PushDebugMessage("���ʼ������޳ɳ�:"..PetName)
                             Clear_XSCRIPT();
                             Set_XSCRIPT_Function_Name("OnInquiryForGrowRate");
                             Set_XSCRIPT_ScriptID(1050);
                             Set_XSCRIPT_Parameter(0,hid);
                             Set_XSCRIPT_Parameter(1,lid);
                             Set_XSCRIPT_ParamCount(2);
                             Send_XSCRIPT();   
					end
			end
         end
	end	
	]], ��������))
end

function ���޻�ͯ(��������,����)
		����λ��=��ȡ������Ʒλ��(����)-1
       LUA_Call(string.format([[
	
                      local  PetDoName ="%s"
			local nPetCount = Pet : GetPet_Count()
                    -- PushDebugMessage("��ǰ��������:"..nPetCount )
for i=0, 9 do
		if Pet:IsPresent(i) then
			    local Petchengzhanglv = Pet : GetGrowRate(i);
                             local PetName=Pet:GetName(i)
                 --PushDebugMessage(Petchengzhanglv)
                      if PetName==PetDoName then
							Pet : SkillStudy_Do(2, i, %d)
                      end
					end
	end	
	]], ��������,����λ��))
end	


--��ѯ���޳ɳ���


function ��ѯ�������޳ɳ���()
��Ļ��ʾ("��ѯ�������޳ɳ���")
       LUA_Call(string.format([[

for i=0, 9 do
		if Pet:IsPresent(i) then
			    local Petchengzhanglv = Pet : GetGrowRate(i);
                             local PetName=Pet:GetName(i)
                 --PushDebugMessage(Petchengzhanglv)
    
			if tonumber(Petchengzhanglv) < 500 then
                             local hid,lid = Pet:GetGUID(i);
                              PushDebugMessage("���ʼ������޳ɳ�:"..PetName)
                             Clear_XSCRIPT();
                             Set_XSCRIPT_Function_Name("OnInquiryForGrowRate");
                             Set_XSCRIPT_ScriptID(1050);
                             Set_XSCRIPT_Parameter(0,hid);
                             Set_XSCRIPT_Parameter(1,lid);
                             Set_XSCRIPT_ParamCount(2);
                             Send_XSCRIPT();   
			end
		end
	end	
	]]))
end






function ��������(aaaa,bbbb)
local nIndex =  LUA_ȡ����ֵ(string.format([[

for i=0, 9 do
		if Pet:IsPresent(i) then
    local strName=Pet:GetName(i)
PushDebugMessage(strName)
--�ɳ���
local strTbl = {"��ͨ","����","�ܳ�","׿Խ","����"};
local Petchengzhanglv = Pet : GetGrowRate(i);
local nGrowLevel = Pet : GetPetGrowLevel(i,tonumber(Petchengzhanglv));
if(nGrowLevel >= 0) then
  nGrowLevel = nGrowLevel + 1;
nGrowLevelname=strTbl[nGrowLevel]
else
nGrowLevelname="δ֪"
Petchengzhanglv=""
end
--PushDebugMessage(nGrowLevel..nGrowLevelname..strName)
if strName == "%s" and nGrowLevel<= tonumber(%d) then
                  PushDebugMessage("��������:"..strName.."|�ɳ���"..nGrowLevelname)
                   Pet : Go_Free(i)
end
end
end
        return -1
]], aaaa,bbbb), "n")
return nIndex
end




function ��ͯ����(aaaa,bbbb,����)
	if ��ȡ������Ʒ����(����)<=0 then
		return -1
	end
	����λ��=��ȡ������Ʒλ��(����)-1
	local nIndex =  LUA_ȡ����ֵ(string.format([[


		for i=0, 10-1 do
		if Pet:IsPresent(i) then
			local strName=Pet:GetName(i)
		--PushDebugMessage(strName)
		--�ɳ���
		local strTbl = {"��ͨ","����","�ܳ�","׿Խ","����"};
		local Petchengzhanglv = Pet : GetGrowRate(i);
		local nGrowLevel = Pet : GetPetGrowLevel(i,tonumber(Petchengzhanglv));
		if(nGrowLevel >= 0) then
		  nGrowLevel = nGrowLevel + 1;
		nGrowLevelname=strTbl[nGrowLevel]
		else
		nGrowLevelname="δ֪"
		Petchengzhanglv=""
		end
		--PushDebugMessage(nGrowLevel..nGrowLevelname..strName)
		if strName == "%s" and nGrowLevel < tonumber(%d) then
						  PushDebugMessage("��������:"..strName.."|�ɳ���        "..nGrowLevelname)
						   Pet : SkillStudy_Do(2, i, %d)
			end
		end
		end
				return -1
	]], aaaa,bbbb,����λ��), "n")
	return nIndex
end




function �Զ���ͯ����(aaaa,bbbb,����)
	for i=1,9999 do
		ȡ����Ʒ("���")	
		��ͼѰ·("����",275,297)
		��ѯ�������޳ɳ���()
		��ʱ(700)
		if ��ͯ����(aaaa,bbbb,����)== -1 then
			break
		end	
		��ʱ(500)
	end
end
--���ϳ���Ҫ�Ҷ�

--���³���ֻ�޸ı������ƺͻ�ͯ��������
�Զ���ͯ����("���ޱ���",5,"���޻�ͯ����")




