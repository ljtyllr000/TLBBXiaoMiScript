function PushDebugMessage(str, ...)
	��Ļ��ʾ(string.format(str, ...))
end

function QuestFrameOptionClicked(MissionOption)
	NPC�����Ի�(MissionOption)
end

function Sleep(ms)
	��ʱ(ms)
end

function MoveToNPC(posx, posy, sceneName, NpcName)
	while true do
		��ͼѰ·(sceneName, posx, posy)
		��ʱ(1000)
		�ȴ���ͼ���()
		if �Ի�NPC(NpcName) == 1 then
			break
		end
	end
end

function BankGetItem(str,num)
	ȡ����Ʒ(str,num)
end

function GetBagItemCount(itemName)
	return ��ȡ������Ʒ����(itemName)
end

function BankSaveItem(str)
	����Ʒ(str,"",0,0,0)
end

local Item = {
	["�ϳ��м������"] = {"���������","��������ʺϳɷ�" },
	["�ϳɸ߼������"] = {"�м������","�м�����ʺϳɷ�" },
	["�ϳɻ�ɫ�����"] = {"�߼������","�߼�����ʺϳɷ�" },
}

local ItemList = "���������|��������ʺϳɷ�|�м������|�м�����ʺϳɷ�|�߼������|�߼�����ʺϳɷ�|��ɫ�����"
----------------------------------------------------------------------------------------------------------------------


--�ϳɹ���ʿ�ʼ�߼�
PushDebugMessage("��ʼǰ����������кϳ�[�����]")

BankGetItem("���������|��������ʺϳɷ�|�м������|�м�����ʺϳɷ�",-1)

MoveToNPC(368, 421, "����", "��ӥ")


QuestFrameOptionClicked("����ʺϳ�");Sleep(1000)


for k, v in pairs(Item) do
	PushDebugMessage("��ʼ[%s]!", k);Sleep(500)
	while GetBagItemCount(v[1]) >= 5 and GetBagItemCount(v[2]) >= 1 do
		QuestFrameOptionClicked(k);Sleep(1000)
	end
end

BankSaveItem(ItemList)
