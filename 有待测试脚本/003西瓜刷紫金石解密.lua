�ϰ�� = "ǳ����ֹ��"

local lua = LUA_ȡ����ֵ

local function ˢ��()
    -- -1����  0����ˢ�� 1-4���Ͻ�ʯ
    --�򿪽���
    if lua("return tostring(IsWindowShow('Token_Shop'))") == "false" then
        lua([[
			Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name("OnOpenShop")
				Set_XSCRIPT_ScriptID( 892921 )
			Send_XSCRIPT()
		]])
        ��ʱ(1000)
    end
    local ret3 = lua([[
		setmetatable(_G, {__index = Token_Shop_Env});
		local buyList = {
			[1] = Token_Shop_Yuanbao1_Icon_Mask,
			[2] = Token_Shop_Yuanbao2_Icon_Mask,
			[3] = Token_Shop_Yuanbao3_Icon_Mask,
			[4] = Token_Shop_Yuanbao4_Icon_Mask,
		}
		for i=1,4 do
			local theAction = EnumAction(i-1, "xiguashop_item");
			if theAction:GetID()~=0 then
				local name = theAction:GetName()
				if name=="�Ͻ�ʯ" then
					if buyList[i]:IsVisible()==false then
						return i
					end
				--elseif string.find(name,"ʱװ") then
				--	return -1
				--elseif string.find(name,"������") then
				--	return -1
				end
			end
		end
		return 0
	]])
    if tonumber(ret3) ~= 0 then
        return tonumber(ret3)
    end

    local ret = tonumber(lua([[
		setmetatable(_G, {__index = Token_Shop_Env});
		local str = Token_Shop_Remain2_Text:GetText()	--"?ӵ�н��񻷣��70"
		local _,int = string.find(str,"�")
		local DB = tonumber(string.sub(str,int+1,string.len(str)))
		if DB<2 then
			return -1
		else
			Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name('OnRefreshShopItem');
				Set_XSCRIPT_ScriptID(892921);
				Set_XSCRIPT_Parameter(0,1);
				Set_XSCRIPT_Parameter(1,0);
				Set_XSCRIPT_ParamCount(2);
			Send_XSCRIPT();
			return 0
		end
	]]))
    ��ʱ(1000)
    if ret == 0 then
        local ret2 = lua([[
			setmetatable(_G, {__index = Token_Shop_Env});
			local buyList = {
				[1] = Token_Shop_Yuanbao1_Icon_Mask,
				[2] = Token_Shop_Yuanbao2_Icon_Mask,
				[3] = Token_Shop_Yuanbao3_Icon_Mask,
				[4] = Token_Shop_Yuanbao4_Icon_Mask,
			}
			for i=1,4 do
				local theAction = EnumAction(i-1, "xiguashop_item");
				if theAction:GetID()~=0 then
					local name = theAction:GetName()
					if name=="�Ͻ�ʯ" then
						if buyList[i]:IsVisible()==false then
							return i
						end
					--elseif string.find(name,"ʱװ") then
					--	return -1
					--elseif string.find(name,"������") then
					--	return -1
					end
				end
			end
			return 0
		]])
        return tonumber(ret2)
    else
        return -1
    end
end

local function ����(idx)
    --�򿪽���
    if lua("return tostring(IsWindowShow('Token_Shop'))") == "false" then
        lua([[
			Clear_XSCRIPT()
				Set_XSCRIPT_Function_Name("OnOpenShop")
				Set_XSCRIPT_ScriptID( 892921 )
			Send_XSCRIPT()
		]])
        ��ʱ(1000)
    end
    lua("setmetatable(_G, {__index = Token_Shop_Env});Token_Shop_YuanbaoBuy(" .. idx .. ")")
    ��ʱ(1000)
    lua("setmetatable(_G, {__index = MessageBox_Self2_Env});MessageBox_Self2_Ok_Clicked()")
    ��ʱ(1000)
end

