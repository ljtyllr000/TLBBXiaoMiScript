skillList = {
    "��ս��Ұ", "��ɨǬ��"
}

while true do
    for _, skillName in pairs(skillList) do
        if �жϼ�����ȴ(skillName) == 1 then
            ����_������()
            ��ʱ(100)
            local HideSkillID = ��ȡ����ID(skillName)
            ʹ�ü���(HideSkillID)
        end
        ��ʱ(200)
    end
end