--1（管理员权限）创建一个名为TRG_WORDS_insert触发器，当增加单词信息时显示增加前后的单词信息
CREATE OR REPLACE TRIGGER TRG_WORDS_insert
BEFORE INSERT ON WORDS_STOCK
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE(:NEW.WORD_NUM||' '||:NEW.CLASS_NUM||' '||:NEW.WORDS||' '||
        :NEW.SOUNDMARK||' '||:NEW.TRANSLATIONS||' '||:NEW.EXAMPLE);
       END IF;
END TRG_WORDS_OPERATION;
/

--2（管理员权限）创建一个名为TRG_WORDS_update 触发器，当修改单词信息时显示修改前后的单词信息
create or replace trigger TRG_WORDS_update 
before  update  on WORDS_STOCK
for each row
begin
    if UPDATING then
        DBMS_OUTPUT.PUT_LINE(:old.CLASS_NUM||' '||:new.CLASS_NUM||' '||:old.WORDS||' '||:new.WORDS||' '||
            :old.SOUNDMARK||' '||:new.SOUNDMARK||' '||:old.TRANSLATIONS||' '||:new.TRANSLATIONS||' '||:old.EXAMPLE||' '||:new.EXAMPLE);
            end if;
end TRG_WORDS_DELE;
/
--3（管理员权限）创建一个名为TRG_WORDS_DELETE触发器，当修改单词信息时显示修改前后的单词信息
CREATE OR REPLACE TRIGGER TRG_WORDS_DELETE
BEFORE  DELETE ON WORDS_STOCK
FOR EACH ROW
BEGIN
    IF deleting THEN
         DBMS_OUTPUT.PUT_LINE(:OLD.WORD_NUM||' '||:OLD.WORDS);
            END IF;
END TRG_WORDS_OPERATION;
/

--4创建名为TRG_CHOOSE_CHECK在背单词的时候点击陌生，若该单词已存在返回已存在
create or replace TRIGGER TRG_CHOOSE_CHECK
BEFORE INSERT ON CHOOSE
FOR EACH ROW
DECLARE
inde number;
BEGIN
SELECT count(*)into inde FROM choose where user_id=:new.user_id and word_num=:new.word_num;
     if(inde>0)
   then
        DBMS_OUTPUT.PUT_LINE('该单词已存在');
        END IF;
END TRG_CHOOSE_CHECK;
/