disconn;
conn / as sysdba;

drop tablespace TEST including contents and datafiles CASCADE CONSTRAINTS;

create tablespace TEST datafile
'C:\words\TEST.dbf' 
SIZE 10M;

drop user admins CASCADE;
drop user yjt CASCADE;

create user admins identified by 123456 default tablespace test;
create user yjt identified by 123456 default tablespace test;

drop role role1 CASCADE;
drop role role2 CASCADE;

create role role1;
create role role2;

grant create session to role1,role2;

grant resource to role1; 
grant alter any table to role1;
grant insert any table to role1;
grant update any table to role1;

grant dba to role2;
grant read, write on directory dumpdir to role2;//读写权限
grant exp_full_database, imp_full_database to role2;//逻辑导入导出权限

grant role2 to admins;
grant role1 to yjt;

