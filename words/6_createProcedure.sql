--1�������Աid���ع���Ա��Ϣ

create or replace PROCEDURE pro_admin_id( p_admin_id admin.ADMIN_ID%type)
AS

Begin
 For v_adm IN (SELECT ADMIN_ID,ADMIN_NAME,ADMIN_PWD 
 FROM admin where admin_id=p_admin_id ) 
loop
		DBMS_OUTPUT.PUT_LINE('ADMIN_ID: ' || v_adm.ADMIN_ID || ' ,ADMIN_NAME: ' || v_adm.ADMIN_NAME || ',ADMIN_PWD : ' || v_adm.ADMIN_PWD);
   End Loop;
Exception 
 When NO_DATA_FOUND then
	    DBMS_OUTPUT.PUT_LINE('���޴���');
End pro_admin_id;
/


--2��������ţ���������Ϣ
create or replace PROCEDURE pro_CLASS_NUM( p_class_num CLASSES.CLASS_NUM%type)
AS

Begin
 For v_cla IN (SELECT CLASS_NUM,CLASS_NAME
 FROM CLASSES where CLASS_NUM=p_class_num ) 
loop
		DBMS_OUTPUT.PUT_LINE('CLASS_NUM: ' || v_cla.CLASS_NUM || ' ,CLASS_NAME: ' || v_cla.CLASS_NAME );
   End Loop;
Exception 
 When NO_DATA_FOUND then
	    DBMS_OUTPUT.PUT_LINE('���޴���');
End pro_CLASS_NUM;
/




--      3�����û�id��ѯ�û���Ϣ
create or replace PROCEDURE PRO_USERS_MESSAGE(P_USER_ID USERS.USER_ID%TYPE)
AS

BEGIN
    FOR V_USERS IN(SELECT USER_ID,USER_NAME,USER_PWD FROM USERS WHERE USERS.USER_ID=P_USER_ID)
LOOP
    DBMS_OUTPUT.PUT_LINE('USER_ID:'||''||V_USERS.USER_ID||' '||'USER_NAME:'||''||V_USERS.USER_NAME||' '||'USER_PWD:'||''||V_USERS.USER_PWD);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('���û�������');
END PRO_USERS_MESSAGE;  
/


--4�����û�id������û��Ĵ��Ѵ��Լ��������
CREATE OR REPLACE PROCEDURE proc_user_choose_words_stock (
    p_user_id users.user_id%TYPE
) AS
BEGIN
dbms_output.put_line(p_user_id);
    FOR v_cw IN (SELECT user_name,words,CLASS_name from U_CH_W_CL where user_id=p_user_id) LOOP
        dbms_output.put_line('�û���:'
                             || v_cw.user_name
                             || '   ����:'
                             || v_cw.words
                             || '  ���:'
                             || v_cw.CLASS_name
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20000, '����ʧ��!!!');
END proc_user_choose_words_stock;
/

--5���뵥����𷵻����и��൥��
CREATE OR REPLACE PROCEDURE proc_words_stock_classes (
    p_class_name classes.class_name%TYPE
) AS
BEGIN
    FOR v_ws_c IN (select words_stock.*,class_name from words_stock,classes where words_stock.class_num=classes.class_num and class_name=p_class_name) LOOP
        dbms_output.put_line('���ʱ��:'
                             || v_ws_c.word_num
                             || '   �����:'
                             || v_ws_c.class_num
                             || '  ����:'
                             || v_ws_c.words
                              || '   ����:'
                             || v_ws_c.SOUNDMARK
                             || '  ����:'
                             || v_ws_c.TRANSLATIONS
                              || '   ����:'
                             || v_ws_c.EXAMPLE
                             || '  ���:'
                             || v_ws_c.CLASS_name
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20010, '����ʧ��!!!');
END proc_words_stock_classes;
/




--6�����û��������е�һ����,�����û���Ϣ
CREATE OR REPLACE procedure  proc_users (
    p_user_name users.user_name%TYPE
) AS

BEGIN
    FOR v_user IN (select * from users where user_name like '%'||p_user_name||'%') LOOP
        dbms_output.put_line('����:'
                             || v_user.user_name
                             || '   id:'
                             || v_user.user_id
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20002, '����ʧ��!!!');
END proc_users;

/





--7�����û�id����û���Ϣ,������Ϣ,�����Ϣ
CREATE OR REPLACE PROCEDURE proc_user_choose_words_classes (
    p_user_id users.user_id%TYPE
) AS
BEGIN
    FOR v_u_c_w_c IN (select 
 users.USER_ID,users.USER_NAME,
 words_stock.word_num, words_stock.words,words_stock.soundmark,words_stock.TRANSLATIONS,
 words_stock.EXAMPLE ,CLASSES.CLASS_NAME,CLASSES.CLASS_num
 from choose,users,words_stock,CLASSES
 where
 choose.WORD_NUM=words_stock.WORD_NUM and choose.USER_ID=users.USER_ID and words_stock.class_num=classes.class_num and users.user_id=p_user_id ) LOOP
        dbms_output.put_line('�û�id:'
                             || v_u_c_w_c.USER_ID
                             || '   ����:'
                             || v_u_c_w_c.USER_NAME
                             || '  ���ʱ��:'
                             || v_u_c_w_c.word_num
                              || '   ����:'
                             || v_u_c_w_c.words
                             || '  ����:'
                             || v_u_c_w_c.soundmark
                              || '   ����:'
                             || v_u_c_w_c.TRANSLATIONS
                             || '  ����:'
                             || v_u_c_w_c.EXAMPLE
                                || '   �����:'
                             || v_u_c_w_c.CLASS_NAME
                             || '  �����:'
                             || v_u_c_w_c.CLASS_num
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20003, '����ʧ��!!!');
END proc_user_choose_words_classes;
/
