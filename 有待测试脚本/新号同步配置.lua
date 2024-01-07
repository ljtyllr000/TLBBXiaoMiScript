�����̽���ϻ��Ʒ�������� = ""
����΢���� = ''
����������Ԫ���� = ''
�첨��BOSS2�����ܿ��˻����� = ''
��Ҫ��ϴ������չ������������ = ''

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function StringSplit(str, reps)
    -- �ַ����и�
    local resultStrList = {}
    string.gsub(str, '[^' .. reps .. ']+',
            function(w)
                table.insert(resultStrList, w)
            end
    )
    return resultStrList
end

function WritePlayerConfiguration(section, keyName, value)
    local playerName = ��ȡ������Ϣ(12)
    local configPath = string.format("C:\\����С��\\��ɫ����\\%s.ini", playerName)
    if section ~= nil and keyName ~= nil and value ~= nil then
        MentalTip("д��ɫ������|" .. section .. "|" .. keyName .. "|" .. value);
        ��ʱ(200)
        д������(configPath, section, keyName, value);
        ��ʱ(200)
    end
end

function ReadPlayerConfiguration(section, keyName)
    local playerName = ��ȡ������Ϣ(12)
    local configPath = string.format("C:\\����С��\\��ɫ����\\%s.ini", playerName)
    local tem = ��������(configPath, section, keyName)
    if tem then
        MentalTip(section .. "|" .. keyName .. "==" .. tem);
        ��ʱ(500)
    else
        return 0
    end
    return tem
end

function BugZhanGongItem()
    -- ս���̵�
    local buyItems = ''

    local HXYLevel = LUA_ȡ����ֵ([[
		local ActionHXY = EnumAction(21,"equip")
		if ActionHXY and ActionHXY:GetID() ~= 0 then
			local nEquipLevel = DataPool:Lua_GetHXYLevel()
			return  nEquipLevel
		else
			return 0
		end
	]])

    if tonumber(HXYLevel) < 100 then
        if buyItems == '' then
            buyItems = buyItems .. '����ѫ��'
        else
            buyItems = buyItems .. '|����ѫ��'
        end
    end

    local effectFullLevel = true
    for i = 0, 6 do
        local effectLevel = LUA_ȡ����ֵ(string.format([[
            local effectIndex = %d
            local nIndex , iEffectLevel, iCost , iNeedHXYLevel , iValue = DataPool:Lua_GetHXYEffect( effectIndex )
            if nIndex ~= nil then
                return iEffectLevel
            end
            return -1
        ]], i))
        if tonumber(effectLevel) < 20 then
            effectFullLevel = false
            if buyItems == '' then
                buyItems = buyItems .. '��������'
            else
                buyItems = buyItems .. '|��������'
            end
            break
        end
    end

    if buyItems == '' then
        buyItems = buyItems .. '����|����¶'
    else
        buyItems = buyItems .. '|����|����¶'
    end

    WritePlayerConfiguration('����', 'ս����Ʒ', buyItems)
end

function GetInfantSkillMinLevel()
    local minLevel = LUA_ȡ����ֵ([[
        local minLevel = 9
        for i = 0, 3 do
            local nID, nLevel = Infant:GetInfantSkillInfo(0, i)
            if nID >= 0 then
                if tonumber(nLevel) < minLevel then
                    minLevel = tonumber(nLevel)
                end
            end
        end
        return minLevel
    ]])
    return tonumber(minLevel)
end

function GetInfantCardMinLevel()
    local minLevel = LUA_ȡ����ֵ([[
        local minLevel = 9
        for i = 0, 5 do
            local nCardYanDuLevel = Infant:GetInfantCardYanDuLevel(0, i)
            if tonumber(nCardYanDuLevel) < minLevel then
                minLevel = tonumber(nCardYanDuLevel)
            end
        end
        return minLevel
    ]])
    return tonumber(minLevel)
end

function GetWuHunGrow()
    local WHGrow = LUA_ȡ����ֵ([[
        local wuhution = EnumAction(18,"equip")
        local id  = wuhution:GetID();
        if id > 0 then
            return DataPool:GetKfsData("GROW")
        end
        return -1
    ]])
    return tonumber(WHGrow)
end

function GetLingPaiBaoZhuMinLevel()
    local tmp = LUA_ȡ����ֵ([[
	        local BaoZhuMinLevel = 50
			local nType,BaoZhu1,BaoZhu2,BaoZhu3,BaoZhu4,nQual = DataPool:GetLingPaiInfo()
			if nType> 0 then
			    if tonumber(BaoZhu1) < BaoZhuMinLevel then
			        BaoZhuMinLevel = tonumber(BaoZhu1)
                end

                if tonumber(BaoZhu2) < BaoZhuMinLevel then
			        BaoZhuMinLevel = tonumber(BaoZhu2)
			    end

                if tonumber(BaoZhu3) < BaoZhuMinLevel then
			        BaoZhuMinLevel = tonumber(BaoZhu3)
			    end

                if tonumber(BaoZhu4) < BaoZhuMinLevel then
			        BaoZhuMinLevel = tonumber(BaoZhu4)
			    end

			end
			return BaoZhuMinLevel
	]])
    return tonumber(tmp)
end

function GetWornLingPaiID()
    local wornLingPaiID = LUA_ȡ����ֵ(string.format([[
        return EnumAction(%d,"equip"):GetID()
    ]], 20))
    return tonumber(wornLingPaiID)
end

