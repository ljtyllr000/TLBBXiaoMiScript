������ʾ = 1
�������8�� = 1  --�����������8�����¶���8��

-- -------------------------------------------------------------------------
���������б� = "���������|��ˮ�޺۽�|�̺����λ�|������а��|����ҫ����|����ŪӰ��|������Ԩ��|���������|������Ӱ��|������Ƶ�|ն�Ƕϳ�ǹ|ת�����ǹ�|�����޺۽�|����������|���������|������Ӱ��|��������ǹ|�����а��|�����¶���|���ƾ��ջ�|����ֻع�|��ת��Ȫ��|�����Ӱ��|���������|����������|������ȸ|���̳�Ӱ|�����ҹ|���ط���|�󺺺��|����Ǻ�|������˪|��������|���ξ��|��������|��������|��������|�������|��Ħһ̾|�������|��������|̫��Ʈ��|��������|ĩ����Ȩ|���쳤��|������Ȫ|��Ӱ����"

װ�����ּ��� = "�������|������|��İʥ��|����ħ��|����|����|����ʥ��|����ʥѥ|����ħ��|����ħ��|��������|����ʥ��|��ˮ����|��ˮ���|��ˮ��ѥ|��ˮ����|��ˮ����|��ˮ��ѥ|��ѩ|����|����|˪��|����|��ĺ|÷����|������|������|����|÷����|�ϻ���|��İʥ��|����|���|������|��������|��������|�Ắ|����|���|ǳ��|��ĺ|����|�Ắ|��ѩ|�ϻ���"

װ�����ּ��� = ���������б� .. "|" .. װ�����ּ���

װ���ؼ��ּ��� = "����ӡ"

ȡ����Ʒ("���", 20000000)
ȡ����Ʒ("3����ʯ�һ�ȯ|��ʯ������3��|��ʯ��Ƕ��|�챦ʯ(3��)|����֮��|����֮��|�����̾�ʯ(3��)|�����쾧ʯ(3��)|�����ƾ�ʯ(3��)|�����̾�ʯ(3��)|��������ʯ(3��)|��������(3��)|�����ʯ(3��)|�����¹�ʯ(3��)|��������(3��)|��������ʯ(3��)|��ĸ��(3��)|����(3��)|")

��ײ������� = {
    [1] = { name = "ţ��", YBpirce = 8, JINpirce = 10 * 10000, equipName = "" },
    [2] = { name = "���", YBpirce = 16, JINpirce = 10 * 10000, equipName = "" },
    [3] = { name = "��ţ��", YBpirce = 24, JINpirce = 10 * 10000, equipName = "" },
    [4] = { name = "�����", YBpirce = 32, JINpirce = 10 * 10000, equipName = "" },
    [5] = { name = "��Ϭ��", YBpirce = 40, JINpirce = 10 * 10000, equipName = "" },
    [6] = { name = "������", YBpirce = 48, JINpirce = 30 * 10000, equipName = "" },
    [7] = { name = "����֮��", YBpirce = 56, JINpirce = 30 * 10000, equipName = "" },
    [8] = { name = "����֮��", YBpirce = 64, JINpirce = 30 * 10000, equipName = "" },
    [9] = { name = "����֮��", YBpirce = 72, JINpirce = 500 * 10000, equipName = "" },
    [10] = { name = "�ʺ�֮��", YBpirce = 80, JINpirce = 400 * 10000, equipName = "" },
    [11] = { name = "��ˮ֮��", YBpirce = 100, JINpirce = 300 * 10000, equipName = "" },
    [11] = { name = "����ɼ�", YBpirce = 120, JINpirce = 300 * 10000, equipName = "" },
    [12] = { name = "���񾫴�", YBpirce = 120, JINpirce = 40 * 10000, equipName = "" },

}

--------------------------------------------------װ�����------------------------------------------------
local SelfEuipList = {
    [1] = { name = "����", downIndex = 11, equipIndex = 0, equipName = "",
            gem = {
                { "�챦ʯ(4��)", "�챦ʯ������(4��)", "�챦ʯ(3��)", "�챦ʯ������(3��)" },
                { "" },
                { "����&��ʯ(4��)", "����&��ʯ������(4��)", "����&��ʯ(3��)", "����&��ʯ������(3��)" },
                { "����&��ʯ(4��)", "����&��ʯ������(4��)", "����&��ʯ(3��)", "����&��ʯ������(3��)" },
            }
    }, --- ����
    [2] = { name = "����", downIndex = 3, equipIndex = 14, equipName = "" }, --- ����
    [3] = { name = "��ָ��", downIndex = 7, equipIndex = 6, equipName = "" }, --- ��ָ���ϣ�
    [4] = { name = "��ָ��", downIndex = 8, equipIndex = 11, equipName = "" }, --- ��ָ���£�
    [5] = { name = "������", downIndex = 9, equipIndex = 12, equipName = "" }, --- �������ϣ�
    [6] = { name = "������", downIndex = 10, equipIndex = 13, equipName = "" }, --- �������£�
    [7] = { name = "�·�", downIndex = 12, equipIndex = 2, equipName = "" }, --- �·�
    [8] = { name = "ñ��", downIndex = 1, equipIndex = 1, equipName = "" }, --- ñ��
    [9] = { name = "����", downIndex = 2, equipIndex = 15, equipName = "" }, --- ���
    [10] = { name = "����", downIndex = 4, equipIndex = 3, equipName = "" }, --- ����
    [11] = { name = "����", downIndex = 5, equipIndex = 5, equipName = "" }, --- ����
    [12] = { name = "Ь��", downIndex = 6, equipIndex = 4, equipName = "" }, --- Ь��
    [13] = { name = "����", downIndex = 13, equipIndex = 7, equipName = "" }, --- ����
    [14] = { name = "����", downIndex = 14, equipIndex = 17, equipName = "",
             gem = {
                 { "�챦ʯ(4��)", "�챦ʯ������(4��)", "�챦ʯ(3��)", "�챦ʯ������(3��)" },
                 { "" },
                 { "����&��ʯ(4��)", "����&��ʯ������(4��)", "����&��ʯ(3��)", "����&��ʯ������(3��)" },
                 { "����&��ʯ(4��)", "����&��ʯ������(4��)", "����&��ʯ(3��)", "����&��ʯ������(3��)" },
             }
    }, --- ����
    [15] = { name = "����", downIndex = 25, equipIndex = 19, equipName = "", gem = { ������ʯ, ���Ա�ʯ, ���Ա�ʯ, ���Ա�ʯ }, },
    [16] = { name = "���", downIndex = "", equipIndex = 18, equipName = "" }, --- ���
    [17] = { name = "����", downIndex = 16, equipIndex = 20, equipName = "" }, --- ����
    [18] = { name = "����ӡ", downIndex = "", equipIndex = 21, equipName = "",
             gem = {
                 { "�챦ʯ(4��)", "�챦ʯ������(4��)", "�챦ʯ(3��)", "�챦ʯ������(3��)" },
                 { "" },
                 { "����&��ʯ(4��)", "����&��ʯ������(4��)", "����&��ʯ(3��)", "����&��ʯ������(3��)" },
                 { "����&��ʯ(4��)", "����&��ʯ������(4��)", "����&��ʯ(3��)", "����&��ʯ������(3��)" },
             }
    }, --- ����
    [19] = { name = "��Ʒ��", downIndex = "", equipIndex = 9, equipName = "" }, --- ����
    [20] = { name = "���ϰ�", downIndex = "", equipIndex = 10, equipName = "" }, --- ����
}

-- ͨ�ú��� ---------------------------------------------------------------------------------------------------
function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
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

function �жϹرմ���(strWindowName)
    if �����Ƿ����(strWindowName) == 1 then
        LUA_Call(string.format([[
			setmetatable(_G, {__index = %s_Env}) this:Hide()
		]], strWindowName))
        ��ʱ(1500)
    end
end

