function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetEquipStar(equipIndex)
    -- ��ȡװ������
    local tem = LUA_ȡ����ֵ(string.format([[
        local equipIndex = %d
		local ID = EnumAction(equipIndex,"equip"):GetID()
		if ID > 0 then
			local nQua = DataPool:GetEquipQual(equipIndex)
			return nQua
		end
		return -1
	]], tonumber(equipIndex)))
    return tonumber(tem)
end

function GetWareWeaponName(equipIndex)
    return LUA_ȡ����ֵ(string.format([[
		return EnumAction(%d,"equip"):GetName()
	]], equipIndex))
end

function GetWeaponPkgIndex(weaponName)
    local weaponIndex = LUA_ȡ����ֵ(string.format([[
        local weaponName = "%s"
        local currNum = DataPool:GetBaseBag_Num();
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
            if theAction:GetID() ~= 0 then
                local itemName = theAction:GetName()
                if itemName == weaponName then
                    return i - 1
                end
            end
        end
        return -1
    ]], weaponName))
    return tonumber(weaponIndex)
end

function main()
    ȡ����Ʒ("������")
    ȡ����Ʒ("���")
    ��ͼѰ·("������", 248, 217)
    ��ʱ(500)

    -- ��ȡ��������
    local weaponName = GetWareWeaponName(0)

    -- ȡ������
    LUA_Call([[setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();]])
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = MainMenuBar_Env});MainMenuBar_SelfEquip_Clicked();]])
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_Equip_Click( 11,0 );]])
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();]])

    local weaponIndex = GetWeaponPkgIndex(weaponName)

    for i = 1, 20 do
        if weaponName ~= -1 then
            LUA_Call(string.format([[
            g_ShengJie_WeaponIndex = %d
            Clear_XSCRIPT()
                Set_XSCRIPT_Function_Name("DoSuperWeapon9Up")
                Set_XSCRIPT_ScriptID(702006)
                Set_XSCRIPT_Parameter(0, 2)
                Set_XSCRIPT_Parameter(1, g_ShengJie_WeaponIndex)
                Set_XSCRIPT_ParamCount(2)
            Send_XSCRIPT()
        ]], weaponIndex))
        end
        ��ʱ(150)
    end
    ��ʱ(500)
    �Ҽ�ʹ����Ʒ(weaponName)
end

-- main ---------------------------------------------
main()