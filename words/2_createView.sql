disconn ;
conn / as sysdba;
grant create any view to scott;
disconn;
conn scott/tiger;

drop view U_Ch ;
drop view CH_W ;
drop view W_CL;
drop view  U_Ch_W_Cl ;

--1用户表与选择表连接查询视图
create view U_Ch
as 
select users.USER_ID ,users.USER_NAME,
choose.WORD_NUM
from 
choose,users
 where choose.USER_ID=users.USER_ID;

--2选择表与词库连接查询视图
 CREATE VIEW CH_W 
AS 
  SELECT user_id ,
choose.word_num,
class_num,
words,
soundmark,
TRANSLATIONS,
example 
FROM WORDS_STOCK,CHOOSE 
WHERE choose.word_num=words_stock.word_num;

--3词库表与分类表连接查询视图
CREATE VIEW W_CL
as
SELECT WORDS_STOCK.WORD_NUM,WORDS_STOCK.WORDS,
 WORDS_STOCK.SOUNDMARK,WORDS_STOCK.TRANSLATIONS,
 WORDS_STOCK.EXAMPLE,CLASSES.CLASS_NUM,CLASSES.CLASS_NAME
 FROM WORDS_STOCK,CLASSES
 WHERE WORDS_STOCK.CLASS_NUM=CLASSES.CLASS_NUM;

--4整体视图
create view U_Ch_W_Cl
 as 
 select 
 users.USER_ID,users.USER_NAME,
 words_stock.words,words_stock.soundmark,words_stock.TRANSLATIONS,
 words_stock.EXAMPLE ,CLASSES.CLASS_NAME
 from choose,users,words_stock,CLASSES
 where
 choose.WORD_NUM=words_stock.WORD_NUM and choose.USER_ID=users.USER_ID;