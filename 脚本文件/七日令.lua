function ������()
	  local tem= LUA_ȡ����ֵ(string.format([[
setmetatable(_G, {__index = Anniversary_Env});
local nTodayCommand,nIndex = GetTodayCommand()
Clear_XSCRIPT()
	Set_XSCRIPT_Function_Name( "CheckCommand" )
	Set_XSCRIPT_ScriptID(232005)
	Set_XSCRIPT_Parameter(0,nIndex)
	Set_XSCRIPT_ParamCount( 1 )
Send_XSCRIPT()
for i=1,7 do
	Anniversary_GetItemPrize(i)
end
		]]), "n",1);	
end

 ������()