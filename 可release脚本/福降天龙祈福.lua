ȡ����Ʒ("������")

��ʱ(2000)

FJLCount = ��ȡ������Ʒ����("������")

if tonumber(FJLCount) > 0 then
	while true do
	    ��ͼѰ·("����",270,256)
		��ʱ(2000)
		local myX = tonumber(��ȡ������Ϣ(7))
		local myY = tonumber(��ȡ������Ϣ(8))
		if myX == 270 and myY == 256 then
			break
		end
	end
	��ʱ(2000)

	�Ի�NPC("���¹�")
	��ʱ(1000)
	NPC�����Ի�("��������")
	��ʱ(2000)
	LUA_Call([[setmetatable(_G, {__index = FuJiangTianLongHD_Env});FuJiangTianLongHD_DoBless();]])
	--LUA_Call([[
	--local bConfirm = tonumber( NpcShop:GetFuJiangTLBuyDirectly() );
	--local isHasFJL = PlayerPackage:CountAvailableItemByIDTable(g_FJL_ItemID) + Bank:GetUnlockTemBankItemCount(g_FJL_ItemID);
	--
	--if isHasFJL >= 1 then
	--	Clear_XSCRIPT();
	--		Set_XSCRIPT_Function_Name( "bConfirm_FJL" );	-- ������
	--		Set_XSCRIPT_ScriptID( 890509 );			-- �ű���
	--		Set_XSCRIPT_ParamCount( 0 );			-- ��������
	--	Send_XSCRIPT();  --2019������
	--elseif ( bConfirm >= 1 ) then
	--	-- ִ�нű�
	--	Clear_XSCRIPT();
	--		Set_XSCRIPT_Function_Name( "DoBless" );	-- ������
	--		Set_XSCRIPT_ScriptID( 890509 );			-- �ű���
	--		Set_XSCRIPT_Parameter( 0, 1 );			-- 0:�ǻ���� 1:�����
	--		Set_XSCRIPT_ParamCount( 1 );			-- ��������
	--	Send_XSCRIPT();
	--
	--]])
	��ʱ(1000)
	LUA_Call([[setmetatable(_G, {__index = MessageBox_Self_Env});MessageBox_Self_OK_Clicked();]])
	
end


