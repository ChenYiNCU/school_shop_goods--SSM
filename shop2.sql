
create table ADMIN
(
  a_id   NUMBER not null,
  a_name VARCHAR2(8),
  a_pwd  VARCHAR2(12)
)
;
alter table ADMIN
  add primary key (A_ID);

create table EVALUATION
(
  e_id      NUMBER,
  g_id      NUMBER not null,
  se_id     NUMBER not null,
  bu_id     NUMBER not null,
  e_content VARCHAR2(1024),
  e_score   NUMBER
)
;
alter table EVALUATION
  add constraint CK_E_SCORE
  check (e_score>0 and e_score<6);

create table GOODS
(
  g_id     NUMBER not null,
  g_name   VARCHAR2(1024) not null,
  t_id     NUMBER not null,
  g_price  NUMBER not null,
  g_detail VARCHAR2(1024),
  se_id    NUMBER not null,
  bu_id    NUMBER,
  flag     NUMBER,
  url      VARCHAR2(1024)
)
;
alter table GOODS
  add primary key (G_ID);

create table TYPE
(
  t_id   NUMBER not null,
  t_name VARCHAR2(12)
)
;
alter table TYPE
  add primary key (T_ID);

create table USER2
(
  u_id     NUMBER not null,
  u_name   VARCHAR2(8),
  u_pwd    VARCHAR2(12),
  u_sid    VARCHAR2(12) not null,
  u_class  VARCHAR2(12),
  u_margin VARCHAR2(12),
  u_flag   NUMBER default 1
)
;
alter table USER2
  add primary key (U_ID);


insert into ADMIN (a_id, a_name, a_pwd)
values (1, '123', '123');
commit;

insert into EVALUATION (e_id, g_id, se_id, bu_id, e_content, e_score)
values (3, 5, 2, 1, '好', 5);
insert into EVALUATION (e_id, g_id, se_id, bu_id, e_content, e_score)
values (22, 2, 1, 2, '一般般', 3);
insert into EVALUATION (e_id, g_id, se_id, bu_id, e_content, e_score)
values (4, 1, 1, 2, '耳机音质很好', 5);
insert into EVALUATION (e_id, g_id, se_id, bu_id, e_content, e_score)
values (23, 6, 1, 2, '实惠便宜，爱了爱了', 5);
insert into EVALUATION (e_id, g_id, se_id, bu_id, e_content, e_score)
values (25, 46, 1, 2, '不错', 4);
commit;

insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (1, '耳机', 2, 30, null, 1, 2, 3, './img/001.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (2, '手机', 2, 1500, null, 1, 2, 3, './img/002.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (3, '鞋子', 3, 200, '全新，便宜卖', 2, null, 0, './img/003.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (4, '半身裙', 4, 200, '全新', 2, null, 1, './img/004.png');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (5, '口红', 8, 100, '全新', 2, 1, 3, './img/005.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (6, '行李箱', 5, 150, '9成新，买了新的，用不到了', 1, 2, 3, './img/006.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (7, '豆本豆', 6, 30, '买多了，喝不完', 2, 1, 3, './img/007.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (8, '国富论', 7, 20, null, 5, null, 1, './img/008.png');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (9, '软件测试', 7, 10, null, 3, 1, 2, './img/009.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (10, '鼠标', 2, 50, null, 3, null, 1, './img/010.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (11, '显示器', 2, 1000, '21寸', 1, null, 1, './img/011.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (12, '乐事薯片', 6, 10, '5包，吃不下了', 4, 1, 3, './img/012.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (13, '帽子', 4, 20, '带过一次', 6, null, 1, './img/帽子.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (14, '洗发水', 12, 10, '毕业清场', 6, null, 0, './img/洗发水.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (15, '键盘', 2, 50, '8成新', 6, null, 1, './img/键盘.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (41, '清洁面膜', 8, 80, '用过一次，便宜卖', 41, null, 1, './img/清洁面膜.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (45, 'mac口红', 8, 80, '用过一次', 41, null, 0, './img/口红mac.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (46, '自行车', 9, 100, '毕业，转让', 1, 2, 3, './img/1自行车.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (44, '抱枕', 4, 10, '123456', 41, null, 1, './img/抱枕.jpg');
insert into GOODS (g_id, g_name, t_id, g_price, g_detail, se_id, bu_id, flag, url)
values (47, '直板夹', 1, 80, null, 1, 2, 3, './img/1直板夹.jpg');
commit;

insert into TYPE (t_id, t_name)
values (1, '文具');
insert into TYPE (t_id, t_name)
values (2, '电子产品');
insert into TYPE (t_id, t_name)
values (3, '男装');
insert into TYPE (t_id, t_name)
values (4, '女装');
insert into TYPE (t_id, t_name)
values (5, '箱包');
insert into TYPE (t_id, t_name)
values (6, '食物');
insert into TYPE (t_id, t_name)
values (7, '书籍');
insert into TYPE (t_id, t_name)
values (8, '美妆');
insert into TYPE (t_id, t_name)
values (9, '运动器械');
insert into TYPE (t_id, t_name)
values (10, '游戏装备');
insert into TYPE (t_id, t_name)
values (11, '动漫周边');
insert into TYPE (t_id, t_name)
values (12, '洗护用品');
insert into TYPE (t_id, t_name)
values (21, '生活用品');
commit;

insert into USER2 (u_id, u_name, u_pwd, u_sid, u_class, u_margin, u_flag)
values (1, '小罗', '123', '8002118311', '软工171', '软件工程', 1);
insert into USER2 (u_id, u_name, u_pwd, u_sid, u_class, u_margin, u_flag)
values (2, '小红', '123', '8002118312', '软工172', '软件工程', 1);
insert into USER2 (u_id, u_name, u_pwd, u_sid, u_class, u_margin, u_flag)
values (3, '小董', '123', '8002118318', '软工182', '软件工程', 1);
insert into USER2 (u_id, u_name, u_pwd, u_sid, u_class, u_margin, u_flag)
values (4, '小王', '123', '8002118317', '软工182', '软件工程', 1);
insert into USER2 (u_id, u_name, u_pwd, u_sid, u_class, u_margin, u_flag)
values (5, '小陈', '123', '8002118316', '软工182', '软件工程', 1);
insert into USER2 (u_id, u_name, u_pwd, u_sid, u_class, u_margin, u_flag)
values (6, '小张', '123', '8002118315', '软工182', '软件工程', 1);
insert into USER2 (u_id, u_name, u_pwd, u_sid, u_class, u_margin, u_flag)
values (41, '小o', '123', '8002118320', '软工125', '软件工程', 1);
commit;
