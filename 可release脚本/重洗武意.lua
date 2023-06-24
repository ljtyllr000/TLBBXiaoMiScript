���������� = { "Ѫ����", "������", "�𹥻�", "������", "������"}
-- ���������Կ�ѡ�� "Ѫ����", "������", "�𹥻�", "������", "������", "����", "����", "�����˺�", "���̼���"

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function GetAttrPoint(attrIndex)
    local attrPoint = LUA_ȡ����ֵ(string.format([[
        local attrIndex = %d
        local point = MaritialSys:GetMaritiaAttrByIndex(attrIndex)
        return point
    ]], attrIndex))
    return tonumber(attrPoint)
end

function WashWuYi(attrIndex)
    LUA_Call(string.format([[
        local nIdx = %d
        Clear_XSCRIPT()
            Set_XSCRIPT_Function_Name( "RecycleAttrPoint" )
            Set_XSCRIPT_ScriptID( 507010 )
            Set_XSCRIPT_Parameter(0, nIdx)
            Set_XSCRIPT_Parameter(1, 1)  -- ����Ϊ0, �Ṻ���ϸ����裬���ǲ���ʹ��
            Set_XSCRIPT_ParamCount(2)
        Send_XSCRIPT()
    ]], attrIndex))
end

function Main()
    local WuYi_ShuXing2Name = {
        [0] = "Ѫ����",
        [1] = "������",
        [2] = "�𹥻�",
        [3] = "������",
        [4] = "������",
        [5] = "����",
        [6] = "����",
        [7] = "�����˺�",
        [8] = "���̼���",
    }

    local ZFXSCount = ��ȡ������Ʒ����("�ϸ�����")
    if ZFXSCount <= 0 then
        MentalTip("��ȷ���������С��ϸ����衿")
        return
    end

    local uselessAttrIndex = {}
    for SXIndex, SXName in pairs(WuYi_ShuXing2Name) do
        local matched = 0
        for k, targetSXName in pairs(����������) do
            if SXName == targetSXName then
                matched = 1
                break
            end
        end
        if matched == 0 then
            uselessAttrIndex[SXIndex] = SXIndex
        end
    end

    for i=8, 0, -1 do
        if uselessAttrIndex[i] ~= nil then
            if ��ȡ������Ʒ����("�ϸ�����") <= 0 then
                MentalTip("��������û�С��ϸ����衿")
                return
            end
			
            local delAttrIndex = uselessAttrIndex[i]
            local currentAttrPoint = GetAttrPoint(delAttrIndex)
            if currentAttrPoint > 0 then
                local canWashCount = 0
                if ZFXSCount > currentAttrPoint then
                    canWashCount = currentAttrPoint
                else
                    canWashCount = ZFXSCount
                end
                MentalTip(string.format("��ʼϴ��%s��, ��ϴ��%d����", WuYi_ShuXing2Name[delAttrIndex], canWashCount))

                for i = 1, canWashCount do
                    WashWuYi(delAttrIndex)
                    ��ʱ(200)
                end
            end
        end
    end
end

-- ------------------------- MAIN ----------------------------------------------------
local keepAttr = ""
for key, value in pairs(����������) do
    keepAttr = keepAttr .. value .. ","
end
MentalTip(string.format("��ʼϴ����, ϴ���������ԣ�%s", keepAttr))
MentalTip(string.format("��ʼϴ����, ϴ���������ԣ�%s", keepAttr))
MentalTip(string.format("��ʼϴ����, ϴ���������ԣ�%s", keepAttr))
ȡ����Ʒ("�ϸ�����")
��ʱ(1000)
while true do
    if ��ȡ������Ʒ����("�ϸ�����") <= 0 then
        MentalTip("��������û�С��ϸ����衿")
        break
    end
    Main()
end
