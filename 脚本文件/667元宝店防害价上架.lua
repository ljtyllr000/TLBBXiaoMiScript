---------------------------------------------------------------------------------
function ����_������ʾ(text,...)
	local strCode = string.format(text,...)
	LUA_Call(string.format([[
		setmetatable(_G, {__index = DebugListBox_Env})
		str= "#e0000ff".."������QQ103900393��ʾ��".."#eFF0000".."%-88s"
		DebugListBox_ListBox:AddInfo(str)
		--��ɫ #e0000ff#u#g0ceff3
		--��ɫ #e0000ff#g28f1ff
		--#Y
	]], strCode))
end

ִ�й���("Ǯׯ��Ԫ��")

function ����_ȡ��������Ʒ(��Ʒ)
	ȡ����Ʒ(��Ʒ)
	����Ʒ(��Ʒ,������Ʒ,1,0,1)
end	

---------------------------------------------------------------------------------
function �رմ���(strWindowName)
      if �����Ƿ����(strWindowName) == 1 then
		����_������ʾ("�رմ���")
		LUA_Call(string.format([[
	          setmetatable(_G, {__index = %s_Env}) this:Hide()  
	   ]], strWindowName), "n")
	  end
end
---------------------------------------------------------------------------------
function ����_Ԫ���������Ʒ()
��ͼѰ·("Ǯׯ",60,30);��ʱ(500)
�Ի�NPC("��۲�");��ʱ(500)
NPC�����Ի�("����Ԫ��",1);��ʱ(500)
��ͼѰ·("Ǯׯ",60,30);��ʱ(1000)
�Ի�NPC("��۲�");��ʱ(1000)
NPC�����Ի�("�����ҳ��۵���Ʒ",1);��ʱ(2000)
		for kkk=1 ,10 do 
			LUA_Call(string.format([[ 
						local aaa=tonumber(%d)
						local theAction = EnumAction( aaa - 1 , "ybmarket_self")
						if theAction:GetID() ~= 0 then
							local pName , nowStatus ,price, itemlefttime = Auction:GetMySellBoxItemAuctionInfo(aaa- 1 )
							if pName ~= nil then 
						--PushDebugMessage("[����]Ԫ���������Ʒ�¼�:"..pName)
						if nowStatus == 1 then
							--Auction:GetBackWhatOnSale(2 , aaa - 1  ,1)
						elseif nowStatus == 2 then
							Auction:GetBackExpired(2 , aaa- 1  ,1)
						elseif  nowStatus ==  3 then
							Auction:GetMoney(2 , aaa- 1 )
						  end
					end
				end			
				]], kkk), "n",1)
	��ʱ(500)
	end
end



---------------------------------------------------------------------------------

function ����_Ԫ�����ϼ���Ʒ(strKey,much,selfcount)
	����_ȡ��������Ʒ(strKey)
	local nCount = ��ȡ������Ʒ����(strKey)
	local nIndex=��ȡ������Ʒλ��(strKey)-1
if nCount<much then
  ����_������ʾ(strKey.."������������ϼ�:"..much.."|Ŀǰ��Ʒ����:"..nCount.."λ��:"..nIndex)
  return
end
if �����Ƿ����("YbMarket") == 0 then
	��ͼѰ·("Ǯׯ",60,30);��ʱ(500)
	�Ի�NPC("��۲�");��ʱ(500)
	NPC�����Ի�("Ԫ�������г�",1);��ʱ(500)
	��ʱ (500)
end

if �����Ƿ����("YbMarket") == 1 then
��ʱ (500)
����_������ʾ("[����]��ʼ����:"..strKey.."��ͼ۸�")
LUA_Call(string.format([[ 
Auction:PacketSend_Search(2 , 1,1, "%s", 1)
	]], strKey), "s",1)
��ʱ (2000)
local wupindanjia=LUA_ȡ����ֵ(string.format([[ 
local pName , pSeller ,pCount ,pYB = Auction:GetItemAuctionInfo(0)
if pName =="%s" and pSeller ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
local AAA=pYB/pCount
--PushDebugMessage(pName.."��͵���:"..AAA)
return AAA
end
	]], strKey), "s",1)
��ʱ (1000)

����_������ʾ(tonumber(wupindanjia))
if tonumber(selfcount)> tonumber(wupindanjia) then
	����_������ʾ("�̻���ͼ۵��ڱ���ֵ,�����ñ����۸�:"..selfcount)
	bbb= math.floor(tonumber(selfcount)*nCount)
	else
	 bbb=math.floor(tonumber(wupindanjia)*nCount)--����ȡ����
