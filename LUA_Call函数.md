### 1����Ằ��
```lua
    LUA_Call("setmetatable(_G, {__index = ChatFrame_Env});Talk : SendChatMessage('guild', '" .. ���ɺ������� .. "');")
```

### 2���򿪰����棬��������Ϣ
```lua
LUA_Call("setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_OnOpenGruidClick();")
��ʱ(3000)
```

### 3����������������
```lua
BangHuiMembersNum = tonumber(LUA_ȡ����ֵ("setmetatable(_G, {__index = NewBangHui_Hygl_Env});return Guild:GetMembersNum(3);"))
for i = 0, BangHuiMembersNum - 1 do
    local guildIdx = tonumber(LUA_ȡ����ֵ("setmetatable(_G, {__index = NewBangHui_Hygl_Env});return Guild:GetShowMembersIdx(" .. tostring(i) .. ");"))
    -- ��ȡ�������е�ǰ�˵�name
    local szMsg = LUA_ȡ����ֵ("setmetatable(_G, {__index = NewBangHui_Hygl_Env});return Guild:GetMembersInfo(" .. tostring(guildIdx) .. ", 'Name');")
    LUA_Call("DataPool:AddFriend(0, '" .. szMsg .. "')")   -- �������ּӺ��ѣ����ڵ�һ�����ѷ���
    ��ʱ(1000)
end
```

### 4����ȡװ��λ���;ö�
```lua
-- downIndex ȡ��װ��ʱʹ�ø�index
-- equipIndex  װ��λ��index����ȡװ��λ��װ����Ϣʱʹ��
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
    [19] = { name = "��Ʒ��", downIndex = "", equipIndex = 9, equipName = "" },
    [20] = { name = "���ϰ�", downIndex = "", equipIndex = 10, equipName = "" },
}
```

```lua
local tem = LUA_ȡ����ֵ(string.format([[
    return EnumAction(%d,"equip"):GetEquipDur()
]], equipIndex))   -- ������� equipIndex
```

### 5����ȡװ��λ��װ��ID
```lua
local tem = LUA_ȡ����ֵ(string.format([[
    return EnumAction(%d,"equip"):GetID()
]], equipIndex))   -- ����� equipIndex
```

### 6����ȡװ��λ��װ������
```lua
LUA_ȡ����ֵ(string.format([[
    return EnumAction(%d,"equip"):GetName()
]], equipIndex))   -- ����� equipIndex
```

### 7����ȡװ��λ��װ���ȼ�
```lua
LUA_ȡ����ֵ(string.format([[
    local  index = %d
    local ID = EnumAction(index,"equip"):GetID()
    if ID > 0 then
        return	DataPool:GetEquipLevel(index)  --װ���ȼ� ����99��
    end
    return -1
]], equipIndex))   -- ����� equipIndex
```

### 8����ȡ������װ���ȼ�
```lua
local aaa = LUA_ȡ����ֵ(string.format([[
    return LifeAbility : Get_Equip_Level(%d);
]], index))     -- index�Ǳ����е�λ�ã���ȡ������Ʒλ��(װ������) - 1
```

### 9����ȡ����װ���Ѵ�׵Ŀ���
```lua
����װ�������� = tonumber(LUA_ȡ����ֵ(string.format([[
    return LifeAbility:GetEquip_HoleCount(%d)
]], index)))      -- index�Ǳ����е�λ�ã���ȡ������Ʒλ��(װ������) - 1
```

### 10������װ�����ǰ3����
```lua
LUA_Call(string.format([[
    Clear_XSCRIPT()
    Set_XSCRIPT_Function_Name("StilettoEx_3")
    Set_XSCRIPT_ScriptID(311200)
    Set_XSCRIPT_Parameter(0,%d)  --װ��λ��
    Set_XSCRIPT_Parameter(1,%d)  --����λ��
    Set_XSCRIPT_ParamCount(2)
    Send_XSCRIPT()
]], ���, nIndex))  -- ��ű�ʾװ���ڱ����е�λ�ã� nIndex��ʾ��ײ����ڱ����е�λ��
```

### 11������װ����׵�4����
```lua
�������� = 2
LUA_Call(string.format([[
    Clear_XSCRIPT()
    Set_XSCRIPT_Function_Name("StilettoEx_4")
    Set_XSCRIPT_ScriptID(311200)
    Set_XSCRIPT_Parameter(0,%d)   --װ��λ��
    Set_XSCRIPT_Parameter(1,%d)   -- ����λ��
    Set_XSCRIPT_Parameter(2,%d)  -- �Ŀ�ʹ�ò�������, 2 ��ʾ���񾫴⣬1 ��ʾ ���֮��
    Set_XSCRIPT_ParamCount(3)
    Send_XSCRIPT()
]], ���, nIndex, ��������))   -- ��ű�ʾװ���ڱ����е�λ�ã� nIndex��ʾ��ײ����ڱ����е�λ�ã���ȡ������Ʒλ��(��ײ���) - 1��, ��������
```

### 12����ȡ����װ����ʯ����
```lua
local tem = LUA_ȡ����ֵ(string.format([[
    local gemcount = LifeAbility:GetEquip_GemCount(%d)
    if gemcount==nil then
        return 0
    end
    return gemcount
]], bHave))  -- ������װ��λ�ã� bHave = ��ȡ������Ʒλ��(װ������) - 1
```

### 13����ȡ������������
```lua
local tem = LUA_ȡ����ֵ(string.format([[
    local ID =EnumAction(18,"equip"):GetID()
    if ID > 0 then
        tem= DataPool:GetKfsData("LIFE")
        return tem
    end
    return -1
]]))
```

### 14��ȡ��װ�����뱳��
```lua
-- 1. ��ͨװ����װ��
LUA_Call(string.format([[ 
    setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click(%d,0)
]], downIndex))  -- �����б��е�downIndex


-- 2. ��ӡ�������װ���ر�Դ�
if װ��λ������ == "����ӡ" then
    LUA_Call("setmetatable(_G, {__index = Xiulian_Env});Xiulian_JueWei_Page_Switch();");
    ��ʱ(2000)
    LUA_Call("setmetatable(_G, {__index = SelfJunXian_Env});SelfJunXian_Equip_Clicked(0);");
    ��ʱ(2000)
elseif װ��λ������ == "���" then
    LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Wuhun_Switch();")
    ��ʱ(2000)
    LUA_Call("setmetatable(_G, {__index =  Wuhun_Env});Wuhun_Equip_Clicked(0);")
    ��ʱ(2000)
end
```




### 15�������̻�����������Ʒ
```lua
-- 1. ����������
NPC�����Ի�("�鿴�����̵�")
��ʱ(1000)
if �����Ƿ����("PS_ShopList") == 1 then
    LUA_Call([[setmetatable(_G, {__index = PS_ShopList_Env}) PS_ShopList_ChangeTabIndex(3)]])
    ��ʱ(1000)
end

-- 2. ������Ʒ
LUA_Call(string.format([[
     PlayerShop:PacketSend_Search(2 , 2, 1, "%s", %d)		
]], ��Ʒ����, qq))  -- ����1��ʾĿ����Ʒ���ƣ� ����2��qq����ʾ�ڼ�ҳ
��ʱ(1500)

-- 3. �������������ǰҳ���Ƚ����֡������������Ƿ����㣬��������
-- -- �����Ҫ������ҳ����������ʹ��ѭ��
local tem = LUA_ȡ����ֵ(string.format([[
    setmetatable(_G, {__index = PS_ShopSearch_Env})
    -- 1ҳ��10�����ݣ����Ա���10��
    for i = 1 ,10 do
        local theAction = EnumAction( i - 1 , "playershop_cur_page")
        if theAction:GetID() ~= 0 then
            --��Ʒ��,������,�����̵�ID,����,�ܼ۸�
            local pName ,pShopName, pShopID ,pCount ,pYB = PlayerShop:GetItemPSInfo( i - 1 )
            if pName ~= nil and pShopID ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
                if pName == "%s" and pCount <= %d and pYB/pCount <= %d then
                   --��������,ֱ�ӷ���
                   PlayerShop:SearchPageBuyItem(i - 1, "item")
                   return true
                end
            end
        end
    end
    return false
]], ����, ����, ���۸�), "b")
```

### 16��������
```lua
LUA_Call(string.format("PlayerPackage:PackUpPacket(%d);", nTheTabIndex))  -- nTheTabIndex��1��ʾ��������2��ʾ������
```

