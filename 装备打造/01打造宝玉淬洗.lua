local GetLuaValue = LUA_ȡ����ֵ
local PushDebugMessageEx = ��Ļ��ʾ
local PushDebugMessage = ��Ļ��ʾ
local Sleep = ��ʱ
local QuestFrameOptionClicked = NPC�����Ի�
GetLuaValue("setmetatable(_G, { __index = DebugListBox_Env })DebugListBox_ListBox:AddInfo('#eaf0c14#Y'..'���ű��ɡ�����lQQ103900393������༭ ')")
function MoveToNPC(fx,fy, nId, npc_name)
	while true do
		if nId==��ȡ������Ϣ(16) and �����������(fx,fy,��ȡ������Ϣ(7),��ȡ������Ϣ(8))<5 then
			�Ի�NPC(npc_name)
			Sleep(500)
			return 
		else
			��ͼѰ·(nId,fx,fy)
		end
	end
end

function IsWindowShow(name) 
	if tonumber(GetLuaValue("if IsWindowShow('"..name.."') then return 1 end return 0","n",1))==1 then
		return true
	end
	return false
end	
	
local tpname = {"��","��ˮ","��ľ","���","Ϣ��",}

function ���б����ϴ(n1,bfb)
	local num = ��ȡ������Ʒ����("����Ȫ")
	local n2 = tonumber(GetLuaValue("local num=0 for i=1,5 do num=num+Player:GetFiveElements_JadeExtend("..n1-1 ..",Player:GetFiveElements_JadeType("..n1-1 ..",i-1))end return num","n",1))
	local n3 = tonumber(GetLuaValue("return Player:GetData('MONEY')+Player:GetData('MONEY_JZ')","n",1))
	PushDebugMessageEx("����|��ǰ��ţ�"..n1.." ֵ��"..n2.."% ����������"..num.." ��ң�"..n3)
	while num>=5 and n2<bfb and n3>=10000 do
		if IsWindowShow("EquipBaoJian_Wash") and string.find(GetLuaValue("setmetatable(_G, {__index = EquipBaoJian_Wash_Env})return EquipBaoJian_Wash_DragTitle:GetText()","s",1),tpname[n1]) then
			PushDebugMessage("�����졿 ��ϴ������"..tpname[n1])
			GetLuaValue("Clear_XSCRIPT()\
				Set_XSCRIPT_Function_Name('FiveElementsJadeWash')\
				Set_XSCRIPT_ScriptID(880039)\
				Set_XSCRIPT_Parameter(0,"..n1-1 ..")\
				Set_XSCRIPT_Parameter(1,2)\
				Set_XSCRIPT_ParamCount(2)\
			Send_XSCRIPT()")
			Sleep(1000)
			GetLuaValue("setmetatable(_G, {__index = WuhunQuest_Env})if this:IsVisible()then WuhunQuest_Bn1Click()end")
		else
			MoveToNPC(113,200,"������","������")
			QuestFrameOptionClicked("���б����ϴ")
			Sleep(500)
			QuestFrameOptionClicked(tpname[n1].."�����ϴ")
		end
		Sleep(500)
		num = ��ȡ������Ʒ����("����Ȫ")
		n2 = tonumber(GetLuaValue("local num=0 for i=1,5 do num=num+Player:GetFiveElements_JadeExtend("..n1-1 ..",Player:GetFiveElements_JadeType("..n1-1 ..",i-1))end return num","n",1))
		n3 = tonumber(GetLuaValue("return Player:GetData('MONEY')+Player:GetData('MONEY_JZ')","n",1))
		PushDebugMessageEx("�����졿 ��ǰ��ţ�"..n1.." ֵ��"..n2.."% ����������"..num.." ��ң�"..n3)
		Sleep(1000)
	end
end

--"��","��ˮ","��ľ","���","Ϣ��"
function ����_���б����ϴ(�ӳ�)
	���б����ϴ(1,�ӳ�)
	���б����ϴ(2,�ӳ�)
	���б����ϴ(3,�ӳ�)
	���б����ϴ(4,�ӳ�)
	���б����ϴ(5,�ӳ�)
end

ȡ����Ʒ("����Ȫ")
����Ʒ("����Ȫ",������Ʒ,0,1,1) 
����_���б����ϴ(30)
����_���б����ϴ(45)
����_���б����ϴ(65)
����_���б����ϴ(80)
����_���б����ϴ(100)
