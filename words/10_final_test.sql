--����1FUN_USER_ID(�û�id)��֤
select FUN_USER_ID('0001') from dual;
--���
--FUN_USER_ID('0001')
---------------------
--                  2



--����2fun_class_user_count('�����')��֤
select fun_class_user_count('c2') from dual;
--���
--FUN_CLASS_USER_COUNT('C2')
----------------------------
--                         2


--����1pro_admin_id('����Աid')��֤
set SERVEROUTPUT ON
EXECUTE pro_admin_id('001');

--����2pro_CLASS_NUM('�����')��֤
EXECUTE pro_CLASS_NUM('c4');
set SERVEROUTPUT ON

--����3PRO_USERS_MESSAGE('�û�id')��֤
set SERVEROUTPUT ON
EXECUTE PRO_USERS_MESSAGE('0001');
--���
--USER_ID:0001 USER_NAME:Mxy USER_PWD:0001

--����4proc_user_choose_words_stock('�û�id')��֤
set SERVEROUTPUT ON
EXECUTE proc_user_choose_words_stock('0001')
--���
--�û���:Mxy   ����:wing  ���:����
--�û���:Mxy   ����:unique  ���:����


--����5proc_words_stock_classes('�������')��֤
set SERVEROUTPUT ON
EXECUTE proc_words_stock_classes('�ļ�')

--���ʱ��:ws3   �����:c3  ����:urban   ����:/'?:b?n/  ����:a. ���е�,ס�ڶ��е�   ����:a  ���:�ļ�
--���ʱ��:ws7   �����:c3  ����:foreign   ����:/'f?rin/  ����:a.����ģ�������   ����:a  ���:�ļ�
--���ʱ��:ws11   �����:c3  ����:barber   ����:/'ba:b?/  ����:n.��ʦ   ����:a  ���:�ļ�


--����6proc_users('�û����еĲ���')��֤
set SERVEROUTPUT ON
EXECUTE proc_users('d')
--���
--����:Ldg   id:0003
--����7proc_user_choose_words_classes('�û�id')��֤
set SERVEROUTPUT ON
EXECUTE proc_user_choose_words_classes('0001')

--���
--�û�id:0001   ����:Mxy  ���ʱ��:ws1   ����:wing  ����:/wi?/   ����:n.����򣬳�  ����:a   �����:����  �����:c1
--�û�id:0001   ����:Mxy  ���ʱ��:ws2   ����:unique  ����:/ju:��ni:k/   ����:a.Ψһ�ģ���һ�޶���  ����:a   �����:����  �����:c2