function DownAndGetLingPaiName()
    MentalTip("׼��ȡ������:")
    if GetWornLingPaiID() <= 0 then
        return -1
    end

    for k = 1, 5 do
        if �����Ƿ����("SelfEquip") == 1 then
            local LingPaiName = LUA_ȡ����ֵ(string.format([[
                local index = %d
                local theAction = EnumAction(index,"equip")
                if theAction then
                    local ID = theAction:GetID();
                    if tonumber( ID) > 0 then
                        local Name = EnumAction(index,"equip"):GetName()
                        return Name
                    end
                end
                return -1
            ]], 20))
            LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], 16))
            ��ʱ(2000)
            local wornLingPaiID = GetWornLingPaiID()
            if wornLingPaiID == 0 then
                ����_�жϹرմ���("SelfEquip")
                return LingPaiName
            end
        else
            LUA_Call("MainMenuBar_SelfEquip_Clicked();");
            ��ʱ(2000)
        end
    end
    return 0
end

function GetLingPaiStar()
    local LingPaiName = DownAndGetLingPaiName()
    local nStarLevel = 8
    if LingPaiName ~= nil and LingPaiName ~= 0 and LingPaiName ~= -1 then
        local LingPaiPos = ��ȡ������Ʒλ��(LingPaiName)
        nStarLevel = LUA_ȡ����ֵ(string.format([[
            local m_EquipBagIndex = %d
            local nStarLevel , nStarEffect , strSuccess , nMustSuccessTry ,nNextStarLevel , nNextStarEffect  = PlayerPackage:Lua_GetBagItemRl_StarInfo(m_EquipBagIndex)
            return nStarLevel
        ]], LingPaiPos - 1))
    elseif LingPaiName == -1 then
        nStarLevel = 1
    end
    return nStarLevel
end

function BuyBaiBaoGeItem()
    local playerName = ��ȡ������Ϣ(12)
    local buyItems = ''


    local LingPaiStar = GetLingPaiStar()
    if LingPaiStar < 8 then
        buyItems = buyItems .. '|����Һ'
    end

    if string.find(��Ҫ��ϴ������չ������������, playerName) then
        buyItems = buyItems .. '|��ľ�ʯ'
    end

    buyItems = buyItems .. '|3���޲�|3������'

    local infantSkillMinLevel = GetInfantSkillMinLevel()
    if infantSkillMinLevel < 9 then
        buyItems = buyItems .. '|������'
    end

    local infantCardMinLevel = GetInfantCardMinLevel()
    if infantCardMinLevel < 9 then
        buyItems = buyItems .. '|�伮ע��'
    end

    local LingPaiBZMinLevel = GetLingPaiBaoZhuMinLevel()
    if LingPaiBZMinLevel < 50 then
        buyItems = buyItems .. '����ľ����'
    end

    local WHGrow = GetWuHunGrow()
    if WHGrow < 887 then
        buyItems = buyItems .. '|������ʯ'
    end

    buyItems = buyItems .. '��Ԫ��|�ϸ�����|�û굤|��ҫʯ'

    if WHGrow >= 887 and WHGrow < 900 then
        buyItems = buyItems .. '|������ʯ'
    end

    buyItems = buyItems .. '|���ɰ'
    WritePlayerConfiguration('����', '�ٱ�����Ʒ', buyItems)
end

function SetXueJiPet()
    local XJPetName = LUA_ȡ����ֵ([[
        local needYSPetCount = 0
        local petCount = Pet:GetPet_Count()
        local XJPetInfo = ''
        local maxXJPetHP = 0
        local XJPetName = ''
        for petIndex=0, petCount do
            for petSkillIndex = 0, 1 do
                local theSkillAction = Pet:EnumPetSkill( petIndex, petSkillIndex, "petskill");
                if theSkillAction:GetID() ~= nil and theSkillAction:GetID() ~= 0 then
                    local petSkillName = theSkillAction:GetName()
                    local petHP = Pet: GetMaxHP(petIndex)
                    local petName = Pet:GetName(petIndex)
                    if string.find(petSkillName, "Ѫ��") then
                        if tonumber(petHP) > maxXJPetHP then
                            maxXJPetHP = tonumber(petHP)
                            XJPetName = petName
                        end
                    end
                end
            end
        end
        return XJPetName
    ]])

    WritePlayerConfiguration('����', 'Ѫ������', XJPetName)

end

