local �������Ƽ���="������|������|������|�Ѫ��|������"
local ���������б�={"������","������","������","�Ѫ��","������"}
local ��ȡ��������ﹱ={200,300,400,500,1000}
local ��ȡ��������ﹱ=50

--��Ļ��ʾ(���������б�[1])
--��Ļ��ʾ(��ȡ��������ﹱ[1])
--��Ļ��ʾ(ceshi)
------------------------------------------------------------------------------------------------------------
�־ö�=tonumber(LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetEquipDur();"))
if �־ö�<=  0 then
	��Ļ��ʾ("���Ƴ־öȲ�����ִ���κβ���")
	return
end
------------------------------------------------------------------------------------------------------------
ȡ����Ʒ("����ľ�|����Һ|��ľ�ʯ")  

function AskGuildDetailInfo()
	if �ж����ް���()==1 then
			   GuildCity_Name = LUA_ȡ����ֵ([[
					local CityName = Guild:GetMyGuildDetailInfo("CityName")
					return CityName
			   ]], "s")
	   if GuildCity_Name ~= "-1" then--֮ǰ�Ѿ��򿪹������棬���ѻ�ȡ�������У�ֱ��return��
	       return GuildCity_Name
	   end
	   LUA_Call("Guild:AskGuildDetailInfo()")
	   ��ʱ(3000)
		 GuildCity_Name = LUA_ȡ����ֵ([[
				local CityName = Guild:GetMyGuildDetailInfo("CityName")
				return CityName
		   ]], "s")
        ��ʱ(2000)
        if �����Ƿ����("NewBangHui_Bhxx") then
	        LUA_Call("setmetatable(_G, {__index = NewBangHui_Bhxx_Env}) NewBangHui_Bhxx_Close()")
	    end
	    return GuildCity_Name
	end
end
�������=AskGuildDetailInfo()
��Ļ��ʾ("�������:"..�������)
��Ļ��ʾ("�������:"..�������)
��Ļ��ʾ("�������:"..�������)

function �رմ���(strWindowName)
	if �����Ƿ����(strWindowName)==1 then
	  LUA_Call(string.format([[
		setmetatable(_G, {__index = %s_Env}) this:Hide()  
	 ]], strWindowName))  
	 end
end

function ���������()
    for i=1,5 do
        if ��ȡ������Ϣ(16)~=������� then
            ��ͼѰ·("����",236,236)
            ��ʱ(500)
            �Ի�NPC("������")
            ��ʱ(500)
            NPC�����Ի�("���뱾�����") 
            ��ʱ(5000) 
            Ѱ·(44,47,1) 
			��ʱ(3000) 
        end
    end
end

function ȡ������()
     for i=1,5 do
         LUA_Call ("MainMenuBar_SelfEquip_Clicked();")
         ��ʱ (1000)
         if �����Ƿ����("SelfEquip") then   --ͬ������ �ȴ����ڳ���()
              LUA_Call ("SelfEquip_Equip_Click(16,0);")
              ��ʱ (1000)
              if LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetID();")=="0" then  --�������װ���ɹ�
                   LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
                   ��ʱ(500)  
                   return 1   
              end
         end      
     end
     LUA_Call("setmetatable(_G, {__index = SelfEquip_Env});SelfEquip_CloseFunction();")      
     ��ʱ(500) 
     if LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetID();")=="0" then
          return 1   
     else  
          return 0
     end     
end

function װ������(��������)
    ��Ļ��ʾ("��ʼװ������:"..��������)
     for i=1,5 do
         if �����Ƿ����("EquipLingPai_ShengJie") ==1 then 
	          	�رմ���("EquipLingPai_ShengJie")
		 elseif �����Ƿ����("EquipLingPai_Star") ==1 then 
				�رմ���("EquipLingPai_Star")
		 elseif �����Ƿ����("EquipLingPai_OperatingSJ") ==1 then 
				�رմ���("EquipLingPai_OperatingSJ")				
             else
              �Ҽ�ʹ����Ʒ(��������,1)     --����2:Ϊʹ�ô���
         end
         ��ʱ(1000)
         if tonumber(LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetID();"))>0 then  --װ���ɹ�
              break   
         end
     end
end


function  ��ȡ����()
if LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")==""  and  ��ȡ������Ʒ����(�������Ƽ���) ==0 then
if tonumber(��ȡ������Ϣ(63)) >=100 then
 ��Ļ��ʾ("��ǰװ�������� ,ǰ�������ȡ")
  ���������()
  for i=1,5 do
         Ѱ·(44,47) 
	��ʱ(3000)
         if ��ȡ������Ʒ����("������") >=1 then
              װ������("������")
              ��ʱ(2000)
         end
         if LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")=="������" then
             ��ʱ(2000)
             break
        end
         if �Ի�NPC("������")==1 then
              ��ʱ(2000)
              NPC�����Ի�("��ȡ����") 
              ��ʱ(2000)
              ����_���()
              ��ʱ(2000)
        end
    end
  end
else
 ��Ļ��ʾ("�Ѿ������� |������ȡ")
end

end

function  ��������()
if LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")==���������б�[5] then
��Ļ��ʾ("��ǰ����Ϊ:"..���������б�[5] .."|�����ٽ�������")
return
end

���������()
Ѱ·(44,47,1) 
��ʱ(3000)
for kk=1,4 do
 if LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")==���������б�[kk] then
	if  tonumber(��ȡ������Ϣ(63)) >=��ȡ��������ﹱ[kk] then
		 ��Ļ��ʾ("��ǰ����Ϊ:"..���������б�[kk].."             Ҫ���׵�����Ϊ:"..���������б�[kk+1])
    if ȡ������()==0 then                     --ȡ��������ifȡ��ʧ��thenreturn
          LUA_Call("PushDebugMessage(\"ȡ������ʧ�ܣ���������!\")")
          return
     end
		  for i=1,5 do
             if �Ի�NPC("������")==1 then
              ��ʱ(2000)
              NPC�����Ի�("����װ������") 
              ��ʱ(2000)
			         if �����Ƿ����("EquipLingPai_ShengJie") ==1 then
						�Ҽ�ʹ����Ʒ(���������б�[kk],1)     --����2:Ϊʹ�ô���
						  ��ʱ(2000)
						  LUA_Call ("setmetatable(_G, {__index = EquipLingPai_ShengJie_Env});EquipLingPai_ShengJie_OnOK();")
					     ��ʱ(2000)
                         װ������(���������б�[kk+1])
						 ��ʱ(2000)
					end
					if LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")==���������б�[kk+1] then
						break
					end
               end
		  end
      end
   end
 end
end

function  ��ȡ������(name,NPCname,index)
if tonumber(��ȡ������Ϣ(63)) >=50 then
 ��Ļ��ʾ("��ȡ������:"..NPCname)
  ���������()
  for i=1,5 do
        Ѱ·(44,47,1)
	��ʱ(3000) 
		if ��ȡ������Ʒ����(name) >=1 then
			��ʱ(2000)
			 ��Ļ��ʾ("�������б���"..name)
              return
         end
         if �Ի�NPC("������")==1 then
              ��ʱ(2000)
              NPC�����Ի�("��ȡ������") 
              ��ʱ(2000)
              NPC�����Ի�(NPCname) 
              ��ʱ(2000)
			  ����_���(index) 
        end
  end
end
end

function  ������Ƕ����(LPname,ZBname,index)
		if ��ȡ������Ʒ����(LPname) >=1 and  ��ȡ������Ʒ����(ZBname)  >=1 then
     LPindex=��ȡ������Ʒλ��(LPname)-1
	 ZBindex =��ȡ������Ʒλ��(ZBname)-1
		LUA_Call(string.format([[
				Clear_XSCRIPT();
				Set_XSCRIPT_Function_Name( "RL_SetRs" );
				Set_XSCRIPT_ScriptID( 880001 );
				Set_XSCRIPT_Parameter( 0, %d);  
				Set_XSCRIPT_Parameter( 1, %d-1);  
				Set_XSCRIPT_Parameter( 2, %d );         --- ��Ʒ��������
				Set_XSCRIPT_ParamCount( 3 );
			Send_XSCRIPT();	
		]], LPindex,index,ZBindex))
	else
	��Ļ��ʾ("���Ʊ��鲻��,�޷���Ƕ")
end
end

function ����ȫ�Զ���Ƕ����()
��Ļ��ʾ("����ȫ�Զ���Ƕ������Ҫȡ��װ���ж�") 
for uuu=1,4 do
	if tonumber(��ȡ������Ϣ(45)+��ȡ������Ϣ(52))<=10*10000 then
		��Ļ��ʾ("��ǰ�������10J,����do����ȫ�Զ���Ƕ����")
		return
    end
	local ��������=LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")
     if  ȡ������()==0 then                 --ȡ��������ifȡ��ʧ��thenreturn
          ��Ļ��ʾ("ȡ������ʧ��,ֹͣ��Ƕ����")
          return
     end
	
       LPindex=��ȡ������Ʒλ��(��������)-1
	   ��Ƕλ�� = LUA_ȡ����ֵ(string.format([[
	    for i=1,4 do
		local nRsID =PlayerPackage:Lua_GetBagItemRl_Rs(%d , i-1)
		if nRsID == -2 then
		PushDebugMessage("δ����:"..i)
		elseif nRsID <= 0 then
		PushDebugMessage("��Ҫ��Ƕ��λ��:"..i)
		return i
		end
		end
        return -1
	]], LPindex), "n")
	
    ��Ļ��ʾ(��Ƕλ��)
     if tonumber(��Ƕλ��)==1 then
	 ��ȡ������("��ȸ���顤Ѫ����","��ȡ��ɫ��ȸ����",0)
	 ������Ƕ����(��������,"��ȸ���顤Ѫ����",1)
     end
	 if tonumber(��Ƕλ��)==2 then
		local  ��������,menpai,PID,Զ������,���⹥��,��ɫ�˺�,���ɵ�ַ,����״̬,�Ա�=��ȡ��������()
         if string.find("����|����|ؤ��", menpai) then
		     ��ȡ������("�������顤������","��ȡ��ɫ��������",3)
              ��ʱ(2000)
		     ������Ƕ����(��������,"�������顤������",2)
              ��ʱ(2000)
         elseif  string.find("��ң|����|", menpai) then
	         ��ȡ������("�������顤�𹥻�","��ȡ��ɫ��������",1)
              ��ʱ(2000)
	         ������Ƕ����(��������,"�������顤�𹥻�",2)
              ��ʱ(2000)
	     elseif  string.find("����|��ɽ|�䵱|�һ���", menpai) then
	         ��ȡ������("�������顤������","��ȡ��ɫ��������",0)
              ��ʱ(2000)
	         ������Ƕ����(��������,"�������顤������",2)
              ��ʱ(2000)
	     elseif  string.find("����|����|���|Ľ��", menpai) then
		     ��ȡ������("�������顤������","��ȡ��ɫ��������",2)
             ��ʱ(2000)
		     ������Ƕ����(��������,"�������顤������",2)
            ��ʱ(2000)
         end
	 end 
 	 if tonumber(��Ƕλ��)==3 then
	 ��ȡ������("���䱦�顤������","��ȡ��ɫ���䱦��",3)
	              ��ʱ(2000)
	 ������Ƕ����(��������,"���䱦�顤������",3)	
	              ��ʱ(2000)
	 end
	 if tonumber(��Ƕλ��)==4 then
		
	 ��ȡ������("�׻����顤����","��ȡ��ɫ�׻�����",4)
	              ��ʱ(2000)
	 ������Ƕ����(��������,"�׻����顤����",4)	
	              ��ʱ(2000)
	 end
	 ��ʱ(3000)
     װ������(��������)
	 if tonumber(��Ƕλ��)==-1 then
       return
	 end	
end	
end

function RsLevelUp(LPindex,toLevel)
	LUA_Call(string.format([[
	local g_RsLevelUp_NeedItem = 38000931
	
local g_RsLevelUp_NeedItem_Num = {
6,6,6,7,7,7,9,9,9,12,12,12,16,16,16,21,21,21,27,27,27,34,34,34,42,42,42,51,51,51,61,61,61,72,72,72,84,84,84,97,97,97,111,111,111,126,126,126,126
}
local m_EquipBagIndex=%d
local toLevel=%d
fo i=1,50  do
for nIndex=1,2 do
local uLevel = PlayerPackage:Lua_GetBagItemRl_RsLevel(m_EquipBagIndex , nIndex - 1)
if toLevel< uLevel then
	Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name( "RsLevelUp_RL" );
			Set_XSCRIPT_ScriptID( 880001 );
			Set_XSCRIPT_Parameter( 0, m_EquipBagIndex);         --- װ����������
			Set_XSCRIPT_Parameter( 1, nIndex - 1);        --- ��Ƕ�ķ�ʯ����
			Set_XSCRIPT_ParamCount( 2 );
	Send_XSCRIPT();	
end
end
end
		]], LPindex,toLevel))	
end


function ���Ʊ������������()
--ȡ����Ʒ("����ľ�|����Һ")  
��������=LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")
if ��ȡ������Ʒ����("����ľ�")>=50 then
���������()
        Ѱ·(44,47,1) 
	��ʱ(5000) 
       if  ȡ������()==0 then                 --ȡ��������ifȡ��ʧ��thenreturn
          LUA_Call("PushDebugMessage(\"ȡ������ʧ�ܣ���������!\")")
          return
      end
    for i=1,5 do
         if �Ի�NPC("������")==1 then
              ��ʱ(3000)
              NPC�����Ի�("���������������") 
              ��ʱ(5000)
              �Ҽ�ʹ����Ʒ(��������,1)

              if �����Ƿ����("EquipLingPai_OperatingSJ")==1 and ��ȡ������Ʒ����("����ľ�")>50  then
                   ��ʱ (1000)
                   �Ҽ�ʹ����Ʒ(��������,1)
                   ��ʱ (1000)
               for i=1,3 do
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnActionItemLClicked(1);")
                   ��ʱ (1000)
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                   ��ʱ (1000)
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnActionItemLClicked(2);")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                   ��ʱ (1000)
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnActionItemLClicked(3);")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                   ��ʱ (1000)
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnActionItemLClicked(4);")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                  LUA_Call("setmetatable(_G, {__index = EquipLingPai_OperatingSJ_Env});EquipLingPai_OperatingSJ_OnOkClicked();")
                end  
                   break
              end
         else 
              ��ʱ(1000)
         end
     end  
	 װ������(��������)
end	
end

function �����Ǽ�����()
��������=LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")
��Ļ��ʾ(��������) 
	if ��ȡ������Ʒ����("����Һ")>=1 then
		���������()
        Ѱ·(44,47,1) ;��ʱ(3000);
       if  ȡ������()==0 then                 --ȡ��������ifȡ��ʧ��thenreturn
          LUA_Call("PushDebugMessage(\"ȡ������ʧ�ܣ���������!\")")
          return
      end
    for i=1,5 do
         if �Ի�NPC("������")==1 then
              ��ʱ(3000)
              NPC�����Ի�("�����Ǽ�����") 
              ��ʱ(5000)
              �Ҽ�ʹ����Ʒ(��������,1)

              if �����Ƿ����("EquipLingPai_Star")==1 and ��ȡ������Ʒ����("����Һ")>=1  then
                   ��ʱ (1000)
                   �Ҽ�ʹ����Ʒ(��������,1)
                   ��ʱ (1000)
				
               for i=1,��ȡ������Ʒ����("����Һ") do
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_Star_Env});EquipLingPai_Star_OnOkClicked();")
                   ��ʱ (100)
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_Star_Env});EquipLingPai_Star_OnOkClicked();")
                   ��ʱ (100)
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_Star_Env});EquipLingPai_Star_OnOkClicked();")
                   ��ʱ (100)
                   LUA_Call("setmetatable(_G, {__index = EquipLingPai_Star_Env});EquipLingPai_Star_OnOkClicked();")
                end  
                   break
              end
         else 
              ��ʱ(1000)
         end
     end  
		 װ������(��������)
