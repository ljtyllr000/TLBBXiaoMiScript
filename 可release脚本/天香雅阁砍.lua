ȡ����Ʒ("������")
��ʱ(1000)
KJLCount = tonumber(��ȡ������Ʒ����("������"))

LUA_Call(string.format([[
	g_NationalDay_KanJia_CurIndex = %d    -- 0~17
	g_NationalDay_KanJia_Num = %d
	Clear_XSCRIPT()
		Set_XSCRIPT_Function_Name("NatiaonalShopCut")
		Set_XSCRIPT_ScriptID(893158)
		Set_XSCRIPT_Parameter(0, 1)
		Set_XSCRIPT_Parameter(1, g_NationalDay_KanJia_CurIndex)
		Set_XSCRIPT_Parameter(2, g_NationalDay_KanJia_Num)
		Set_XSCRIPT_ParamCount(3)
	Send_XSCRIPT()
]], 17, KJLCount))
��ʱ(2000)
LUA_Call([[setmetatable(_G, {__index = MessageBox_Self2_Env});MessageBox_Self2_Ok_Clicked();]])


��ʱ(2000)

for i = 0, 4 do
    LUA_Call(string.format([[
		nIndex = %d
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("NatiaonalShopCutFanLi")
			Set_XSCRIPT_ScriptID(893158)
			Set_XSCRIPT_Parameter(0,nIndex)
			Set_XSCRIPT_ParamCount(1)
		Send_XSCRIPT()
	]], i))
end

��ʱ(1000)
ִ�й���("�Զ����")