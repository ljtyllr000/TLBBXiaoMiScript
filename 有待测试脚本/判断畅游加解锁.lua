

function judgeProtectTime()
	local judgeRet = LUA_ȡ����ֵ([[
		if (tonumber(DataPool:GetLeftProtectTime()) > 0) then
			return 0
		end
		return 1
	]])
	return tonumber(judgeRet)
end





while true do
	if judgeProtectTime() == 1 then
		��ʱ(2000)
	end
end

while true do
	if tonumber(�ж�ͨ����ȫ��֤()) == 1 then
		break
	end
	��ʱ(10000)
end