### 17����ʯ����
```lua
local tem = LUA_ȡ����ֵ(string.format([[
    local g_GemItemPos = %d  -- �����б�ʯλ��
    local itemcount = PlayerPackage:GetBagItemNum(g_GemItemPos)
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("OnGemCarve");
        Set_XSCRIPT_ScriptID(800117);
        Set_XSCRIPT_Parameter(0,g_GemItemPos);
        Set_XSCRIPT_Parameter(1,%d);  -- ��������λ��
        Set_XSCRIPT_Parameter(2,135);
        Set_XSCRIPT_Parameter(3, 0);
        Set_XSCRIPT_Parameter(4,itemcount);
        Set_XSCRIPT_ParamCount(5);
    Send_XSCRIPT();
]], LPindex, Needindex), "b")  -- LPindex = ��ȡ������Ʒλ��(��ʯ����) - 1�� Needindex = ��ȡ������Ʒλ��(������������) - 1
```

### 18�������ػݱ���ʣ�����
```lua
local aaa = LUA_ȡ����ֵ(string.format([[
    local nMD = math.mod(DataPool:GetPlayerMission_DataRound(1561),10);
    return nMD 
]]))
```


### 19��װ����ʯ
```lua
LUA_Call(string.format([[
		g_EnchaseEx_Gem_pos=%d  -- �����б�ʯλ��
		g_EnchaseEx_Equip_pos=%d    -- ������װ��λ��
		g_EnchaseEx_Material_pos=%d  -- ��������Ƕ��λ��
		g_EnchaseEx_Gem_hole=%d  -- �ڼ����״�ʯ
		if g_EnchaseEx_Gem_hole > 0 and g_EnchaseEx_Gem_hole < 4 then
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("EnchaseEx_3")
			Set_XSCRIPT_ScriptID(701614)
			Set_XSCRIPT_Parameter(0,g_EnchaseEx_Gem_pos)  -- �����б�ʯλ��
			Set_XSCRIPT_Parameter(1,g_EnchaseEx_Equip_pos)  -- ������װ��λ��
			Set_XSCRIPT_Parameter(2,g_EnchaseEx_Material_pos)  -- ��������Ƕ��λ��
			Set_XSCRIPT_Parameter(3,-1)
			Set_XSCRIPT_Parameter(4,g_EnchaseEx_Gem_hole-1)  -- �ڼ����״�ʯ
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
]], bIndex, bHave, nIndex, ��ʯλ��)) -- ����1�������б�ʯλ��  ����2��������װ��λ��  ����3����������Ƕ��λ��  ����4���ڼ����״�ʯ
```

### 20����������Ϣ
**��ȡ�����Ϣǰ������Ҫ����һ�Σ�������޷���ȡ�����Ϣ**
```lua
LUA_Call("Guild:AskGuildDetailInfo()")
```

### 21�����ִ��ڻ���
```lua
�����Ƿ����("SelfEquip")  -- װ������
�����Ƿ����("NewBangHui_Bhxx") -- ������
�����Ƿ����("PS_ShopSearch")  -- �����̻���������
�����Ƿ����("PS_ShopList")   -- �����̻�鿴�����̵����
�����Ƿ����("MessageBox_Self")  -- ȷ����ȡ����confirm����
�����Ƿ����("YuanbaoShop")   -- Ԫ���̵����
�����Ƿ����("SelfJunXian")  -- ����װ������ӡ��Ϣ����
�����Ƿ����("Wuhun")  -- ����װ���������Ϣ����
�����Ƿ����("EquipLingPai_ShengJie")  -- �������׽���
�����Ƿ����("EquipLingPai_Star")  -- �������ǽ���
�����Ƿ����("EquipLingPai_OperatingSJ")  -- �����������������������
�����Ƿ����("YbMarket")   -- Ǯׯ������Ʒ����
�����Ƿ����("EquipStrengthen")  -- ǿ����������
```

### 22���رմ���
```lua
LUA_Call(string.format([[
    setmetatable(_G, {__index = %s_Env}) this:Hide()  
 ]], strWindowName))  -- �������ֲο�����
```

### 23�����װ���Ƿ�����
```lua
-- ����ֵ"0" ��ʾ�Ѿ�����, > 0��ʾ��װ��
LUA_ȡ����ֵ(string.format([[
    return EnumAction(%d,'equip'):GetID();
]], equipIndex))  -- equipIndex�������list�пɼ�
```

### 24����������
```lua
-- ���׵��ȷ����ť
LUA_Call("setmetatable(_G, {__index = EquipLingPai_ShengJie_Env});EquipLingPai_ShengJie_OnOK();")
```

### 25�����Ʊ�����Ƕ
```lua
LPindex=��ȡ������Ʒλ��(LPname)-1  -- ����������λ��
ZBindex =��ȡ������Ʒλ��(ZBname)-1  -- �����б���λ��
index = 1 -- ����Ҫ��Ƕ��λ�ã������Ʊ����4���ף���ѡΪ1��2��3��4
LUA_Call(string.format([[
        Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name( "RL_SetRs" );
        Set_XSCRIPT_ScriptID( 880001 );
        Set_XSCRIPT_Parameter( 0, %d);  
        Set_XSCRIPT_Parameter( 1, %d-1);  
        Set_XSCRIPT_Parameter( 2, %d );         --- ��Ʒ��������
        Set_XSCRIPT_ParamCount( 3 );
    Send_XSCRIPT();	
]], LPindex,index,ZBindex))
```

### 26_1�����Ʊ�������-ģ����
```lua
-- 1. ѡ��ڼ��ű���
LUA_Call(string.format([[
    setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnActionItemLClicked(%d);
]], BZIndex))  -- BZIndex��ʾ�ڼ��ű��飬��ѡ1��2��3��4

-- 2. ���ȷ����1��
LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
```

### 26_2�����Ʊ�������-����Դ��ű�
```lua
LUA_Call(string.format([[	
    local m_EquipBagIndex = %d
    local nIndex = %d
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name( "RsLevelUp_RL" );
        Set_XSCRIPT_ScriptID( 880001 );
        Set_XSCRIPT_Parameter( 0, m_EquipBagIndex );         --- ���Ʊ�������
        Set_XSCRIPT_Parameter( 1,nIndex - 1   );        --- ��Ƕ�ķ�ʯ����
        Set_XSCRIPT_ParamCount( 2 );
    Send_XSCRIPT();	
]], ����������λ��, ��������λ��))   -- ����1������������λ��  ����2��Ҫ���������ϵ��Ŀű��飨1,2,3,4��
```


### 27_1����������-ģ����
```lua
LUA_Call("setmetatable(_G, {__index = EquipLingPai_Star_Env});EquipLingPai_Star_OnOkClicked();")
```

### 27_2����������-����Դ��ű�
```lua
LUA_Call(string.format([[	
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name( "RL_StarLevelup" );
        Set_XSCRIPT_ScriptID( 880001 );
        Set_XSCRIPT_Parameter( 0, %d);         -- װ����������
        Set_XSCRIPT_Parameter( 1, 0);         -- ����2��0��ʾ������1 �Զ�����ȷ��
        Set_XSCRIPT_ParamCount( 2 );
    Send_XSCRIPT();		
]], ����������λ��))
```


### 28������������ĳ������ĵȼ�
```lua
aaa=  LUA_ȡ����ֵ(string.format([[ 
    local m_EquipBagIndex = %d
    local nIndex = %d
    local uLevel = PlayerPackage:Lua_GetBagItemRl_RsLevel(m_EquipBagIndex , nIndex - 1)
    return uLevel
]], �������,�������))  -- �������Ϊ���������Ƶ�λ�ã��������Ϊ�����ϱ����λ��(��ѡ�1,2,3,4)
```

### 28��������չ��������
```lua
for yyy=1,10 do
    LUA_Call(string.format([[
        local resetExAttrTarget = %s
        LPindex=tonumber(%d)
        -- ��һ����չ����
        local nExAttrID111 , nExAttrStr111 = PlayerPackage:Lua_GetBagRlExAttr(LPindex, 0)
        if string.find(nExAttrStr111, resetExAttrTarget) then
            aaa=1
        else
            aaa=0
        end
        
        -- �ڶ�����չ����
        local  nExAttrID222 , nExAttrStr222 = PlayerPackage:Lua_GetBagRlExAttr(LPindex, 1)
        if string.find(nExAttrStr222, resetExAttrTarget) then
            bbb=1
        else
            bbb=0
        end

        -- ��������չ����
        local  nExAttrID333 , nExAttrStr333 = PlayerPackage:Lua_GetBagRlExAttr(LPindex, 2)
        if string.find(nExAttrStr333, resetExAttrTarget) then
            ccc=1
        else
            ccc=0
        end

        PushDebugMessage(aaa..bbb..ccc)

        if aaa+bbb+ccc ==1 then
            PushDebugMessage("�Ѿ���1��Ѫ��������Ҫ�����ʯ2��")
        elseif  aaa+bbb+ccc ==2 then
            PushDebugMessage("�Ѿ���2��Ѫ��������Ҫ�����ʯ3��")
        elseif  aaa+bbb+ccc ==3 then
            PushDebugMessage("�Ѿ���3��Ѫ������������ϴ����ѭ��")
            return
        end
        
        --��ʼ����
        Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("RlResetExAttr");
        Set_XSCRIPT_ScriptID(880001);
        Set_XSCRIPT_Parameter(0,LPindex);
        Set_XSCRIPT_Parameter(1,aaa);
        Set_XSCRIPT_Parameter(2,bbb);
        Set_XSCRIPT_Parameter(3,ccc);
        Set_XSCRIPT_Parameter(4,0);
        Set_XSCRIPT_ParamCount(5);
        Send_XSCRIPT();	
    ]], "maxhp", ����������λ��))  
    -- ����1�� "maxhp" ��ʾѪ���ޣ��������ޱ���������Ӧ��"equip_attr_resistother_cold"��"equip_attr_resistother_fire"��"equip_attr_resistother_light"��"equip_attr_resistother_poison"    
    -- ����2: ����������λ�ã���ȡ������Ʒλ��(��������)-1
    ��ʱ(2000)--������ʱ�ȴ���������Ӧ
end
```

