�������޽��������� = -1   -- ָ������������-1 ��ʾ�����������

function BuyPetEquipPkg(buyMax)
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_Clicked(11)]])  -- ������޼����
    ��ʱ(100)
    if buyMax == -1 then
        LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy2_Env});ActivitySchedule_MBuy2_CalMax();]])  -- ������
        ��ʱ(100)
    end
    LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy2_Env});ActivitySchedule_MBuy2_OK_Clicked();]])  -- �������
end




function GetPKGFirstPetEquipPos()
    -- ��ȡ��һ������װ����λ��
    return LUA_ȡ����ֵ([[
        local petEquipKeyList = {"����", "����", "����", "����", "����", "����", "����", }
        local currNum = DataPool:GetBaseBag_RealMaxNum();
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
			local sName = theAction:GetName();
			for k,v in pairs(petEquipKeyList) do
				if string.find(sName, v) ~= nil then
					return i
				end
			end
        end
    ]])
end

function GetPKGPetEquipNum()
    -- ��ȡ������װ��������
    return LUA_ȡ����ֵ([[
        local petEquipCount = 0
        local petEquipKeyList = {"����", "����", "����", "����", "����", "����", "����", }
        local currNum = DataPool:GetBaseBag_RealMaxNum();
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
			local sName = theAction:GetName();
			for k,v in pairs(petEquipKeyList) do
				if string.find(sName, v) ~= nil then
					petEquipCount = petEquipCount + 1
				end
			end
        end
        return petEquipCount
    ]])
end


function GetBagUnusedUnitCount()
    -- ��ȡ����������δʹ�õĸ�����
    return LUA_ȡ����ֵ([[
        local currNum = DataPool:GetBaseBag_Num();
        local UnusedCount = 0
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
            if theAction:GetID() == 0 then
                UnusedCount = UnusedCount + 1
            end
        end
        return UnusedCount
    ]])
end


function PetEquipDepart()
    �Ի�NPC("����")
    ��ʱ(500)
    NPC�����Ի�("������װ���")
    ��ʱ(1000)

    local firstPetEquipPos = GetPKGFirstPetEquipPos()
    local row = math.floor(tonumber(firstPetEquipPos) / 10)
    local col = math.floor(tonumber(firstPetEquipPos) % 10)
    if col == 0 then
        col = 10
    else
        row = row + 1
    end

    local pkgPetEquipCount = GetPKGPetEquipNum()

    -- �Ҽ���ӵ�������
    LUA_Call(string.format([[setmetatable(_G, {__index = Packet_Env});Packet_ItemBtnClicked(%d,%d);]], row, col))
    ��ʱ(100)

    local departCount = 0
    while departCount < tonumber(pkgPetEquipCount) do
		LUA_Call([[setmetatable(_G, {__index = PetEquipSuitDepart_Env});PetEquipSuitDepart_Buttons_Clicked();]])  -- ��� ��װ���
		��ʱ(200)
        LUA_Call([[setmetatable(_G, {__index = LoginSelectServerQuest_Env});SelectServerQuest_Bn1Click();]])  -- ���ȷ��
		departCount = departCount + 1
		��ʱ(200)
    end
    ��ʱ(200)
    LUA_Call([[setmetatable(_G, {__index = PetEquipSuitDepart_Env});this:Hide();]])
end


function destroyPkg()
    -- ���� û�õ�����װ��
    LUA_Call([[
        local petEquipCount = 0
        local petEquipKeyList = {"���޼�", "������", "���޻�", "������", "����צ", }
        local currNum = DataPool:GetBaseBag_RealMaxNum();
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
			local sName = theAction:GetName();
			for k,v in pairs(petEquipKeyList) do
				if sName == v then
					Clear_XSCRIPT()
                        Set_XSCRIPT_ScriptID( 124 )
                        Set_XSCRIPT_Function_Name( "OnDestroy" )
                        Set_XSCRIPT_Parameter( 0, i )
                        Set_XSCRIPT_ParamCount( 1 )
                    Send_XSCRIPT()
				end
			end
        end
        return petEquipCount
    ]])
end

function UsePetEquipPkgAndDepart()
    -- ��ʹ�ñ����
    while true do
		local unusedUnitCount = tonumber(GetBagUnusedUnitCount())
        usePkgCount = math.floor(unusedUnitCount/4)
        if tonumber(��ȡ������Ʒ����("���޽�����")) <= 0 then
            break
        end

        for i =1, usePkgCount do
            �Ҽ�ʹ����Ʒ("���޽�����")
            ��ʱ(100)
        end
        ��ʱ(1000)
        ִ�й���("�Զ����")
        ��ʱ(100)
        PetEquipDepart()
    end

    PetEquipDepart()
end


ִ�й���("�Զ����")
��ͼѰ·("����", 355, 236)
��ͼѰ·("����", 355, 236)
��ʱ(1000)
�Ի�NPC("������")
��ʱ(500)
NPC�����Ի�("�ƽ���")
��ʱ(1000)
if �������޽��������� == -1 then
    BuyPetEquipPkg(-1)
else
    for i = 1, �������޽��������� do
        BuyPetEquipPkg(0)
        ��ʱ(100)
    end
end
��ʱ(2000)
��ͼѰ·("����", 354, 268)
��ʱ(1000)
�Ի�NPC("����")
��ʱ(500)

UsePetEquipPkgAndDepart()
