---��Ҫ�ĵĲ�����β�� ������Ҫ��
---------------------------------------------------------------------------------------------------------------------------------------


function ����_ȡ����������()
    local tem = LUA_ȡ����ֵ(string.format([[
		local ZoneWorldID = DataPool:GetSelfZoneWorldID()
	local strName = DataPool:GetServerName( ZoneWorldID )
	return strName 
		]]))
    return tem
end

----------------------------------------------------------------------------------------------------
function ����_ȡ̯λ����()
    return LUA_ȡ����ֵ(string.format([[
setmetatable(_G, {__index = StallBuy_Env});
aaa=StallBuy:GetStallerName()
return aaa
 ]]), "s");
end

----------------------------------------------------------------------------------------------------
function ����_������Χ̯λ(��ͼ, XXX, YYY, ������, С�����ƺϼ�)
    if ����_ȡ����������() ~= ������ or С�����ƺϼ� == nil then
        ��Ļ��ʾ("���������Ʋ���,�������ò���")
        return
    end

    ��ͼѰ·(��ͼ, XXX, YYY)
    ID���� = ""
    for KKK = 1, 20 do
        ��Ʒ����, ��ƷID, ��ƷX����, ��ƷY����, ��ƷѪ��, ��Ʒ����, ��Ʒ���, ��Ʒ����, �����ж�, ͷ����ע = ������Χ��Ʒ(1, С�����ƺϼ�, 15.5, ID����)
        if ��ƷID > 0 then
            ID���� = ID���� .. "|" .. ��ƷID
            ��Ļ��ʾ(ID����)
            ��ͼѰ·("Ǯׯ", ��ƷX����, ��ƷY����)
            ��Ļ��ʾ(��Ʒ���� .. ��ƷID .. "��̯λ")
            LUA_Call(string.format([[
	ID =%d
	OpenStallSale(ID)
 ]], ��ƷID), "n");
            ��ʱ(3000)

            if �����Ƿ����("StallBuy") then
                if ����_ȡ̯λ����() == ��Ʒ���� then
                    for i = 0, 19 do
                        local tem = LUA_ȡ����ֵ(string.format([[
                            i=%d
                            local theAction = EnumAction(i, "st_other");
                            g_nCurSelectItemID = theAction:GetID();
                            local nItemName = StallBuy:GetItemName(g_nCurSelectItemID);
                            local nItemNum  = StallBuy:GetItemNum(g_nCurSelectItemID);
                            local nPriceYuanbao = StallBuy:GetPrice("item", i);
                            AA=i+1
                            if nItemName  then

                            if  tonumber(nPriceYuanbao) < 500 then      ----�Լ��ļ۸�  100���� ���۳��������ļ۸�

                                PushDebugMessage(AA..".   ��Ʒ����"..nItemName.."����:"..nItemNum.."����:"..nPriceYuanbao);
                                StallBuy:BuyItem(g_nCurSelectItemID,i);
                                return 1
                            else
                                PushDebugMessage(AA..".    ��Ʒ����"..nItemName.."����:"..nItemNum.."����:"..nPriceYuanbao.."|������");
                            end
                            else
                                PushDebugMessage(AA.."û����Ʒ��ʱ2��");
                            end
                         ]], i), "n");
                        if tonumber(tem) == 1 then
                            ��ʱ(2000)
                        else
                            ��ʱ(50)
                        end
                    end
                end
            end
        end
    end
end

while true do
    ����_������Χ̯λ("Ǯׯ", 73, 57, "��ɱ", "��ɽ�ϵ����� ")---��Ҫ�ĵĲ���
    --����_������Χ̯λ("Ǯׯ",60,30,"��ɱ")
end
