local n = 1 --1 为数量  想换几个就改动一下数字就行 

function 取材料()
    取出物品("3级宝石兑换券")  
    if 获取背包物品数量("3级宝石兑换券") == 0 then
           屏幕提示("没有材料") 
           return
    end 
	换宝石()
	end
	
function 换宝石()
            跨图寻路("钱庄",68,44)
            延时(1000)
	    
   计次循环 i=1,n 执行
            对话NPC("钱夫人")
            延时(500)
            NPC二级对话("使用宝石兑换券")
            延时(500)
            NPC二级对话("使用3级宝石兑换券")
			延时(500)
            NPC二级对话("红宝石(3级)")
			延时 (500)
            NPC二级对话("同意")
			延时 (500)
	结束  
  
end 

取材料()
执行功能("自动存仓")