function д��ɫ������(AAA, BBB, CCC)
    local ���� = ��ȡ������Ϣ(12)
    local ·�� = string.format("C:\\����С��\\��ɫ����\\%s.ini", ����)
    if AAA ~= nil and BBB ~= nil and CCC ~= nil then
        MentalTip("д��ɫ������|" .. AAA .. "|" .. BBB .. "|" .. CCC);
        ��ʱ(200)
        д������(·��, AAA, BBB, CCC);
        ��ʱ(200)
    end
end

function ����ɫ������(AAA, BBB)
    local ���� = ��ȡ������Ϣ(12)
    local ·�� = string.format("C:\\����С��\\��ɫ����\\%s.ini", ����)
    local tem = ��������(·��, AAA, BBB)
    if tem ~= nil then
        MentalTip(AAA .. "|" .. BBB .. "==" .. tem);
        ��ʱ(500)
    else
        return 0
    end
    return tem
end

function ȡ�����������()
    local _, menpai, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()

    local tem = LUA_ȡ����ֵ(string.format([[
        local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
        local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
        local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
        local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
        local tt={ iIceAttack, iFireAttack, iThunderAttack,iPoisonAttack}
        if iIceAttack==math.max(unpack(tt)) then
            maxOfT ="��" .. "|" .. "iIceAttack"
        elseif  iFireAttack==math.max(unpack(tt)) then
            maxOfT ="��" .. "|" .. "iFireAttack"
        elseif  iThunderAttack==math.max(unpack(tt)) then
            maxOfT ="��" .. "|" .. "iThunderAttack"
        elseif  iPoisonAttack==math.max(unpack(tt)) then
            maxOfT ="��" .. "|" .. "iPoisonAttack"
        end
        return maxOfT
    ]]), "s")
    local temList = StringSplit(tem, '|')
    ���Թ��� = temList[1]
    �������ֵ = tonumber(temList[2])
    MentalTip("��ǰ����������Թ���:" .. ���Թ��� .. ",    ����ֵ: " .. �������ֵ)

    if �������ֵ == 0 then
        if string.find("����|����|ؤ��", menpai) then
            ���Թ��� = "��"
        elseif string.find("��ң|����|�����", menpai) then
            ���Թ��� = "��"
        elseif string.find("����|��ɽ|�һ���", menpai) then
            ���Թ��� = "��"
        elseif string.find("����|����|���|Ľ��|�䵱", menpai) then
            ���Թ��� = "��"
        end
    else
        return -1
    end
    return tostring(���Թ���)
end

function ȡ���￹��()
    local _, menpai, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()

    local tem = LUA_ȡ����ֵ(string.format([[
        local iIceDefence  		= Player:GetData( "DEFENCECOLD" );
        local iFireDefence 		= Player:GetData( "DEFENCEFIRE" );
        local iThunderDefence	= Player:GetData( "DEFENCELIGHT" );
        local iPoisonDefence	= Player:GetData( "DEFENCEPOISON" );
        local tt={iIceDefence, iFireDefence, iThunderDefence, iPoisonDefence}
        if iIceDefence == math.max(unpack(tt)) then
            maxOfT ="����" .. "|" .. "iIceDefence"
        elseif iFireDefence == math.max(unpack(tt)) then
            maxOfT ="��" .. "|" .. "iFireDefence"
        elseif iThunderDefence == math.max(unpack(tt)) then
            maxOfT ="����" .. "|" .. "iThunderDefence"
        elseif iPoisonDefence == math.max(unpack(tt)) then
            maxOfT ="����" .. "|" .. "iPoisonDefence"
        end
        return maxOfT
    ]]), "s")

    local temList = StringSplit(tem, '|')
    ���� = temList[1]
    ��߿���ֵ = tonumber(temList[2])
    MentalTip("��ǰ������߿���: " .. ���Թ��� .. ",    ����Ϊ: " .. ��߿���ֵ)

    if ��߿���ֵ < 100 then
        ���� = "����"
    else
        return -1
    end
    return tostring(����)
end

function ȡ����Ǯ()
    ����Ǯ = ��ȡ������Ϣ(52) + ��ȡ������Ϣ(45)
    return ����Ǯ
end

-- ---------------------------------------------------------------------- ------------------------------------------------------------------------
function ȡ����װ���־�(aaa)
    local tem = LUA_ȡ����ֵ(string.format([[
		return EnumAction(%d,"equip"):GetEquipDur()
	]], aaa))
    return tonumber(tem)
end

function ȡ����װ��ID(aaa)
    local tem = LUA_ȡ����ֵ(string.format([[
		return EnumAction(%d,"equip"):GetID()
	]], aaa))
    return tonumber(tem)
end

function ȡ����װ������(aaa)
    return LUA_ȡ����ֵ(string.format([[
		return EnumAction(%d,"equip"):GetName()
	]], aaa))
end

function ȡ����װ���ȼ�(aaa)
    local tem = LUA_ȡ����ֵ(string.format([[
				local  index =%d
				local ID =EnumAction(index,"equip"):GetID()
				if ID > 0 then
					return	DataPool:GetEquipLevel(index)  --װ���ȼ� ����99��
				end
				return -1
			]], aaa))
    --return LifeAbility:GetWearedEquip_NeedLevel(index) --��Ҫ�ȼ�
    return tonumber(tem)
end

function ȡ����װ��λ�õȼ�(װ��λ������)
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            return ȡ����װ���ȼ�(SelfEuipList[i].equipIndex)
        end
    end
end

function ȡ����װ��λ������(װ��λ������)
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            local װ������ = ȡ����װ������(SelfEuipList[i].equipIndex)
            return װ������
        end
    end
end
-- ------------------------------------------------------------------

function ȡ����װ���ȼ�(index)
    local aaa = LUA_ȡ����ֵ(string.format([[
		return LifeAbility : Get_Equip_Level(%d);
	]], index))
    return tonumber(aaa)
end

function ȡ�����������()
    --300���
    local tem = LUA_ȡ����ֵ(string.format([[
		local ID =EnumAction(18,"equip"):GetID()
		if ID > 0 then
			tem= DataPool:GetKfsData("LIFE")
			return tem
		end
		return -1
			]]))
    return tonumber(tem)
end

function ȡ�������Ʊ�������()
    local tem = LUA_ȡ����ֵ([[
        local nType,BaoZhu1,BaoZhu2,BaoZhu3,BaoZhu4,nQual = DataPool:GetLingPaiInfo()
        --local IconName,ItemName = DataPool:GetLingPaiBaoZhuIconName(1)
        if nType> 0 then
            return BaoZhu1 .. "|" .. BaoZhu2 .. "|" .. BaoZhu3 .. "|" .. BaoZhu4
        end
        return -1
    ]])
    return tem
end

function ȡ���ܺ����������()
    local aaa = LUA_ȡ����ֵ(string.format([[
			local nMD = math.mod(DataPool:GetPlayerMission_DataRound(1561),10);
			return nMD
		]]))
    return tonumber(aaa)
end


-- -------------------------------------------------------�ر�����-----------------------------------------------------------------
function ȡ��װ����ȡ����(װ��λ������)
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            MentalTip("׼��ȡ��װ��λ��:" .. װ��λ������)
            local װ���־� = ȡ����װ���־�(SelfEuipList[i].equipIndex)
            if װ��λ������ == "���" then
                local װ���־� = ȡ�����������()
            end

            if tonumber(װ���־�) <= 0 then
                --MentalTip("װ���־ò���,��ȡ��")
                return 0
            end
            if ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0 then
                return 0
            end

            for k = 1, 10 do
                local װ������ = ȡ����װ������(SelfEuipList[i].equipIndex)
                if �����Ƿ����("SelfEquip") ~= 1 then
                    LUA_Call("MainMenuBar_SelfEquip_Clicked();");
                    ��ʱ(2000)
                end
                if װ��λ������ == "����ӡ" then
                    LUA_Call("setmetatable(_G, {__index = Xiulian_Env});Xiulian_JueWei_Page_Switch();");
                    ��ʱ(2000)
                    LUA_Call("setmetatable(_G, {__index = SelfJunXian_Env});SelfJunXian_Equip_Clicked(0);");
                    ��ʱ(2000)
                    �жϹرմ���("SelfJunXian")

                elseif װ��λ������ == "���" then
                    MentalTip("����������|������|,��ֹ����")
                    ��ʱ(2000)
                    ����Ʒ("|������|������|", 0, 0, 1)

                    LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Wuhun_Switch();")
                    ��ʱ(2000)
                    LUA_Call("setmetatable(_G, {__index =  Wuhun_Env});Wuhun_Equip_Clicked(0);")
                    ��ʱ(2000)
                    �жϹرմ���("Wuhun")
                else
                    LUA_Call(string.format([[ setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)]], SelfEuipList[i].downIndex))
                end
                ��ʱ(3000)
                if ȡ����װ��ID(SelfEuipList[i].equipIndex) == 0 then
                    �жϹرմ���("SelfEquip")
                    return װ������
                end
            end
            return 0
        end
    end
