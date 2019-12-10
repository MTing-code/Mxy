--1������ԱȨ�ޣ�����һ����ΪTRG_WORDS_insert�������������ӵ�����Ϣʱ��ʾ����ǰ��ĵ�����Ϣ
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

--2������ԱȨ�ޣ�����һ����ΪTRG_WORDS_update �����������޸ĵ�����Ϣʱ��ʾ�޸�ǰ��ĵ�����Ϣ
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
--3������ԱȨ�ޣ�����һ����ΪTRG_WORDS_DELETE�����������޸ĵ�����Ϣʱ��ʾ�޸�ǰ��ĵ�����Ϣ
CREATE OR REPLACE TRIGGER TRG_WORDS_DELETE
BEFORE  DELETE ON WORDS_STOCK
FOR EACH ROW
BEGIN
    IF deleting THEN
         DBMS_OUTPUT.PUT_LINE(:OLD.WORD_NUM||' '||:OLD.WORDS);
            END IF;
END TRG_WORDS_OPERATION;
/

--4������ΪTRG_CHOOSE_CHECK�ڱ����ʵ�ʱ����İ�������õ����Ѵ��ڷ����Ѵ���
create or replace TRIGGER TRG_CHOOSE_CHECK
BEFORE INSERT ON CHOOSE
FOR EACH ROW
DECLARE
inde number;
BEGIN
SELECT count(*)into inde FROM choose where user_id=:new.user_id and word_num=:new.word_num;
     if(inde>0)
   then
        DBMS_OUTPUT.PUT_LINE('�õ����Ѵ���');
        END IF;
END TRG_CHOOSE_CHECK;
/