local function ���׸��ϰ�(i)
    if lua("return Player:GetName()") == �ϰ�� then
        ����(i)
    elseif tonumber(lua("return Player:GetData('YUANBAO')")) >= 450 then
        ����(i)
    else
        while lua("return tostring(IsWindowShow('Exchange'))") == "false" do
            --ҪԪ��
            ��ͼѰ·("����", 284, 357)
            ��ʱ(1000)
            lua("Target:SelectThePlayer('" .. �ϰ�� .. "')")
            ��ʱ(100)
            lua("Exchange:SendExchangeApply();")
            ��ʱ(100)
            for o = 1, 10 do
                if lua("return tostring(IsWindowShow('Exchange'))") == "true" then
                    ��ʱ(1000)
                    break
                end
                ��ʱ(1000)
            end
        end
        while lua("return tostring(IsWindowShow('Exchange'))") == "true" do
            if lua("return tostring(Exchange:IsLocked('other'))") == "true" then
                local Timer = tonumber(lua("setmetatable(_G, {__index = ExchangeSafe_Env});return ExchangeSafe_Watch:GetProperty('Timer');"))
                ��ʱ(Timer * 1000 + 500)
                if lua("return tostring(Exchange:IsLocked('self'))") == "false" then
                    lua("setmetatable(_G, {__index = Exchange_Env});Exchange_Lock_Button_Clicked()")
                    ��ʱ(1500)
                end
                if lua("return tostring(Exchange:IsLocked('self'))") == "true" then
                    lua("setmetatable(_G, {__index = Exchange_Env});Trade_Accept_Button_Clicked()")
                    ��ʱ(500)
                end
            end
        end

        while lua("return tostring(IsWindowShow('Exchange'))") == "true" do
            ��ʱ(1000)
        end

        while true do
            local ret = lua([[
				local index,BindState = PlayerPackage:FindFirstBindedItemIdxByIDTable(30501036)
				if index~=-1 then
					PlayerPackage:UseItem(index)
					return 1
				end
				return 0
			]])
            if ret == "1" then
                ��ʱ(400)
            else
                break
            end
        end

        ����(i)
        ��ʱ(1000)

        --���ܽ���
        while lua("return tostring(IsWindowShow('Exchange'))") == "false" do
            lua([[
				if Exchange:IsStillAnyAppInList() then					
					Exchange:OpenExchangeFrame()
				else
					PushDebugMessage("�ȴ��ϰ�Ž�����")				
				end					
				setmetatable(_G, {__index = MainMenuBar_Env});					
				if Exchange:IsStillAnyAppInList()==false then					
					MainMenuBar_Stop_Flash_Exchange()				
				end					
			]])
            ��ʱ(1000)
        end

        --�ӵ�����
        if lua("return tostring(IsWindowShow('Exchange'))") == "true" then
            ��ʱ(1000)
            �Ҽ�ʹ����Ʒ("�Ͻ�ʯ", 2)
            ��ʱ(1000)
            while lua("return tostring(IsWindowShow('Exchange'))") == "true" do

                if lua("return tostring(Exchange:IsLocked('self'))") == "false" then
                    local Timer = tonumber(lua("setmetatable(_G, {__index = ExchangeSafe_Env});return ExchangeSafe_Watch:GetProperty('Timer');"))
                    ��ʱ(Timer * 1000 + 500)
                    lua("setmetatable(_G, {__index = Exchange_Env});Exchange_Lock_Button_Clicked()")
                    ��ʱ(1500)
                elseif lua("return tostring(Exchange:IsLocked('other'))") == "true" then
                    ��ʱ(1000)
                    lua("setmetatable(_G, {__index = Exchange_Env});Trade_Accept_Button_Clicked()")
                    break
                end
                ��ʱ(1000)
            end
            while lua("return tostring(IsWindowShow('Exchange'))") == "true" do
                ��ʱ(100)
            end
        end
    end
end

if tonumber(lua("return DataPool:GetServerDayTime()")) > 20220817 then
    ��Ļ��ʾ("��ѽ���")
    return
end

