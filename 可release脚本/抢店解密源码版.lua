SWE = 1
-------------------------------------------------------
function MOU(text, ...)
    if SWE == 1 then
        local strCode = string.format(text, ...)
        LUA_Call(string.format([[
            setmetatable(_G, {__index = DebugListBox_Env})
                str= "#e330033#gFFB90F".."".."#e330033#gFFB90F".."%-88s"
                DebugListBox_ListBox:AddInfo(str)
                --��ɫ #e0000ff#u#g0ceff3
                --��ɫ #e0000ff#g28f1ff
                --#Y
        ]], strCode))
    end
end

function �رմ���(strWindowName)
    if �����Ƿ����(strWindowName) == 1 then
        LUA_Call(string.format([[
            setmetatable(_G, {__index = %s_Env}) this:Hide()
	    ]], strWindowName))
    end
end

function ��������(szName, iTem)
    for i = 1, 5 do
        if �Ի�NPC("�Ǹ�ʢ") == 1 then
            ��ʱ(200)
            if �����Ƿ����("Quest") == 1 then
                for kkk = 1, 5 do
                    LUA_Call(string.format([[
                        local nType = PlayerShop:GetCanOpenShopType();
                        if nType==1 or nType==3 then
                            setmetatable(_G, {__index = PS_CreateShop_Env})
                            PlayerShop:CreateShop("%s", %d)
                        else
                                PushDebugMessage("")
                        end
                    ]], szName, iTem))
                    ��ʱ(200)
                    break
                end
                �رմ���("Quest")
                break
            end
        end
    end
end

function TRE()
    �������� = "�����˷�"
    LUA_Call(string.format([[
        setmetatable(_G, {__index = PS_CreateShop_Env})
        PlayerShop:CreateShop("%s", 1)
    ]], ��������))
end

��ͼѰ·("����", 329, 299)
ִ�й���("ͬ����Ϸʱ��")
while true do
    local hour = tonumber(os.date("%H", os.time()))
    local minute = tonumber(os.date("%M", os.time()))
    local second = tonumber(os.date("%S", os.time()))
    if minute ~= nil or second ~= nil then
        MOU(string.format("����ʱ��[%d]��[%d]��~~~~~~�ȴ�����ʱ��59:59", minute, second))
        if minute == 59 and second == 59 then
            for i = 1, 6 do
                TRE()
                ��ʱ(100)
            end
        end
    end
    ��ʱ(100)
end