function main()
    local playerName = ��ȡ������Ϣ(12)
    WritePlayerConfiguration('����', '�Զ���Ǯ', '1')
    WritePlayerConfiguration('����', '����Ѫ��', '90')
    WritePlayerConfiguration('����', '��������', '10')
    WritePlayerConfiguration('����', '����������', '1')
    WritePlayerConfiguration('����', '�߼���Ѫ', '1')
    WritePlayerConfiguration('����', '�����Ѫ', '1')
    WritePlayerConfiguration('����', '�ŶӼ�Ѫ', '1')
    WritePlayerConfiguration('����', '������μ�', '1')
    if string.find(�����̽���ϻ��Ʒ��������, playerName) then
        WritePlayerConfiguration('����', '�̽���ϻ������Ʒ', '�̽���ϻ������Ʒ=��|���˿|��Ԫ��')
    end
    WritePlayerConfiguration('����', 'F11����', '1')
    WritePlayerConfiguration('����', 'F12����', '1')
    WritePlayerConfiguration('����', '�Զ�����Ԫ', '1')
    WritePlayerConfiguration('����', '��ս�����ظ�', '1')
    WritePlayerConfiguration('����', '�����з���', '1')
    WritePlayerConfiguration('����', '��ȡõ��', '1')
    WritePlayerConfiguration('����', '��ȡ����', '1')
    WritePlayerConfiguration('����', '�����¯', '1')
    WritePlayerConfiguration('����', '���˿���', '1')
    WritePlayerConfiguration('����', '̫����Ը', '0')  -- TODO
    WritePlayerConfiguration('����', 'ÿ��ǩ��', '1')
    WritePlayerConfiguration('����', 'ǩ���콱', '1')
    WritePlayerConfiguration('����', '�������齬', '0')
    WritePlayerConfiguration('����', '�Ͻ�ս����', '0')
    WritePlayerConfiguration('����', '��ȡս��', '1')
    BugZhanGongItem()
    WritePlayerConfiguration('����', '���μ��콱', '1')
    WritePlayerConfiguration('����', 'ʦͽ������', '0')
    WritePlayerConfiguration('����', '�ٱ�����', '0')
    WritePlayerConfiguration('����', '����Ѫ������', '0')
    WritePlayerConfiguration('����', '�ٱ�����', '0')
    BuyBaiBaoGeItem()
    WritePlayerConfiguration('����', '�Զ�������', '1')
    WritePlayerConfiguration('����', '��ͼ����', '50')
    WritePlayerConfiguration('����', '��ͼ��Ѫ', '50')
    WritePlayerConfiguration('����', '������ֲ���', '0')
    SetXueJiPet()

    WritePlayerConfiguration('��������', '��NPC��Ʒ', '[��][��]����|[��]ɽ�����|[��]Ԫ��ͨ��|[��]Ԫ���ر�|[��]��Ծ���|[��]�Ƹ����|[��]��è���|[��]�踣���|[��]���Ϲ�����|[��]ǩ������|[��]����ɽ�ű�|ͨ�ü�����10��|�žɵ�Ǯ��|�򺣵�|������|���²���|���˽��|������10��|��������10��|������10��|������Ŧ|�����Ŧ')
    WritePlayerConfiguration('��������', '������', '[��]�����¶|�Ǹ�����ͼ|������|�嶾�顤Ԫ��|�嶾�顤����|�嶾�顤����|׺��ʯ��Ԫ|׺��ʯ����|׺��ʯ����|��ɷǿ������|ǧ������|��Ʒ������|�ٴ�����|���Һ|���캮��|������|��������|����Ѫ��|�伮��ҳ|�����|������м|����|����ʯ|������Ƭ|����ʯ')
    WritePlayerConfiguration('��������', 'ǿ������', '[��][��]��������|[��][��]�м�����|[��][��]�߼�����|[��][��]����Ƥë|[��][��]�м�Ƥë|[��][��]�߼�Ƥë|[��][��]�������|[��][��]��ҩ����|[��][��]�������|[��][��]���ղ���|[��][��]������|[��][��]�｣��|[��][��]������|[��][��]˫����|[��][��]����|[��][��]����|[��][��]ǹ����|[��][��]������|[��][��]����|[��][��]������|[��][��]ñ��|[��][��]����|[��][��]����|[��][��]����|[��][��]��ָ|[��][��]����|[��][��]�·�|[��][��]����|[��][��]����|[��][��]Ь|[��]������ʯ|[��]�����޲�|[��]������|[��]���޻�|[��]������|[��]���޼�|[��]����צ|[��]������|[��]������|[��]���в���|[��]���е���|�ͼ���ʯ������|ѩӵ���ء���Ѩ1��|�ὣ������֪1��|���꼼����|�߼��۶�|����ʯ1��|�߼�����|�߼�����|�߼���Ѫ|����ѩ�ؼ�����|���˫�����ʳ��|������צ��֪1��|�������ġ�֪1��|ǹ������ͼ6��|������|�㹽����ʳ��|��������������|�һ��似����|�����Ӱ��|���꼼����|��꼼����|���޼�����|����������|���ճ�ڡ�֪1��|������Ѩ�֡���1��|����Ѽ��ʳ��|����뷢��֪1��|һ��ƻ��|������⻢|��������ơ�֪1��|�г彣������1��|һ����ɢ������1��|�߼��鶯������|��������ʳ��|���鼼����|����ñͼ��|�߼�����|�ӳⷽ�١���1��|ѩ���צ����Ϣ1��|��ָ�񹦡�֪1��|����ͷ����1��|�߼�αװ������|���鸯ʬ����֪1��|�߼���ǽ������|�߼�����������|�����似����|Ѫ���似����|���׺䶥������|����ʯ|����ʯ��Ƭ|�����似����|˫�̴���ͼ6��|˫�̴���ͼ7��|����������|�߼�����������|�߼�����������|�߼��ͻ�������|��Ѩ|�߼����Ӽ�����|�߼�ʶ�Ƽ�����|�߼�����������|�߼�Ѫ��������|�߼��ͽ�|��ǽ������|���г�ʳ��|���Ҽ���ʳ��|�߼���������|�߼�����������|ʹ��������|�߼�����������|�߼���������|�߼���ŭ������|�߼����ļ�����|�߼�˲Ӱ������|�߼���������|�߼�ǿ������|�߼���Ѫ������|ʶ�Ƽ�����|����������|�߼��ƻ꼼����|����������|���ƿ�ͼ��|�ͼ�������|��İʥѥͼ��|���������ʳ��|����ʯ5��|����ָ·��֪1��|��������ͼ��|�����ͼ��|����Ƿ�ʳ��|��İʥ��ͼ��|����ţ����ʳ��|����ʥ��ͼ��|����|ǹ������ͼ4��|����ʯ7��|�����|�ȴ���ͼ7��|�μ���ʳ��|�߼�����|������|����|ɽ������ʳ��|����ħ��ͼ��|��İʥ��ͼ��|����|�߼�����|����ʯ6��|����ħ��ͼ��|����ʥѥͼ��|�߼�ˤ��|ľ������Ƭʳ��|���̴���ͼ4��|Ѫ��������|��ը����ʳ��|����ʥ��ͼ��|˫�̴���ͼ2��|�ǺӺ�������1��|��������ͼ7��|������Եͼ��|���ͼ��ʳ��|������������ͼ��|������������ͼ��|��������ͼ��|Ҫ���������޹�|����ͼ��|��������Ϧ����|�۶�|��Ϧ����ͼ��|��������ͼ4��|��ī����ͼ��|�ƽ�ս��ͼ��|���꼼����|ǹ������ͼ7��|ˤ��|���Ӽ�����|��ҹ�ٺ�ͼ��|�߼�����������|����˿ʳ��|ˮѼ�����ʳ��|��������ͼ6��|˫�̴���ͼ4��|��������ͼ5��|����|����ʯ|˫�̴���ͼ3��|������ͼ3��|����|��Ѫ|���̴���ͼ5��|�ȴ���ͼ6��|����ͼ��|��������ͼ��|��׼|�ٱ����⣺���ӱ�|������ͼ6��|�ȴ���ͼ2��|����|δ��ͼ��|��Ԫ|��ŭ������|���Ƽ�����|����ʥ��ͼ��|�����ͼ��|������ͼ5��|˫�̴���ͼ5��|����ʥ��ͼ��|������ʯ�Ұ�|˲Ӱ������|�鶯������|����|����|����������|������|��������|��������|����������|ǹ������ͼ2��|����֮��|ƴ��������|��Ԩͼ��|ն��ͼ��|�ȴ���ͼ5��|��ѩͼ��|����������|�߼���ʯ������|�����|��������|Ѫɫս��ͼ��|���ͼ��|�߼����Ƽ�����|�ͽ�|��ľ��|����������|�������ͼ��|Ů���Ϸ�ͼ��|����ͼ��|��Ѫ������|�����ָͼ��|���̴���ͼ6��|���̴���ͼ3��|�ȴ���ͼ3��|�ƻ�������|��������ͼ2��|����ͼ��|�ͻ�������|Ѫ��������|�ٴ�����|�ٶۼ�����|���̴���ͼ7��|���ļ�����|����|ǹ������ͼ5��|������ͼ2��|������������ͼ��|ǿ������|��սͼ��|����|����ħ��ͼ��|������Ұ��Ů��|��İʥ��ͼ��|��Ŀ|�·�����ͼ7��|ñ�Ӵ���ͼ7��|�������ͼ7��|Ь�Ӵ���ͼ7��|��������ͼ7��|��ָ����ͼ7��|��������ͼ7��|��������ͼ7��|�������ͼ7��|���״���ͼ7��|�·�����ͼ6��|ñ�Ӵ���ͼ6��|�������ͼ6��|Ь�Ӵ���ͼ6��|��������ͼ6��|��ָ����ͼ6��|��������ͼ6��|��������ͼ6��|�������ͼ6��|���״���ͼ6��|�·�����ͼ5��|ñ�Ӵ���ͼ5��|�������ͼ5��|Ь�Ӵ���ͼ5��|��������ͼ5��|��ָ����ͼ5��|��������ͼ5��|��������ͼ5��|�������ͼ5��|���״���ͼ5��|�·�����ͼ4��|ñ�Ӵ���ͼ4��|�������ͼ4��|Ь�Ӵ���ͼ4��|��������ͼ4��|��ָ����ͼ4��|��������ͼ4��|��������ͼ4��|�������ͼ4��|���״���ͼ4��|�·�����ͼ3��|ñ�Ӵ���ͼ3��|�������ͼ3��|Ь�Ӵ���ͼ3��|��������ͼ3��|��ָ����ͼ3��|��������ͼ3��|��������ͼ3��|�������ͼ3��|���״���ͼ3��|�·�����ͼ2��|ñ�Ӵ���ͼ2��|�������ͼ2��|Ь�Ӵ���ͼ2��|��������ͼ2��|��ָ����ͼ2��|��������ͼ2��|��������ͼ2��|�������ͼ2��|���״���ͼ2��|�·�����ͼ1��|ñ�Ӵ���ͼ1��|�������ͼ1��|Ь�Ӵ���ͼ1��|��������ͼ1��|��ָ����ͼ1��|��������ͼ1��|��������ͼ1��|�������ͼ1��|���״���ͼ1��|������|������ɢ����|�ƻ꼼����|����|αװ������|����������|������|������|ɳ��������|������|���Ǹ�|��¶��|�ٹ�������|��ĵ��|���޻û�����Ƭ|�����ٺ���|�̶���|֥���|��Ǯ|��ɫ����|������|�����|����|���ĵ�|��������|����������ͼ��|�۾���|������|����|޽��|�����|���Ƹ�|Ы��|��Ѫɢ|��Ѫɢ|����ɢ|�ٻ���|��ҩ|����ɢ|�ɵ�����|�ɵ�����|�ɵ�����|����飨1����|����|֩��|����|���|���|��Ҷ����Ƭ|�����|��Ϭ��|����|�˽�|����ʯ|�㹽�˰�|�Ž��̷�|���|Ŵ�׸�|������|������|�����ָ|�����Ƭ����|�����|������м|������|��ϼ��¶|�����¶|ҹ�Ɑ|���ϸ�|������ʯ|�Ĳ�|�ľ��|ǧ������|�ȴ���ͼ4��|ǹ������ͼ3��|������Сʯ��|�������Ի���|������������|���޵���Ӣ��|���޵����飨1����|��������|Ҫ���������|�ٱ����⣺Ľ�ݸ�|�ٱ����⣺������|�ٱ����⣺���к�|������ͼ4��|�������|����������|���޻��յ�|�����Ƭ����|ף��ë��|����������|���ݵ�������|������������|������ͼ7��|��������ͼ3��|��ҩ��������|�۽��|Ⱦ��3��|���̴���ͼ10��|������|���̴���ͼ2��|ȫ���й�Ҫ��|����ܰ|˿��3��|����ʯ|��ʯ������1��|���|�ȴ���ͼ10��|˫�̴���ͼ10��|������ͼ10��|��������ͼ10��|��ţ��|���ݵ���ѩ��|ǹ������ͼ10��|ˮ������|����ʯ4��|�ڰ�����|������|¹�׵�|���߻���|��Ƥ|��������|���|�����鱨|����ͷ|������|ˮ������|���޵�|�絤|������|���ٸ�|�ֵ���|�����|��ɮ��|������|��˿��|��ɥ��|���ᵶ|���ƽ�|��ü��|������|һέ�ɽ�|���Ϸ�|ˮ��Ư|��ͭ��|��ͭ��|������|������|������|������|������|������|̫�泤ȭ|��ɽ��÷��|������|��Ůȭ��|ϡ���䱦ͼ|������|�պ��㶹��|��˹����|��ޢ��|����ʯ|������')
    WritePlayerConfiguration('��������', '������', '[��][��]������|[��][��]������|[��][��]��������|ɽ�����|�žɵ�Ǯ��|���˽��|��ʾ�ʯ|����ľ�Ƭ|�ؼ���ҳ|���Ϲ�����|��������ҩ|������Ŧ|�����Ŧ|������')
    WritePlayerConfiguration('��������', '�������', '������ٵ�|��ç���7��|������ʯ|3����ʯ��Ƭ�һ�ȯ|����¶|�ͼ���ʯ�ϳɷ�')
    WritePlayerConfiguration('��������', '���ȡ��', '[��]���в���|[��]���е���|[��]�ľ�����|����ʯ|����ʯ��Ƭ|��̫�����˹����|��ֽ|����Һ|����ľ�|�����ȷ�ӡ|��Ʒ������|�嶾�顤Ԫ��|�嶾�顤����|�嶾�顤����|���Ϲ�ϻ����Ʒ|�����˹����|��ɽ��|�ؽ�ȯ|���Ϲ�����|��������10��|������10��|������10��')
    WritePlayerConfiguration('��������', 'ʹ����Ʒ', 'ѩ֥ҩɢ|�������Ļ���|�����ź�|���·�ս���|�����������ţ|100��Ԫ��|200��Ԫ��')

    WritePlayerConfiguration('���', '���������', '6')
    WritePlayerConfiguration('���', '�������', '6')
    WritePlayerConfiguration('���', '�������', '6')
    WritePlayerConfiguration('���', '����ɽ���', '6')
    WritePlayerConfiguration('���', '��翷����', '6')
    WritePlayerConfiguration('���', '���������', '6')
    WritePlayerConfiguration('���', '�ľ����', '6')
    WritePlayerConfiguration('���', 'ˢ�����', '6')
    WritePlayerConfiguration('���', '�ŋָ���', '6')
    WritePlayerConfiguration('���', '�������', '6')
    WritePlayerConfiguration('���', '��ɽ��', '6')
    WritePlayerConfiguration('���', '��ʥ���', '12')
    WritePlayerConfiguration('���', '�첨�����', '12')

    WritePlayerConfiguration('����', '���շѴ���', '1')

    WritePlayerConfiguration('����', 'ģʽ����', '�ľ�ׯ|������|����(��)|��翷�|�����þ�')
    WritePlayerConfiguration('������', '���Ⱥ', '0')
    WritePlayerConfiguration('������', '�����ȴ�', '1')
    WritePlayerConfiguration('��翷�', '��λģʽ', '2')
    WritePlayerConfiguration('��翷�', '�Զ�����', '0')
    WritePlayerConfiguration('����þ�', '�ȴ��Ȼ�', '1')
    WritePlayerConfiguration('�ľ�ׯ', '�ȴ��Ȼ�', '1')

    WritePlayerConfiguration('�ճ�', '�������', '1')
    WritePlayerConfiguration('�ճ�', '����Ծ���', '1')
    WritePlayerConfiguration('�ճ�', '��������', '��������')
    WritePlayerConfiguration('�ճ�', '������֮Լ', '1')
    if string.find(����΢����, playerName) then
        WritePlayerConfiguration('�ճ�', '����ޱ����', '1')
    end
    WritePlayerConfiguration('�ճ�', '�һ�����ֵ', '0')
    WritePlayerConfiguration('�ճ�', '��������', '0')
    if string.find(����������Ԫ����, playerName) then
        WritePlayerConfiguration('�ճ�', '��������Ʒ', '�����|�������޻�ͯ����|�ϸ�����|��ɫ��Ԫ����')
    else
        WritePlayerConfiguration('�ճ�', '��������Ʒ', '�����|�������޻�ͯ����|�ϸ�����')
    end
    WritePlayerConfiguration('�ճ�', '���ƽ�����', '0')
    WritePlayerConfiguration('�ճ�', '���ƽ���Ʒ', '������ٵ�')
    WritePlayerConfiguration('�ճ�', '�����������', '������')
    WritePlayerConfiguration('�ճ�', '��¥�ͻ�', '0')

    WritePlayerConfiguration('ˢ��', '���շѴ���', '1')
    WritePlayerConfiguration('ˢ��', '��λ�س�', '1')
    WritePlayerConfiguration('ˢ��', 'ֻ������', '1')
    WritePlayerConfiguration('ˢ��', '�س����', '1')
    WritePlayerConfiguration('ˢ��', '�˳�����', '1')
    WritePlayerConfiguration('ˢ��', '�Զ����', '0')
    WritePlayerConfiguration('ˢ��', '��������', '0')
    WritePlayerConfiguration('ˢ��', '�Զ�����', '0')
    WritePlayerConfiguration('ˢ��', '�ȴ���Աʱ��', '20')
    WritePlayerConfiguration('ˢ��', 'ʧЧʱ��', '2')
    WritePlayerConfiguration('ˢ��', '�Ȱ���ʱ', '2')
    WritePlayerConfiguration('ˢ��', '����ɱ��Ѫ', '1')

    WritePlayerConfiguration('��ͼ��ͼ', '������λ', '1')
    WritePlayerConfiguration('��ͼ��ͼ', '��λ�س�', '1')

    WritePlayerConfiguration('�ٻ�Ե', '������', '20')

    WritePlayerConfiguration('����', '���״�ͼ����', '50')

    WritePlayerConfiguration('��������', '����NPC', '')
    WritePlayerConfiguration('��������', '���X', '182')
    WritePlayerConfiguration('��������', '���Y', '156')

    WritePlayerConfiguration('ѰӰ����', '����', '���転������*103*84|�����򻤽���*107*31|���谲Զ����*183*39|���ɵ��׻�Ӣ��*72*43|���ɵĲ����˾*77*124|���ɵ�����ս��*203*212|���ɵ������*47*47|���ɵĳ��ױ�*60*51|���ɵ��ϻ���*188*83|���ɵľ���з*160*96|���ɵ�������*212*53|���ɵ�ͨ���ҹ�*122*193|���ɵĺ������*129*150|���ɵİ�����*208*168')

    WritePlayerConfiguration('���ƾ�����', '�Լ��Ⱦ�', '1')
    WritePlayerConfiguration('���ƾ�����', '�������', '1')
    WritePlayerConfiguration('���ƾ�����', 'ʱ��', '3')

    -- TODO
    WritePlayerConfiguration('�Զ�����', '������Ʒ', '���ʾ�|����|Ҷ����|Ͳ�и�|����|����ɢ|������|���۵�|����ɢ|���޻�ͯ����|����ɢ|����|�����|����ɢ|�·�����ͼ10��|ñ�Ӵ���ͼ10��|�������ͼ10��|Ь�Ӵ���ͼ10��|��������ͼ10��|��ָ����ͼ10��|��������ͼ10��|��������ͼ10��|�������ͼ10��|���״���ͼ10��|�̾�ʯ(1��)|�쾧ʯ(1��)|����ʯ(1��)|�ƾ�ʯ(1��)|�챦ʯ(1��)|�̱�ʯ(1��)|�Ʊ�ʯ(1��)|�ڱ�ʯ(1��)|����ʯ(1��)|��ʯ(1��)|����ʯ(1��)|è��ʯ(1��)|��ĸ��(1��)|�ʯ(1��)|����(1��)|����(1��)|����(1��)|�¹�ʯ(1��)|ʯ��ʯ(1��)|�⾧ʯ(1��)|����|�߼����޻�ͯ����|����֮��|���ʶ�Ƥ|�춹��|һƷ��|��ֽ��|������Բ|������Ƭ|��ϲ����|�����ѱ�|������|��������|����ʯ|��ľ��|�嶾�顤Ԫ��|�嶾�顤����|�嶾�顤����|���齬|����|����|�۶�|����|��׼|����|�߼�����|�߼�����|�߼��۶�|�߼�����|�߼���׼|�߼�����|����������|�߼�����������|�߼�ʹ��������|Ѫ�����＼����|�һ���ԭ������|���޼�����|���꼼����|����ѩ�ؼ�����|���׺䶥������|�����似����|�һ��似����|Ѫ���似����|�����似����|���鼼����|����������|���꼼����|���Ƽ�����|�߼�Ѫ��������|����������|����������|����ˮ|����Ѫ��|�޲���Ƭ|������Ƭ|������Ƭ|��Ѫ|�ͼ���ʯ�ϳɷ�|�ʺ�֮��|����֮��|����|׺��ʯ��Ԫ|׺��ʯ����|׺��ʯ����|�������|�߼���Ѫ|����ӡ��������ͼ��|�ͼ�������|��ɷǿ������|Ҫ���������n��|Ҫ���������|��ç���2��|�߼�Ѫ��������|�߼����Ӽ�����|�߼���ǽ������|������ɽ����1��|������ɡ�����1��|���Ǿ��ס�����1��|Ϫɽ���á���׼1��|Ҫ��������������|׺����ʯ|Ҫ�����ɷ����|Ҫ�����������|����ͼ����Ϣ1��|ͬ����������1��|Ϫɽ���á�����1��|������ɽ��ä1��|��Ȼһ������1��|�Ͻ�ʯ|Ԫ��Ʊ')
    WritePlayerConfiguration('�Զ�����', '���ܵ�ͼ', '����')
    WritePlayerConfiguration('�Զ�����', '����X', '211')
    WritePlayerConfiguration('�Զ�����', '����Y', '288')
    WritePlayerConfiguration('�Զ�����', '�ϰ��ͼ', '����')
    WritePlayerConfiguration('�Զ�����', '�ϰ�X', '211')
    WritePlayerConfiguration('�Զ�����', '�ϰ�Y', '288')
    WritePlayerConfiguration('�Զ�����', '�ϰ�����', 'ӣ�q��СȾ')  -- TODO
    WritePlayerConfiguration('�Զ�����', '������', '5')
    WritePlayerConfiguration('�Զ�����', '����Ԫ��', '0')
    WritePlayerConfiguration('�Զ�����', '��ɵ�ͼ', '����')
    WritePlayerConfiguration('�Զ�����', '���X', '211')
    WritePlayerConfiguration('�Զ�����', '���Y', '288')
    WritePlayerConfiguration('�Զ�����', '����ʧ��', '�ȴ�����')
    WritePlayerConfiguration('�Զ�����', '������ʱ', '9999')
    WritePlayerConfiguration('�Զ�����', '����������', '�Զ����')
    WritePlayerConfiguration('�Զ�����', '����������', '�Զ����')
    WritePlayerConfiguration('�Զ�����', '�ȴ�ʱ��', '30')
    WritePlayerConfiguration('�Զ�����', '�ȴ���ʱ', '�����ȴ�')
    WritePlayerConfiguration('�Զ�����', '���ͼ��', '20��')

    WritePlayerConfiguration('�Զ�����', '��³��', '��������ͼ10��|��ָ����ͼ10��')
    WritePlayerConfiguration('�Զ�����', '�����', '����|�쾧ʯ|����ʯ|�ƾ�ʯ|�̾�ʯ|����ʯ|��ʯ|è��ʯ')
    WritePlayerConfiguration('�Զ�����', '�쳬��', '�챦ʯ|�ƾ�ʯ|����ʯ|�쾧ʯ|�̾�ʯ|����ʯ|�̱�ʯ|����|��ĸ��|����|�ʯ|�¹�ʯ|����|è��ʯ|����ʯ|�Ʊ�ʯ|��ʯ|ʯ��ʯ|�⾧ʯ|�ڱ�ʯ')
    WritePlayerConfiguration('�Զ�����', '������', '�챦ʯ|�ƾ�ʯ|����ʯ|�쾧ʯ|�̾�ʯ|����ʯ|�̱�ʯ|����|��ĸ��|����|�ʯ|�¹�ʯ|����|è��ʯ|����ʯ|�Ʊ�ʯ|��ʯ|ʯ��ʯ|�⾧ʯ|�ڱ�ʯ')
    WritePlayerConfiguration('�Զ�����', '�ɷ���', '�챦ʯ|�̱�ʯ|��ĸ��|����|�ʯ|�¹�ʯ|����|è��ʯ|����ʯ|�Ʊ�ʯ|��ʯ|ʯ��ʯ|�⾧ʯ|�ڱ�ʯ')
    WritePlayerConfiguration('�Զ�����', '������', '�챦ʯ|�ƾ�ʯ|����ʯ|�쾧ʯ|�̾�ʯ|����ʯ|�̱�ʯ|����|��ĸ��|����|�ʯ|�¹�ʯ|����|è��ʯ|����ʯ|�Ʊ�ʯ|��ʯ|ʯ��ʯ|�⾧ʯ|�ڱ�ʯ')
    WritePlayerConfiguration('�Զ�����', '����ʩ', '��������ͼ10��|��ָ����ͼ10��')
    WritePlayerConfiguration('�Զ�����', '�������', '110')

    WritePlayerConfiguration('��ʥ', '��Ѫ�ȴ�', '0')
    WritePlayerConfiguration('��ʥ', '������������', '0')
    WritePlayerConfiguration('��ʥ', 'ǿ��BOSS', '0')
    WritePlayerConfiguration('��ʥ', '�ȴ�Ѫ�����ڿ���', '0')
    WritePlayerConfiguration('��ʥ', '����ģʽ', '1')
    WritePlayerConfiguration('��ʥ', 'ʯ��ģʽ', '1')
    WritePlayerConfiguration('��ʥ', '�����Ŷ�', '0')
    WritePlayerConfiguration('��ʥ', 'վλģʽ', '1')
    WritePlayerConfiguration('��ʥ', '���ȴ�ʯ��', '1')

    WritePlayerConfiguration('����ɽ', 'Ľ�ݲ�״̬', '4')

    WritePlayerConfiguration('��λ����', '������λ', '1')
    WritePlayerConfiguration('��λ����', '��������', '3')
    WritePlayerConfiguration('��λ����', '��ֽ��', '0')
    WritePlayerConfiguration('��λ����', '��ֽ��', '0')
    WritePlayerConfiguration('��λ����', '��ֽͭ', '0')
    WritePlayerConfiguration('��λ����', '����λ', '')

    WritePlayerConfiguration('���', '��λ��ʽ', '����ӳ��ų�')
    WritePlayerConfiguration('���', '���淶Χ', '2')
    WritePlayerConfiguration('���', '��������', '1')
    WritePlayerConfiguration('���', '��ʱ��λ', '1')
    WritePlayerConfiguration('���', '��������', '1')
    WritePlayerConfiguration('���', '��ͼ����', '1')
    WritePlayerConfiguration('���', '����Ŀ��', '1*0|2*0|3*0|4*0|5*0')
    WritePlayerConfiguration('���', '����˳��', '1*0|2*0|3*0')
    WritePlayerConfiguration('���', '�����ȴ�', '0')
    WritePlayerConfiguration('���', 'У������', '1')
    WritePlayerConfiguration('���', '���ظ�', '������')
    WritePlayerConfiguration('���', '�Զ��������', '1')
    WritePlayerConfiguration('���', 'Ѫ������', '70')

    WritePlayerConfiguration('���״��', '��������', '�ִ�|ǧ�����|����|�޵з���è|�������|������|����ʮ��|����|Ԭ����|����|���|����|������|���|��ڤ��|ڤ��ū|���繷|�����|ľͰ��|��Ѫ����|��������|˪Ӱ|��צаӥ|���Ĺ�|˹��|�Ϻ��콭С��|�����콭С��|�����콭С��|�����콭С��|�콭��|ç������')
    WritePlayerConfiguration('���״��', '���ģʽ', '1')
    WritePlayerConfiguration('���״��', '����ӳ�', '1')
    WritePlayerConfiguration('���״��', '�����鶨λ', '1')
    WritePlayerConfiguration('���״��', '������ص�', '1')
    WritePlayerConfiguration('���״��', '�������', '1')
    WritePlayerConfiguration('���״��', '����������', '0')

    WritePlayerConfiguration('ҹ̽�첨��', 'BOSS1����վλ', '0')
    WritePlayerConfiguration('ҹ̽�첨��', 'BOSS2������ֱײ', '0')
    WritePlayerConfiguration('ҹ̽�첨��', 'BOSS2����ŭ��Ϯɳ', '0')
    if string.find(�첨��BOSS2�����ܿ��˻�����, playerName) then
        WritePlayerConfiguration('ҹ̽�첨��', 'BOSS2�����ܿ��˻�', '1')
    else
        WritePlayerConfiguration('ҹ̽�첨��', 'BOSS2�����ܿ��˻�', '0')
    end
    WritePlayerConfiguration('ҹ̽�첨��', 'BOSS4��ɢվλ', '1')
    WritePlayerConfiguration('ҹ̽�첨��', '�ȴ��Ȼ�', '1')

    WritePlayerConfiguration('�����', '��������', '0')
    WritePlayerConfiguration('�����', '��������', '8')
    WritePlayerConfiguration('�����', '��ֵ�ͼ', '1')
    WritePlayerConfiguration('�����', 'ѩ������', '0')
    WritePlayerConfiguration('�����', '�綾����', '0')
    WritePlayerConfiguration('�����', '���ױ���', '0')
    WritePlayerConfiguration('�����', '����ڻ�', '0')
    WritePlayerConfiguration('�����', '�ȴ����ϼ�Ѫ��״̬', '1')

    WritePlayerConfiguration('�ľ�����', '�ľ�', '׼�ǡ���|��������|���š���|Ͷ�ס���|���|���ġ���|��������|��������|��������|�˻�|����|ǲ������|ǲ������|ǲ������|ǲ������|���š���|���š���|���š���|Ͷ�ס���|Ͷ�ס���|Ͷ�ס���|���ġ���|���ġ���|���ġ���|���ġ���|�Ľ�����|�Ľ�����|�Ľ�����|�Ľ�����|���顤��|���顤��|���顤��|���顤��|����|����|����|��Х|����|��Ȼ|����|��ľ|�ݶ�|�ϻ�|����|ӿȪ|��м|����|����|����|����|��ȸ|ֹ��|����|����|�۽�|��ñ|ӽ��|����|�߲�|����|�Ǵ�|�ɽ�|���|���ġ���|���ġ���|���ġ���|��ǡ���|��ǡ���|��ǡ���|��ǡ���|��ǧ����|��ǧ����|��ǧ����|��ǧ����|���ۡ���|���ۡ���|���ۡ���|���ۡ���|���|���ġ���|���ġ���|���ġ���|���ġ���|���ˡ���|���ˡ���|���ˡ���|���ˡ���|׼�ǡ���|׼�ǡ���|׼�ǡ���|����|��ˮ|����|����|��Ļ|����|�ֽ�|��ζ')
    WritePlayerConfiguration('�ؼ�����', '�ؼ�', '�ؼ�=�һ�����|�������|�����м�|����ǧ��|�ض��ݻ�|Ͷ������|��֮��|Խ������|�������|�ٶ��ع�|��������|���ع³�|��ͱ���|��Դ����|���罭��|���ؼ汸|��Ѫ�龭|ֱ������|��ˮ����|ͼ��ذ��|�׶�Ϊ��|���߱���|�����Ὥ|����֮��|��Ԩ�ı�|�ļ�˼��|������ҩ|�Ѿ�����|ҩʯ֮��|����һ��|�����ﺮ|��������|�ƽ���̨|�����ƶ�|���׻���|������|��������|��ɽ����|��ѩ����|������ǰ|κ��ֵ�|��������|����һŭ|��������|���׻���|�������')

    WritePlayerConfiguration('�����Զ�״̬', '��ͼ', '����')
    WritePlayerConfiguration('�����Զ�״̬', 'X', '185')
    WritePlayerConfiguration('�����Զ�״̬', 'Y', '336')
    WritePlayerConfiguration('�����Զ�״̬', '�ȴ�ʱ��', '3')

end

-- main ------------------------------------------------------------------------------------
main()