28����ȡ����������Ϣ
```lua
LUA_ȡ����ֵ(string.format([[ 
        index = %d
        local nType,BaoZhu1,BaoZhu2,BaoZhu3,BaoZhu4,nQual = DataPool:GetLingPaiInfo()
        --local IconName,ItemName = DataPool:GetLingPaiBaoZhuIconName(1)
        if nType> 0 then
            if index == 1 then
                return BaoZhu1
            end
            if index == 2 then
                return BaoZhu2
            end
            if index == 3 then
                return BaoZhu3
            end
            if index == 4 then
                return BaoZhu4
            end	
            if index == 5 then
                return nQual
            end	
        end
        return -1
]], index))
```

### 29��װ����ͨ����
```lua
local tem =LUA_ȡ����ֵ(string.format([[
	    local index = tonumber(%d)
		
		local equip_level = LifeAbility : Get_Equip_Level(index);
		if equip_level <80 then
            PushDebugMessage("װ���ȼ��������ܴ���")
            return 2
		end
		
		local selfMoney = Player:GetData("MONEY") + Player:GetData("MONEY_JZ")
		if selfMoney<50000 then
            PushDebugMessage("����Ҳ���")
            return 2
		end

        local theAction = EnumAction(index, "packageitem")
        JT_ABC=tostring("%s")
        -- ��һ����ͨ
        local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(0);
        if	string.find(pName, JT_ABC)  then	
            JT_AAA=1
            else
            JT_AAA=0
        end
        
        -- �ڶ�����ͨ
        local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(1);		
        if	string.find(pName, JT_ABC)  then
            JT_BBB=1
        else
            JT_BBB=0
        end

        -- ��������ͨ
        local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(2);		
        if string.find(pName,JT_ABC )  then
            JT_CCC=1
        else
            JT_CCC=0
        end	
        
        local JT_shuliang=JT_AAA+JT_BBB+JT_CCC
        if JT_shuliang>=1 then
            local itemneed=PlayerPackage:CountAvailableItemByIDTable(20700063) 
            if itemneed < 15 then
                PushDebugMessage("��𲻹�")
                return 2
            end
        end
		
        PushDebugMessage(JT_AAA..JT_BBB..JT_CCC)
        if JT_AAA+JT_BBB+JT_CCC>=%d then
            PushDebugMessage("%d��ͨ��ϴ�ã����ٴ���")
            return 2
        end

        Clear_XSCRIPT();
            Set_XSCRIPT_Function_Name("EquipCuiLian");
            Set_XSCRIPT_ScriptID(890088);
            Set_XSCRIPT_Parameter(0,%d);
            Set_XSCRIPT_Parameter(1,JT_AAA)
            Set_XSCRIPT_Parameter(2,JT_BBB)
            Set_XSCRIPT_Parameter(3,JT_CCC)
            Set_XSCRIPT_ParamCount(4);
        Send_XSCRIPT();	
		]], LPindex,JT_SHUXING,����,����,LPindex), "d")
-- ����1��LPindex������װ��λ��: LPindex=��ȡ������Ʒλ��(װ������)-1
-- ����2��JT_SHUXING Ŀ�����ԣ�con(����)��attack_cold(��)��attack_fire(��)��attack_light(��)��attack_poison(��)
-- ����3��ϴ��������ͬ������
-- ����4��ϴ��������ͬ������
-- ����5��LPindex������װ��λ��: LPindex=��ȡ������Ʒλ��(װ������)-1
```

### 30����ͨ����
```lua
-- ����
local tem =LUA_ȡ����ֵ(string.format([[
        local index = tonumber(%d)
        local JT_ABC=tostring("%s") 
        local nlevel= tonumber(%d)
        
        local equip_level = LifeAbility : Get_Equip_Level(index);
        if equip_level <80 then
            PushDebugMessage("װ���ȼ�����")
            return 2
        end
		
        local theAction = EnumAction(index, "packageitem")
        -- ��ȡ�������ľ�ͨ���
        local JT_XUHAO=-1   -- ��ͨ���
        for kkk=0,2 do
            local pName, pLevel, pBValue, pPercent, pRValue = theAction:GetEquipAttaProperty(kkk);
            if(pLevel ~= nil and pLevel > 0) then
                if	string.find(pName, JT_ABC)  then	
                    if tonumber(pLevel) < nlevel  then
                        JT_XUHAO= kkk+1
                        JT_MQDJ=pLevel
                    end
                end
            else
                PushDebugMessage("װ��û�д��� �޷�����")
                break	
            end		
        end		
        --PushDebugMessage("װ�������Զ�Ӧλ��:"..JT_XUHAO)
			
        if tonumber(JT_XUHAO)==-1 then
            return 2	
        end		

        -- ������ӵ�еľ���ʯ����
        local itemneed= PlayerPackage:CountAvailableItemByIDTable(20700055)
        -- ��������ȼ���Ҫ����ʯ������
        if tonumber(JT_MQDJ) >= 30 and  tonumber(JT_MQDJ) < 40  then
                JT_XYJJS=14  
        elseif tonumber(JT_MQDJ) >= 20 and  tonumber(JT_MQDJ) < 30  then
				JT_XYJJS=12
        elseif tonumber(JT_MQDJ) >=1 and  tonumber(JT_MQDJ) < 10  then
				JT_XYJJS=1		
        elseif tonumber(JT_MQDJ) >=10 and  tonumber(JT_MQDJ) < 20  then
				JT_XYJJS=6
        elseif tonumber(JT_MQDJ) >=40 and  tonumber(JT_MQDJ) < 50  then
				JT_XYJJS=16
        elseif tonumber(JT_MQDJ) >=50 and  tonumber(JT_MQDJ) < 60  then
				JT_XYJJS=18
        elseif tonumber(JT_MQDJ) >=60 and  tonumber(JT_MQDJ) < 70  then
				JT_XYJJS=20
        elseif tonumber(JT_MQDJ) >=70 and  tonumber(JT_MQDJ) < 80  then
				JT_XYJJS=22
        elseif tonumber(JT_MQDJ) >=80 and  tonumber(JT_MQDJ) < 90  then
				JT_XYJJS=24
        elseif tonumber(JT_MQDJ) >=90 and  tonumber(JT_MQDJ) < 100  then
				JT_XYJJS=25
        else
				 JT_XYJJS=20
        end
        --PushDebugMessage("��Ҫ����ʯ:"..JT_XYJJS)
        if itemneed < JT_XYJJS then
            PushDebugMessage("����ʯ:����")
            return 2
        end
								
        Clear_XSCRIPT();
            Set_XSCRIPT_Function_Name("EquipLevelupAtta");
            Set_XSCRIPT_ScriptID(890088);
            Set_XSCRIPT_Parameter(0,index); 
            Set_XSCRIPT_Parameter(1, tonumber(JT_XUHAO));
            Set_XSCRIPT_Parameter(2, 0);
            Set_XSCRIPT_ParamCount(3);
        Send_XSCRIPT();
		]], LPindex,JT_SHUXING,�ȼ�),"d")
-- ����1�� ������װ��λ��
-- ����2����ͨ���ԣ�con(����)��attack_cold(��)��attack_fire(��)��attack_light(��)��attack_poison(��)
-- ����3����ͨ���������ټ��������ж��Ƿ���Ҫ����
```


