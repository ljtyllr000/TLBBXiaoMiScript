local ����Ƶ�� = "1"
local ����Ƶ�� = "0"
local ����Ƶ�� = "0"
local ˽����Ϣ = "0"
local ϵͳƵ�� = "0"
local �Խ�Ƶ�� = "0"		--ϵͳԤ�����ܣ�Ϊ0�ͺ�
local ���Ƶ�� = "0"
local ����Ƶ�� = "0"
local ������Ϣ = "1"
local ����Ƶ�� = "0"
local ����Ƶ�� = "1"
local ͬ��Ƶ�� = "0"
local ͬ��Ƶ�� = "0"
local �Ŷ�Ƶ�� = "0"
local С��Ƶ�� = "0"		--ϵͳԤ�����ܣ�Ϊ0�ͺ�
local ǧ�ﴫ�� = "0"		--ϵͳԤ�����ܣ�Ϊ0�ͺ�
local �ž�Ƶ�� = "0"
local ����Ƶ�� = "0"		--ϵͳԤ�����ܣ�Ϊ0�ͺ�
local ����Ƶ�� = "0"		--ϵͳԤ�����ܣ�Ϊ0�ͺ�
local �������� = "0"		--ϵͳԤ�����ܣ�Ϊ0�ͺ�
local T����Ϣ = "0"		--ϵͳԤ�����ܣ�Ϊ0�ͺ�
local ��ɱ��Ϣ = "0"
local ����Ƶ�� = "0"		--2014Q1��������죬���幦��ȥ����Ϊ0�ͺ�
--ֻ�����棬1=ѡ�У�0=ȡ��
local strConfig = ����Ƶ��
strConfig=strConfig..����Ƶ��
strConfig=strConfig..����Ƶ��
strConfig=strConfig..˽����Ϣ
strConfig=strConfig..ϵͳƵ��
strConfig=strConfig..�Խ�Ƶ��
strConfig=strConfig..���Ƶ��
strConfig=strConfig..����Ƶ��
strConfig=strConfig..������Ϣ
strConfig=strConfig..����Ƶ��
strConfig=strConfig..����Ƶ��
strConfig=strConfig..ͬ��Ƶ��
strConfig=strConfig..ͬ��Ƶ��
strConfig=strConfig..�Ŷ�Ƶ��
strConfig=strConfig..С��Ƶ��
strConfig=strConfig..ǧ�ﴫ��
strConfig=strConfig..�ž�Ƶ��
strConfig=strConfig..����Ƶ��
strConfig=strConfig..����Ƶ��
strConfig=strConfig..��������
strConfig=strConfig..T����Ϣ
strConfig=strConfig..��ɱ��Ϣ
strConfig=strConfig..����Ƶ��
local isFenpingOpen = tonumber(LUA_ȡ����ֵ("return Talk:IsFenpingOpen()") )
if isFenpingOpen == 0 then
	LUA_Call("Talk:CreateFenping('"..strConfig.."');")
end
if isFenpingOpen == 1 then
	LUA_Call("Talk:ConfigFenping('"..strConfig.."');")
end

local ��Ϸ����lua = [[
SystemSetup:View_SetData( "wtdh",0 );    --���嶯��
SystemSetup:View_SetData( "dhgxzl",0 );   --��ɫ����
SystemSetup:View_SetData( "ksfw",0 );   --��ʾģ���� ���ӷ�Χ
SystemSetup:View_SetData( "mxxslj",0 );   --ģ����ʾ, NPC �� ��� ����
SystemSetup:View_SetData( "yszl",0 );
SystemSetup:View_SetData( "rwyy",0 );   --������Ӱ
SystemSetup:View_SetData( "dxyy",0 );
SystemSetup:View_SetData( "txdjsz",0 );   --����Ч��
SystemSetup:View_SetData( "miwu",0 );   --��ʾ����
SystemSetup:View_SetData( "zdbt",0 );   --�ڵ���͸
SystemSetup:View_SetData( "cztb",0 );  --��ֱͬ��
SystemSetup:View_SetData( "mrsj",0 );-- �����Ӿ�
SystemSetup:View_SetData( "jzcj",0 );
SystemSetup:View_SetData( "rt",0 );
SystemSetup:View_SetData( "mxtx",0 );  --ģ����Ч
SystemSetup:View_SetData( "tksj",0 );   --����ӽ�
SystemSetup:View_SetData( "tm",1 );-- ��ģ
SystemSetup:View_SetData( "fhj",0 );   --ȫ�������
SystemSetup:View_SetData( "cy",0 );   --����
SystemSetup:View_SetData( "qpfg",0 );   --ȫ������
SystemSetup:View_SetData( "hdr",0 );   --HDR
Variable:SetVariable("View_Resoution", "1280,720", 0);   -- ���÷ֱ���
SystemSetup:SaveGameSetup (0,0,0,0,0,0,0,0,0,0.89999997615814,0,0,0,0,0,1,1,0,1,1,0,0,0,0,0,1,0,1,0,0,0,0,0,0); -- ��Ϸ������
Variable:SetVariable("EnableBGSound", "0", 0);   -- ��Ч����
Variable:SetVariable("Enable3DSound", "0", 0);
Variable:SetVariable("EnableSKSound", "0", 0);
Variable:SetVariable("EnableUISound", "0", 0);
]]
LUA_Call(��Ϸ����lua)