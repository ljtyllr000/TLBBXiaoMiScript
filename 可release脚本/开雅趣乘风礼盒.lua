
function OpenGift()
    �Ҽ�ʹ����Ʒ("��Ȥ�˷����")
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = SpecialGift_ThreeChoiceTongyong_Env});SpecialGift_ThreeChoiceTongyong_Choose(3)]])  -- ѡ�е������������
    ��ʱ(1000)
    LUA_Call([[setmetatable(_G, {__index = SpecialGift_ThreeChoiceTongyong_Env});SpecialGift_ThreeChoiceTongyong_GetClick()]])
end


function main()
    ��Ļ��ʾ("����ҹ��Ʒ, ���Ǿ�Ʒ��ʹ�ñ����е���Ȥ�˷����, ѡ�������")
    local giftCount = tonumber(��ȡ������Ʒ����("��Ȥ�˷����"))

    local index = 0
    while index < giftCount do
	    OpenGift()
        index = index + 1
		��ʱ(2000)
	end

end



main()