end

function ����װ��(װ��λ������, װ������)
    if װ������ == "" then
        MentalTip("��������,����װ��")
        return
    end
    if ��ȡ������Ʒ����(װ������) <= 0 then
        MentalTip("û��װ���޷�ʹ��,����װ��")
        return
    end
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            for k = 1, 5 do
                if װ��λ������ == "���" then
                    ����_������()
                    �Ҽ�ʹ����Ʒ(װ������);
                    ��ʱ(8000)
                else
                    �Ҽ�ʹ����Ʒ(װ������);
                    ��ʱ(2000)
                end
                if ȡ����װ��ID(SelfEuipList[i].equipIndex) > 0 then
                    MentalTip(" �ɹ�����" .. װ������ .. "|��λ��:" .. װ��λ������)
                    break
                end
            end
        end
    end
    --MentalTip(װ��λ������..":λ�ô���")
end

-- --------------------------------------------------------------------------------------------------------------------------
function �����̻Ṻ����Ʒ(����, ����, ���۸�, �ж��Ƿ�����Ʒ, ҳ���ѯ, �����Ӽ�)
    if not �����Ӽ� then
        �����Ӽ� = 1
    end

    if not ҳ���ѯ then
        ҳ���ѯ = 9
    end
    for ss = 1, �����Ӽ� do
        ���� = ���� + 4
        for qq = 1, ҳ���ѯ do
            ��Ļ��ʾ(����)
            if tonumber(�ж��Ƿ�����Ʒ) == 1 then
                if ��ȡ������Ʒ����(����) >= 1 then
                    ��Ļ��ʾ("�������������Ʒ" .. ����)
                    return false
                end
            end
            ȡ����Ʒ("���", 200000)
            if �����Ƿ����("PS_ShopSearch") ~= 1 then
                for i = 1, 5 do
                    ��ͼѰ·("����", 330, 299)
                    if �Ի�NPC("�Ǹ�ʢ") == 1 then

                        ��ʱ(1000)
                        NPC�����Ի�("�鿴�����̵�")
                        ��ʱ(1000)
                        if �����Ƿ����("PS_ShopList") == 1 then
                            LUA_Call([[setmetatable(_G, {__index = PS_ShopList_Env}) PS_ShopList_ChangeTabIndex(3)]])
                            ��ʱ(1000)
                            break
                        end
                    end
                end
                --������Ʒ
            end

            LUA_Call(string.format([[
                 PlayerShop:PacketSend_Search(2 , 2, 1, "%s", %d)
            ]], ����, qq))
            ��ʱ(1500)
            --������һҳ��û�з�����������Ʒ
            local tem = LUA_ȡ����ֵ(string.format([[
                setmetatable(_G, {__index = PS_ShopSearch_Env})
                for i = 1 ,10 do
                    local theAction = EnumAction( i - 1 , "playershop_cur_page")
                    if theAction:GetID() ~= 0 then
                        --��Ʒ��,������,�����̵�ID,����,�ܼ۸�
                        local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )
                        if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
                            if pName == "%s" and pCount <= %d and pYB/pCount <= %d then
                               PushDebugMessage(pName.."/"..pShopName.."/"..pCount.."/"..pYB)
                               --��������,ֱ�ӷ���
                               PlayerShop:SearchPageBuyItem(i - 1, "item")
                               return true
                            end
                        end
                    end
                end
                return false
            ]], ����, ����, ���۸�), "b")
            ��ʱ(1500)
        end
        ��ʱ(200)
    end
end




-- --------------------------------------��ʯ�������---------------------------------
function ȡ����װ����λ����(index)
    --װ�����
    local tem = LUA_ȡ����ֵ(string.format([[
		local holeCount  = LifeAbility : GetWearedEquip_HoleCount(%d)
		return  holeCount
	]], index))
    return tonumber(tem)
end

function ȡ����װ��λ�ÿ�λ����(װ��λ������)
    --װ��λ������
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            return ȡ����װ����λ����(SelfEuipList[i].equipIndex, ���)
        end
    end
end

function ȡ����װ����ʯ����(���, �ڼ���)
    if not ��� then
        ��� = 0
    end
    if not �ڼ��� then
        ��� = 1
    end
    local tem = LUA_ȡ����ֵ(string.format([[
				index = tonumber(%d)
		xuhao = tonumber(%d)
		local isHaveEquip, gemIndex1, gemIndex2, gemIndex3, gemIndex4  = LifeAbility:SplitWearedEquipGem(index)
		if isHaveEquip == 1 then
			if xuhao == 1 then
				if gemIndex1> 0 then
					local name=  DataPool:Lua_GetItemNameByIndex(gemIndex1)
					return tostring(name)
				else
					return tostring("û�б�ʯ")
				end
			elseif xuhao == 2 then
				if gemIndex2> 0 then
					local name=  DataPool:Lua_GetItemNameByIndex(gemIndex2)
					return tostring(name)
				else
					return tostring("û�б�ʯ")
				end
			elseif xuhao == 3 then
				if gemIndex3> 0 then
					local name=  DataPool:Lua_GetItemNameByIndex(gemIndex3)
					return tostring(name)
				else
					return tostring("û�б�ʯ")
				end
			elseif xuhao == 4 then
				if gemIndex4 > 0 then
					local name=  DataPool:Lua_GetItemNameByIndex(gemIndex4)
					return tostring(name)
				else
					return tostring("û�б�ʯ")
				end
			end
		end
		return  -1
            	]], ���, �ڼ���))
    return tostring(tem)
end

function ȡ����װ��λ�ñ�ʯ����(װ��λ������, ���)
    for i = 1, #SelfEuipList do
        if SelfEuipList[i].name == װ��λ������ then
            return ȡ����װ����ʯ����(SelfEuipList[i].equipIndex, ���)
        end
    end
end

function ȡ����װ����ʯ����(װ������)
    if ��ȡ������Ʒ����(װ������) > 0 then
        bHave = ��ȡ������Ʒλ��(װ������) - 1
    else
        return 5
    end
    local tem = LUA_ȡ����ֵ(string.format([[
            local gemcount = LifeAbility:GetEquip_GemCount(%d)
				if gemcount==nil then
					return 0
				end
                return gemcount
            	]], bHave))
    return tonumber(tem)
end

function ȡ����װ��������(װ������)
    local bHave = tonumber(��ȡ������Ʒλ��(װ������)) - 1
    if bHave < 0 then
        return -1
    end
    local tem = LUA_ȡ����ֵ(string.format([[
				return LifeAbility:GetEquip_HoleCount(%d)
            	]], bHave))
    return tonumber(tem)
end

