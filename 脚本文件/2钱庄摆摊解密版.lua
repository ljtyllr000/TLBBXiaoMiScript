g_��̯λ�� = { 80, 55 }

g_��ҳ = 0    --0��Ʒ 1����

g_������Ʒ = {
    ["���ʯ������1����"] = 0.7,
    ["���ʯ���ƣ�1����"] = 0.7,
    ["����飨3����"] = 70,
    ["�����ϻ�"] = 500,
}



LUA_ȡ����ֵ("StallSale:CloseStall('cancel');")	��ʱ(1000)

local str = ""
for k,v in pairs(g_������Ʒ) do
	str = str .. k .. "|"
end
ȡ����Ʒ(str)
��ͼѰ·("Ǯׯ",g_��̯λ��[1],g_��̯λ��[2])	��ʱ(1000)

--��̯
while �����Ƿ����("StallSale")==0 do
	����_������()
	LUA_ȡ����ֵ("PlayerPackage:OpenStallSaleFrame();StallSale:AgreeBeginStall();")	��ʱ(1000)
end

--��ҳ��
LUA_ȡ����ֵ("StallSale:SetDefaultPage("..g_��ҳ..")")	��ʱ(1000)

--�ϼ���Ʒ
for k,v in pairs(g_������Ʒ) do
	local name = k
	local money = v
	for i=0,199 do
		local ret = LUA_ȡ����ֵ(string.format([[
			local i = %d
			setmetatable(_G, {__index = Packet_Env});
			local theAction = EnumAction(i, "packageitem");
			local id = theAction:GetID();
			if id~=0 then
				if theAction:GetName()=="%s" then
					Packet_Space_Line10_Row10_button:SetActionItem(id);
					Packet_Space_Line10_Row10_button:DoAction();
					return 1
				end
			end
		]],i,name))
		if ret=="1" then
			��ʱ(1000)
			LUA_ȡ����ֵ(string.format([[
				local theAction = EnumAction(%d, "packageitem");
				local id = theAction:GetID();
				if id~=0 then
					local num = theAction:GetNum();
					local name = theAction:GetName();
					local money = %s * num
					if money<1 then money=1 end
					PushDebugMessage("��Ʒ["..name.."]"..num.."�� "..tostring(money))
					StallSale:ReferItemPrice(money);
					setmetatable(_G, {__index = InputYuanbao_Env});this:Hide();
					setmetatable(_G, {__index = MessageBox_Self_Env});this:Hide();
				end
			]],i,money))
		end
	end

	local ret = LUA_ȡ����ֵ(string.format([[
		local idx = -1
		for i=0,9 do
			local szPetName,szOn = Pet:GetPetList_Appoint(i);
			if szPetName~="" then
				idx = idx + 1
			end
			if PlayerPackage:IsPetLock(i)~=1 and szPetName=="%s" then
				PushDebugMessage("����["..szPetName.."] "..%s)
				Exchange:AddPet(idx);
				return 1
			end
		end
	]],name,money))
	if ret=="1" then
		��ʱ(1000)
		LUA_ȡ����ֵ(string.format([[
			StallSale:PetUpStall(%s);
			setmetatable(_G, {__index = InputYuanbao_Env});this:Hide();
			setmetatable(_G, {__index = MessageBox_Self_Env});this:Hide();
		]],money))
	end

end
