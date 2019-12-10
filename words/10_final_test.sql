--函数1FUN_USER_ID(用户id)验证
select FUN_USER_ID('0001') from dual;
--输出
--FUN_USER_ID('0001')
---------------------
--                  2



--函数2fun_class_user_count('类别编号')验证
select fun_class_user_count('c2') from dual;
--输出
--FUN_CLASS_USER_COUNT('C2')
----------------------------
--                         2


--过程1pro_admin_id('管理员id')验证
set SERVEROUTPUT ON
EXECUTE pro_admin_id('001');

--过程2pro_CLASS_NUM('类别编号')验证
EXECUTE pro_CLASS_NUM('c4');
set SERVEROUTPUT ON

--过程3PRO_USERS_MESSAGE('用户id')验证
set SERVEROUTPUT ON
EXECUTE PRO_USERS_MESSAGE('0001');
--输出
--USER_ID:0001 USER_NAME:Mxy USER_PWD:0001

--过程4proc_user_choose_words_stock('用户id')验证
set SERVEROUTPUT ON
EXECUTE proc_user_choose_words_stock('0001')
--输出
--用户名:Mxy   单词:wing  类别:初中
--用户名:Mxy   单词:unique  类别:高中


--过程5proc_words_stock_classes('单词类别')验证
set SERVEROUTPUT ON
EXECUTE proc_words_stock_classes('四级')

--单词编号:ws3   类别编号:c3  单词:urban   音标:/'?:b?n/  翻译:a. 都市的,住在都市的   例句:a  类别:四级
--单词编号:ws7   类别编号:c3  单词:foreign   音标:/'f?rin/  翻译:a.外国的；外来的   例句:a  类别:四级
--单词编号:ws11   类别编号:c3  单词:barber   音标:/'ba:b?/  翻译:n.理发师   例句:a  类别:四级


--过程6proc_users('用户名中的部分')验证
set SERVEROUTPUT ON
EXECUTE proc_users('d')
--输出
--姓名:Ldg   id:0003
--过程7proc_user_choose_words_classes('用户id')验证
set SERVEROUTPUT ON
EXECUTE proc_user_choose_words_classes('0001')

--输出
--用户id:0001   姓名:Mxy  单词编号:ws1   单词:wing  音标:/wi?/   翻译:n.翼，翅膀，翅  例句:a   类别名:初中  类别编号:c1
--用户id:0001   姓名:Mxy  单词编号:ws2   单词:unique  音标:/ju:’ni:k/   翻译:a.唯一的，独一无二的  例句:a   类别名:高中  类别编号:c2
