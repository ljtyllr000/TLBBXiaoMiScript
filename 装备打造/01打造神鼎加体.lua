

function ����_�رմ���(strWindowName)
	if �����Ƿ����(strWindowName)==1 then
		��Ļ��ʾ("����_�رմ���:"..strWindowName)
	  LUA_Call(string.format([[
		setmetatable(_G, {__index = %s_Env}) this:Hide()  
	 ]], strWindowName))  
	 end
end

function �Զ��жϴ򿪴���()
    if �����Ƿ����("SelfShenDing")==0 then
		if �����Ƿ����("SelfEquip")==0 then
			��Ļ��ʾ("��װ������")
			LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
			��ʱ(2000)
		end
		 if �����Ƿ����("SelfShenDing")==0 then
			��Ļ��ʾ("ѡ����ľ����")
			LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});Other_ShenDing_Page_Switch();")
			��ʱ(2000)
		end
    end
	
end


function ǬԪ����()
	LUA_Call(string.format([[
		setmetatable(_G, {__index = SelfShenDing_Env});
		SelfShenDing_ChangeTabIndex(0);
		setmetatable(_G, {__index = SelfShenDing_Env});
		SelfShenDing_NingLian();
	 ]]))  
end	

function ��������()
	LUA_Call(string.format([[
		setmetatable(_G, {__index = SelfShenDing_Env});
		SelfShenDing_ChangeTabIndex(1);
		setmetatable(_G, {__index = SelfShenDing_Env});
		SelfShenDing2_NingLian();
	 ]],AAA))  
end	
------------------------------------------------------------
function ȡҩ������()
local tem=LUA_ȡ����ֵ(string.format([[
local nYaoChen = Player:GetData("YaoChenValue");
return tonumber(nYaoChen) 
	 ]])) 
		return tonumber(tem)
end

function ȡǬԪ��Ҫҩ������()
local tem=LUA_ȡ����ֵ(string.format([[
	setmetatable(_G, {__index = SelfShenDing_Env});
local str=SelfShenDing_XuYaoYaoChen_Text:GetText();
local n1 = string.find(str,'��')
if n1 then
return tonumber(string.sub(str, n1+2))
end
return 0
		 ]]))  
		return tonumber(tem)
end

function ȡ������Ҫҩ������()
local tem=LUA_ȡ����ֵ(string.format([[
	setmetatable(_G, {__index = SelfShenDing_Env});
local str=SelfShenDing_XuYaoYaoChen_Text:GetText();
local n1 = string.find(str,'��')
if n1 then
return tonumber(string.sub(str, n1+2))
end
return 0
		 ]]))  
		return tonumber(tem)
end

function ��ľ�����Զ��ӵ�(AAA)
	LUA_Call(string.format([[	
		local tem= tonumber(Player:GetData("Attack_QianNengPoint"));
		if tem <=0 then
			return
		end
	
		local nIce, nFire, nThunder, nPoison = Player:GetData("Attack_IFTPValue");
		local Index=tonumber(%d)
		if Index==1 then
			PushDebugMessage("�����Ե���:"..tem.."|�Զ�������:��")
			nIce2=tem;nFire2=0;nThunder2=0;nPoison2=0;
		end
		if Index==2 then
			PushDebugMessage("�����Ե���:"..tem.."|�Զ�������:��")
			nIce2=0;nFire2=tem;nThunder2=0;nPoison2=0;
		end
		if Index==3 then
			PushDebugMessage("�����Ե���:"..tem.."|�Զ�������:��")
			nIce2=0;nFire2=0;nThunder2=tem;nPoison2=0;
		end
		if Index==4 then
			PushDebugMessage("�����Ե���:"..tem.."|�Զ�������:��")
			nIce2=0;nFire2=0;nThunder2=0;nPoison2=tem;
		end
	
	Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("OnLianDanLuQianNengAccept");
		Set_XSCRIPT_ScriptID(339011);
		Set_XSCRIPT_Parameter(0, tonumber(nIce)+nIce2)
		Set_XSCRIPT_Parameter(1, tonumber( nFire)+nFire2 )
		Set_XSCRIPT_Parameter(2, tonumber(nThunder) +nThunder2)
		Set_XSCRIPT_Parameter(3, tonumber(nPoison) +nPoison2)
		Set_XSCRIPT_ParamCount(4);
	Send_XSCRIPT();
  ]],AAA))  
end		
		
function ȫ�Զ��ж���ľ����()
��Ļ��ʾ("�������������---ȫ�Զ��ж���ľ����")
ȡ����Ʒ("����ҩ��")  
while ��ȡ������Ʒ����("����ҩ��")>=1 do
��Ļ��ʾ("����ҩ��-�Զ�ʹ��")
��ʱ(500)
�Ҽ�ʹ����Ʒ("����ҩ��",1)  
��ʱ(500)
end 

for i=1,5 do
	�Զ��жϴ򿪴���()
if ȡҩ������()>=ȡǬԪ��Ҫҩ������() then
	ǬԪ����()
	��ʱ(2000)
end
end
	����_�رմ���("SelfShenDing")
end

ȫ�Զ��ж���ľ����()