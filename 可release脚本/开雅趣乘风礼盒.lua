
function OpenGift()
    �Ҽ�ʹ����Ʒ("��Ȥ�˷����")
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = SpecialGift_ThreeChoiceTongyong_Env});SpecialGift_ThreeChoiceTongyong_Choose(3)]])  -- ѡ�е������������
    ��ʱ(500)
    LUA_Call([[setmetatable(_G, {__index = SpecialGift_ThreeChoiceTongyong_Env});SpecialGift_ThreeChoiceTongyong_GetClick()]])
end


function main()
    ��Ļ��ʾ("����ҹ��Ʒ, ���Ǿ�Ʒ��ʹ�ñ����е���Ȥ�˷����, ѡ�������")
    local giftCount = tonumber(��ȡ������Ʒ����("��Ȥ�˷����"))
	
	for i = 1,giftCount do
	    OpenGift()
		��ʱ(1000)
	end

end



main()