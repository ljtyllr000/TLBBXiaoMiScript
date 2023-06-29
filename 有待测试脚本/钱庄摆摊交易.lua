g_bossRole = "ӣ�q��СȾ"   -- �ϰ������

-- ��ذ�����
g_whileList = "���ƣ�|�䳾��|��˪��|��ѩ��|���ǣ�|��¶��|��Ӱ��|����Ǥ�|���ݺ����|��榣�|����֦��|�m���ã��f|ؼ�����|���˷����˩e|�Y�۳ҰԵ��g|�Ͼ�|��m���éf"
g_monitorDistance = 8   -- ��ض��ٷ�Χ�ڳ��ַǰ�������ң�������̯

g_NeedSaleItem = {
    "���ʯ���ƣ�1����",
    "���ʯ������1����",
    "���ʯ������1����",
    "���ʯ������1����",
    "�ơ�����������",
    "�ơ�����������",
    "�ơ��ȶ�������",
    "�ơ�����������",
    "��������������",
    "��������������",
    "�����ζ�������",
    "��������������",
    "��������������",
    "�����ƶ�������",
    "��������������",
    "�����۱�������",
    "��������������",
    "��������������",
    "��������������",
    "��������������",
    "���޵����磨1����",
    "���޵����飨1����",
    "���޵�����1����",
    "���޵����ϣ�1����",
    "���޵����䣨1����",
    "��Ԫ����",
    "��Ԫ��",
    "������ʯ",
    "���޾���",
    "���˿",
    "ʥ����",
    "�����3��",
}
g_StallLocation = { 80, 55 }  -- Ǯׯ��̯����

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function CancelStall()
    -- ȡ����̯
    LUA_Call("StallSale:CloseStall('cancel');")
end

function ShelfItem()
    --�ϼ���Ʒ
    for k, v in pairs(g_NeedSaleItem) do
        local name = k
        local money = v
        for i = 0, 199 do
            local ret = LUA_ȡ����ֵ(string.format([[
                local i = %d
                setmetatable(_G, {__index = Packet_Env});
                local theAction = EnumAction(i, "packageitem");
                local id = theAction:GetID();
                if id~=0 then
                    if theAction:GetName() == "%s" then
                        Packet_Space_Line10_Row10_button:SetActionItem(id);
                        Packet_Space_Line10_Row10_button:DoAction();
                        return 1
                    end
                end
            ]], i, name))
            if ret == "1" then
                ��ʱ(1000)
                LUA_ȡ����ֵ(string.format([[
                    local theAction = EnumAction(%d, "packageitem");
                    local id = theAction:GetID();
                    if id~=0 then
                        local num = theAction:GetNum();
                        local name = theAction:GetName();
                        local money = 1
                        PushDebugMessage("��Ʒ["..name.."]"..num.."�� "..tostring(money))
                        StallSale:ReferItemPrice(money);
                        setmetatable(_G, {__index = InputYuanbao_Env});this:Hide();
                        setmetatable(_G, {__index = MessageBox_Self_Env});this:Hide();
                    end
                ]], i, money))
            end
        end
    end
end

function StallSaleItem()
    -- ��̯
    while �����Ƿ����("StallSale") == 0 do
        ����_������()
        LUA_ȡ����ֵ("PlayerPackage:OpenStallSaleFrame();StallSale:AgreeBeginStall();")
        ��ʱ(1000)
    end

    --������ҳ��
    local mainPage = "0"  -- --0��Ʒ 1����
    LUA_ȡ����ֵ("StallSale:SetDefaultPage(" .. mainPage .. ")")
    ��ʱ(1000)

end

