
local ItemSource = "ϡ���䱦ͼ"

--�ַ����ָ��,�ָ���Ϊ"|"
function SplitString(str, sep)
	local tmp ={}
	for w in string.gmatch(str, string.format("([^%q]+)",sep)) do 
		table.insert(tmp,w)
	end
	return tmp	
end
--������Ҫ�ϼܵ���Ʒ����

function ������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#cFF0000".."��ʾ��".."#cFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
		--#Y
	]], strCode))
end
--=====================================================================================================
local ItemList = SplitString(ItemSource, "|") 
local OwnItem = {}
---------------��---��---��---��-----------------------------------
function Sleep(ms)
	��ʱ(ms)
end
function QuestFrameOptionClicked(str)
	NPC�����Ի�(str) 
end
function PushDebugMessage(str, ...)
	local str = string.format(str, ...)
	��Ļ��ʾ(str)
end
function IsWindowShow(str)
	return �����Ƿ����(str)
end
function MoveToNPC(posx, posy, sceneName, NpcName)
	while true do
		��ͼѰ·(sceneName, posx, posy);Sleep(1000)
		if �Ի�NPC(NpcName) == 1 then
			break
		end
	end
end

function CloseWindow(str)
	LUA_Call(string.format("setmetatable(_G, {__index = %s_Env});this:Hide()",str))
end

--�ж�����������Ƿ���Ҫ���۵���Ʒ�ĺ���
function FindTemBagItem(NameList)
	local tmpItem = {}
	for k, v in pairs(NameList) do 
		local itemname = LUA_ȡ����ֵ(string.format([[ 
			setmetatable(_G, {__index = Packet_Temporary_Env})  
			local szName = "%s"
				for i = 1, 120 do
					local theAction, bLocked = Bank:EnumTemItem(i - 1)
					if theAction:GetID() ~= 0 then
						if szName == theAction:GetName() then
							return theAction:GetName()
						end
					end
				end
			return ""
		]],v))
		if itemname ~= "" then
			table.insert(tmpItem, itemname)
		end
	end
	return tmpItem
end
--��������Ҽ����
function TemPacketRclick(name)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = Packet_Temporary_Env})
		local GRID_BUTTONS = {}
		local szName = "%s"
		for i = 1, 120 do
			local ItemBar = Packet_Temporary_ActionsList:AddItemElement( "ActionButtonItem", "Packet_Temporary", "", "")
			local ItemAcButton = ItemBar:GetLuaActionButton("Packet_Temporary")
			ItemAcButton:SetProperty("DragAcceptName", "p"..tostring(i))
			table.insert(GRID_BUTTONS,ItemAcButton);
		end
		for i = 1, 120 do
			local theAction, bLocked = Bank:EnumTemItem(i-1);
			if theAction:GetID() ~= 0 then
				GRID_BUTTONS[i]:SetActionItem(theAction:GetID())
				if szName == theAction:GetName() then
					GRID_BUTTONS[i]:DoAction()
					GRID_BUTTONS[i]:SetActionItem(-1)
				end
			end
		end
	]],name))
end
--ͳ�ƽ�������Ʒ�����ĺ���
function CountTemBagItemNum(name)
    local num = LUA_ȡ����ֵ(string.format([[
        setmetatable(_G, {__index = Packet_Temporary_Env})  
        local szName = "%s"
            for i = 1, 120 do
                local theAction, bLocked = Bank:EnumTemItem(i - 1)
                if theAction:GetID() ~= 0 then
                    if szName == theAction:GetName() then
                        return theAction:GetNum()
                    end
                end
            end
            return 0
	]],name))
	return tonumber(num)
end

for i = 1, 10 do
	local statecounttotalmax = LUA_ȡ����ֵ(string.format([[
	local itemidx,count,itemid,price,time,totalmax,state,money,pos = GuiShiUI:LuaFnGetMarketUserSellInfoByID(0,%d-1);
	if itemid > 0 then
	    return state .. "|" .. count .. "|" .. totalmax
	end
	]],i))
	Sleep(100)
	local tmp = SplitString(statecounttotalmax, "|")
	table.insert(OwnItem,{indx = i, state = tonumber(tmp[1]), count = tonumber(tmp[2]), totalmax = tonumber(tmp[3])})
end
function  ȡ����������()
        local tem=  LUA_ȡ����ֵ(string.format([[
                local ZoneWorldID = DataPool:GetSelfZoneWorldID()
        local strName = DataPool:GetServerName( ZoneWorldID )
        return strName
                ]]))
        return  tem
end
function �������ȡ��()
if  string.find("��������|",ȡ����������()) then
                local Item = FindTemBagItem(ItemList)

         for k, v in pairs(Item) do
        	TemPacketRclick(v);Sleep(1000) --�Ҽ������Ҫ����Ʒ
         end
CloseWindow("GuiShi_MarketOnSell",true) --�ر��ϼܽ���
CloseWindow("GuiShi_Market",true) --�ر�ɭ���н���
                ��ʱ(3000)
                else
                ������ʾ("���ű�ֻ�����ڡ��������顿������ȡ�ر�ͼʹ�ã���Ҫ������;����ϵQQ3707181")
                ������ʾ("���ű�ֻ�����ڡ��������顿������ȡ�ر�ͼʹ�ã���Ҫ������;����ϵQQ3707181")
                ������ʾ("���ű�ֻ�����ڡ��������顿������ȡ�ر�ͼʹ�ã���Ҫ������;����ϵQQ3707181")
                ������ʾ("���ű�ֻ�����ڡ��������顿������ȡ�ر�ͼʹ�ã���Ҫ������;����ϵQQ3707181")
                ������ʾ("���ű�ֻ�����ڡ��������顿������ȡ�ر�ͼʹ�ã���Ҫ������;����ϵQQ3707181")
                return
  end
--��ȡ���������Ҫ�ϼܵ���Ʒ����
end 
�������ȡ��()