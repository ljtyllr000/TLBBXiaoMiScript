ָ����꼼�� = {
    "����֮��",
    "ǿ��֮��",
    "��ʴ��"
}

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetMyMoney()
    local myMoney = LUA_ȡ����ֵ([[
        local myMoney = Player:GetData('MONEY') + Player:GetData('MONEY_JZ')
        return myMoney
    ]])
    return tonumber(myMoney)
end

function main()
    MentalTip("�����Ϸ�����, ��ϴ���3������")
    ȡ����Ʒ("���ʯ|���")
    if ��ȡ������Ʒ����("���ʯ") <= 0 then
        MentalTip("�����С����ʯ����������, �˳�")
        return
    end

    if GetMyMoney() < 5 * 10000 then
        MentalTip("��Ҳ���, �˳�")
        return
    end
    LUA_Call([[setmetatable(_G, {__index = Wuhun_Env});Wuhun_Equip_Clicked( 0 );]])  -- ժ�����

    ��ͼѰ·("����", 140, 195)
    ��ʱ(1500)
    �Ի�NPC("������")
    ��ʱ(1000)
    NPC�����Ի�("��ϴ��꼼��")
    ��ʱ(1000)

    local pos1 = ��ȡ������Ʒλ��("������")
    local pos2 = ��ȡ������Ʒλ��("������")
    if tonumber(pos1) ~= 0 then
        �Ҽ�ʹ����Ʒ("������")
    else
        �Ҽ�ʹ����Ʒ("������")
    end
    ��ʱ(1000)

    local wuHunSkill = ""
    for index, skillName in pairs(ָ����꼼��) do
        if skillName ~= "" then
            if wuHunSkill ~= "" then
                wuHunSkill = wuHunSkill .. '|' .. skillName
            else
                wuHunSkill = wuHunSkill .. skillName
            end
        end
    end

    local tmp = 0
    for k, v in pairs(ָ����꼼��) do
        local ret = LUA_ȡ����ֵ(string.format([[
            local targetWuHunSkill = "%s"

            for i = 0, 2 do
                local oldSkillDesc = DataPool:GetKFSSkillDesc(0,i)
                if string.find(oldSkillDesc, targetWuHunSkill) then
                    return 1
                end
            end
            return -1
        ]], v))
        if tonumber(ret) == 1 then
            tmp = tmp + 1
        end
    end
    if tmp == #ָ����꼼�� then
        MentalTip("�������������Ŀ�꼼��, ������ϴ")
        return
    end

    local count = 1
    while true do
        if GetMyMoney() < 5 * 10000 or ��ȡ������Ʒ����("���ʯ") <= 0 then
            MentalTip("���ϡ����ʯ�����Ҳ���, �˳�")
            break
        end

        MentalTip(string.format("��ʼ��%d����ϴ", count))
        LUA_Call([[setmetatable(_G, {__index = NewWuhunSkillStudy_Env});NewWuhunSkillStudy_OK_Clicked();]])
        ��ʱ(500)
        local newCount = 0
        for x, y in pairs(ָ����꼼��) do
            local ret = LUA_ȡ����ֵ(string.format([[
                local targetWuHunSkill = "%s"

                for i = 0, 2 do
                    local newSkillDesc =  DataPool : GetKFSNewSkillDesc(0,i);
                    if string.find(newSkillDesc, targetWuHunSkill) then
                        return 1
                    end
                end
                return -1
            ]], y))

            if tonumber(ret) == 1 then
                newCount = newCount + 1
            end
        end

        if newCount == #ָ����꼼�� then
            LUA_Call([[setmetatable(_G, {__index = NewWuhunSkillStudy_Env});NewWuhunSkill_SaveChange_OK()]])
            MentalTip("��ϴ��꼼�����")
            break
        else
            MentalTip(string.format("�����С�%d����������������", newCount))
        end
        count = count + 1
        ��ʱ(200)
    end
end

-- -------------------------- MAIN ----------------------
main()