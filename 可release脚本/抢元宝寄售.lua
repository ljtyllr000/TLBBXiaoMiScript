ȡ����Ʒ("���")
��ͼѰ·("����", 256, 321)
��ʱ(1000)
�Ի�NPC("͡͡")
��ʱ(500)
NPC�����Ի�("���빺��Ԫ��")
��ʱ(1000)
-- CommisionStall.lua
while true do
    for g_grad = 0, 2 do
        LUA_Call(string.format([[
            setmetatable(_G, {__index = CommisionStall_Env});
            CommisionStall_ChangeTabIndex(%d);
        ]], g_grad + 1))
        ��ʱ(500)

        -- ����Ԫ��
        LUA_Call(string.format([[
            g_grad = %d
            if(g_grad<=2)then
                -- Ԫ����
				g_Type = 1
			else
				g_Type = 2
			end
            for idx = 1, 3 do
                -- Ŀǰ���۵����٣��������20����ֻ����ǰ3�����ݼ���
                local theAction = CommisionShop:EnumAction(idx-1);
                if theAction:GetID() ~= 0 then
                    local Sailer = CommisionShop:EnumItem(tonumber(g_Type-1),tonumber(idx-1),"serial");

                    Clear_XSCRIPT();
                        Set_XSCRIPT_Function_Name("Buy");
                        Set_XSCRIPT_ScriptID(800116);
                        Set_XSCRIPT_Parameter(0,tonumber(191));
                        Set_XSCRIPT_Parameter(1,tonumber(g_grad));
                        Set_XSCRIPT_Parameter(2,tonumber(Sailer));
                        Set_XSCRIPT_ParamCount(3);
                    Send_XSCRIPT();
                end
            end
        ]], g_grad))  -- TODO g_gradΪ��0,1,2���ֱ��Ӧ��������50��Ԫ����200��Ԫ����500��Ԫ��
    end
end