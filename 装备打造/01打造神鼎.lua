��Ļ��ʾ("�ȼ�100�������Զ��ж��������,�������ú����ɱ�������")

function ȡ��ɫ������()
local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
if tonumber(��ȡ������Ϣ(26))>=100 then
    local tem =LUA_ȡ����ֵ(string.format([[
	local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
	local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
	local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
	local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
	local tt={ iIceAttack, iFireAttack, iThunderAttack,iPoisonAttack}
	if iIceAttack==math.max(unpack(tt)) then
		maxOfT =1;PushDebugMessage("����������:��");
	elseif  iFireAttack==math.max(unpack(tt)) then
		maxOfT =2;PushDebugMessage("����������:��");
	elseif  iThunderAttack==math.max(unpack(tt)) then
		maxOfT =3;PushDebugMessage("����������:��");
	elseif  iPoisonAttack==math.max(unpack(tt)) then
		maxOfT =4;PushDebugMessage("����������:��");
	end
	return maxOfT 
	]]), "n")
	return tonumber(tem)
else
if string.find("����|��ɽ|�䵱", menpai) then
	���Թ���=1;��Ļ��ʾ("����������:��"..���Թ���)
elseif  string.find("��ң|����|", menpai) then
	���Թ���=2;��Ļ��ʾ("����������:��"..���Թ���)
elseif  string.find("����|����|���|Ľ��|", menpai) then
	���Թ���=3;��Ļ��ʾ("����������:��"..���Թ���)
elseif  string.find("����|����|ؤ��", menpai) then
	���Թ���=4;��Ļ��ʾ("����������:��"..���Թ���)
end
	return tonumber(���Թ���)
end
end



function �رմ���(strWindowName)
	if �����Ƿ����(strWindowName)==1 then
		��Ļ��ʾ("�رմ���:"..strWindowName)
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
		if ȡҩ������()>=ȡ������Ҫҩ������() then
			��������()
			��ʱ(2000)	
		end
	end
	��ľ�����Զ��ӵ�(ȡ��ɫ������())
	�رմ���("SelfShenDing")
end

ȫ�Զ��ж���ľ����()