function �ƽ��й������캮��(num)
    ��ͼѰ·("����", 355, 236)
    ��ͼѰ·("����", 355, 236)
    ��ʱ(1000)
    �Ի�NPC("������")
    ��ʱ(500)
    NPC�����Ի�("�ƽ���")
    ��ʱ(1000)

    for i = 1, num do
        -- TODO
        LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_Shop2_Env});ActivitySchedule_Shop2_Clicked()]])
        ��ʱ(1000)
        LUA_Call([[setmetatable(_G, {__index = ActivitySchedule_MBuy2_Env});ActivitySchedule_MBuy2_OK_Clicked();]])  -- �������
    end

    -- TODO
    if tonumber(��ȡ������Ʒ����("")) <= 0 then
        break
    end

    for i = 1, usePkgCount do
        -- TODO
        �Ҽ�ʹ����Ʒ("")
        ��ʱ(500)
    end
end

function �Զ������񾫴�(��������)
    if �������� ~= "���񾫴�" then
        return
    end

    for i = 1, 9 do
        if ��ȡ������Ʒ����("���캮��") < 5 * 4 then
            �ƽ��й������캮��(20)
        end
    end

    while ��ȡ������Ʒ����("���캮��") >= 5 do
        ��ͼѰ·("¥��", 187, 225);
        ��ʱ(1500)
        if �Ի�NPC("ʷɩ") == 1 then
            NPC�����Ի�("����ϳ�");
            ��ʱ(1500)
            NPC�����Ի�("��Ҫ�ϳ�");
            ��ʱ(1500)
            LUA_Call("setmetatable(_G, {__index = PlayerPackage_Env});PlayerPackage:PackUpPacket(1);");
            ��ʱ(1500)
        end
        if ��ȡ������Ʒ����("���񾫴�") >= 1 then
            return
        end
    end
end

function ȫ��������Զ����(���, Ŀ�����)
    for kkk = 1, 19 do
        local װ���ȼ� = ȡ����װ���ȼ�(���)
        if װ���ȼ� > 0 then
            ��׵ȼ� = math.ceil(װ���ȼ� / 10)
            if ��׵ȼ� <= 8 and �������8�� == 1 then
                --��������
                ��׵ȼ� = 8
            end
            ����װ�������� = tonumber(LUA_ȡ����ֵ(string.format([[
					return LifeAbility:GetEquip_HoleCount(%d)
				]], ���)))
            if ����װ�������� >= Ŀ����� then
                MentalTip("����λ��:%d,������:%d,Ŀ�����,�������", ���, ����װ��������, Ŀ�����)
                ��ʱ(200)
                return
            end
            if ����װ�������� == 3 then
                ��׵ȼ� = 12
            end
            ��ײ��� = ��ײ�������[��׵ȼ�].name
            ��׼۸� = ��ײ�������[��׵ȼ�].JINpirce
            MentalTip("����λ��:%d|װ���ȼ�:%d|װ����ײ���:%s|��׼۸�:%d|Ŀ��������:%d", ���, װ���ȼ�, ��ײ���, ��׼۸�, Ŀ�����)
            if ��ȡ������Ʒ����(��ײ���) > 0 then
                nIndex = ��ȡ������Ʒλ��(��ײ���) - 1
            else
                MentalTip("��ײ���" .. ��ײ��� .. "����")
                �Զ������񾫴�(��ײ���)
                �����̻Ṻ����Ʒ(��ײ���, 1, ��׼۸�, 1, 3, 3)
                nIndex = ��ȡ������Ʒλ��(��ײ���) - 1
            end
            if not string.find("����|����|����|¥��|Ǯׯ", ��ȡ������Ϣ(16)) then
                MentalTip("���ڵ�ͼ����|����|����|¥��|Ǯׯ,װ��ȥ���� ")
                ��ʱ(1000)
                ��ͼѰ·("����", 280, 322)
            end

            if tonumber(����װ��������) < 3 then
                MentalTip("ǰ���״��")
                LUA_Call(string.format([[
			Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("StilettoEx_3")
			Set_XSCRIPT_ScriptID(311200)
			Set_XSCRIPT_Parameter(0,%d)--װ��λ��
			Set_XSCRIPT_Parameter(1,%d)--����λ��
			Set_XSCRIPT_ParamCount(2)
			Send_XSCRIPT()
			]], ���, nIndex))
            else
                if ��ײ��� == "���񾫴�" then
                    four = 2
                else
                    four = 1
                end
                LUA_Call(string.format([[
						Clear_XSCRIPT()
					Set_XSCRIPT_Function_Name("StilettoEx_4")
					Set_XSCRIPT_ScriptID(311200)
					Set_XSCRIPT_Parameter(0,%d)
					Set_XSCRIPT_Parameter(1,%d)
					Set_XSCRIPT_Parameter(2,%d)
					Set_XSCRIPT_ParamCount(3)
				Send_XSCRIPT()
						]], ���, nIndex, four))
            end
        end
        ��ʱ(1000)
    end
end

function װ���Զ����(װ������, ��ײ���, ��׼۸�, ��λ����)
    for kkk = 1, 9 do
        local װ���ȼ� = ȡ����װ���ȼ�(��ȡ������Ʒλ��(װ������) - 1)
        if װ���ȼ� > 0 then
            ��׵ȼ� = math.ceil(װ���ȼ� / 10)
            if ��׵ȼ� <= 8 and �������8�� == 1 then
                --��������
                ��׵ȼ� = 8
            end
            if ȡ����װ��������(װ������) == 3 then
                ��׵ȼ� = 12
            end
            ��ײ��� = ��ײ�������[��׵ȼ�].name
            ��׼۸� = ��ײ�������[��׵ȼ�].JINpirce
            MentalTip(string.format("װ������:%s|װ���ȼ�:%d|װ����ײ���:%s|��׼۸�:%d|Ŀ��������:%d", װ������, װ���ȼ�, ��ײ���, ��׼۸�, ��λ����))
            ��ʱ(3000)

            local �Ѿ���׵Ŀ��� = ȡ����װ��������(װ������)
            --��ʱ(1000)
            MentalTip(װ������ .. "�Ѿ���׵Ŀ���:" .. �Ѿ���׵Ŀ���)
            if �Ѿ���׵Ŀ��� >= ��λ���� then
                MentalTip("��ǰĿ���λ����" .. ��λ����)
                --��ʱ(1000)
                return
            end
            if ��ȡ������Ʒ����(װ������) > 0 then
                bHave = ��ȡ������Ʒλ��(װ������) - 1
            else
                break
            end

            if ��ȡ������Ʒ����(��ײ���) > 0 then
                nIndex = ��ȡ������Ʒλ��(��ײ���) - 1
            else
                MentalTip("��ײ���" .. ��ײ��� .. "����")
                if ��ײ��� == "���񾫴�" then
                    �Զ������񾫴�(��ײ���)
                end
                if ��ȡ������Ʒ����(��ײ���) < 1 then
                    �����̻Ṻ����Ʒ(��ײ���, 1, ��׼۸�, 1, 3, 3)
                end

                nIndex = ��ȡ������Ʒλ��(��ײ���) - 1
            end

            ��ͼѰ·("����", 280, 322)

            if tonumber(�Ѿ���׵Ŀ���) < 3 then
                MentalTip("ǰ���״��")
                LUA_Call(string.format([[
                    Clear_XSCRIPT()
                    Set_XSCRIPT_Function_Name("StilettoEx_3")
                    Set_XSCRIPT_ScriptID(311200)
                    Set_XSCRIPT_Parameter(0,%d)--װ��λ��
                    Set_XSCRIPT_Parameter(1,%d)--����λ��
                    Set_XSCRIPT_ParamCount(2)
                    Send_XSCRIPT()
                ]], bHave, nIndex))
            else
                if ��ײ��� == "���񾫴�" then
                    four = 2
                else
                    four = 1
                end
                LUA_Call(string.format([[
				Clear_XSCRIPT()
                    Set_XSCRIPT_Function_Name("StilettoEx_4")
                    Set_XSCRIPT_ScriptID(311200)
                    Set_XSCRIPT_Parameter(0,%d)
                    Set_XSCRIPT_Parameter(1,%d)
                    Set_XSCRIPT_Parameter(2,%d)
                    Set_XSCRIPT_ParamCount(3)
                Send_XSCRIPT()
				]], bHave, nIndex, four))
            end
        end
    end
