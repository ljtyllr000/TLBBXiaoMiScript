
function 晴天_判断关闭窗口(strWindowName)
      if 窗口是否出现(strWindowName)==1 then
	    LUA_Call(string.format([[
	        setmetatable(_G, {__index = %s_Env}) this:Hide()
	  ]], strWindowName))
	  end
end

function 晴天_打开帮会()
local tem = LUA_取返回值(string.format([[
		setmetatable(_G, {__index = MainMenuBar_Env});
MainMenuBar_OnOpenGruidClick();

setmetatable(_G, {__index = NewBangHui_Hygl_Env});
NewBangHui_Hygl_Bhxz_Clicked();

setmetatable(_G, {__index = NewBangHui_Xuanzhan_Env});
NewBangHui_Xuanzhan_Bhxz_Clicked();
------------------------------------------------------------
setmetatable(_G, {__index = NewBangHui_Xuanzhan_Env});
NewBangHui_Xuanzhan_BenfuBtn_Click();

	]]))
end



---对方帮会ID  和延时速度 速度越少越快
local 敌对帮会的ID ={
26,}


local 速度 = 100


function 晴天_帮会宣战(name)
	晴天_打开帮会()
	local 开始时间 =tonumber(os.time())
	延时(3000)
	while true do
		if tonumber(os.time())-开始时间 >=5*60 then
			晴天_打开帮会()
			开始时间 =tonumber(os.time())
			晴天_判断关闭窗口("NewBangHui_Hygl")
		end
		for i =1,#敌对帮会的ID do
			local tem = LUA_取返回值(string.format([[
			local WorldNum = City:GetKServerWorldNum();
			for i=1,WorldNum do
				local WorldName = City:GetKServerZoneWorldNameByIndex(i-1);
				if WorldName=="%s" then
					local g_CurrentSelectedServer = City:GetKServerZoneWorldIdByIndex(i-1);
					City:AddKServerEnemyList(g_CurrentSelectedServer,%d );
					return
				end
			end
				]],name,敌对帮会的ID[i]))
			屏幕提示("宣战ID:"..敌对帮会的ID[i])
			延时(速度)
		end
	end
end


晴天_帮会宣战("上海滩")