end	
end




function ����������������()
	��Ļ��ʾ("����������������  ��Ҫȡ��װ���ж�") 
	if ��ȡ������Ʒ����("��ľ�ʯ")>=1 then
		���������()
        Ѱ·(44,47,1) 
		��ʱ(5000)
		��Ļ��ʾ("do����������������") 
	else
		return
	end
    local ��������=LUA_ȡ����ֵ("return EnumAction(20,'equip'):GetName();")
	��ʱ(2000)
    if  ȡ������()==0 then
        ��Ļ��ʾ("ȡ������ʧ�ܣ���������������������")
        return
    end
    LPindex=��ȡ������Ʒλ��(��������)-1
	��Ļ��ʾ(��������..LPindex.."|��ʼ����������������")
	for yyy=1,10 do
		LUA_Call(string.format([[
			LPindex=tonumber(%d)
			local nExAttrID111 , nExAttrStr111= PlayerPackage:Lua_GetBagRlExAttr(LPindex, 0)
			if string.find(nExAttrStr111,"maxhp") then
				aaa=1
			else
				aaa=0
			end
			local  nExAttrID222 , nExAttrStr222 = PlayerPackage:Lua_GetBagRlExAttr(LPindex, 1)
			if string.find(nExAttrStr222,"maxhp") then
				bbb=1
			else
				bbb=0
			end

			local  nExAttrID333 , nExAttrStr333 = PlayerPackage:Lua_GetBagRlExAttr(LPindex, 2)
			if string.find(nExAttrStr333,"maxhp") then
				ccc=1
			else
				ccc=0
			end

			PushDebugMessage(aaa..bbb..ccc)

			if aaa+bbb+ccc ==1 then
				PushDebugMessage("�Ѿ���1��Ѫ��������Ҫ�����ʯ2��")
			elseif  aaa+bbb+ccc ==2 then
				PushDebugMessage("�Ѿ���2��Ѫ��������Ҫ�����ʯ3��")
			elseif  aaa+bbb+ccc ==3 then
				PushDebugMessage("�Ѿ���3��Ѫ������������ϴ����ѭ��")
				return
			end
			--��ʼ����
			Clear_XSCRIPT();
			Set_XSCRIPT_Function_Name("RlResetExAttr");
			Set_XSCRIPT_ScriptID(880001);
			Set_XSCRIPT_Parameter(0,LPindex);
			Set_XSCRIPT_Parameter(1,aaa);
			Set_XSCRIPT_Parameter(2,bbb);
			Set_XSCRIPT_Parameter(3,ccc);
			Set_XSCRIPT_Parameter(4,0);
			Set_XSCRIPT_ParamCount(5);
			Send_XSCRIPT();	
		]], LPindex))
		��ʱ(2000)--������ʱ�ȴ���������Ӧ
	end
	װ������(��������)
end



��ȡ����()
��������()
����ȫ�Զ���Ƕ����()
�����Ǽ�����()
���Ʊ������������()
--����������������() --ָ��3Ѫ����
