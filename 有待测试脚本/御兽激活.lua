-- ����ʹ�ð�Ԫ������

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
    string.gsub(str, '[^' .. reps .. ']+',
            function(w)
                table.insert(resultStrList, w)
            end
    )
    return resultStrList
end

function ActivePetMaster()
    LUA_Call([[
        for activeIndex = 0, 115 do
            local pointState = Player:GetPetMasterPointState(activeIndex , "State")
            local petFlag = Player:GetPetMasterPointState(activeIndex , "PetFlag")
            if pointState ~= nil and petFlag ~= nil then
                if pointState == 0 or pointState == 1 then      --δ���� ���� ������
                    Clear_XSCRIPT()
                        Set_XSCRIPT_Function_Name( "PetMasterActive" )
                        Set_XSCRIPT_ScriptID( 880004 )
                        Set_XSCRIPT_Parameter( 0,  activeIndex)         ---�������
                        Set_XSCRIPT_ParamCount( 1 )
                    Send_XSCRIPT()
                end
            end
        end
    ]])
end

-- main ------------------------------------------------
ActivePetMaster()