end

function MessageBoxOK()
    if �����Ƿ����("MessageBox_Self") == 1 then
        MentalTip("MessageBoxȷ��")
        LUA_Call(" setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();")
        ��ʱ(1000)
    end
end

function ���Ԫ��������(���)
    local tem = LUA_ȡ����ֵ("setmetatable(_G, {__index = YuanbaoShop_Env})return YuanbaoShop_ItemInfo" .. tostring(���) .. "_Text:GetText()")
    return tostring(tem)
end

function �Զ�����ʯ��Ƕ��(�󶨹���, ��������, Ԫ������)
    MentalTip("ȫ�Զ�����ʯ��Ƕ��")
    ȡ����Ʒ("��ʯ��Ƕ��")
    for i = 1, 5 do
        if ��ȡ������Ʒ����("��ʯ��Ƕ��") > 0 then
            return
        end
        if �󶨹��� then
            if tonumber(��ȡ������Ϣ(62)) >= 98 then
                MentalTip("�󶨹���ʯ��Ƕ��")
                if �����Ƿ����("YuanbaoShop") == 0 then
                    LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();");
                    ��ʱ(2000)
                end
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(1);");
                ��ʱ(2000)
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList_Bind(2);");
                ��ʱ(2000)
                if string.find(���Ԫ��������(1), "��ʯ��Ƕ��") then
                    LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);");
                    ��ʱ(2000)
                end
                MessageBoxOK()
                ��ʱ(2000)
                �жϹرմ���("YuanbaoShop")
                ��ʱ(2000)
                if ��ȡ������Ʒ����("��ʯ��Ƕ��") > 0 then
                    return
                end
            end
        end
        if �������� then
            if tonumber(��ȡ������Ϣ(55)) >= 98 then
                MentalTip("��������ʯ��Ƕ��")
                if �����Ƿ����("YuanbaoShop") == 0 then
                    LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();");
                    ��ʱ(2000)
                end
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);");
                ��ʱ(2000)
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(2);");
                ��ʱ(2000)
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(6);");
                ��ʱ(2000)
                if string.find(���Ԫ��������(1), "��ʯ��Ƕ��") then
                    LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(1);");
                    ��ʱ(2000)
                end
                MessageBoxOK()
                �жϹرմ���("YuanbaoShop")
            end
            if ��ȡ������Ʒ����("��ʯ��Ƕ��") > 0 then
                return
            end
        end
        if Ԫ������ then
            if tonumber(��ȡ������Ϣ(46)) >= 98 then
                if �����Ƿ����("YuanbaoShop") == 0 then
                    LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();");
                    ��ʱ(2000)
                end
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(0);");
                ��ʱ(2000)
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(2);");
                ��ʱ(2000)
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(6);");
                ��ʱ(2000)
                LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");
                ��ʱ(2000)
                if string.find(���Ԫ��������(2), "��ʯ��Ƕ��") then
                    LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(2);");
                    ��ʱ(2000)
                end
                MessageBoxOK()
                �жϹرմ���("YuanbaoShop")
            end
            if ��ȡ������Ʒ����("��ʯ��Ƕ��") > 0 then
                return
            end
        end
    end
end

function ������(nTheTabIndex)
    if nTheTabIndex == 1 then
        MentalTip("�Զ����� <������>")
    elseif nTheTabIndex == 2 then
        MentalTip("�Զ����� <������>")
    end
    LUA_Call(string.format("PlayerPackage:PackUpPacket(%d);", nTheTabIndex))
end

function �һ��챦ʯ()
    if ��ȡ������Ʒ����("�챦ʯ(3��)") > 0 then
        return
    end
    ȡ����Ʒ("3����ʯ�һ�ȯ")
    if ��ȡ������Ʒ����("3����ʯ�һ�ȯ") > 0 then
        for i = 1, 5 do
            if ��ȡ������Ʒ����("3����ʯ�һ�ȯ") <= 0 then
                MentalTip("3����ʯ�һ�ȯ����")
                break
            end
            ��ͼѰ·("Ǯׯ", 68, 44)
            if �Ի�NPC("Ǯ����") == 1 then
                ��ʱ(1000)
                NPC�����Ի�("ʹ�ñ�ʯ�һ�ȯ", 0)
                ��ʱ(1000)
                NPC�����Ի�("ʹ��3����ʯ�һ�ȯ", 0)
                ��ʱ(1000)
                NPC�����Ի�("�챦ʯ(3��)", 0)
                ��ʱ(1000)
                NPC�����Ի�("ͬ��", 0)
                ��ʱ(1000)
            end
            if ��ȡ������Ʒ����("�챦ʯ(3��)") > 0 then
                return
            end
        end
    end
end

function �һ����Ա�ʯ(��ʯ����)

    MentalTip("�һ���ʯ" .. ��ʯ����)
    if ��ȡ������Ʒ����(��ʯ����) > 0 then
        return
    end
    ȡ����Ʒ("3����ʯ�һ�ȯ")
    if ��ȡ������Ʒ����("3����ʯ�һ�ȯ") > 0 then
        for i = 1, 5 do
            if ��ȡ������Ʒ����("3����ʯ�һ�ȯ") <= 0 then
                MentalTip("3����ʯ�һ�ȯ����")
                break
            end
            ��ͼѰ·("Ǯׯ", 68, 44)
            if �Ի�NPC("Ǯ����") == 1 then
                ��ʱ(1000)
                NPC�����Ի�("ʹ�ñ�ʯ�һ�ȯ", 0)
                ��ʱ(1000)
                NPC�����Ի�("ʹ��3����ʯ�һ�ȯ", 0)
                ��ʱ(1000)
                NPC�����Ի�(��ʯ����)
                ��ʱ(1000)
                NPC�����Ի�("ͬ��", 0)
                ��ʱ(1000)
            end
            if ��ȡ������Ʒ����(��ʯ����) > 0 then
                return
            end
        end
    end
end

function ��Ը������������(����)

    MentalTip("��Ը������ʯ")
    if not ���� then
        ���� = 1
    end
    ȡ����Ʒ("�챦ʯ(3��)")
    if ��ȡ������Ʒ����("�챦ʯ(3��)") >= ���� then
        return true
    end
    ȡ����Ʒ("��Ը��")
    for i = 1, 20 do
        if ��ȡ������Ʒ����("��Ը��") >= 20 then
            ��ͼѰ·("����", 282, 276);
            ��ʱ(1000)
            if �Ի�NPC("����ʿ") == 1 then
                NPC�����Ի�("��Ը���һ�����");
                ��ʱ(1000)
                NPC�����Ի�("�챦ʯ", 1);
                ��ʱ(1000)
                NPC�����Ի�("��Ҫ�һ�");
                ��ʱ(2000)
            end
            if ��ȡ������Ʒ����("�챦ʯ(3��)") >= ���� then
                return true
            end
        end
    end
    �һ��챦ʯ()
    if ��ȡ������Ʒ����("�챦ʯ(3��)") >= ���� then
        return true
    end
    return false
end

function ���ܱ�ʯ����(GemName, NeedItem)
    ��ͼѰ·("����", 281, 321)
    MentalTip("��ʯ����:%s ,%s", GemName, NeedItem)
    ��ʱ(2000)
    LPindex = ��ȡ������Ʒλ��(GemName) - 1
    Needindex = ��ȡ������Ʒλ��(NeedItem) - 1
    if LPindex >= 0 and Needindex >= 0 then
        local tem = LUA_ȡ����ֵ(string.format([[
		local g_GemItemPos =%d
		local itemcount = PlayerPackage:GetBagItemNum(g_GemItemPos)
		Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("OnGemCarve");
			Set_XSCRIPT_ScriptID(800117);
			Set_XSCRIPT_Parameter(0,g_GemItemPos);
			Set_XSCRIPT_Parameter(1,%d);
			Set_XSCRIPT_Parameter(2,135);
			Set_XSCRIPT_Parameter(3, 0);
			Set_XSCRIPT_Parameter(4,itemcount);
			Set_XSCRIPT_ParamCount(5);
		Send_XSCRIPT();
		]], LPindex, Needindex), "b")
    end
