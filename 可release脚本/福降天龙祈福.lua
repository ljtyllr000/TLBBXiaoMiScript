ȡ����Ʒ("������")

��ʱ(2000)

FJLCount = ��ȡ������Ʒ����("������")

if tonumber(FJLCount) > 0 then
	while true do
	    ��ͼѰ·("����",270,256)
		��ʱ(2000)
		local myX = tonumber(��ȡ������Ϣ(7))
		local myY = tonumber(��ȡ������Ϣ(8))
		if myX == 270 and myY == 256 then
			break
		end
	end
	��ʱ(2000)

	�Ի�NPC("���¹�")
	��ʱ(1000)
	NPC�����Ի�("��������")
	��ʱ(2000)
	LUA_Call([[setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_DoBless();]])
	��ʱ(1000)
	LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
	
end


