���������� = {"��Ӱ��", "���ݺ����", "��榣�", "ӣ�q��СȾ", "����Ǥ�", "����֦��"}

roleName = ��ȡ������Ϣ(12)

saveMatched = 0
for k, v in pairs(����������) do
    if v == roleName then
        saveMatched = 1
        break
    end
end

if saveMatched ~= 1 then
    ȡ����Ʒ("������")
    ��ʱ(1000)
    �Զ����("������")
end