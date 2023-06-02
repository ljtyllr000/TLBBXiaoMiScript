function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetRolePetCount()
    local rolePetCount = LUA_ȡ����ֵ([[
    return Pet:GetPet_Count()
    ]])

    return rolePetCount
end

function GetNeedYanShouPetCount(rolePetCount)
    -- ����״̬ ���� < 3W������������0
    local count = LUA_ȡ����ֵ(string.format([[
    local needYSPetCount = 0

    for i=0, %d do
        local petLife = Pet:GetNaturalLife(i);
        if Pet:GetIsPossession(i) then
            if petLife < 30000 then
                needYSPetCount = needYSPetCount + 1
            end
        else
            if petLife == 0 then
                needYSPetCount = needYSPetCount + 1
            end
        end
    end
    return needYSPetCount
    ]], tonumber(rolePetCount) - 1))
    return count
end


function PetYanShou(rolePetCount)
    for i = 0, rolePetCount-1 do
        local isNeedYanShou = LUA_ȡ����ֵ(string.format([[
		    local petLife = Pet:GetNaturalLife(%d);
            if Pet:GetIsPossession(%d) then
                if petLife < 30000 then
					PushDebugMessage(111111)
                    return 1
                end
            else
                if petLife == 0 then
					PushDebugMessage(2222)
                    return 1
                end
            end
            return 0
        ]], i, i))

        if tonumber(isNeedYanShou) == 1 then
            MentalTip("��" .. tostring(i + 1) .. "ֻ������Ҫ����")
			LUA_Call(string.format([[
			    local bagIndex, bindstate = PlayerPackage:FindFirstBindedItemIdxByIDTable( 30606023 )
                if bagIndex == nil or bagIndex < 0 or bindstate == 0 then
                    bagIndex, bindstate = PlayerPackage:FindFirstBindedItemIdxByIDTable( 30606001 )
                    if bagIndex == nil or bagIndex < 0 or bindstate == 0 then
                        bagIndex, bindstate = PlayerPackage:FindFirstBindedItemIdxByIDTable( 30606024 )
                        if bagIndex == nil or bagIndex < 0 or bindstate == 0 then
                            bagIndex, bindstate = PlayerPackage:FindFirstBindedItemIdxByIDTable( 30606002 )
                            if bagIndex == nil or bagIndex < 0 or bindstate == 0 then
                                bagIndex = PlayerPackage:GetBagPosByItemIndex( 30606023 )
                                if bagIndex == nil or bagIndex < 0 then
                                    bagIndex = PlayerPackage:GetBagPosByItemIndex( 30606001 )
                                    if bagIndex == nil or bagIndex < 0 then
                                        bagIndex = PlayerPackage:GetBagPosByItemIndex( 30606024 )
                                        if bagIndex == nil or bagIndex < 0 then
                                            bagIndex = PlayerPackage:GetBagPosByItemIndex( 30606002 )
                                            if bagIndex == nil or bagIndex < 0 then
                                                local hid,lid = Pet:GetGUID(%d);
                                                Clear_XSCRIPT();
                                                Set_XSCRIPT_Function_Name("PetSkillStudy_YanShou");
                                                Set_XSCRIPT_ScriptID(311111);
                                                Set_XSCRIPT_Parameter(0,1);
                                                Set_XSCRIPT_Parameter(1,hid);
                                                Set_XSCRIPT_Parameter(2,lid);
                                                Set_XSCRIPT_ParamCount(3);
                                                Send_XSCRIPT();
                                                return;
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                Pet:SkillStudy_Do(3, %d, bagIndex);
			]], i, i))
        end
		��ʱ(1000)
    end
end

function BuyYanShouDanByYBBind(missCount)
    -- ��Ԫ���̵꣬�л�����Ԫ���̵꣬ѡ�������̳ǣ�ѡ�����ްٱ��䣬�����������굤
    -- ���ȱ�ٵ���������1����Ҫѭ����ι������ʹ����������
    local start = 0
    while start < missCount do
        LUA_Call([[setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();]])  -- ��YB�̵�
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);]])  -- �е���Ԫ��
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(3);]])  -- �е������̳�
        ��ʱ(500)

        local queRenGouMaiStatus = LUA_ȡ����ֵ([[return NpcShop:GetBuyDirectly()]])
        local clicked = false
        if tonumber(queRenGouMaiStatus) == 0 then
            -- 0��ʾ��ѡ����ȷ�ϣ��ᵯ��ȷ�Ͽ�����Ҫȡ����ѡ
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
            clicked = true
        end

        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(7);]])  -- �������ٵ�
        ��ʱ(500)
        if clicked then
            -- ����ȷ�ϰ�ť�ָ�ԭ״
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
        end
        start = start + 1
    end
