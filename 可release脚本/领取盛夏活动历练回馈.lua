for i=1,4 do
	LUA_Call(string.format([[
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name("GetReward")  
			Set_XSCRIPT_ScriptID(888091) 
			Set_XSCRIPT_Parameter(0,%d);
			Set_XSCRIPT_ParamCount(1)
		Send_XSCRIPT()
	]], i))
	��ʱ(500)
end

ִ�й���("�Զ����")