end

-- �ϼ�_��Ʒ
		for i =1,99 do
			local nCount = ��ȡ������Ʒ����(strKey)
			if nCount<much then
				break
			end
				LUA_Call(string.format([[ 
				Auction:PacketSend_SellItem(tonumber(%d) , tonumber(%d) ,1) 
					]],nIndex,bbb), "s",1)
		
			end
	end
end


---------------------------------------------------------------------------------


function ����_�ž�������Ʒ()
��ͼѰ·("������",204,134);��ʱ(500)
�Ի�NPC("�̺��");��ʱ(500)
NPC�����Ի�("����Ԫ��",1);��ʱ(500)
NPC�����Ի�("���ս��",1);��ʱ(500)

��ͼѰ·("������",204,134);��ʱ(1000)
�Ի�NPC("�̺��");��ʱ(1000)
NPC�����Ի�("�����ҳ��۵���Ʒ",1);��ʱ(2000)

		for kkk=1 ,10 do 
LUA_Call(string.format([[ 
            local abcd=tonumber(%d)
			--PushDebugMessage(abcd)
					local pName ,nowStatus , price = KVKAuction:GetMySellBoxItemAuctionInfo(1, abcd - 1)
				if pName ~= nil then 
	        --PushDebugMessage("[����]�ž�������Ʒ�¼�:"..pName)
			
			if nowStatus == 1 then
				KVKAuction:GetBackWhatOnSale(1 , abcd - 1  ,1)
			elseif nowStatus == 2 then
				KVKAuction:GetBackExpired(1 , abcd- 1  ,1)
			elseif  nowStatus ==  3 then
		 	KVKAuction:GetMoney(1 , abcd- 1 )
             end
		end
	
	]], kkk), "n",1)
	��ʱ(500)
	end
end




function ����_�ž��ϼ���Ʒ(strKey,much,selfcount)--
����_ȡ��������Ʒ(strKey)
local nCount = ��ȡ������Ʒ����(strKey)
local nIndex=��ȡ������Ʒλ��(strKey)-1

����_������ʾ(strKey.."������������ϼ�:"..much.."|Ŀǰ��Ʒ����:"..nCount.."λ��:"..nIndex)
if nCount<much then
  ����_������ʾ(strKey.."������������ϼ�:"..much.."|Ŀǰ��Ʒ����:"..nCount.."λ��:"..nIndex)
  return
end

if �����Ƿ����("KVKMarket")== 0 then
��ͼѰ·("������",204,134);��ʱ(500)
�Ի�NPC("�̺��");��ʱ(500)
NPC�����Ի�("�ž�������",1);��ʱ(500)
��ʱ (500)
end

if �����Ƿ����("KVKMarket") == 1 then
��ʱ (500)
����_������ʾ("[����]��ʼ����:"..strKey.."��ͼ۸�")
LUA_Call(string.format([[ 
KVKAuction:PacketSend_Search(1 ,1, 1, "%s" , 1)
	]], strKey), "s",1)
��ʱ (1000)
local wupindanjia=LUA_ȡ����ֵ(string.format([[ 
	local pName, pSeller, pCount, pYB = KVKAuction:GetItemAuctionInfo(1,0 )
if pName =="%s" and pSeller ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
local abcd=pYB/pCount
--PushDebugMessage(pName.."��͵���:"..abcd)
return abcd
end

	]], strKey), "s",1)
��ʱ (1000)

����_������ʾ(tonumber(wupindanjia))

if tonumber(selfcount)> tonumber(wupindanjia) then
	����_������ʾ("�̻���ͼ۵��ڱ���ֵ,�����ñ����۸�:"..selfcount)
	bbb= math.floor(tonumber(selfcount)*nCount)
	else
	 bbb=math.floor(tonumber(wupindanjia)*nCount)--����ȡ����
end

-- �ϼ�_��Ʒ
LUA_Call(string.format([[ 
KVKAuction:PacketSend_SellItem(1,tonumber(%d) , tonumber(%d) ,1) 
	]],nIndex,bbb), "s",1)
end
end








function ����_Ԫ�����޸���Ʒ(strKey)
if �����Ƿ����("YbMarket") == 0 then
	��ͼѰ·("Ǯׯ",60,30);��ʱ(500)
	�Ի�NPC("��۲�");��ʱ(500)
	NPC�����Ի�("Ԫ�������г�",1);��ʱ(500)
	��ʱ (500)
end

	if �����Ƿ����("YbMarket") == 1 then