### 31����������
```lua
local tem =LUA_ȡ����ֵ(string.format([[
	    local index = tonumber(%d)
	    local todwlevel= tonumber(%d)	
		local IsHaveDiaowen = LifeAbility:IsEquipHaveDiaowen(index)  -- װ���Ƿ��е���
	    local IsHaveDiaowenEx = LifeAbility:IsEquipHaveDiaowenEx(index)
		if  tonumber(IsHaveDiaowen)~=1 then
            PushDebugMessage("װ��û�е���")
            return 2
		end
		
        local dwId,dwlevel = LifeAbility:GetEquitDiaowenID(index)  -- ����ID�͵ȼ�
        local dwIdEx,dwlevelEx = LifeAbility:GetEquitDiaowenIDEx(index)
			
        if dwlevel>=todwlevel then
            PushDebugMessage("�����Ѿ������õȼ�:"..todwlevel)
            return 2
        end
		
        Clear_XSCRIPT()
        Set_XSCRIPT_Function_Name("DoEquipDWLevelUp")
        Set_XSCRIPT_ScriptID(809272)
        Set_XSCRIPT_Parameter(0, index) --���������
        Set_XSCRIPT_Parameter(1, todwlevel)  --��һ������Ҫ�����ĵȼ�
        Set_XSCRIPT_Parameter(2, 0) --�ڶ�������Ҫ�����ĵȼ�
        Set_XSCRIPT_Parameter(3, 0)  --0������ʾֱ���� 1��������ʾ
        Set_XSCRIPT_ParamCount(4)
        Send_XSCRIPT()
]], LPindex,�ȼ�),"n")
-- ����1��LPindex ������װ��λ��
-- ����2������Ҫ�������ټ�
```

### 32�������һ�Ԫ��
```lua
-- 1. �򿪶һ�Ԫ������
LUA_Call(string.format([[
    Clear_XSCRIPT();
    Set_XSCRIPT_Function_Name("AskOpenDuihuanWindow");
    Set_XSCRIPT_ScriptID(181000);
    Set_XSCRIPT_ParamCount(0);
    Send_XSCRIPT();
]]))

-- 2. �����һ�Ԫ��
 LUA_Call(string.format([[
    YB=%d
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("BuyYuanbao");
        Set_XSCRIPT_ScriptID(181000);
        Set_XSCRIPT_Parameter(0,tonumber(YB));
        Set_XSCRIPT_Parameter(1,1);
        Set_XSCRIPT_ParamCount(2);
    Send_XSCRIPT();
]],index), "n")
```

### 33����ȡ�ҵ�ǮׯԪ���г���Ʒ���õĵ���
```lua
for kkk=1 ,10 do
    tem= LUA_ȡ����ֵ(string.format([[ 
        local aaa=tonumber(%d)
        local theAction = EnumAction( aaa - 1 , "ybmarket_self")
        if theAction:GetID() ~= 0 then
            local pName , nowStatus ,price, itemlefttime = Auction:GetMySellBoxItemAuctionInfo(aaa- 1 )
            if pName ~= nil  then 
                g_itemNum = Auction:GetMySellBoxItemNum(aaa-1)
                --PushDebugMessage("[����]Ԫ���������Ʒ�¼�:"..pName)
                if  pName=="%s" then
                    if nowStatus == 1 then
                        return g_itemNum
                        --Auction:GetBackWhatOnSale(2 , aaa - 1  ,1)
                    elseif nowStatus == 2 then
                        Auction:GetBackExpired(2 , aaa- 1  ,1)
                    elseif  nowStatus ==  3 then
                        Auction:GetMoney(2 , aaa- 1 )
                    end
                end	
            end
        end			
        return -1
    ]], kkk,strKey), "n",1)
    -- kkk ��ʾ�����۵Ķ��ٸ���Ʒ
    -- strKey ��ʾ��Ʒ����
end
```

### 34��Ǯׯ����������Ʒ��ȡ�г���
```lua
-- ����ָ����Ʒ
LUA_Call(string.format([[ 
    Auction:PacketSend_Search(2, 1, 1, "%s", 1) 
        -- ����1���Ϸ������ͣ�2 ����Ʒ�г�, 1 �������г�, 3 ��װ���г�
        -- ����2����ߵ������ͣ����ϵ���һ��Ϊ 1~8
        -- ����3������ʽ��
        -- ����4����Ʒ����
        -- ����5���ڼ�ҳ
]], strKey), "s",1) -- strKey��ʾ��Ʒ����

-- ��ȡ��Ʒ��ǰ�г���ͼ�
local wupindanjia=LUA_ȡ����ֵ(string.format([[ 
    local pName , pSeller ,pCount ,pYB = Auction:GetItemAuctionInfo(0)
    if pName =="%s" and pSeller ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
        local AAA=pYB/pCount
        --PushDebugMessage(pName.."��͵���:"..AAA)
        return AAA
    end
]], strKey), "s",1) -- strKey��ʾ��Ʒ����
```

### 35��Ǯׯ�����ϼ���Ʒ
```lua
LUA_Call(string.format([[ 
    Auction:PacketSend_SellItem(tonumber(%d) , tonumber(%d) ,1) 
]],nIndex,bbb), "s",1)
-- ����1��nIndex��ʾ��Ʒ�ڱ����е�λ��
-- ����2��bbb ��ʾ�ϼ���Ʒ���ܼ�
```

### 36��Ǯׯ���۸ļ�
```lua
for kkk=1 ,10 do
    LUA_Call(string.format([[ 
        g_Cur_Modify_Type =2
        g_Index =%d-1
        wantguidh, wantguidl = Auction:GetMyAuctionSellBoxItemGuid(g_Index)
        Auction:ChangePrice(g_Cur_Modify_Type ,g_Index , tonumber(%d), wantguidh, wantguidl)		
    ]], kkk,bbb), "n",1)
    -- ����1����ʾ�ҵĵڼ������ϼ���Ʒ
    -- ����2��bbb ��ʾ�ϼ���Ʒ���ܼ�
end 
```

### 37�����ߺ���
```lua
-- 1. �ַ����з�ת��Ϊ�б�
function SplitString(str, sep)
    -- strΪԭʼ�ַ����� sepΪ�ָ���ʶ���ţ��� |��/��
    local tmp = {}
    for w in string.gmatch(str, string.format("([^%q]+)", sep)) do
        table.insert(tmp, w)
    end
    return tmp
end

-- 2. ������ʾ
function ������ʾ(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#cFF0000".."��ʾ��".."#cFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
	]], strCode))
end
```


### 38��������Ҳ���
```lua
-- 1. ����ʽ���
LUA_Call([[setmetatable(_G, {__index = Packet_Temporary_Env})]])

-- 2. ͳ��
```

### 39��ͳ���������ָ����Ʒ����
```lua
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
]], name))  -- nameΪָ����Ʒ������
```

### 40���Ҽ�������������Ʒȡ��
```lua
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
]], name))  -- name ΪҪȡ����ָ����Ʒ����
```


### 41����ȡ����������
```lua
local tem = LUA_ȡ����ֵ(string.format([[
    local ZoneWorldID = DataPool:GetSelfZoneWorldID()  -- ��ǰ������ID
    local strName = DataPool:GetServerName( ZoneWorldID )  -- ��ǰ������name
    return strName
]]))
```

### 42������ӡ����
```lua
LUA_Call("SelfJunXian_EquipHXYLevelup();")
```


### 43��������������Ʒ
```lua
-- 1. �ж��Ƿ��
if �Ƿ�� ==0 or �Ƿ�� == nil then
    tbangding =10
elseif  �Ƿ�� ==1 then
    tbangding = 0
elseif  �Ƿ�� ==2 then
    tbangding = 1
end
for i=0,199 do
    tem = LUA_ȡ����ֵ(string.format([[
        tbangding =tostring("%s")
        i =%d
        ttname = "%s"
        local theAction=EnumAction(i,"packageitem")
        local GetName=theAction:GetName()   -- ��Ʒ����
        local szItemNum =theAction:GetNum();   -- ��Ʒ����
        local Status=GetItemBindStatus(i);   -- ��Ʒ��״̬
            if GetName~=nil and GetName ~="" then
                if string.find(ttname,GetName ) then
                    if string.find(tbangding,tostring(Status)) then
                        PushDebugMessage("������Ʒ:"..GetName.."|����λ��:"..i)
                        return 1
                    end	
                end
            end
        return -1
    ]],tbangding, i,��Ʒ����))
end


-- 2. ��������������������������
LUA_ȡ����ֵ([[
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
```

### 44����ȡ������װ����������
```lua
local tem =LUA_ȡ����ֵ(string.format([[
    local equipQual =PlayerPackage:GetSuperWeaponQual(%d)
    return equipQual
]], ������װ��λ��), "n")   -- ������װ��λ�ã���ȡ������Ʒλ��(װ������)-1
```


### 45��������԰����
```lua
local nBeginIndex, nGridNum = Bank:GetRentBoxInfo(8);
local nActIndex = nBeginIndex;
for i = 1, nGridNum do
    local theAction, bLocked = Bank:EnumItem(nActIndex);
    if theAction:GetID() ~= 0 then
        local itemName = theAction:GetName()
    end
end
```


### 46���Ҿֿ߲�
```lua
local g_FurnitureInnerType = {
    [0] = { Name = "����", Pos = 1, Type = 1 },
    [1] = { Name = "��", Pos = 1, Type = 2 },
    [2] = { Name = "����", Pos = 1, Type = 3 },
    [3] = { Name = "�輸", Pos = 1, Type = 4 },
    [4] = { Name = "��", Pos = 1, Type = 5 },
    [5] = { Name = "��", Pos = 1, Type = 6 },
    [6] = { Name = "���", Pos = 1, Type = 7 },
    [7] = { Name = "����", Pos = 1, Type = 8 },
    [8] = { Name = "����", Pos = 1, Type = 9 },
    [9] = { Name = "װ��", Pos = 1, Type = 10 },
    [10] = { Name = "����", Pos = 1, Type = 11 },
    [11] = { Name = "��̺", Pos = 1, Type = 12 },
}
local g_FurnitureOuterType = {
    [0] = { Name = "ͥԺ��", Pos = 0, Type = 1 },
    [1] = { Name = "ͥԺ��", Pos = 0, Type = 2 },
    [2] = { Name = "��Ȫ", Pos = 0, Type = 3 },
    [3] = { Name = "Ӱ��", Pos = 0, Type = 4 },
    [4] = { Name = "���", Pos = 0, Type = 5 },
    [5] = { Name = "��", Pos = 0, Type = 6 },
    [6] = { Name = "��ʯ", Pos = 0, Type = 7 },
    [7] = { Name = "��ľ", Pos = 0, Type = 8 },
    [8] = { Name = "ֲ��", Pos = 0, Type = 9 },
    [9] = { Name = "����", Pos = 0, Type = 10 },
    [10] = { Name = "����", Pos = 0, Type = 11 },
    [11] = { Name = "����", Pos = 0, Type = 12 },
}

-- ͥԺ�ֿ��У�ĳ�����͵ļҾ��ж�����
local nXiYouCount = BieYeFurniture:GetFurTypeCntQulityInTbl(5, g_FurnitureOuterType[i].Type, g_FurnitureOuterType[i].Pos, 0)
for j = 1, nXiYouCount do
    local nQuality = BieYeFurniture:GetFurQulityInTbl(5, g_FurnitureOuterType[i].Type, g_FurnitureOuterType[i].Pos, 0, j)
    local nName = BieYeFurniture:GetFurNamenTbl(5, g_FurnitureOuterType[i].Type, g_FurnitureOuterType[i].Pos, 0, j)
end

-- ���Ҳֿ��У�ĳ�����͵ļҾ��ж�����
local nXiYouCount = BieYeFurniture:GetFurTypeCntQulityInTbl(5, g_FurnitureInnerType[i].Type, g_FurnitureInnerType[i].Pos, 0)
for j = 1, nXiYouCount do
    local nQuality = BieYeFurniture:GetFurQulityInTbl(5, g_FurnitureInnerType[i].Type, g_FurnitureInnerType[i].Pos, 0, j)
    local nName = BieYeFurniture:GetFurNamenTbl(5, g_FurnitureInnerType[i].Type, g_FurnitureInnerType[i].Pos, 0, j)
end
```

### 47���Ҽ�ʹ����Ʒ
```lua
--�������
LUA_Call(string.format([[
    local theAction = EnumAction(%d, "packageitem");
    if theAction:GetID() ~= 0 then
        setmetatable(_G, {__index = Packet_Env});
        local oldid = Packet_Space_Line1_Row1_button:GetActionItem();
        Packet_Space_Line1_Row1_button:SetActionItem(theAction:GetID());
        Packet_Space_Line1_Row1_button:DoAction();
        Packet_Space_Line1_Row1_button:SetActionItem(oldid);
    end
]], itemPos))   -- itemPos Ϊ��������Ʒ��λ��
```

### 48��(�д�����)���ط�����VIP��˲Ӱ������λ/����
```lua
--
-- 1. ���׷��Ķ�λ
LUA_Call(string.format([[
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("SetPosition");
        Set_XSCRIPT_ScriptID(330059);
        Set_XSCRIPT_Parameter(0, %d)
        Set_XSCRIPT_Parameter(1, %d)
        Set_XSCRIPT_ParamCount(2)
    Send_XSCRIPT();
]], CTFLPos, CTFLIndex))
-- ����1�����ط�������������ȡ������Ʒλ��("���ط���") - 1
-- ����2��ʹ�ó��׷��ĵڼ�������λ���Ķ�λ

-- 2. VIP˲Ӱ�����Ķ�λ
LUA_Call(string.format([[
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("SetPosition");
        Set_XSCRIPT_ScriptID(330061);
        Set_XSCRIPT_Parameter(0, %d)
        Set_XSCRIPT_Parameter(1, %d)
        Set_XSCRIPT_ParamCount(2)
    Send_XSCRIPT();
]], SYFLPos, SYFLIndex))
-- ����1��˲Ӱ��������������ȡ������Ʒλ��("˲Ӱ����") - 1
-- ����2��ʹ��˲Ӱ�����ĵڼ�������λ���Ķ�λ

-- 3. ���׷��ɶ�λ
LUA_Call(string.format([[
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("SetUISelIdx");
        Set_XSCRIPT_ScriptID(330059);
        Set_XSCRIPT_Parameter(0, %d)
        Set_XSCRIPT_Parameter(1, %d)
        Set_XSCRIPT_ParamCount(2);
    Send_XSCRIPT();
    PlayerPackage:UseItem(Client_ItemIndex)
]], CTFLPos, CTFLIndex))
-- ����1�����ط�������������ȡ������Ʒλ��("���ط���") - 1
-- ����2��ʹ�ó��׷��ĵڼ�������λ�÷ɶ�λ

-- 4. ˲Ӱ�����ɶ�λ
LUA_Call(string.format([[
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("SetUISelIdx");
        Set_XSCRIPT_ScriptID(330061);
        Set_XSCRIPT_Parameter(0, %d)
        Set_XSCRIPT_Parameter(1, %d)
        Set_XSCRIPT_ParamCount(2);
    Send_XSCRIPT();
    PlayerPackage:UseItem(Client_ItemIndex)
]], SYFLPos, SYFLIndex))
-- ����1��˲Ӱ��������������ȡ������Ʒλ��("˲Ӱ����") - 1
-- ����2��ʹ��˲Ӱ�����ĵڼ�������λ�÷ɶ�λ
```


### 49��(�д�����)���ط����������
```lua
-- 1. ʹ�ð�Ԫ������
LUA_Call(string.format([[
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("YuanbaoBind_AddFuZhou");
        Set_XSCRIPT_ScriptID(330059);
        Set_XSCRIPT_Parameter(0, %d);
        Set_XSCRIPT_ParamCount(1);
    Send_XSCRIPT();
]], SYFLPos)) -- ����1�����ط�������������ȡ������Ʒλ��("���ط���") - 1

-- 2. ʹ��Ԫ������
LUA_Call(string.format([[
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("Yuanbao_AddFuZhou");
        Set_XSCRIPT_ScriptID(330059);
        Set_XSCRIPT_Parameter(0, %d);
        Set_XSCRIPT_ParamCount(1);
    Send_XSCRIPT();
]], SYFLPos)) -- ����1�����ط�������������ȡ������Ʒλ��("���ط���") - 1

-- 3. ��֪����ʲô, ȷ�ϲ���
LUA_Call(string.format([[
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("AddFuZhou");
        Set_XSCRIPT_ScriptID(330059);
        Set_XSCRIPT_Parameter(0, Client_ItemIndex)
        Set_XSCRIPT_ParamCount(1);
    Send_XSCRIPT();
]], SYFLPos)) -- ����1�����ط�������������ȡ������Ʒλ��("���ط���") - 1
```

### 50��(�д�����)���׷���Ϣ
```lua
-- 1. ��������һ�α����г��׷������ݣ���Ȼ�޷���ȡ����
LUA_Call([[
    PlayerPackage:AskDunJiaShuPosInfo()
]])

-- 2. ��ȡ���׷�ÿ����ť��������Ϣ
-- �ܹ���3ҳ��ÿҳ��10������
LUA_Call(string.format([[
    local flPos = %d
    for pageNum = 1, 3 do
        for i = 1, 10 do
            local nIdx = (pageNum-1)*10 + i-1
            -- ����id����ͼ���֣��������ô�����X���꣬Y���꣬�Ƿ��һ��ʹ��
            local sceneid, strText, count, posx, posy, init = PlayerPackage:GetDunJiaShuPosInfo(flPos, nIdx)
        end
    end 
]], FLPos))  -- ����1��������������ȡ������Ʒλ��("���ط���") - 1
```

