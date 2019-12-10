--1输入管理员id返回管理员信息

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
	    DBMS_OUTPUT.PUT_LINE('查无此人');
End pro_admin_id;
/


--2输入类别编号，输出类别信息
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
	    DBMS_OUTPUT.PUT_LINE('查无此项');
End pro_CLASS_NUM;
/




--      3输入用户id查询用户信息
create or replace PROCEDURE PRO_USERS_MESSAGE(P_USER_ID USERS.USER_ID%TYPE)
AS

BEGIN
    FOR V_USERS IN(SELECT USER_ID,USER_NAME,USER_PWD FROM USERS WHERE USERS.USER_ID=P_USER_ID)
LOOP
    DBMS_OUTPUT.PUT_LINE('USER_ID:'||''||V_USERS.USER_ID||' '||'USER_NAME:'||''||V_USERS.USER_NAME||' '||'USER_PWD:'||''||V_USERS.USER_PWD);
    END LOOP;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('此用户不存在');
END PRO_USERS_MESSAGE;  
/


--4输入用户id输出该用户的错难词以及单词类别
CREATE OR REPLACE PROCEDURE proc_user_choose_words_stock (
    p_user_id users.user_id%TYPE
) AS
BEGIN
dbms_output.put_line(p_user_id);
    FOR v_cw IN (SELECT user_name,words,CLASS_name from U_CH_W_CL where user_id=p_user_id) LOOP
        dbms_output.put_line('用户名:'
                             || v_cw.user_name
                             || '   单词:'
                             || v_cw.words
                             || '  类别:'
                             || v_cw.CLASS_name
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20000, '查找失败!!!');
END proc_user_choose_words_stock;
/

--5输入单词类别返回所有该类单词
CREATE OR REPLACE PROCEDURE proc_words_stock_classes (
    p_class_name classes.class_name%TYPE
) AS
BEGIN
    FOR v_ws_c IN (select words_stock.*,class_name from words_stock,classes where words_stock.class_num=classes.class_num and class_name=p_class_name) LOOP
        dbms_output.put_line('单词编号:'
                             || v_ws_c.word_num
                             || '   类别编号:'
                             || v_ws_c.class_num
                             || '  单词:'
                             || v_ws_c.words
                              || '   音标:'
                             || v_ws_c.SOUNDMARK
                             || '  翻译:'
                             || v_ws_c.TRANSLATIONS
                              || '   例句:'
                             || v_ws_c.EXAMPLE
                             || '  类别:'
                             || v_ws_c.CLASS_name
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20010, '查找失败!!!');
END proc_words_stock_classes;
/




--6输入用户的名字中的一个字,返回用户信息
CREATE OR REPLACE procedure  proc_users (
    p_user_name users.user_name%TYPE
) AS

BEGIN
    FOR v_user IN (select * from users where user_name like '%'||p_user_name||'%') LOOP
        dbms_output.put_line('姓名:'
                             || v_user.user_name
                             || '   id:'
                             || v_user.user_id
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20002, '查找失败!!!');
END proc_users;

/





--7输入用户id输出用户信息,单词信息,类别信息
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
        dbms_output.put_line('用户id:'
                             || v_u_c_w_c.USER_ID
                             || '   姓名:'
                             || v_u_c_w_c.USER_NAME
                             || '  单词编号:'
                             || v_u_c_w_c.word_num
                              || '   单词:'
                             || v_u_c_w_c.words
                             || '  音标:'
                             || v_u_c_w_c.soundmark
                              || '   翻译:'
                             || v_u_c_w_c.TRANSLATIONS
                             || '  例句:'
                             || v_u_c_w_c.EXAMPLE
                                || '   类别名:'
                             || v_u_c_w_c.CLASS_NAME
                             || '  类别编号:'
                             || v_u_c_w_c.CLASS_num
                             );
    END LOOP;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20003, '查找失败!!!');
END proc_user_choose_words_classes;
/
