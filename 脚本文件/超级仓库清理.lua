
----------------------------------------------------
local 星期几=(os.date("%A")) 
local 当前等级=到数值(获取人物信息(26))
local 人物名字= 获取人物信息(12)

local 每周一次丢弃物品列表="新莽神符6级|新莽神符7级|愿灵泉|宝石雕琢符3级"

local 必须扔物品列表="玄灵丹|天灵丹|庆坤杯|小灵丹"

local 满级多余物品列表="龙纹玉灵|铸纹血玉|玉龙髓"

----------------------------------------------------

执行功能("取BOSS宝箱") 
执行功能("取出宝宝套") 
执行功能("拆解宝宝套") 

----------------------------------------------------自定义函数


屏幕提示(星期几)
if 星期几 == "Monday" then
 if 到数值(获取人物信息(26)) >=102 then
  屏幕提示("等级大于102级,丢弃神器")
    取出物品(每周一次丢弃物品列表)
    延时(1000)
    自动清包(每周一次丢弃物品列表)
 end
end

if 当前等级 >=98 then
  屏幕提示("自动清理玄灵丹")
  取出物品(必须扔物品列表)
  延时(1000)
  自动清包(必须扔物品列表)
end


-------------------------绑定销毁列表---------------------------------
屏幕提示("★★★★晴天★★★★---绑定销毁列表")

绑定销毁列表="缥缈玄符|庆坤杯|小灵丹|天灵丹|彻地符箓|玄天寒玉|3级精铁|精铁碎片|门派召集令|【有时间的时装】|碧景琉璃|玉眠寒川|游岚月色|缀梦灵石|虹耀石|"

取出物品(绑定销毁列表)


存物品(绑定销毁列表,不存物品,0,1,1)
if 获取背包物品数量(绑定销毁列表)>0 then
自动清包(绑定销毁列表)
end

-------------------------释灵髓---------------------------------
屏幕提示("★★★★晴天★★★★---释灵髓")

取出物品("释灵髓")
while 获取背包物品数量("释灵髓")>=1 do
屏幕提示("释灵髓-自动使用")
延时(500)
右键使用物品("释灵髓",1)  
延时(500)
end 

-------------------------真元珀---------------------------------
屏幕提示("★★★★晴天★★★★---真元珀")
取出物品("真元珀|真元精珀")  
存物品("真元珀|真元精珀",不存物品,0,1,1)
存物品("真元珀|真元精珀",不存物品,0,1,1)
for kkk=1,20 do
if 获取背包物品数量("真元珀")>=1 then
屏幕提示("真元珀-自动使用");延时(500)
右键使用物品("真元珀",1);延时(500)
end 
if 获取背包物品数量("真元精珀")>=1 then
屏幕提示("真元精珀-自动使用");延时(500)
右键使用物品("真元精珀",1);延时(500)
end 
end 

-------------------------豪侠勋章---------------------------------
屏幕提示("★★★★晴天★★★★---豪侠印升级")
取出物品("豪侠勋章")
for kkk=1,30 do
if 获取背包物品数量("豪侠勋章")>0 then
	LUA_Call ("SelfJunXian_EquipHXYLevelup();");延时(500)
end
end 

存物品("豪侠勋章")

-------------------------玄机药尘---------------------------------
屏幕提示("★★★★晴天★★★★---玄机药尘")
取出物品("玄机药尘")  
for kkk=1,30 do
if 获取背包物品数量("玄机药尘")>=1 then
	屏幕提示("玄机药尘-自动使用");延时(500)
	右键使用物品("玄机药尘",1);延时(500)  
end 
end 

-------------------------玄兵石碎片---------------------------------
屏幕提示("★★★★晴天★★★★---玄兵石碎片")
取出物品("玄兵石碎片")  
if 获取背包物品数量("玄兵石碎片")>=2 then
右键使用物品("玄兵石碎片",1);延时(500)  
右键使用物品("玄兵石碎片",1);延时(500)  
end
存物品("玄兵石碎片|玄兵石")


----------------------------红利票--------------------------------
屏幕提示("★★★★晴天★★★★---红利票")
取出物品("红利票") 
if 获取背包物品数量("红利票")>=1 then
右键使用物品("红利票",1);延时(500)
右键使用物品("红利票",1);延时(500)
end 

----------------------------开周活跃好礼--------------------------------
屏幕提示("★★★★晴天★★★★---周活跃好礼")
取出物品("周活跃好礼") 
if 获取背包物品数量("周活跃好礼")>0 then
执行功能("开周活跃好礼");延时(500) 
end