end

function ��ʯ����(GemName)

    --MentalTip("�Զ�����ʯ������3��")
    if string.find(GemName, "3��") then
        �������� = "��ʯ������3��"
    elseif string.find(GemName, "2��") then
        �������� = "��ʯ������2��"
    end
    if ��ȡ������Ʒ����(��������) <= 0 then
        ȡ����Ʒ(��������)
        �����̻Ṻ����Ʒ(��������, 250, 50 * 10000, 1)
    end
    ���ܱ�ʯ����(GemName, ��������)
    ��ʱ(3000)
    --д��ɫ������("��ʯ����", "������ʯ", index)
    --��ʱ(2000)
    --ִ�й���("��ʯ����")
end

function ��������ʯ(��ʯ����)
    if ��ʯ���� == "�ƾ�ʯ������(3��)" then
        index = 3
    elseif ��ʯ���� == "����ʯ������(3��)" then
        index = 4
    elseif ��ʯ���� == "�쾧ʯ������(3��)" then
        index = 5
    elseif ��ʯ���� == "�̾�ʯ������(3��)" then
        index = 6
    elseif ��ʯ���� == "����������(3��)" then
        index = 10
    else
        index = 10
    end
    if ��ȡ������Ʒ����(��ʯ����) >= 1 then
        return
    end

    if tonumber(��ȡ������Ϣ(55)) >= 210 then
        MentalTip("��������ʯ:" .. ��ʯ����)
        if �����Ƿ����("YuanbaoShop") == 0 then
            LUA_Call("setmetatable(_G, {__index = MiniMap_Env});MiniMap_YuanBaoFunc();");
            ��ʱ(2000)
        end
        LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_ChangeTabIndex(5);");
        ��ʱ(2000)
        LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateList(5);");
        ��ʱ(2000)
        LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_UpdateShop(1);");
        ��ʱ(2000)
        LUA_Call("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_PageDown();");
        ��ʱ(2000)
        --MentalTip(���Ԫ��������(index))

        if ���Ԫ��������(index) == ��ʯ���� then
            LUA_Call(string.format("setmetatable(_G, {__index = YuanbaoShop_Env});YuanbaoShop_GoodButton_Clicked(%d);", index));
            ��ʱ(2000)
        end
        MessageBoxOK()
        �жϹرմ���("YuanbaoShop")
    end

end

function �Զ�����ʯ(��ʯ����)
    MentalTip("�Զ�����ʯ" .. ��ʯ����)
    ȡ����Ʒ(��ʯ����)
    if ��ȡ������Ʒ����(��ʯ����) >= 1 then
        return
    end

    local ��ʯ���Ƶ���ǰ = string.gsub(��ʯ����, "����", "")
    ȡ����Ʒ(��ʯ���Ƶ���ǰ .. "|3����ʯ�һ�ȯ|4����ʯ�һ�ȯ")
    --MentalTip(��ʯ���Ƶ���ǰ)
    --��ʱ(5000)

    if ��ȡ������Ʒ����(��ʯ���Ƶ���ǰ) >= 1 then
        ��ʯ����(��ʯ���Ƶ���ǰ)
        ��ʱ(5000)
        if ��ȡ������Ʒ����(��ʯ����) >= 1 then
            return
        end
    end

    if ��ʯ���� == "�챦ʯ(4��)" then
        ȡ����Ʒ(��ʯ����)
        if ��ȡ������Ʒ����(��ʯ����) <= 0 then
            return
        end
    end
    --��ʱ(30000)

    if string.find(��ʯ���Ƶ���ǰ, "����") and string.find(��ʯ���Ƶ���ǰ, "3��") then
        --MentalTip("333");
        --��ʱ(6000)

        if ��ȡ������Ʒ����(��ʯ���Ƶ���ǰ) >= 1 then
            ��ʯ����(��ʯ���Ƶ���ǰ)
            ȡ����Ʒ(��ʯ����)
        else
            return
        end
    end

    if string.find(��ʯ���Ƶ���ǰ, "��ʯ") and string.find(��ʯ���Ƶ���ǰ, "3��") then
        if ��ȡ������Ʒ����(��ʯ���Ƶ���ǰ) >= 1 then
            ��ʯ����(��ʯ���Ƶ���ǰ)
            ȡ����Ʒ(��ʯ����)
            return
        end
        if ��ȡ������Ʒ����(��ʯ���Ƶ���ǰ) <= 0 then
            if ��ȡ������Ʒ����("3����ʯ�һ�ȯ") >= 1 then
                �һ����Ա�ʯ(��ʯ���Ƶ���ǰ)
                ��ʯ����(��ʯ���Ƶ���ǰ)
                ȡ����Ʒ(��ʯ����)
                return
            end
        end
    end

end

function װ���ϱ�ʯ(װ������, ��ʯ����, ��ʯλ��)
    MentalTip(��ʯ����)
    �Զ�����ʯ(��ʯ����)
    local bIndex = ��ȡ������Ʒλ��(��ʯ����) - 1
    MentalTip(bIndex)
    --��ʱ(1000)

    if not bIndex or bIndex < 0 then
        return -1
    end


    --��ͼѰ·("����",282,321)

    if ��ȡ������Ʒ����(װ������) > 0 then
        bHave = ��ȡ������Ʒλ��(װ������) - 1
        MentalTip("װ��λ��" .. bHave)
    else
        return -1
    end

    if ��ȡ������Ʒ����("��ʯ��Ƕ��") > 0 then
        nIndex = ��ȡ������Ʒλ��("��ʯ��Ƕ��") - 1
    else
        �Զ�����ʯ��Ƕ��(true, false);
        ��ʱ(2000)
        nIndex = ��ȡ������Ʒλ��("��ʯ��Ƕ��") - 1
    end

    MentalTip("��ʯ��Ƕ��" .. nIndex)

    װ����λ������ = ȡ����װ��������(װ������)
    if װ����λ������ < ��ʯλ�� then
        return
    end
    ȡ����Ʒ("���")
    LUA_Call(string.format([[
		g_EnchaseEx_Gem_pos=%d
		g_EnchaseEx_Equip_pos=%d
		g_EnchaseEx_Material_pos=%d
		g_EnchaseEx_Gem_hole=%d
		if g_EnchaseEx_Gem_hole > 0 and g_EnchaseEx_Gem_hole < 4 then
            Clear_XSCRIPT()
                Set_XSCRIPT_Function_Name("EnchaseEx_3")
                Set_XSCRIPT_ScriptID(701614)
                Set_XSCRIPT_Parameter(0,g_EnchaseEx_Gem_pos)
                Set_XSCRIPT_Parameter(1,g_EnchaseEx_Equip_pos)
                Set_XSCRIPT_Parameter(2,g_EnchaseEx_Material_pos)
                Set_XSCRIPT_Parameter(3,-1)
                Set_XSCRIPT_Parameter(4,g_EnchaseEx_Gem_hole-1)
                Set_XSCRIPT_ParamCount(5)
            Send_XSCRIPT()
        elseif g_EnchaseEx_Gem_hole == 4 then
            Clear_XSCRIPT()
                Set_XSCRIPT_Function_Name("EnchaseEx_4")
                Set_XSCRIPT_ScriptID(701614)
                Set_XSCRIPT_Parameter(0,g_EnchaseEx_Gem_pos)
                Set_XSCRIPT_Parameter(1,g_EnchaseEx_Equip_pos)
                Set_XSCRIPT_Parameter(2,g_EnchaseEx_Material_pos)
                Set_XSCRIPT_Parameter(3,-1)
                Set_XSCRIPT_Parameter(4,3)
                Set_XSCRIPT_ParamCount(5)
            Send_XSCRIPT()
        end
    ]], bIndex, bHave, nIndex, ��ʯλ��))
end

