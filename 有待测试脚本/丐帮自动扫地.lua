skillList = {
    "��ս��Ұ", "��ɨǬ��"
}

function MoveToPos(NPCCity, x, y)
    while true do
        ��ͼѰ·(NPCCity, x, y)
        ��ʱ(500)
        local myX = ��ȡ������Ϣ(7)
        local myY = ��ȡ������Ϣ(8)
        if tonumber(myX) == x and tonumber(myY) == y then
            break
        end
    end
end

function UseTuLingZhuTransmit()
    -- ʹ�������鴫��
    if ��ȡ������Ʒ����("������") > 0 then
        ����_������();

        �Ҽ�ʹ����Ʒ("������", 1);   -- Ĭ��ʹ�õ�һ��
        ��ʱ(1000)
        while true do
            if �����Ƿ����("Item_TuDunZhu") == 1 then
                LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_Cancel_Clicked(1);");
                break
            end
            ��ʱ(500)
        end
        ��ʱ(2000)
    end
end

function GetTLZPos(TLZName, TLZNum)
    return LUA_ȡ����ֵ(string.format([[
        local currNum = DataPool:GetBaseBag_Num();
        local TLZName = "%s"
        local TLCNum = %d
        local TLZCount = 0
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
            local sName = theAction:GetName();
            if string.find(TLZName, sName) ~= nil then
                TLZCount = TLZCount + 1
                if TLZCount == TLCNum then
                    return i
                end
            end
        end
        return -1
    ]], TLZName, tonumber(TLZNum)))
end

function UseTuLingZhuPositioning()
    -- ʹ�������鶨λ
    -- ��λ��1��������
    if ��ȡ������Ʒ����("������") > 0 then
        �Ҽ�ʹ����Ʒ("������", 1);
        ��ʱ(1000)
        if �����Ƿ����("Item_TuDunZhu") == 1 then
            LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
            ��ʱ(1000)
            LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
        end
    end
    ��ʱ(1000)

    -- ��λ��2��������
    local secondTLZPos = GetTLZPos("������", 2)
    if tonumber(secondTLZPos) == -1 then
        return
    end

    local row = math.floor(tonumber(secondTLZPos) / 10)
    local col = math.floor(tonumber(secondTLZPos) % 10)
    if col == 0 then
        col = 10
    else
        row = row + 1
    end
    LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))
    ��ʱ(1000)
    if �����Ƿ����("Item_TuDunZhu") == 1 then
        LUA_Call("setmetatable(_G, {__index = Item_TuDunZhu_Env});Item_TuDunZhu_OK_Clicked();")
        ��ʱ(1000)
        LUA_Call("setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
    end
end

while true do
    if ��ȡ������Ʒ����("������") > 0 then
        UseTuLingZhuPositioning()
    end

    for _, skillName in pairs(skillList) do
        if �жϼ�����ȴ(skillName) == 1 then
            ����_������()
            ��ʱ(100)
            local HideSkillID = ��ȡ����ID(skillName)
            ʹ�ü���(HideSkillID)
        end
        ��ʱ(200)
    end

    if �ж���������() == 1 then
        LUA_Call([[Player:SendReliveMessage_OutGhost();]])
        �������ظ�()
        �������ظ�()
        if ��ȡ������Ʒ����("������") > 0 then
            UseTuLingZhuTransmit()
            �ȴ���ͼ���()
        else
            local pName, pLevel, pMenPai, pHP, pMap, pPosX, pPosY = ���_��ȡ��Ա��Ϣ(1)
            MoveToPos(pMap, pPosX, pPosY)
        end
    end
end