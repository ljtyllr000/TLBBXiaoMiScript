--��ȡ��������ϴ��������¼���
function GetAfterAttr()
	local aS1 = LUA_ȡ����ֵ("setmetatable(_G, {__index = AnqiShuxingNEW_Env});return AnqiShuxingNEW_AfterAttrFirst:GetText()")
	local aS2 = LUA_ȡ����ֵ("setmetatable(_G, {__index = AnqiShuxingNEW_Env});return AnqiShuxingNEW_AfterAttrSecond:GetText()")
	local aS3 = LUA_ȡ����ֵ("setmetatable(_G, {__index = AnqiShuxingNEW_Env});return AnqiShuxingNEW_AfterAttrThird:GetText()")
	return aS1, aS2, aS3
end
--�жϱ�����Ǯ�Ƿ����,���㷵��true����������false
function �жϱ�����Ǯ�Ƿ����()
	local Money = LUA_ȡ����ֵ("return Player:GetData('MONEY')")
	local JZ = LUA_ȡ����ֵ("return Player:GetData('MONEY_JZ')")
	if (tonumber(Money) + tonumber(JZ)) >= 50000 then
		return true
	else
		return false
	end
end

function �رմ���(strWindowName)
    if �����Ƿ����(strWindowName)==1 then
		��Ļ��ʾ("�رմ���")
		LUA_Call(string.format([[
	        setmetatable(_G, {__index = %s_Env}) this:Hide()  
		]], strWindowName), "n")
	end
end

function ȡ�°���(��������)
    while ��ȡ������Ʒ����(��������) == 0  do 
		��ʱ(1000)
		LUA_Call("MainMenuBar_SelfEquip_Clicked();")
		if �����Ƿ���� ("SelfEquip") ==1 then
			��ʱ(500)
			LUA_Call("SelfEquip_Equip_Click(14,0);")
			��ʱ(500)
			LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseUI();")
			��ʱ(500)
		end
	end
end

function ȡ����()
    ȡ����Ʒ("����ʯ")  
	ȡ����Ʒ("���") 
	--����Ʒ ("ǧ������|�ٴ�����",0,1,1) ---���һ��ֻΪ���ò�����Ʒ ��������ȡ����
    if ��ȡ������Ʒ����("����ʯ") == 0 then
	   ��Ļ��ʾ("û�в���") 
	   return		
    end
end

function װ������(��������)
    for i=1,5 do
        if �����Ƿ����("AnqiShuxingNEW") == 1 then 
	        �رմ���("AnqiShuxingNEW")
			�Ҽ�ʹ����Ʒ(��������,1)														
        else
            �Ҽ�ʹ����Ʒ(��������,1)    --����2:Ϊʹ�ô���
        end
        ��ʱ(1000)
        if  tonumber(LUA_ȡ����ֵ("return EnumAction(17,'equip'):GetID();")) > 0 then  --װ���ɹ�
            break   
        end
    end
end


local �������� = LUA_ȡ����ֵ("return EnumAction(17,'equip'):GetName();")
��Ļ��ʾ(��������) 
--local str = "�����Թ���|�����Թ���|�����Թ���|�����Թ���|" --str ֻȡ����һ��

ȡ����()	
ȡ�°���(��������)
��ͼѰ·("����",208,343)
��ʱ(1000)
if �Ի�NPC("����")==1 then
	��ʱ(1000)
	NPC�����Ի�("��ϴ������������")
	��ʱ(500)
	if �����Ƿ����("AnqiShuxingNEW") == 1 then
		�Ҽ�ʹ����Ʒ(��������, 1)
		��ʱ(1000)
		while (�жϱ�����Ǯ�Ƿ����() == true and ��ȡ������Ʒ����("����ʯ") > 0) do
			LUA_Call("setmetatable(_G, {__index = AnqiShuxingNEW_Env});AnqiShuxingNEW_OK_Clicked();")--������ϴ��ȷ�ϰ�ť
			��ʱ(1000)
			local aS1, aS2, aS3 = GetAfterAttr()
			if string.find(aS3,"Ѫ����")  and string.find(aS3, "������") and string.find(aS2, "ɢ��") then
				LUA_Call("setmetatable(_G, {__index = AnqiShuxingNEW_Env});AnqiShuxingNEW_SaveChange_Clicked(0);")--����滻��ť
				break
			end
		end
	end
end
��ͼѰ·("����",208,321)
װ������(��������)
ִ�й���("�Զ����")

