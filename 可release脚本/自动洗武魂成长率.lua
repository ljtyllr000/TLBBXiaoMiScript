�ò��󶨵�ϴ = 0
�ð󶨵�ϴ = 1

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

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

function GetWornWHName()
    local tem = LUA_ȡ����ֵ("return EnumAction(18,'equip'):GetName();")
    return tem
end

function GetWornWHID()
    local tem = LUA_ȡ����ֵ("return EnumAction(18,'equip'):GetID();")
    return tonumber(tem)
end

function GetWornWHINFO(index)
    if not index then
        index = 1
    end
    local tem = LUA_ȡ����ֵ(string.format([[
		local index=%d
		local tem = -1
		local wuhution=EnumAction(18,"equip")
		local id  =wuhution:GetID();
		if  id > 0 then
			if index == 1 then
				tem = 	DataPool:GetKfsData("NAME")  -- ����
			elseif index == 2 then	
				 tem = DataPool:GetKfsData("EXTRALEVEL")  --�ϳɵȼ�
			elseif index == 3 then
				 tem =DataPool:GetKfsData("LEVEL");  --�ȼ�
			elseif index == 4 then
				 tem =DataPool:GetKfsData("LIFE");  --����		
			elseif index == 5 then
				 tem =LifeAbility:GetWearedEquip_HoleCount(18); --�������
			elseif index == 6 then
				 tem =DataPool:GetKfsData("EXP");  --��ǰ����
			elseif index == 7 then
				 tem =DataPool:GetKfsData("NEEDEXP");  --�����				
			elseif index == 8 then	  --���Թ���
					tem =""
					for i=1,10 do
						local iText , iValue = DataPool:GetKfsFixAttrEx(i - 1)		
						if iText ~= nil and iText ~= "" and iValue ~= nil and iValue > 0  then
							tem =tem..iText.."|"
						end		
					end
			elseif index == 9 then	
				return id
			end
		end	--ID 
			return tem
		]], index))
    return tem
end

function DownWornWH(index)
    if not index then
        if GetWornWHINFO(4) <= 0 then
            MentalTip("���û��������ִ��")
            return 0
        end
    end

    if GetWornWHID() > 0 then
        WHName = GetWornWHName()
        MentalTip(string.format("�������Ϊ ��%s��", WHName))
    else
        MentalTip("������û���")
        return 0
    end

    for i = 1, 5 do
        LUA_Call("MainMenuBar_SelfEquip_Clicked();", -1)
        ��ʱ(2000)
        if �����Ƿ����("SelfEquip") then
            --ͬ������ �ȴ����ڳ���()
            LUA_Call("setmetatable(_G, {__index = Wuhun_Env});Wuhun_Equip_Clicked(0);")
            ��ʱ(2000)
            if LUA_ȡ����ֵ("return EnumAction(18,'equip'):GetID();") == "0" then
                --�������װ���ɹ�
                LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();", -1)
                ��ʱ(500)
                return tostring(WHName)
            end
        end
    end

    LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();", -1)
    ��ʱ(1500)

    if GetWornWHID() == 0 then
        return tostring(WHName)
    else
        return 0
    end
end

function GetDownedWHBKIndex(WHName, WHEXTRALEVEL, isBind)
    if isBind == 0 or not isBind then
        tbangding = 10
    elseif isBind == 1 then
        tbangding = 0
    elseif isBind == 2 then
        tbangding = 1
    end

    local tem = LUA_ȡ����ֵ(string.format([[
        local tolvele = tonumber(%d)
        local tbangding = tostring("%s")
        name = "%s"
        for i=0,99 do
            local theAction = EnumAction(i,"packageitem")
            local ID = theAction:GetID();
            if ID > 0 then
                local GetName=theAction:GetName();
                if string.find(name,GetName) then
                    local Status = GetItemBindStatus(i);
                    local level = PlayerPackage:GetBagKfsData(i,"EXTRALEVEL")
                    if string.find(tbangding,tostring(Status)) then
                        if level == tolvele then
                            return i
                        end
                    end
                end
            end
        end
        return    -1
			]], WHEXTRALEVEL, tbangding, WHName))
    return tonumber(tem)
end


function UseItem(index) --�������
	LUA_Call(string.format([[
		local theAction = EnumAction(%d, "packageitem");
		if theAction:GetID() ~= 0 then
				setmetatable(_G, {__index = Packet_Env});
				local oldid = Packet_Space_Line1_Row1_button:GetActionItem();
				Packet_Space_Line1_Row1_button:SetActionItem(theAction:GetID());
				Packet_Space_Line1_Row1_button:DoAction();
				Packet_Space_Line1_Row1_button:SetActionItem(oldid);
		end
	]], index))
end

function WashBKWH(BKIndex)
    LUA_Call(string.format([[
        m_Equip_Idx = %d
        g_YBCheck = %d
        PlayerPackage:Kfs_Op_Do(12, m_Equip_Idx, 0, 0, g_YBCheck)
    ]], BKIndex, 1))

end

function main()
    ȡ����Ʒ("������ʯ")
    ȡ����Ʒ("���")
    ����Ʒ("������ʯ", ������Ʒ, 0, 1, 1)
    local WHEXTRALEVEL = GetWornWHINFO(2)
    local WHName = GetWornWHINFO(1)
	DownWornWH(1)
    local BKIndex = GetDownedWHBKIndex(WHName, WHEXTRALEVEL, 2)
    MentalTip('ժ�µ�����ڱ����е�����Ϊ' .. BKIndex)
	MoveToPos("����",138,195)
    local HTSSNum = ��ȡ������Ʒ����("������ʯ")
    for i=1, HTSSNum do
        WashBKWH(BKIndex)
        ��ʱ(500)
    end

	����_������()
	����_������()

	UseItem(BKIndex)


    ����Ʒ("������ʯ")
    ����Ʒ("���")
end


-- main ----------------------------------------------------------------------
main()
