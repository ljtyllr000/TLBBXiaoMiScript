ȡ����Ʒ("�����ľ�")
��ʱ(3000)
if ��ȡ������Ʒ����("�����ľ�") > 0 then
    LUA_Call([[
        Clear_XSCRIPT()
                Set_XSCRIPT_Function_Name("AskActRMBReward")  --�ű��ӿ�
                Set_XSCRIPT_ScriptID(790029) --�ű����
                Set_XSCRIPT_ParamCount(0)
        Send_XSCRIPT()
    ]])

    ��ʱ(2000)

    LUA_Call([[setmetatable(_G, {__index = MessageBox_Self2_Env});MessageBox_Self2_Ok_Clicked();]])

end