function BuyStallItem(roleName, roleID)
    -- ��̯λ
    LUA_Call(string.format([[
        ID =%d
        OpenStallSale(ID)
     ]], roleID), "n");
    ��ʱ(3000)

    if �����Ƿ����("StallBuy") then
        MentalTip(string.format("��ʼ����%s����̯λ", roleName))
        for i = 0, 19 do
            local tem = LUA_ȡ����ֵ(string.format([[
                i=%d
                local theAction = EnumAction(i, "st_other");
                g_nCurSelectItemID = theAction:GetID();
                local nItemName = StallBuy:GetItemName(g_nCurSelectItemID);
                local nItemNum  = StallBuy:GetItemNum(g_nCurSelectItemID);
                local nPriceYuanbao = StallBuy:GetPrice("item", i);
                AA=i+1
                if nItemName  then
                    if  tonumber(nPriceYuanbao) == 1 then      ----�Լ��ļ۸�,�����ܼ�: ���۳��������ļ۸�
                        --PushDebugMessage(AA..".   ��Ʒ����"..nItemName.."����:"..nItemNum.."����:"..nPriceYuanbao);
                        StallBuy:BuyItem(g_nCurSelectItemID,i);
                        return 1
                    end
                end
            ]], i), "n");
            if tonumber(tem) ~= 1 then
                ��ʱ(2000)
            else
                ��ʱ(500)
            end
        end
    end
end

function CheckMySaleItem()
    local ret = LUA_ȡ����ֵ([[
        for i=0, 19 do
            local theAction = EnumAction(i, "st_self");
            if theAction:GetID() ~= 0 then
                return 1
            end
        end
        return -1
    ]])
    return tonumber(ret)
end

function CheckNeedSaleItem()
    for i = 0, 199 do
        for k, v in pairs(g_NeedSaleItem) do
            local ret = LUA_ȡ����ֵ(string.format([[
                local theAction = EnumAction(%d, "packageitem");
                local id = theAction:GetID();
                if id~=0 then
                    local name = theAction:GetName();
                    if name = "%s" then
                        return 1
                    end
                end
                return -1
            ]], i, v))
            if tonumber(ret) == 1 then
                return 1
            end
        end
    end
    return -1
end

function main()
    MentalTip(string.format("Ǯׯ(%d, %d)����̯����Ԫ����Ʒ", g_StallLocation[1], g_StallLocation[2]))
    MentalTip(string.format("Ǯׯ(%d, %d)����̯����Ԫ����Ʒ", g_StallLocation[1], g_StallLocation[2]))
    ִ�й���("�Զ����")
    local str = ""
    for k, v in pairs(g_NeedSaleItem) do
        str = str .. v .. "|"
    end

    ȡ����Ʒ(str)
    ����Ʒ(str, str, 1, 0, 1)  -- �������Ʒ
    ��ͼѰ·("Ǯׯ", g_StallLocation[1], g_StallLocation[2])
    ��ʱ(1000)
    myName = ��ȡ������Ϣ(12)

    if g_bossRole ~= myName then
        --��̯��
        MentalTip("��̯�ſ�ʼ��̯")
        while true do
            -- �����Χ���
            local ret = ��ȡ��Χ���(g_whileList, g_StallLocation[1], g_StallLocation[2], g_monitorDistance)
            if ret > 0 then
                MentalTip(string.format('%d�׷�Χ�ڳ��ַǰ��������, ȡ����̯', g_monitorDistance))
                CancelStall()
                goto continue
            end

            if �����Ƿ����("StallMessage") == 0 then
                StallSaleItem()  -- ��ʼ��̯
            end

            local checkRet1 = CheckMySaleItem()
            local checkRet2 = CheckNeedSaleItem()
            if checkRet1 == -1 and checkRet2 == 1 then
                -- ��ǰ�ϼܵ�����, ���ұ����л��п����ϼ���Ʒ�������ϼ���Ʒ
                ShelfItem()  -- �ϼ���Ʒ
            elseif checkRet2 == -1 then
                MentalTip('������Ʒ��ת�����, �˳���̯')
                CancelStall()
                ��ʱ(1000)
                ��ͼѰ·("����", 330, 299)  -- ת����ɣ��뿪
                break
            end
            :: continue ::
            ��ʱ(1000)
        end
    else
        -- �ϰ����
        MentalTip("�ϰ����׼�������Ԫ��")
        while true do
            local roleName, roleID, _, _, _, _, _, _, _, _ = ������Χ��Ʒ(1, g_whileList, 3)
            if roleID > 0 then
                BuyStallItem(roleName, roleID)
            end
        end
    end
end


-- ------------------------------ MAIN ----------------------------------
main()
