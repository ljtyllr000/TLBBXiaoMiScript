����콵���ѡ�� = "������"

function UseSBTJGift()
    local SBTJGiftCount = ��ȡ������Ʒ����("����콵���")
    for i = 1, SBTJGiftCount do
        �Ҽ�ʹ����Ʒ("����콵���")
        ��ʱ(1000)
        local SBTJGift = { '����ʯ', '������', '������' }
        for index, val in pairs(SBTJGift) do
            if string.find(����콵���ѡ��, val) then
                LUA_Call(string.format([[setmetatable(_G, {__index = OptionalGiftBox_Three_Env});OptionalGiftBox_Three_OnItemClicked(%d)]], index))
                ��ʱ(1000)
                LUA_Call([[setmetatable(_G, {__index = OptionalGiftBox_Three_Env});OptionalGiftBox_Three_OnGetClicked()]])
                break
            end
        end
        ��ʱ(200)
    end
end

-- main --------------------------------------
UseSBTJGift()
