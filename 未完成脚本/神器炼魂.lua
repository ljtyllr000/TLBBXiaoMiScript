��Ҫ������ = {
    "Ѫ����",
    "������",
    "������",
    "�𹥻�",
    "������",
    "����",
    "��������",
}

allSuperWeapon = "�����ɷ���|���������|�̺����λ�|������Ӱ��|�ܽ����յ�|������Ƶ�|��ˮ�޺۽�|����ŪӰ��|����������|����������|�̺��貨��|̫�������|�ٴ������|�����ͬ��|������ȸ|���̳�Ӱ|�����ҹ|�����ҹ|�󺺺��|����Ǻ�|������˪|��������|���ξ��|����|��ڤ|����|����|����|����|����|����|����"

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function SuperWeaponWash(superWeaponName)
    if string.find(allSuperWeapon, superWeaponName) then
        if �����Ƿ����("SuperWeaponUpNEW") == 1 then
            �Ҽ�ʹ����Ʒ(װ������, 1)  --����2Ϊʹ�ô���1�Σ���ʡ�ԣ�Ĭ��Ϊ1��
            LUA_Call("setmetatable(_G, {__index = SuperWeaponUpNEW_Env});SuperWeaponUpNEW_Buttons_Clicked();")
            ��ʱ(1500)
            break
        end
    end

    ��ʱ(1500)
end

function checkWashAfterAttr()
    local newAttr = LUA_ȡ����ֵ(string.format([[
		local num =  DataPool : Lua_GetRecoinNum();
		local str = ""
		for i = 0, num-1 do
			local tempstr = DataPool :Lua_GetRecoinEnumAttr(i)
			if string.find(tempstr, "#{") then
				local left = string.find(tempstr, "#{")
				local left2 = string.find(tempstr, "}")
				strTemp = GetDictionaryString(string.sub(tempstr, left+2, left2-1))
			end
			str = str..strTemp.."|"
		end
		return  str
	]], "s"))
    local satisfiedCount = 0
    for i = 1, #��Ҫ������ do
        if string.find(newAttr, ��Ҫ������[i]) then
            satisfiedCount = satisfiedCount + 1
        end
    end

    if satisfiedCount == #��Ҫ������ then
        return 1
    end
    return -1
end

function WashShenQi()
	MentalTip("��ʼϴ����")
    LUA_Call(string.format([[
    	local allSuperWeapon = "%s"
		local currNum = DataPool:GetBaseBag_RealMaxNum();
        for i=1, currNum do
            theAction,bLocked = PlayerPackage:EnumItem("base", i-1);  -- szPacketName = "base"��"material"��"quest"
			local sName = theAction:GetName();
			if string.find(allSuperWeapon, sName) ~= nil then
				petEquipCount = petEquipCount + 1
			end
        end
	]], allSuperWeapon, ))


	��ͼѰ·("����", 354, 240);
	��ʱ(1500)
	�Ի�NPC("ŷ����")
	NPC�����Ի�("��������", 0)      --����1���Ի��ı�  ����2:ģ���Ի���0��ʾ��ȷ 1��ʾģ��
	��ʱ(1500)
end