function װ��λ���Զ����(װ��λ��, ��λ����)
    --MentalTip(string.format("���[%s]����[%s]�۸�[%d]λ��[%d]",װ��λ��,��ײ���,��׼۸�,��λ����))

    װ���ȼ� = ȡ����װ��λ�õȼ�(װ��λ��)
    if װ���ȼ� > 0 then
        ��׵ȼ� = math.ceil(װ���ȼ� / 10)
        if ��׵ȼ� <= 8 and �������8�� == 1 then
            --��������
            ��׵ȼ� = 8
        end
        if ȡ����װ��λ�ÿ�λ����(װ��λ��) == 3 then
            ��׵ȼ� = 12
        end
        ��ײ��� = ��ײ�������[��׵ȼ�].name
        ��׼۸� = ��ײ�������[��׵ȼ�].JINpirce

        MentalTip(string.format("װ��λ������:%s|װ���ȼ�:%d|װ����ײ���:%s|��׼۸�:%d|Ŀ��������:%d", װ��λ��, װ���ȼ�, ��ײ���, ��׼۸�, ��λ����))
        --��ʱ(30000)
    else
        return
    end

    for i = 1, 4 do
        if ȡ����װ��λ�ÿ�λ����(װ��λ��) >= ��λ���� then
            return true
        end
        ȡ����Ʒ("���")
        ȡ����Ʒ(��ײ���)
        if ��ȡ������Ʒ����(��ײ���) >= 1 then
            MentalTip("�д����")
        else
            if tonumber(��ȡ������Ϣ(45)) < ��׼۸� then
                MentalTip("���[%s]����[%s]�۸�[%d]λ��[%d],��Ҳ�����������", װ��λ��, ��ײ���, ��׼۸�, ��λ����)
                ��ʱ(2000)
                return false
            end
        end


        --��ͼѰ·("����",282,321)
        ��ִ��װ������ = ȡ��װ����ȡ����(װ��λ��)

        if ��ִ��װ������ == "" or ��ִ��װ������ == nil or ��ִ��װ������ == 0 then
            return false
        end

        װ���Զ����(��ִ��װ������, ��ײ���, ��׼۸�, ��λ����)
        ����װ��(װ��λ��, ��ִ��װ������)
        --��ʱ(1000)
    end
end

function �Զ���ʯ(װ��λ������, ��ʯ����, ��λ����, ��ʯλ�����)
    local ��ʯλ������ = ȡ����װ��λ�ñ�ʯ����(װ��λ������, ��ʯλ�����)
    MentalTip("�Զ���ʯװ��λ��[%s]��ʯ����[%s]��λ����[%d]��ʯλ�����[%d]", װ��λ������, ��ʯ����, ��λ����, ��ʯλ�����)
    --��ʱ(3000)
    --MentalTip("װ��λ������"..��ʯλ������)
    if ��ʯλ������ ~= "û�б�ʯ" and ��ʯλ������ ~= "-1" then
        MentalTip("��λ���Ѿ��б�ʯ��,��������")
        ��ʱ(200)
        return
    end
    ȡ����Ʒ("��ʯ��Ƕ��")
    if ��ȡ������Ʒ����("��ʯ��Ƕ��") <= 0 then
        if tonumber(��ȡ������Ϣ(62)) < 98 and tonumber(��ȡ������Ϣ(55)) < 98 then
            MentalTip("���紦��ʯ��Ƕ��,û����������")
            return
        end
    end

    װ��λ���Զ����(װ��λ������, ��λ����)
    if ȡ����װ��λ�ÿ�λ����(װ��λ������) < ��λ���� then
        return
    end

    �Զ�����ʯ(��ʯ����)
    --��ʱ(3000)
    if ��ȡ������Ʒ����(��ʯ����) <= 0 then
        MentalTip("�Զ���ʯ������û�б�ʯ" .. ��ʯ����)
        ��ʱ(30)
        return
    end

    ��ִ��װ������ = ȡ��װ����ȡ����(װ��λ������)
    ��ʱ(1500)
    if ��ִ��װ������ == "" or ��ִ��װ������ == nil then
        return
    end

    LPindex = ��ȡ������Ʒλ��(��ִ��װ������) - 1
    MentalTip("����׵ı������:" .. LPindex)
    if LPindex < 0 then
        return
    end

    if װ���ϱ�ʯ(��ִ��װ������, ��ʯ����, ��λ����) == -1 then
        ����װ��(װ��λ������, ��ִ��װ������)
    end
    ��ʱ(3000)
    ����װ��(װ��λ������, ��ִ��װ������)
end

function IsInTable(value, tbl)
    for k, v in ipairs(tbl) do
        if v == value then
            return 1;
        end
    end
    return -1;
end

function ����ʯͷ��(ʯͷ��, ��ʯ��ɫ)
    for n = 1, #ʯͷ�� do
        if type(ʯͷ��[n]) == "table" then
            for k = 1, #ʯͷ��[n] do
                ʯͷ��[n][k] = string.gsub(ʯͷ��[n][k], "&", ��ʯ��ɫ)
                ʯͷ��[n][k] = string.gsub(ʯͷ��[n][k], "#", ��ʯ��ɫ)
            end
        else
            ʯͷ��[n] = string.gsub(ʯͷ��[n], "&", ��ʯ��ɫ)
            ʯͷ��[n] = string.gsub(ʯͷ��[n], "#", ��ʯ��ɫ)
        end
    end
    return ʯͷ��
end

function ���ܴ�ʯ(װ��λ������, gem, ��ʯλ���ۺ�)
    if not ��ʯλ���ۺ� then
        ��ʯλ���ۺ� = "1234"
    end
    local װ������ = ȡ����װ��λ������(װ��λ������)
    if string.find(װ�����ּ���, װ������) or string.find(װ������, װ���ؼ��ּ���) then
        --MentalTip(װ������)
    else
        MentalTip(װ������ .. "|�����趨������,��������")
        --��ʱ(10)
        return
    end

    if ȡ����װ��λ�ñ�ʯ����(װ��λ������, 1) == "-1" then
        MentalTip(װ��λ������ .. "û��װ��")
        --��ʱ(10)
        return
    end

    for KK = 1, 4 do
        ��ʯ���� = gem[KK]
        if type(��ʯ����) ~= "table" then
            return
        end
        for i = 1, 4 do
            local ��ʯλ������ = ȡ����װ��λ�ñ�ʯ����(װ��λ������, i)
            if ��ʯλ������ == "û�б�ʯ" then
                if string.find(��ʯλ���ۺ�, "1") and i == 1 and IsInTable(ȡ����װ��λ�ñ�ʯ����(װ��λ������, 2), ��ʯ����) == -1 and IsInTable(ȡ����װ��λ�ñ�ʯ����(װ��λ������, 3), ��ʯ����) == -1 then
                    for m = 1, #��ʯ���� do
                        --MentalTip(��ʯ����[m])
                        --��ʱ(3000)
                        �Զ���ʯ(װ��λ������, ��ʯ����[m], 1, 1)
                    end
                end

                if string.find(��ʯλ���ۺ�, "2") and i == 2 and IsInTable(ȡ����װ��λ�ñ�ʯ����(װ��λ������, 1), ��ʯ����) == -1 and IsInTable(ȡ����װ��λ�ñ�ʯ����(װ��λ������, 3), ��ʯ����) == -1 then
                    for m = 1, #��ʯ���� do
                        --MentalTip(��ʯ����[m])
                        --��ʱ(3000)
                        �Զ���ʯ(װ��λ������, ��ʯ����[m], 2, 2)
                    end
                end

                if string.find(��ʯλ���ۺ�, "3") and i == 3 and IsInTable(ȡ����װ��λ�ñ�ʯ����(װ��λ������, 1), ��ʯ����) == -1 and IsInTable(ȡ����װ��λ�ñ�ʯ����(װ��λ������, 2), ��ʯ����) == -1 then
                    for m = 1, #��ʯ���� do
                        --MentalTip("1111")
                        --MentalTip(��ʯ����[m])
                        --��ʱ(300)
                        �Զ���ʯ(װ��λ������, ��ʯ����[m], 3, 3)
                    end
                end

                if string.find(��ʯλ���ۺ�, "4") and i == 4 and KK == 4 then
                    for m = 1, #��ʯ���� do
                        --MentalTip("1111")
                        --MentalTip(��ʯ����[m])
                        --��ʱ(300)
                        �Զ���ʯ(װ��λ������, ��ʯ����[m], 4, 4)
                    end
                end
            end
        end
    end
