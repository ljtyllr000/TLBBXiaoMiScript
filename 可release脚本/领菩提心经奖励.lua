getList = {
    [1] = 2,
    [2] = 2,
    [3] = 2,
    [4] = 1,
    [5] = 2,
    [6] = 2,
    [7] = 2,
    [8] = 1,
    [9] = 1,
    [10] = 2,
    [11] = 1,
}

for g_CurIndex, g_CurChoose in pairs(getList) do
    LUA_Call(string.format([[
		g_CurIndex = %d
		g_CurChoose = %d
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("AskGetReward")
			Set_XSCRIPT_ScriptID(790029)
			Set_XSCRIPT_Parameter(0,g_CurIndex)
			Set_XSCRIPT_Parameter(1,1) -- 0 ��ѣ�1 Ϊ�����ľ������
			Set_XSCRIPT_Parameter(2,g_CurChoose)
			Set_XSCRIPT_ParamCount(3)
		Send_XSCRIPT()
	]], g_CurIndex, g_CurChoose))
    ��ʱ(500)
end

�Ҽ�ʹ����Ʒ("�ƺţ�������Լ������")
