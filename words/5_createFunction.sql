--1输入用户id返回该用户所选单词类别数
create or replace FUNCTION fun_user_id (
    p_user_id users.user_ID%type
)
return number
AS
v_cla number;
Begin
    select  count(distinct(classes.class_num)) into v_cla from CHOOSE,WORDS_STOCK,classes 
    where CHOOSE.user_id =p_user_id
    and WORDS_STOCK.WORD_NUM=CHOOSE.WORD_NUM 
    and classes.CLASS_NUM=WORDS_STOCK.CLASS_NUM;

    return v_cla;
Exception
     When NO_DATA_FOUND then
		DBMS_OUTPUT.PUT_LINE('查无此记录！！！');
End fun_user_id;

/


--2输入单词类别编号返回选择这个类别的人数
create or replace FUNCTION fun_class_user_count (
    p_CLASS_NUM classes.CLASS_NUM%type
)
return number
AS
v_count number;
Begin
    select count(distinct(user_id)) into v_count from ( select 
 users.user_id,users.user_name,users.user_pwd,
 words_stock.word_num,words_stock.words,words_stock.soundmark,words_stock.translations,
 words_stock.example ,classes.class_name,classes.class_num
 from choose,users,words_stock,classes
 where
 choose.word_num=words_stock.word_num 
 and choose.user_id=users.user_id 
 and words_stock.class_num=classes.class_num) 
 group by class_num having class_num=p_CLASS_NUM;

    return v_count;
Exception
     When NO_DATA_FOUND then
		DBMS_OUTPUT.PUT_LINE('查无此记录！！！');
End fun_class_user_count;

/