end

function BuyYanShouDanByHongLi(missCount)
    -- ��Ԫ���̵꣬�л��������̵꣬ѡ�������̳ǣ�ѡ�����ްٱ��䣬�����������굤
    -- ���ȱ�ٵ���������1����Ҫѭ����ι������ʹ����������
    local start = 0
    while start < missCount do
        LUA_Call([[setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();]])  -- ��YB�̵�
        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);]])  -- �е������̵�
        ��ʱ(2000)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(3);]])  -- �е������̳�
        ��ʱ(500)

        local queRenGouMaiStatus = LUA_ȡ����ֵ([[return NpcShop:GetBuyDirectly()]])
        local clicked = false
        if tonumber(queRenGouMaiStatus) == 0 then
            -- 0��ʾ��ѡ����ȷ�ϣ��ᵯ��ȷ�Ͽ�����Ҫȡ����ѡ
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
            clicked = true
        end

        ��ʱ(500)
        LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(5);]])  -- �������ٵ�
        ��ʱ(500)
        if clicked then
            -- ����ȷ�ϰ�ť�ָ�ԭ״
            LUA_Call([[setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_querengoumai_Clicked();]])  -- �������ȷ��
        end
        start = start + 1
    end
end

function PrepareYanShouDan(needYSDCount)
    -- ������
    -- ��Ԫ������
    -- ��������
    local current_YSDCount = tonumber(��ȡ������Ʒ����("�������굤"))
    if current_YSDCount >= needYSDCount then
        MentalTip("�������굤��������")
        return
    end

    local missCount = needYSDCount - current_YSDCount
    if missCount <= 0 then
        -- �������˾��˳�����
        return
    end

    MentalTip(string.format("һ����Ҫ����%d���������굤", missCount))
    local needYBBindAmount = missCount * 20
    local roleHasYBBindAmount = tonumber(��ȡ������Ϣ(62))
    if roleHasYBBindAmount >= needYBBindAmount then
        -- ��ɫ��Ԫ�����㣬����ʣ���������굤
		MentalTip(string.format("��Ԫ������%d���������굤", missCount))
        BuyYanShouDanByYBBind(missCount)
        return
    else
        -- ��ɫ��Ԫ�����㣬��������������굤
        local buyYSDByYBBindCount = math.floor(roleHasYBBindAmount / 20)
		MentalTip(string.format("��Ԫ������%d���������굤", buyYSDByYBBindCount))
        BuyYanShouDanByYBBind(buyYSDByYBBindCount)
    end

    local current_YSDCount = tonumber(��ȡ������Ʒ����("�������굤"))
    local missCount = needYSDCount - current_YSDCount
    if missCount <= 0 then
        -- ���㱳�������굤�������������˾��˳�����
        return
    end

    local roleHongLiAmount = tonumber(��ȡ������Ϣ(55))
    local needHongLiAmount = missCount * 20
    if roleHongLiAmount >= needHongLiAmount then
        -- ��ɫ�������㣬����ʣ���������굤
		MentalTip(string.format("��������%d���������굤", missCount))
        BuyYanShouDanByHongLi(missCount)
    else
        -- ��ɫ�������㣬��������������굤
        local buyYSDByHongLiCount = math.floor(roleHongLiAmount / 20)
		MentalTip(string.format("��������%d���������굤", buyYSDByHongLiCount))
        BuyYanShouDanByHongLi(buyYSDByHongLiCount)
    end

    local current_YSDCount = tonumber(��ȡ������Ʒ����("�������굤"))
    local missCount = needYSDCount - current_YSDCount
    if missCount <= 0 then
        -- ���㱳�������굤�������������˾��˳�����
        return
    else
        MentalTip(string.format("��ǰ��Ȼȱ�١�%d�����������굤, ���ֶ�����", missCount))
    end

end

function Main()
    local rolePetCount = GetRolePetCount()
    local needYSDCount = GetNeedYanShouPetCount(rolePetCount)
    PrepareYanShouDan(tonumber(needYSDCount))
    PetYanShou(rolePetCount)
end

-- --------ִ��-------------
Main()