while true do
    local ret = ˢ��()
    if ret == -1 then
        break
    end
    if ret >= 1 and ret <= 4 then
        ���׸��ϰ�(ret)
    end
end

for i = 1, 5 do
    lua(string.format([[
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name('OnGetTokenShopFanLi');
			Set_XSCRIPT_ScriptID(892921);
			Set_XSCRIPT_Parameter(0,%d);
			Set_XSCRIPT_ParamCount(1);
		Send_XSCRIPT();
	]], i))
    ��ʱ(500)
end

if lua("return Player:GetName()") == �ϰ�� then
    ��ͼѰ·("Ǯׯ", 66, 66)
    ��ʱ(1000)
    for i = 1, 10 do
        lua("Player:YuanBaoToTicket(450)")
        ��ʱ(1000)
    end
    ��ͼѰ·("����", 284, 357)
    ��ʱ(1000)
    while true do
        local �Է����� = ""
        --���ܽ���
        lua([[
			if Exchange:IsStillAnyAppInList() then					
				Exchange:OpenExchangeFrame()				
			end					
			setmetatable(_G, {__index = MainMenuBar_Env});					
			if Exchange:IsStillAnyAppInList()==false then					
				MainMenuBar_Stop_Flash_Exchange()				
			end					
		]])
        ��ʱ(1000)

        --�ӵ�����
        if lua("return tostring(IsWindowShow('Exchange'))") == "true" then
            ��ʱ(1000)
            �Է����� = lua("return Exchange:GetOthersName()")
            ��Ļ��ʾ(�Է�����)
            ��ʱ(1000)
            �Ҽ�ʹ����Ʒ("Ԫ��Ʊ", 1)
            ��ʱ(1000)
            while lua("return tostring(IsWindowShow('Exchange'))") == "true" do
                if lua("return tostring(Exchange:IsLocked('self'))") == "false" then
                    local Timer = tonumber(lua("setmetatable(_G, {__index = ExchangeSafe_Env});return ExchangeSafe_Watch:GetProperty('Timer');"))
                    ��ʱ(Timer * 1000 + 500)
                    lua("setmetatable(_G, {__index = Exchange_Env});Exchange_Lock_Button_Clicked()")
                    ��ʱ(1500)
                elseif lua("return tostring(Exchange:IsLocked('other'))") == "true" then
                    ��ʱ(1000)
                    lua("setmetatable(_G, {__index = Exchange_Env});Trade_Accept_Button_Clicked()")
                    break
                else
                    ��ʱ(1000)
                end
            end
            while lua("return tostring(IsWindowShow('Exchange'))") == "true" do
                ��ʱ(100)
            end
            lua("Target:SelectThePlayer('" .. �Է����� .. "')")
            ��ʱ(100)
            lua("Exchange:SendExchangeApply();")
            ��ʱ(100)
            while true do
                ��ʱ(1000)
                if lua("return tostring(IsWindowShow('Exchange'))") == "true" then
                    while lua("return tostring(IsWindowShow('Exchange'))") == "true" do
                        if lua("return tostring(Exchange:IsLocked('other'))") == "true" then
                            local Timer = tonumber(lua("setmetatable(_G, {__index = ExchangeSafe_Env});return ExchangeSafe_Watch:GetProperty('Timer');"))
                            ��ʱ(Timer * 1000 + 1000)
                            if lua("return tostring(Exchange:IsLocked('self'))") == "false" then
                                lua("setmetatable(_G, {__index = Exchange_Env});Exchange_Lock_Button_Clicked()")
                                ��ʱ(1500)
                            end
                            if lua("return tostring(Exchange:IsLocked('self'))") == "true" then
                                lua("setmetatable(_G, {__index = Exchange_Env});Trade_Accept_Button_Clicked()")
                                ��ʱ(500)
                            end
                        end
                    end
                    break
                else
                    ��Ļ��ʾ("�ȴ�" .. �Է����� .. "�����Ͻ�ʯ")
                end
            end

            while lua("return tostring(IsWindowShow('Exchange'))") == "true" do
                ��ʱ(1000)
            end
        end
    end
end