��ʱ (500)
����_������ʾ("[����]��ʼ����:"..strKey.."��ͼ۸�")
LUA_Call(string.format([[ 
Auction:PacketSend_Search(2 , 1,1, "%s", 1)
	]], strKey), "s",1)
��ʱ (2000)

��Ʒ����=LUA_ȡ����ֵ(string.format([[ 
local pName , pSeller ,pCount ,pYB = Auction:GetItemAuctionInfo(0)
if pName =="%s" and pSeller ~= nil and pCount ~= nil and pYB ~= nil and pCount > 0 then
local AAA=pYB/pCount
--PushDebugMessage(pName.."��͵���:"..AAA)
return AAA
end
return -1
	]], strKey), "s",1)
��ʱ (1000)



����_������ʾ(tonumber(��Ʒ����))
�رմ���("YbMarket")
end

��ͼѰ·("Ǯׯ",61,29);��ʱ(500)
�Ի�NPC("��۲�");��ʱ(500)
�Ի�NPC("��۲�");��ʱ(1000)
NPC�����Ի�("�����ҳ��۵���Ʒ",1);��ʱ(2000)

		for kkk=1 ,10 do 
		tem= LUA_ȡ����ֵ(string.format([[ 
						local aaa=tonumber(%d)
						local theAction = EnumAction( aaa - 1 , "ybmarket_self")
						if theAction:GetID() ~= 0 then
							local pName , nowStatus ,price, itemlefttime = Auction:GetMySellBoxItemAuctionInfo(aaa- 1 )
							if pName ~= nil  then 
								g_itemNum = Auction:GetMySellBoxItemNum(aaa-1)
						--PushDebugMessage("[����]Ԫ���������Ʒ�¼�:"..pName)
						if  pName=="%s" then
							if nowStatus == 1 then
									return g_itemNum
								--Auction:GetBackWhatOnSale(2 , aaa - 1  ,1)
							elseif nowStatus == 2 then
								Auction:GetBackExpired(2 , aaa- 1  ,1)
							elseif  nowStatus ==  3 then
								Auction:GetMoney(2 , aaa- 1 )
							  end
						end	
					end
				end			
				return -1
				]], kkk,strKey), "n",1)
				if  tonumber(tem) > 0 then
					��Ļ��ʾ(tem)
					
					bbb = math.floor(��Ʒ����*(tonumber(tem)))
					��Ļ��ʾ(bbb)
					��ʱ(3000)
					LUA_Call(string.format([[ 
					g_Cur_Modify_Type =2
					g_Index =%d-1
					wantguidh, wantguidl = Auction:GetMyAuctionSellBoxItemGuid(g_Index)
					Auction:ChangePrice(g_Cur_Modify_Type ,g_Index , tonumber(%d), wantguidh, wantguidl)		
								]], kkk,bbb), "n",1)
				��ʱ(500)
				end
		end
end
---------------------------------------------------------------------------------
����_Ԫ�����޸���Ʒ("�ٴ�����")


����_Ԫ�����ϼ���Ʒ("���޵����磨1����",10,0.1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("���޵����飨1����",10,0.1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("���޵�����1����",10,0.1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("���޵����ϣ�1����",10,3)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("���޵����䣨1����",10,1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("������",200,0.1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("���˿",10,5)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("��Ԫ��",10,3)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("������",3,5)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("���ʯ",10,0.1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("����ʯ",10,0.1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("ʥ����",100,0.1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("����ˮ",100,1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("������",10,1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("��������",10,1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("������ʯ",10,8)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("��Ԫ����",1,5)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("ʥ��֮��",1,80)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("���޾���",10,1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("ǧ������",10,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("������м",10,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("�����3��",30,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("����Ѫ��",20,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("׺��ʯ��Ԫ",100,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("׺��ʯ����",100,1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("׺��ʯ����",100,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("����飨1����",100,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("���ʯ���ƣ�1����",100,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("���ʯ������1����",50,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("���ʯ������1����",100,1)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("���ʯ������1����",100,1)    --���� ���� �ͼ�


����_Ԫ�����ϼ���Ʒ("�ơ�����������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("�ơ�����������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("�ơ��ȶ�������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("�ơ�����������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�



����_Ԫ�����ϼ���Ʒ("�����ζ�������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("�����ƶ�������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("�����۱�������",1,50)    --���� ���� �ͼ�



����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��������������",1,50)    --���� ���� �ͼ�

����_Ԫ�����ϼ���Ʒ("��Ҷ����Ƭ",20,0.3)    --���� ���� �ͼ�


