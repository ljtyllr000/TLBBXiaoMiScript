RMB������ȡ = {		--1��ѡ����� 2��ѡ���ұ�
	[0] = 1,
	[1] = 1,
	[2] = 1,
	[3] = 1,
	[4] = 1,
	[5] = 1,
	[6] = 1,
	[7] = 1,
	[8] = 1,
	[9] = 1,
	[10] = 1,
}

RMB�Զ����� = false 	--true���Զ��� false�ǲ��Զ���

��Ҫ�Զ�ʹ�õ���Ʒ���� = {
	"��Ԫ����",
	"��Ŀ��",
	"�����²���",
	"������",
	"��ɫ��Ԫ����",
	"����ҩ��",
	"��Լ�ľ�����",
}

local function �򿪽���()
    local ret = LUA_ȡ����ֵ([[
		if IsWindowShow('Fuli_ZhanLing2') then
			return 0
		else
			OpenZhanLing(1)
			return 1
		end
	]])
    if ret == "1" then
        ��ʱ(1000)
    end
end
local function �Ƿ񼤻�RMB()
    local ret = LUA_ȡ����ֵ([[
		setmetatable(_G, {__index = Fuli_ZhanLing2_Env});
		return tostring(Fuli_ZhanLing2_ArouseButton__auto_0__:IsVisible())
	]])
    return ret == "false"
end

local function ����()
    if �Ƿ񼤻�RMB() then
        return
    end
    --����
    LUA_ȡ����ֵ([[
		Clear_XSCRIPT()
			Set_XSCRIPT_Function_Name( "AskActRMBReward" )
			Set_XSCRIPT_ScriptID(790029)
			Set_XSCRIPT_Parameter(0, 1)
			Set_XSCRIPT_ParamCount(1)
		Send_XSCRIPT()
	]])
    ��ʱ(1000)
end

local function ���������ľ�()
    ȡ����Ʒ("�����ľ��ۿ�ȯ|�����ľ�")
    if ��ȡ������Ʒ����("�����ľ�") == 0 then
        local ret = LUA_ȡ����ֵ([[	--ʹ���ۿ�ȯ
			local index,BindState = PlayerPackage:FindFirstBindedItemIdxByIDTable(38004812)
			if index~=-1 then
				Clear_XSCRIPT()
					Set_XSCRIPT_Function_Name("OnBuy")
					Set_XSCRIPT_ScriptID(790035)
					Set_XSCRIPT_Parameter(0, index)
					Set_XSCRIPT_Parameter(1, 1)
					Set_XSCRIPT_ParamCount(2)
				Send_XSCRIPT()
				return 1
			end
			PushDebugMessage("û�������ľ��ۿ�ȯ ֱ�ӹ���")
			return -1
		]])
        ��ʱ(1000)

        if ret ~= "1" then
            --ʹ���ۿ�ȯʧ�� Ԫ���깺��
            LUA_ȡ����ֵ("UpdateShopItem(4,3)")
            ��ʱ(1000)
            LUA_ȡ����ֵ([[
				for i=0,GetActionNum("boothitem") do
					local theAction = EnumAction(i, "boothitem");
					if theAction:GetID()~=0 then
						local name = theAction:GetName()
						if name=="�����ľ�" then
							NpcShop:BulkBuyItem(i,1,0);
							return
						end
					end
				end
			]])
            ��ʱ(1000)
        end
    end
end

local function ��ȡ����()
    for i = 0, 10 do
        �򿪽���()
        local ret1 = LUA_ȡ����ֵ(string.format([[
			setmetatable(_G, {__index = Fuli_ZhanLing2_Env});
			if Fuli_ZhanLing2_Reward_BasicGetButton__auto_%d__:IsVisible() then
				Clear_XSCRIPT()
					Set_XSCRIPT_Function_Name("AskGetReward")  --�ű��ӿ�
					Set_XSCRIPT_ScriptID(790029) --�ű����
					Set_XSCRIPT_Parameter(0,%d)	--���
					Set_XSCRIPT_Parameter(1,0) 	--0��� 1����
					Set_XSCRIPT_Parameter(2,0)	--ѡ��1����2
					Set_XSCRIPT_ParamCount(3)
				Send_XSCRIPT()
				return 1
			end
		]], i, i + 1))
        if ret1 == "1" then
            ��ʱ(500)
        end
        if RMB������ȡ[i] == 1 or RMB������ȡ[i] == 2 then
            local ret2 = LUA_ȡ����ֵ(string.format([[
				setmetatable(_G, {__index = Fuli_ZhanLing2_Env});
				if Fuli_ZhanLing2_Reward_AdvancedGetButton__auto_%d__:IsVisible() then
					Clear_XSCRIPT()
						Set_XSCRIPT_Function_Name("AskGetReward")  --�ű��ӿ�
						Set_XSCRIPT_ScriptID(790029) --�ű����
						Set_XSCRIPT_Parameter(0,%d)	--���
						Set_XSCRIPT_Parameter(1,1) 	--0��� 1����
						Set_XSCRIPT_Parameter(2,%d)	--ѡ��1����2
						Set_XSCRIPT_ParamCount(3)
					Send_XSCRIPT()
					return 1
				end
			]], i, i + 1, RMB������ȡ[i]))
            if ret2 == "1" then
                ��ʱ(500)
            end
        end
    end
    ��Ļ��ʾ("΢��TL7665��������ȡ���")
end
local function ʹ����Ʒ()
    for i = 1, #��Ҫ�Զ�ʹ�õ���Ʒ���� do
        local ��Ʒ�� = ��Ҫ�Զ�ʹ�õ���Ʒ����[i]
        for o = 1, ��ȡ������Ʒ����(��Ʒ��) do
            �Ҽ�ʹ����Ʒ(��Ʒ��)
            ��ʱ(300)
            LUA_ȡ����ֵ("setmetatable(_G, {__index = Item_MultiUse_Env});Item_MultiUse_BuyMulti_Clicked()")

            if ��ȡ������Ʒ����(��Ʒ��) == 0 then
                break
            end
        end
    end
    ��Ļ��ʾ("΢��TL7665��ʹ����Ҫ�Զ�ʹ�õ���Ʒ���")
end

�򿪽���()
if �Ƿ񼤻�RMB() == false then
    ȡ����Ʒ("�����ľ��ۿ�ȯ|�����ľ�")
    if RMB�Զ����� and ��ȡ������Ʒ����("�����ľ�") == 0 then
        ��Ļ��ʾ("û�������ľ�, ��ǰ����Ϊ�Զ�����")
        ���������ľ�()
    end
    ����()
end
��ȡ����()
ʹ����Ʒ()
