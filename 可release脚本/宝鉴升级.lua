function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function CheckBaoJian()
    local isMaxLevel = LUA_ȡ����ֵ([[
        local totalLevel = 0
        for i = 0, 4 do
            local BaoYuLevel = Player:GetFiveElements_ElementsLevel(i)
            totalLevel = totalLevel + BaoYuLevel
        end

        if totalLevel < 500 then
            return 0
        end
        return 1
    ]])

    if tonumber(isMaxLevel) == 1 then
        MentalTip("�����ȼ�����")
        return 1
    end
    return -1
end

function BaoJianCohesion()
    local isMaxLevel = CheckBaoJian()
    if isMaxLevel == 1 then
        return
    end

    ȡ����Ʒ("���")
    ȡ����Ʒ("��������")
    ��ʱ(1000)
    if ��ȡ������Ʒ����("��������") <= 0 then
        MentalTip("���ϡ��������顿����")
        return
    end

    ��ͼѰ·("������", 113, 200)  -- TODO
    if �Ի�NPC("������") == 1 then
        NPC�����Ի�("���б�������")
        ��ʱ(1000)
    end
    while true do
        if �����Ƿ����("EquipBaoJian_Cohesion") == 1 then
            LUA_Call("setmetatable(_G, {__index = EquipBaoJian_Cohesion__Env});EquipBaoJian_Cohesion_OnOK();")
            ��ʱ(200)
            local notice = ��ȡ������Ϣ(37)
            if notice then
                if string.find(notice, "#{ZZZB_150811_188}", 1, true) then
                    MentalTip("��Ҳ���")
                    ��ʱ(1000)
                    return
                elseif string.find(notice, "#{ZZZB_150811_187}", 1, true) then
                    MentalTip("���ϡ��������顿����")
                    ��ʱ(1000)
                    return
                end
            end
        end
    end
end

-- ------------------- MAIN --------------------------------------------------
BaoJianCohesion()