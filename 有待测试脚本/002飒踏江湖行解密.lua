LUA_Call([[ 
	for MisType=0,4 do
		for i=0, 99 do		--���100�����񣬱�֤��������ѭ��
			local nIndex, nTaskID, szDesc, nAwardCount, nNeedCount = LuaFnXinShouZhanLing_GetMissionConfig(i,MisType);
			if nIndex == nil then
				break;
			end

			--�õ���������
			local nFinishCnt, bIsGetPrize = LuaFnXinShouZhanLing_GetMissionData( nTaskID );
			if nFinishCnt == nil or bIsGetPrize == nil then
				break;
			end
			if nFinishCnt>=nNeedCount and bIsGetPrize<=0then		--���>=��Ҫ û��ȡ		
				Clear_XSCRIPT()
					Set_XSCRIPT_Function_Name( "OnGetTaskPrize" )
					Set_XSCRIPT_ScriptID( 998112 )
					Set_XSCRIPT_Parameter( 0, MisType)
					Set_XSCRIPT_Parameter( 1, nTaskID )
					Set_XSCRIPT_ParamCount(2)
				Send_XSCRIPT()	
			end
		end
	end
]])
��ʱ(500)
LUA_Call([[ 
	local level = LuaFnXinShouZhanLing_GetLevel()
	local Putong = LuaFnXinShouZhanLing_GetAwardProgressPutong()
	for i=Putong,level do
		FreshMan_GamePass_Award_GetAward(i,1)
	end

	if LuaFnXinShouZhanLing_GetHaveJingying()>0 then
		local Jingying = LuaFnXinShouZhanLing_GetAwardProgressJingying()
		for i=Jingying,level do
			FreshMan_GamePass_Award_GetAward(i,2)
		end
	end

]])