### 51��(�д�����)˲Ӱ������Ϣ
```lua
-- 1. ��������һ�α����г��׷������ݣ���Ȼ�޷���ȡ����
LUA_Call([[
    PlayerPackage:AskDunJiaShuPosInfo()
]])

-- 2. ��ȡ���׷�ÿ����ť��������Ϣ
-- �ܹ���3ҳ��ÿҳ��10������
LUA_Call(string.format([[
    local flPos = %d
    for pageNum = 1, 3 do
        for i = 1, 10 do
            local nIdx = (pageNum-1)*10 + i-1
            -- ����id����ͼ���֣�X���꣬Y���꣬���������ô�����������
            local sceneid, strText, posx, posy, usedCount, maxUseCount = PlayerPackage:GetDunJiaShuVIPPosInfo(flPos, nIdx)
        end
    end 
]], FLPos))  -- ����1��������������ȡ������Ʒλ��("���ط���") - 1
```

### 52���������Ե�
```lua
local g_Martial_WuYi_ShuXingLevelPoint = {
    [1] = 750, --Ѫ����	
    [2] = 10, --������	
    [3] = 10, --�𹥻�	
    [4] = 10, --������	
    [5] = 10, --������	
    [6] = 110, --����	
    [7] = 35, --����	
    [8] = 13, --�����˺�
    [9] = 13, --���̼���
    [10] = 5, --��������
    [11] = 100, --�⹦����
    [12] = 100, --�ڹ�����
}
local g_Martial_WuYi_ShuXing2Name = {
    [1] = "Ѫ����",
    [2] = "������",
    [3] = "�𹥻�",
    [4] = "������",
    [5] = "������",
    [6] = "����",
    [7] = "����",
    [8] = "�����˺�",
    [9] = "���̼���",
    [10] = "��������",
    [11] = "�⹦����",
    [12] = "�ڹ�����",
}

LUA_Call([[
    local data = MaritialSys:GetMaritiaAttrInfo()  -- ��������
    if(data ~= nil) then
		g_Martial_WuYi_ShuXing2Name = {}
		g_Martial_WuYi_ShuXingLevelPoint = {}
	end
    for i, v in ipairs(data) do
        g_Martial_WuYi_ShuXing2Name[v[1] + 1] = v[2];
        g_Martial_WuYi_ShuXingLevelPoint[v[1] + 1] = v[3];
    end
]])
```

### 53������ȼ���Ϣ
```lua
LUA_Call("
    local data = MaritialSys:GetMartialLevelInfo()
    
    if(data ~= nil) then
		g_Martial_WuYi_LevelExp = {}
		g_Martial_TalenLayerNeedLevel = {}
		g_Martial_WuYi_LevelAttrPoint = {}
		g_Martial_WuYi_LevelTalentPoint = {}
		g_Martial_WuYi_LevelLimit = {}
	end
	
	for i,v in ipairs(data) do
		local nLayer = v[5]
		g_Martial_WuYi_LevelExp[v[1]] = v[2]
		g_Martial_WuYi_LevelAttrPoint[v[1]] = v[3]
		g_Martial_WuYi_LevelTalentPoint[v[1]] = v[4]
		g_Martial_WuYi_LevelLimit[v[1]] = v[6]
 		if(nLayer ~= 0 and (g_Martial_TalenLayerNeedLevel[nLayer] == nil or g_Martial_TalenLayerNeedLevel[nLayer] > v[1])) then
			g_Martial_TalenLayerNeedLevel[nLayer] = v[1]
		end
	end
")
```

### 54���������Խ�������
```lua
-- 1. ���������ˢ����
LUA_Call([[
    local nWuYiMonsterNum = MaritialSys:GetMaritialTodayNum()
]])

-- 2. ����Ķ౶����ˢ����
LUA_Call([[
    local nMultiWuYiMonsterNum = MaritialSys:GetMaritiaLTodayMultiNum()
]])

-- 3. ����ʣ������ˢ����
LUA_Call([[
    local nMonsterNum,nReward = MaritialSys:GetLastDayMonster()
]])

-- 4. �ɷ������
LUA_Call([[
    local nRemainPoint = MaritialSys:GetMaritiaRemainPoint()
]])

-- 5. ���ⶳ��״̬
LUA_Call([[
    local nState = MaritialSys:GetMaritiaFreezeState()
]])

-- 6. ����ȼ�
LUA_Call([[
    local nMartialLevel = MaritialSys:GetMaritiaLevel()
]])

-- 7. ��ǰ���⾭��
LUA_Call([[
    local nCurExp = MaritialSys:GetMaritiaExp()
]])
```

### 55�� �����츳��������
```lua
-- 1. �츳��Ϣ, �츳��������Ϣ������Ϊһ��table
LUA_Call([[
    local data = MaritialSys:GetTalentDescInfo()
]])

-- 2. �����츳�ȼ�
LUA_Call([[
    for i=1,5 do
		local nId,nLevel = MaritialSys:GetTalentLevelBylayerID(i - 1)
    end
]])

-- 3. �츳�ɷ����
LUA_Call([[
    local nRemain = MaritialSys:GetTalentRemainPoint()
]])
```

### 56������ӵ�
```lua
LUA_Call([[
    Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "AddAttr" )
		Set_XSCRIPT_ScriptID( 507010 )
	Send_XSCRIPT()
]])
```

### 57������ϴ��
```lua
LUA_Call(string.format([[
    local nIdx = %d
    --����ӿڽű�
    local g_Martial_WuYi_ScriptId = 507010 
    local g_Martial_WuYi_YuanbaoPay=1 -- �Ƿ�ʹ��Ԫ������
    -- ����ϴ�����ID
    local g_Martial_WuYi_ReclyItemID = 38002046
    local g_Martial_WuYi_ReclyItemID1 = 38002047
    local nValue = MaritialSys:GetMaritiaAttrByIndex(nIdx)  -- ĳ�����Եĵ���
    
    -- ���ϴ������Ƿ����
    local bExist = IsItemExist(g_Martial_WuYi_ReclyItemID)
	local bExist1 = IsItemExist(g_Martial_WuYi_ReclyItemID1)
	
	-- �ж��Ƿ���ϴ��ȷ��
	local bComfirm = Martial_WuYi_Top_xidianqueren:GetCheck()
	
	-- ϴ��
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name( "RecycleAttrPoint" )
		Set_XSCRIPT_ScriptID( g_Martial_WuYi_ScriptId )
		Set_XSCRIPT_Parameter(0,nIdx)
		Set_XSCRIPT_Parameter(1, 1)  -- ����Ϊ0, �Ṻ���ϸ����裬���ǲ���ʹ��
		Set_XSCRIPT_ParamCount(2)
	Send_XSCRIPT()
]], pointIndex)) -- ����1����ϴ�����Ե�����
```


### 58������Ա��Ϣ
```lua
-- 1. �������Ա��Ϣ����������һ�Σ������޷���ȡ����
LUA_Call([[
    Guild:AskGuildMembersInfo();
]])

-- 2. ��Ա��Ϣ
LUA_Call([[
    local totalNum = Guild:GetMembersNum(4);
		local i = 0;
		while i < totalNum do
			local guildIdx = Guild:GetShowMembersIdx(i);
			local color,strTips = Guild:GetMembersInfo(guildIdx, "ShowColor");
			szMsg = Guild:GetMembersInfo(guildIdx, "Name");   -- ��Ա����
			local FirstManGuid = Guild:GetMembersInfo(guildIdx, "FirstManGuid");
			local tPos = Guild:GetMembersInfo(guildIdx, "Position")  -- ְλ
			local level = Guild:GetMembersInfo(guildIdx, "Level")   -- �ȼ�
			local nMenpai = Guild:GetMembersInfo(guildIdx, "MenPai")  -- ����
			local nContriPerWeek = Guild:GetMembersInfo(guildIdx, "ContriPerWeek")   -- ÿ�ܰﹱ
			local nEquipPoint = Guild:GetMembersInfo(guildIdx, "EquipPoint")   -- װ������
			local nguid = Guild:GetMembersInfo(guildIdx, "GUID")
]])
```

### 59����������
```lua
LUA_Call([[
    setmetatable(_G, {__index = Packet_Temporary_Env})  
    local szName = "%s"
    for i = 1, 120 do
        local theAction, bLocked = Bank:EnumTemItem(i - 1)
        if theAction:GetID() ~= 0 then
            local szName = theAction:GetName()
        end
    end
]])
```

