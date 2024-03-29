
drop table CLASSES  cascade constraints;
drop table WORDS_STOCK cascade constraints;
drop table USERS cascade constraints;
drop table CHOOSE cascade constraints;
drop table ADMIN cascade constraints;

--单词类别表

  CREATE TABLE CLASSES 
   (	"CLASS_NUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"CLASS_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "CLASSES_PK" PRIMARY KEY ("CLASS_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE
   ) ;


--单词表

  CREATE TABLE WORDS_STOCK 
   (	"WORD_NUM" VARCHAR2(20 BYTE), 
	"CLASS_NUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WORDS" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"SOUNDMARK" VARCHAR2(50 BYTE), 
	"TRANSLATIONS" VARCHAR2(250 BYTE), 
	"EXAMPLE" VARCHAR2(250 BYTE), 
	 PRIMARY KEY ("WORD_NUM")）;

 
--用户表

  CREATE TABLE USERS
   (	"USER_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"USER_ID" VARCHAR2(20 BYTE), 
	"USER_PWD" VARCHAR2(20 BYTE), 
	 CONSTRAINT "USERS_PK" PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE
   );


 
--选择表

  CREATE TABLE CHOOSE
   (	"USER_ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WORD_NUM" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "CHOOSE_PK" PRIMARY KEY ("USER_ID", "WORD_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "CHOOSE_FK1" FOREIGN KEY ("USER_ID")
	  REFERENCES USERS ("USER_ID") ENABLE, 
	 CONSTRAINT "CHOOSE_FK2" FOREIGN KEY ("WORD_NUM")
	  REFERENCES WORDS_STOCK ("WORD_NUM") ENABLE
   );
 

 
--管理员

 
  CREATE TABLE ADMIN
   (	"ADMIN_ID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ADMIN_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"ADMIN_PWD" VARCHAR2(20 BYTE), 
	 CONSTRAINT "ADMIN_PK" PRIMARY KEY ("ADMIN_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) ;
 
 
