���ν�ɫ = "���ƣ�|�䳾��|��˪��|��ѩ��|���ǣ�|��¶��"  -- ���ν�ɫ������ | ���

function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ, ���Ǿ�Ʒ��".."#eFF0000".."%s"
		DebugListBox_ListBox:AddInfo(str)
	]], strCode))
end

function StringSplit(str, reps)
	-- �ַ����и�
    local resultStrList = {}
    string.gsub(str,'[^'..reps..']+',
		function ( w )
			table.insert(resultStrList, w)
		end
	)
    return resultStrList
end

function GetTrustFriendCount()
	local trustFriendCount = LUA_ȡ����ֵ([[
		local trustFriendNumber = DataPool : GetTrustFriendNumber( );
		return trustFriendNumber
	]])
	return tonumber(trustFriendCount)
end

function AddTrustFriend(friendId)
	LUA_Call(string.format([[
		local guid = "%s"
		DataPool : AddTrustFriend( guid );
	]], friendId))
end

function GetTrustFriendName(nIndex)
	local trustFriendName = LUA_ȡ����ֵ(string.format([[
		local index = %d
		local name = DataPool : GetTrustFriend( index, "NAME" )
		return name
	]], nIndex))
	return trustFriendName
end

function GetTrustFriendGuid(nIndex)
	local trustFriendGuidStr = LUA_ȡ����ֵ(string.format([[
		local nIndex = %d
		local guid = DataPool : GetTrustFriend( nIndex, "GUID" );
		return guid
	]], nIndex))
	local trustFriendGuid = string.sub(trustFriendGuidStr, 3)
	return trustFriendGuidStr
end

function HasRoleExistTrust(curFriendId)
	local nowTrustFriCount = GetTrustFriendCount()
	if nowTrustFriCount >= 10 then
		return -1
	end

	local index = 0
	while index < nowTrustFriCount do
		local truFriendGuid = GetTrustFriendGuid(index)
		if truFriendGuid == curFriendId then
			return -2
		end
		index = index + 1
	end
	return 1
end

function GetFriendID(roleName)
    local tem = LUA_ȡ����ֵ(string.format([[
		name2 ="%s"
		XXX=1
		for nIndex = 0, 80 do
			local ID = DataPool:GetFriend( XXX, nIndex, "ID" );
			if ID then
				local name = DataPool:GetFriend( XXX, nIndex, "NAME")
				if name2 == name then
				  return ID
				end
			end
		end
		return -1
		]], roleName), "b")
    return tem
end

function main()
	local myName = ��ȡ������Ϣ(12)
	local needAddRole = StringSplit(���ν�ɫ, "|")
	for i= 1, #needAddRole do
		local roleName = needAddRole[i]
		if roleName ~= myName then
			local curFriendId = GetFriendID(roleName)
			local checkExist = HasRoleExistTrust(curFriendId)
			if checkExist == -1 then
				MentalTip("�������ν�ɫ�Ѵ�����, �޷��������")
				return
			elseif checkExist == -2 then
				MentalTip(string.format("��%s���Ѵ����������б�, ����", roleName))
			elseif checkExist == 1 then
				if curFriendId ~= "-1" then
					AddTrustFriend(curFriendId)
					MentalTip(string.format("������Ρ�%s���ɹ�", roleName))
				else
					MentalTip(string.format("��%s���������ĺ���, �޷��������, ����", roleName))
				end
			end
		end
		��ʱ(1000)  -- ֻ���ӳ�ʱ�䣬����ص������ʧ��
	end
end

-- ----------------------------------- Main -----------------------------------------------
main()