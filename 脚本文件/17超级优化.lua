-------------------------------------------------------------------------�����ͼ����---------------
function ����_�ڻ�С��ͼ()
	     LUA_Call(string.format([[ 

	function zidingyi_MiniMap_OnEvent(event)
	if event=="SCENE_TRANSED" then
		this:Hide()
	PushDebugMessage("������������ʾ��QQ 531896440 Ⱥ 641700076 ����С�������ı��ٷ�֮99.99����")
	PushDebugMessage("������������ʾ��QQ 531896440 Ⱥ 641700076 ����С�������ı��ٷ�֮99.99����")
	PushDebugMessage("������������ʾ��QQ 531896440 Ⱥ 641700076 ����С�������ı��ٷ�֮99.99����")
	end	
	end

if TT_MiniMap_OnEvent == nil then
   TT_MiniMap_OnEvent = MiniMap_OnEvent
    function MiniMap_OnEvent(event)
        TT_MiniMap_OnEvent(event);
        zidingyi_MiniMap_OnEvent(event);
    end
end
]]))
end
function ����_��ԭС��ͼ()	
	     LUA_Call(string.format([[ 
	MiniMap_OnEvent=TT_MiniMap_OnEvent --��ԭ
	TT_MiniMap_OnEvent=nil
]]))
end
-------------------------------------------------------------------------------------------

function ����_�ڻ�����()
	     LUA_Call(string.format([[ 
function TT_ChatFrame_OnEvent(event)
	if event=="PLAYER_ENTERING_WORLD" then
		this:Hide()
		PushDebugMessage("������������ʾ��QQ 531896440 Ⱥ 641700076 ����С�������ı��ٷ�֮99.99����")
	end	
end

if XTT_ChatFrame_OnEvent == nil then
    XTT_ChatFrame_OnEvent = ChatFrame_OnEvent
    function ChatFrame_OnEvent(event)
        XTT_ChatFrame_OnEvent(event);
        TT_ChatFrame_OnEvent(event);
    end
end
]]))
end

function ����_��ԭС��ͼ()	
	     LUA_Call(string.format([[ 
	ChatFrame_OnEvent=XTT_ChatFrame_OnEvent
	XTT_ChatFrame_OnEvent=nil
]]))
end


����_�ڻ�С��ͼ()
����_�ڻ�����()