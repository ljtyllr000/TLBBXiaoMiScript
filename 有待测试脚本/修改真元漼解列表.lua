Ŀ�����ֹؼ��� = {}
-- Ŀ�����ֹؼ��� = { "����", "����", "�����ʿ"}

ɱ���������� = 5

�����ٶ� = 110 -- ��������, ԽСԽ��, С��110���׵���, ���Ǿ���Խ��; Խ��Խ��, ���Ǿ���Խ��


function MentalTip(text, ...)
    local strCode = string.format(text, ...)
    LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."����ҹ��Ʒ,���Ǿ�Ʒ��".."#eFF0000".."%s"
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

function GetPlayerMaxAttr()
    local attr = LUA_ȡ����ֵ(string.format([[
    local iIceAttack  		= Player:GetData( "ATTACKCOLD" );
    local iFireAttack 		= Player:GetData( "ATTACKFIRE" );
    local iThunderAttack	= Player:GetData( "ATTACKLIGHT" );
    local iPoisonAttack		= Player:GetData( "ATTACKPOISON" );
    local tt={ iIceAttack, iFireAttack, iThunderAttack,iPoisonAttack}
    if iIceAttack==math.max(unpack(tt)) then
        maxOfT ="bing"
    elseif  iFireAttack==math.max(unpack(tt)) then
        maxOfT ="huo"
    elseif  iThunderAttack==math.max(unpack(tt)) then
        maxOfT ="xuan"
    elseif  iPoisonAttack==math.max(unpack(tt)) then
        maxOfT ="du"
    end
    return maxOfT
    ]]), "s")
    return attr
end

function WritePlayerConfiguration(section, keyName, value)
    local playerName = ��ȡ������Ϣ(12)
    local configPath = string.format("C:\\����С��\\��ɫ����\\%s.ini", playerName)
    if section ~= nil and keyName ~= nil and value ~= nil then
        MentalTip("д��ɫ������|" .. section .. "|" .. keyName .. "|" .. value);
        ��ʱ(200)
        д������(configPath, section, keyName, value);
        ��ʱ(200)
    end
end

function ReadPlayerConfiguration(section, keyName)
    local playerName = ��ȡ������Ϣ(12)
    local configPath = string.format("C:\\����С��\\��ɫ����\\%s.ini", playerName)
    local tem = ��������(configPath, section, keyName)
    if tem then
        MentalTip(section .. "|" .. keyName .. "==" .. tem);
        ��ʱ(500)
    else
        return 0
    end
    return tem
end

-- main ------------------------------------------------------

ZYList = {
    bing='��Ԫ������',
    huo='��Ԫ�����',
    xuan='��Ԫ��ӡ��',
    du='��Ԫ���ƶ�',
}

local CuiJieList = '��Ԫ����������|��Ԫ���ٲ�����|��Ԫ���ھ�����|��Ԫ�����|��Ԫ��Ѹ��|��Ԫ��ǧת���|��Ԫ����������|��Ԫ������|��Ԫ����������|��Ԫ������|��Ԫ��������ͥ|��Ԫ���⹦���|��Ԫ������մ��'

CuiJieList = CuiJieList .. '|[��ɫ]��Ԫ��Ѫӿ����|[��ɫ]��Ԫ������|[��ɫ]��Ԫ������|[��ɫ]��Ԫ�����|[��ɫ]��Ԫ��ӡ��|[��ɫ]��Ԫ���ƶ�'

--local tmp = '��Ԫ��Ѫӿ����|��Ԫ������|��Ԫ�����|��Ԫ��ӡ��|��Ԫ���ƶ�|��Ԫ������'

local attr = GetPlayerMaxAttr()

for k,v in pairs(ZYList) do
    if k ~= attr then
        CuiJieList = CuiJieList .. '|' .. v
    end
end

WritePlayerConfiguration('��Ԫ���', '�����Ԫ', CuiJieList)