### 60�������Ҽ�ȡ����Ʒ
```lua
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
	]],name))  -- name��ʾҪȡ����Ʒ����
```

### 61��(�д�����)����Buff
```lua
LUA_Call([[
    -- ��ȡ������ϵ�buff����
    local buff_num = Player:GetBuffNumber();  
    if ( buff_num > 30 ) then
		buff_num = 30;
	end
	
	-- ����buffIndex�б�
	local BUFFINDEX_LIST = {};
	for jj=1,IMPACT_NUM do
		BUFFINDEX_LIST[jj] = -1;
	end
	
	-- buff���ȼ��б�
	local BuffPriority = {}   
	for jj=1,buff_num do
		BuffPriority[jj] = {}
		BuffPriority[jj].key = jj-1;
		BuffPriority[jj].val = Player:GetBuffPriorityByIndex(jj-1);
	end
	
    -- �������ȼ��Ӹߵ�������buff
    for jj=buff_num,1,-1 do   
		for kk=1,jj-1 do
			if BuffPriority[kk].val < BuffPriority[kk+1].val then
				BuffPriority[kk],BuffPriority[kk+1] = BuffPriority[kk+1],BuffPriority[kk]
			end
		end
	end
	
	-- ��buffIndex�����ȼ�����
	for jj=1,buff_num do
		BUFFINDEX_LIST[jj] = BuffPriority[jj].key;
	end
	
	local i = 0;
    while i<buff_num do
        szIconName = Player:GetBuffIconNameByIndex(BUFFINDEX_LIST[i+1]);  -- buff���֣�
        szToolTips = Player:GetBuffToolTipsByIndex(BUFFINDEX_LIST[i+1]);
        szTimeText = Player:GetBuffTimeTextByIndex(BUFFINDEX_LIST[i+1]);  -- buffʣ��ʱ��
]])
```


### 62����ȡװ��������
```lua
-- ��ȡ������װ�����������ԣ���ƴ�ӳ��ַ���
LUA_Call(string.format([[
    local index = %d
    local theAction = EnumAction(index, "packageitem")
    if theAction:GetID() ~= 0 then
        local icon =  tostring(LifeAbility : Get_Item_Icon_Name(index))
        local num = theAction:GetEquipAttrCount()  -- װ����������
		local str = ""
		for i = 0, num-1 do
			local tempstr = theAction:EnumEquipExtAttr(i)  -- ��ȡÿһ������
			local strTemp = ""
            if string.find(tempstr, "#{") then
                local left = string.find(tempstr, "#{")
                local left2 = string.find(tempstr, "}")
                strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))	
            end 
			str = str..strTemp
		end
		return str
    end
]], Index))  -- IndexΪװ���ڱ����е���������ȡ����λ��(xxx) - 1
```


### 63��ȡװ����ϴ�������
```lua
local isWQ = LUA_ȡ����ֵ(string.format([[
    local num =  DataPool : Lua_GetRecoinNum();
	local str = ""
	for i = 0, num-1 do
		local tempstr = DataPool :Lua_GetRecoinEnumAttr(i)
		local strTemp = ""
		if string.find(tempstr, "#{") then
			local left = string.find(tempstr, "#{")
			local left2 = string.find(tempstr, "}")
			strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))	
		end 
        str = str..strTemp.."|"
	end
	return  str
	]], "s"))
```


### 64����ӡ����
```lua
LUA_Call([[
    Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name( "HXY_LevelUp" )
		Set_XSCRIPT_ScriptID( 880006 )
		Set_XSCRIPT_ParamCount( 0 );
	Send_XSCRIPT();
]])
```


### 65����ӡ����Ч������/����
```lua
-- 1. ��ȡ����Ч��
LUA_Call([[
    for i=1,7 do
        --    ����         ����ȼ�  �������蹦ѫ  ����������ӡ�ȼ�   ֵ
        local nIndex , iEffectLevel, iCost , iNeedHXYLevel , iValue = DataPool:Lua_GetHXYEffect( i - 1 )
        local nAddValueEffect = DataPool:Lua_GetHXYEffectRefixValue( i - 1 )   -- ???
        local strExAttr = strExAttr = DataPool:Lua_GetHXYExAttrInfo( i - 1 )  -- ???
        local nRefixValue = DataPool:Lua_GetHXYExAttrRefixValue( i - 1 )    -- ???
    end
]])

-- 2. �������
LUA_Call(string.format([[
    Clear_XSCRIPT()
		Set_XSCRIPT_ScriptID( 880006 )
		Set_XSCRIPT_Function_Name( "HXY_EffectLevelUp" )
		Set_XSCRIPT_Parameter( 0, %d )
		Set_XSCRIPT_Parameter( 1 , 1)
		Set_XSCRIPT_ParamCount( 2 )
	Send_XSCRIPT()
]], aryIndex))  -- aryIndex Ϊ�����������0~6
```

### 66���ؼ���Ϣ
```lua
-- 1. �����Լ���3���ؼ�
LUA_Call([[
    for Index = 1, 3 do
        local theAction = EnumAction(Index - 1, "combobook")
        if (theAction:GetID() ~= 0 ) then
            local nSumSkill = GetActionNum("skill");  -- ��ȡ�ؼ��ļ���������һ��Ϊ3��
            local bookname = Player:GetComboBookInfo(Index, "bookname");  -- �ؼ�����
            local bookitemid = Player:GetComboBookInfo(Index, "bookitemId");   -- �ؼ�ID
            local bookdesc = Player:GetComboBookInfo(Index, "bookdesc");    -- �ؼ�����
            local nLevel = Player:GetComboBookInfo(Index, "level");  -- �ؼ��ȼ�
            local skill1, skill2, skill3 = Player:GetComboBookInfo(Index, "comboskill");  -- �ؼ���3�����ܵ�ID�����ܾ�ʽ���Ƽ�ʽ������ʽ
            local rate1, rate2 = Player:GetComboBookInfo(Index, "rate");  -- ������һ�����ܵĸ���
            local nextrate1, nextrage2 = Player : GetComboBookInfo(Index, "nextlevelrate");
            local levelupneed =  Player : GetComboBookInfo(Index, "nextlevelexp");  -- ������һ����Ҫ�ľ���
            local nextlevelallxiuwei = Player : GetComboBookInfo(Index, "allxiuwei");  -- �ؼ���������Ϊ
        end
]])

-- 2. ��ȡ�Լ�����Ϊ��Ϣ
LUA_Call([[
    local xiuweivalue =  Player : GetData( "XIUWEI" );  -- �Լ���ǰ��Ϊֵ
    local tilte,level = SelfMiji_GetXiuWeiLevel(xiuweivalue)
    local nextlevelneed = GetXiuweiNextNeed(xiuweivalue)
    local lilianvalue =  Player : GetData( "LILIAN" );  ����ֵ
]])

-- 3.�����ؼ��ļ���
LUA_Call([[
    local nSumSkill = GetActionNum("skill");  -- ��ȡ�ؼ��ļ���������һ��Ϊ3��
    local skill1, skill2, skill3 = Player:GetComboBookInfo(Index, "comboskill");
    for i = 1, nSumSkill do
        local thetempAction = EnumAction(i, "skill");
        local temp = thetempAction:GetID();
        local nCommonId = LifeAbility : GetLifeAbility_Number(temp);
        if nCommonId == skill1 then 
            local combobookSkill1Name = thetempAction:GetName()
        end
    end
]])

-- 4.����ĳ���ؼ�
LUA_Call(string.format([[
    Clear_XSCRIPT();
		Set_XSCRIPT_Function_Name("CheckDeleteBook");
		Set_XSCRIPT_ScriptID(890099);
		Set_XSCRIPT_Parameter(0,Index);
		Set_XSCRIPT_ParamCount(1);
	Send_XSCRIPT();
]], miJiIndex))  -- miJiIndex�ؼ�������0,1,2

-- 5. �ؼ�����
LUA_Call(string.format([[
    AskLevelupComboBook(%d);
]], miJiIndex))   -- miJiIndex�ؼ�������0,1,2
```


