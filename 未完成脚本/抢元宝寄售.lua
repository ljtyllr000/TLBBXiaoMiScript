ȡ����Ʒ("���")
��ͼѰ·("����", 160, 181)
��ʱ(1000)
local _, npcID, _, _, _, _, _, _, _, _ = ������Χ��Ʒ(1, "͡͡", 3)
�Ի�NPC("͡͡")
��ʱ(500)
-- CommisionStall.lua
while true do
    NPC�����Ի�("����Ԫ��") -- TODO
    ��ʱ(110)
    for g_grad = 0, 2 do
        -- TODO �л�����ͬ���͵�Ԫ����
        LUA_Call(string.format([[

        ]], g_grad))
        ��ʱ(500)

        -- ����Ԫ��
        LUA_Call(string.format([[
            npcID = %d
            g_grad = %d
            if(g_grad<=2)then
                -- Ԫ����
				g_Type = 1
			else
				g_Type = 2
			end
            for idx = 1, 3 then
                -- Ŀǰ���۵����٣��������20����ֻ����ǰ3�����ݼ���
                local theAction = CommisionShop:EnumAction(idx-1);
                if theAction:GetID() ~= 0 then
                    local Sailer = CommisionShop:EnumItem(tonumber(g_Type-1),tonumber(idx-1),"serial");

                    Clear_XSCRIPT();
                        Set_XSCRIPT_Function_Name("Buy");
                        Set_XSCRIPT_ScriptID(800116);
                        Set_XSCRIPT_Parameter(0,tonumber(npcID));
                        Set_XSCRIPT_Parameter(1,tonumber(g_grad));
                        Set_XSCRIPT_Parameter(2,tonumber(Sailer));
                        Set_XSCRIPT_ParamCount(3);
                    Send_XSCRIPT();
                end
            end
        ]], npcID, g_grad))  -- TODO g_gradΪ��0,1,2���ֱ��Ӧ��������50��Ԫ����200��Ԫ����500��Ԫ��
    end
end