end

-- ----------------------------------------------------------------------------------------------------------------------
����������� = ȡ�����������()
���￹�� = ȡ���￹��()

if ����������� == "��" then
    ���Ա�ʯ��ɫ = "��"
elseif ����������� == "��" then
    ���Ա�ʯ��ɫ = "��"
elseif ����������� == "��" then
    ���Ա�ʯ��ɫ = "��"
elseif ����������� == "��" then
    ���Ա�ʯ��ɫ = "��"
end

if ���￹�� == "����" then
    ���Ա�ʯ��ɫ = "�����ʯ"
elseif ���￹�� == "��" then
    ���Ա�ʯ��ɫ = "�����¹�ʯ"
elseif ���￹�� == "����" then
    ���Ա�ʯ��ɫ = "��������"
elseif ���￹�� == "����" then
    ���Ա�ʯ��ɫ = "��������"
end

���Ա�ʯ = string.gsub("����&��ʯ(3��)", "&", ���Ա�ʯ��ɫ)

��Ƕʯͷ�� = {
    { "�챦ʯ(4��)", "�챦ʯ������(4��)", "�챦ʯ(5��)" },
    { "����&��ʯ(4��)", "����&��ʯ������(4��)" },
    {},
    { "����&��ʯ(4��)", "����&��ʯ������(4��)" },
}

������Ƕʯͷ�� = {
    { "�챦ʯ(4��)", "�챦ʯ������(4��)", "�챦ʯ(5��)" },
    { "����&��ʯ(4��)", "����&��ʯ������(4��)" },
    { "&(4��)", "&������(4��)" },
    { "&(4��)", "&������(4��)" },
}

����ʯͷ�� = {
    { "����&��ʯ(4��)", "����&��ʯ������(4��)" },
    { "����(4��)", "���񡤺���(4��)", },
    {},
    { "����&��ʯ(4��)", "����&��ʯ������(4��)", },
}

����ʯͷ�� = {
    { "�챦ʯ(4��)", "�챦ʯ������(4��)", "�챦ʯ(5��)" },
    { "��ĸ��(4��)", "��ĸ�̡�����(4��)" },
    { "&(4��)", "&������(4��)" },
    { "�̱�ʯ(4��)", "�̱�ʯ������(4��)" },
}

��Ƕʯͷ�� = ����ʯͷ��(��Ƕʯͷ��, ���Ա�ʯ��ɫ)
������Ƕʯͷ�� = ����ʯͷ��(������Ƕʯͷ��, ���Ա�ʯ��ɫ)
����ʯͷ�� = ����ʯͷ��(����ʯͷ��, ���Ա�ʯ��ɫ)
����ʯͷ�� = ����ʯͷ��(����ʯͷ��, ���Ա�ʯ��ɫ)

��������, ����, PID, Զ������, ���⹥��, ��ɫ�˺�, ���ɵ�ַ, ����״̬, �Ա� = ��ȡ��������()

local ���ﵱǰ�ȼ� = tonumber(��ȡ������Ϣ(26))
if ���ﵱǰ�ȼ� < 98 then
    LUA_Call(string.format([[
	        Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("GetBonus")  --�ű��ӿ�
			Set_XSCRIPT_ScriptID(290099) --�ű���� g_CurrentSelect
			Set_XSCRIPT_Parameter(0,tonumber(4))
			Set_XSCRIPT_ParamCount(1)
		Send_XSCRIPT()
	  ]]))
    ��ʱ(2000)
    LUA_Call(string.format([[
	        Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("GetBonus")  --�ű��ӿ�
			Set_XSCRIPT_ScriptID(290099) --�ű���� g_CurrentSelect
			Set_XSCRIPT_Parameter(0,tonumber(5))
			Set_XSCRIPT_ParamCount(1)
		Send_XSCRIPT()
	  ]]))
    ��ʱ(2000)
end

װ��λ���Զ����("����", 4)
װ��λ���Զ����("����", 4)
װ��λ���Զ����("����", 4)
װ��λ���Զ����("����", 4)
װ��λ���Զ����("���", 4)
װ��λ���Զ����("����ӡ", 4)

-- --------------------------------------------------------------------
if ���� == "����" then
    ���ܴ�ʯ("����", ������Ƕʯͷ��, "1234")
    ���ܴ�ʯ("����", ������Ƕʯͷ��, "1234")
    ���ܴ�ʯ("����", ������Ƕʯͷ��, "1234")
    ���ܴ�ʯ("���", ������Ƕʯͷ��, "1234")
    ���ܴ�ʯ("����ӡ", ������Ƕʯͷ��, "1234")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("ñ��", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")

    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "1")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "1")
    ���ܴ�ʯ("������", ����ʯͷ��, "1")
    ���ܴ�ʯ("������", ����ʯͷ��, "1")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("ñ��", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")

    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "2")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "2")
    ���ܴ�ʯ("������", ����ʯͷ��, "2")
    ���ܴ�ʯ("������", ����ʯͷ��, "2")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("ñ��", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")

    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "3")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "3")
    ���ܴ�ʯ("������", ����ʯͷ��, "3")
    ���ܴ�ʯ("������", ����ʯͷ��, "3")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("ñ��", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")

    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "4")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "4")
    ���ܴ�ʯ("������", ����ʯͷ��, "4")
    ���ܴ�ʯ("������", ����ʯͷ��, "4")
else
    ���ܴ�ʯ("����", ����ʯͷ��, "1234")
    ���ܴ�ʯ("����", ��Ƕʯͷ��, "1234")
    ���ܴ�ʯ("����", ��Ƕʯͷ��, "1234")
    ���ܴ�ʯ("����", ��Ƕʯͷ��, "1234")
    ���ܴ�ʯ("���", ��Ƕʯͷ��, "1234")
    ���ܴ�ʯ("����ӡ", ��Ƕʯͷ��, "1234")

    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "1")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "1")
    ���ܴ�ʯ("������", ����ʯͷ��, "1")
    ���ܴ�ʯ("������", ����ʯͷ��, "1")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")
    ���ܴ�ʯ("ñ��", ����ʯͷ��, "1")
    ���ܴ�ʯ("����", ����ʯͷ��, "1")

    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "2")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "2")
    ���ܴ�ʯ("������", ����ʯͷ��, "2")
    ���ܴ�ʯ("������", ����ʯͷ��, "2")

    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "3")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "3")
    ���ܴ�ʯ("������", ����ʯͷ��, "3")
    ���ܴ�ʯ("������", ����ʯͷ��, "3")

    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "4")
    ���ܴ�ʯ("��ָ��", ����ʯͷ��, "4")
    ���ܴ�ʯ("������", ����ʯͷ��, "4")
    ���ܴ�ʯ("������", ����ʯͷ��, "4")

    ���ܴ�ʯ("����", ��Ƕʯͷ��, "2")
    ���ܴ�ʯ("����", ��Ƕʯͷ��, "3")
    ���ܴ�ʯ("����", ��Ƕʯͷ��, "4")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "2")
    ���ܴ�ʯ("����", ����ʯͷ��, "2")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "3")
    ���ܴ�ʯ("����", ����ʯͷ��, "3")
    ���ܴ�ʯ("ñ��", ����ʯͷ��, "3")

    ���ܴ�ʯ("�·�", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("Ь��", ����ʯͷ��, "4")
    ���ܴ�ʯ("����", ����ʯͷ��, "4")
    ���ܴ�ʯ("ñ��", ����ʯͷ��, "4")
end