### 67����������
```lua
LUA_Call(string.format([[
    local g_SuperWeapon9_Change_WeaponIndex = %d
    local n9ID,str9WG,n8ID,str8WG,n5ID,str5WG,needMoney = PlayerPackage:GetSuperWeapon9WG(g_SuperWeapon9_Change_WeaponIndex,"tbl")
]], Index)) -- Index��ɶ��������������λ�ã�

-- 2. 9����������
LUA_Call([[
    local nSkillId = DataPool:GetSuperWeaponDIYSkillId()
	if nSkillId == nil or nSkillId <= 0 then
	    -- δ������������
		return
	end

    local theActionSkill = EnumAction(0 , "superweapondiyskill");
    if theActionSkill:GetID() ~= 0 then 
        local slotLevel = DataPool:GetSuperWeaponDIYSkillSlotLevel(1)
        if slotLevel ~= nil and slotLevel > 0 then
            PushDebugMessage("���ܿ���")
        end
    end
]])

-- 3. 9������3�����ܵȼ�
local g_SuperWeapon9_DIYSkill_Data = 
{
	[1] = { itemId = 38002040, bindId = 38002041, nameText = "#{JXSQ_170804_67}", lockText = "#{JXSQ_170804_70}", title = "#{JXSQ_170804_92}", costText = "#{JXSQ_170804_98}", itemText = "#{JXSQ_170804_102}", itemTextRed = "#{JXSQ_170829_265}", itemTip = "#{JXSQ_170829_219}", levelTip = "#{JXSQ_170829_207}", },
	[2] = { itemId = 38002042, bindId = 38002043, nameText = "#{JXSQ_170804_68}", lockText = "#{JXSQ_170804_71}", title = "#{JXSQ_170804_93}", costText = "#{JXSQ_170804_99}", itemText = "#{JXSQ_170804_103}", itemTextRed = "#{JXSQ_170829_266}", itemTip = "#{JXSQ_170829_220}", levelTip = "#{JXSQ_170829_247}", },
	[3] = { itemId = 38002044, bindId = 38002045, nameText = "#{JXSQ_170804_69}", lockText = "#{JXSQ_170804_72}", title = "#{JXSQ_170804_94}", costText = "#{JXSQ_170804_100}", itemText = "#{JXSQ_170804_104}", itemTextRed = "#{JXSQ_170829_267}", itemTip = "#{JXSQ_170829_221}", levelTip = "#{JXSQ_170829_248}", },
}

LUA_Call([[
    for nIndex = 1,3 do
        local slotLevel = DataPool:GetSuperWeaponDIYSkillSlotLevel(nIndex)   -- ��ȡ��ǰ��nIndex����۵ĵȼ�
        if slotLevel == nil or slotLevel <= 0 then
            return
        end
        
        -- 3�������ÿ��������Ҫ��������
        local nCostNum, nCostMoney = DataPool:GetSuperWeaponDIYSkillLevelupData(slotLevel, nIndex)
        if nCostNum ~= nil and nCostNum > 0 then
			local nItemId = g_SuperWeapon9_DIYSkill_Data[nIndex].itemId
			local itemName = PlayerPackage:GetItemName(nItemId)
        end
        
        -- ��õ�ǰ��ۼ���
        local impactIndex = DataPool:GetSuperWeaponDIYSkillImpactIndex(nIndex)
        if impactIndex == nil or impactIndex <= 0 then
            return
        end	
        local slotType, nCostNum, nSkillId = DataPool:GetSuperWeaponDIYSkillActiveData(impactIndex)
        if nCostNum == nil or nCostNum < 0 or nSkillId == nil or nSkillId <= 0 then
            return
        end
        local bRet,skillName = DataPool:GetSkillName(nSkillId)  -- ����id��ȡ��������
    end
]])

-- 4. ��ȡ������������
LUA_Call([[
    for nIndex=1,3 do
        -- 1��ʾ����2��ʾ�ػ���3��ʾ�����
        local itemId = g_SuperWeapon9_DIYSkill_Data[nIndex].itemId  -- ���󶨻���ID
		local bindId = g_SuperWeapon9_DIYSkill_Data[nIndex].bindId  -- �󶨻���ID
		local itemNum = PlayerPackage:CountAvailableItemByIDTable(itemId)  -- ���󶨻�������
		local bindNum = PlayerPackage:CountAvailableItemByIDTable(bindId)   -- �󶨻�������
    end
]])


-- 5. ����3���������
LUA_Call(string.format([[
    local objCared = DataPool:GetCurDialogNpcId();
    g_TargetServerID = Get_XParam_INT(0);   -- �Ƿ�ᱨ��
    g_ObjCared = objCared
    
    local g_TargetServerID = %d
    local g_SuperWeapon9_DIYSkill_WeaponIndex = %d
    local nIndex = %d
    Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name("SuperWeaponDIYSkill_LevelupSlot")
		Set_XSCRIPT_ScriptID(892471)
		Set_XSCRIPT_Parameter(0, g_TargetServerID)
		Set_XSCRIPT_Parameter(1, g_SuperWeapon9_DIYSkill_WeaponIndex)
		Set_XSCRIPT_Parameter(2, nIndex)
		Set_XSCRIPT_Parameter(3, 0)
		Set_XSCRIPT_ParamCount(4)
	Send_XSCRIPT()
]], a, b, c))
-- ����1��������
-- ����2������������������
-- ����3���ڼ������
```


### 68��(�д�����)�����б�
```lua
-- 1. �����б���
-- ����  Special ���⴦��
-- ���  Special ���⴦��
-- ʦ��  Special ���⴦��
-- ͽ��  Special ���⴦��
-- ��
-- ��
-- ��
-- ��
-- ������
-- ����
-- ���
-- ��ʱ����
-- ���ξ���     ��������


-- 2. 8����ͨ��
LUA_Call([[
    for i = 1 , 8 do   -- 8����ͨ��
		local j = i
		if i == 8 then
			j = 13
		end
		
		local FriendCount = 0 --��������
        local FriendInfo = {} --����������������ߺ�������
        FriendInfo[j] = ""
		for iTmp = 1, 4 do
            FriendCount = FriendCount + DataPool:GetFriendNumber( tonumber( iTmp ) );
            local groupCount = DataPool:GetFriendNumberCommon( tonumber( iTmp ) );--ÿ������
            local onlienCount= DataPool:GetFriendOnlineNumberCommon( tonumber( iTmp ) );--ÿ����������
        end
        
        
        -- ��ǰchannel�ĺ��������� j ��Χ��1~7, 13
        local relealFriendNumber = DataPool:GetFriendNumber( tonumber( j ) )  
]])


-- ÿ��channel������ΪIndex���û���Ϣ
LUA_Call([[
    for i = 1 , 8 do   -- 8����ͨ��
		local nChannel = i
		if i == 8 then
			nChannel = 13
		end
		
		-- ��ǰchannel�ĺ��������� j ��Χ��1~7, 13
        local relealFriendNumber = DataPool:GetFriendNumber( tonumber( nChannel ) ) 
        
        local nIndex = 0;
        while nIndex < relealFriendNumber do
            local name = DataPool:GetFriend( nChannel, nIndex, "NAME" );  -- ����
            local remark =  Friend_GetSpecialRemark( nChannel, nIndex )     -- ��ע
            local emotion = DataPool:GetFriend( nChannel, nIndex, "MOOD" );     -- ����
            local friendship = DataPool:GetFriend( nChannel, nIndex, "FRIENDSHIP" );    -- �Ѻöȣ�����
            local relationtype = DataPool:GetFriend( nChannel, nIndex, "RELATION_TYPE" );   -- ��ϵ�� 7:ʦ�� 8��ͽ�� 3����� 2�����
            local imOnlineTime = DataPool:GetFriend( nChannel, nIndex, "IM_ONLINE_TIME" );
            local IMst = DataPool:GetFriend( nChannel, nIndex, "IM_STATUS" );
            local Sex = DataPool:GetFriend( nChannel, nIndex, "SEX" );
            local haveMsg = DataPool:GetFriend( nChannel, nIndex, "MSG" );
            local guid =  DataPool:GetFriend( nChannel, nIndex, "ID" );  -- ID
            local havePresent = DataPool:GetFriend(nChannel, nIndex, "FRIEND_PRESENT" );
            local nLevel = DataPool:GetFriend(nChannel, nIndex, "LEVEL");
            local zoneWorldID = DataPool:GetFriend(nChannel, nIndex, "ZONEWORLDID" )  -- ���ѵķ�����ID
            local selfZoneWorldID = DataPool:GetSelfZoneWorldID()  -- �ҵķ�����ID
        end
]])

```


### 69��������
```lua
LUA_Call(string.format([[
    local zfIndex = %d
    Clear_XSCRIPT();
        Set_XSCRIPT_Function_Name("QueryLevel");
        Set_XSCRIPT_ScriptID(891175);
        Set_XSCRIPT_Parameter(0,index);
        Set_XSCRIPT_ParamCount(1);
    Send_XSCRIPT();	

]], zfIndex))  
-- zfIndex ������
```


### 70��(�д�����)Ŀ��Target����
```lua
LUA_Call([[
    local szName = Guild:GetMembersInfo(tonumber(currentGuildListIndex), "Name");

	if(nil ~= szName) then
		Target:SelectThePlayer(szName);
	end
]])


LUA_Call([[
    Target:SelectThePlayer(szSingleName,tZoneWorldId);
]])

```