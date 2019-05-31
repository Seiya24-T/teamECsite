/*
 * コメントは
 * comment "この中に書く"
 */

set names utf8;
set foreign_key_checks=0;

drop database if exists orion;
create database if not exists orion;

use orion;

create table user_info(
	id int not null primary key auto_increment comment "ID",
	user_id varchar(16) unique not null comment "ユーザーID",
	password varchar(16) not null comment "パスワード",
	family_name varchar(32) not null comment "姓",
	first_name varchar(32) not null comment "名",
	family_name_kana varchar(32) not null comment "姓かな",
	first_name_kana varchar(32) not null comment "名かな",
	sex tinyint default 0 comment "性別",
	email varchar(32) comment "メールアドレス",
	status tinyint default 0 comment "ステータス",
	logined tinyint not null default 0 comment "ログインフラグ",
	regist_date datetime comment "登録日",
	update_date datetime comment "更新日"
)
default charset=utf8
comment="会員情報テーブル";

insert into user_info values
(1,"guest","guest","夏目","漱石","なつめ","そうせき",0,"noname@gmail.com",0,0,now(),now()),
(2,"guest2","guest2","芥川","龍之介","あくたがわ","りゅうのすけ",0,"InTheCoffin@gmail.com",0,0,now(),now()),
(3,"guest3","guest3","太宰","治","だざい","おさむ",0,"shikkaku@gmail.com",0,0,now(),now()),
(4,"guest4","guest4","志賀","直哉","しが","なおや",0,"kamisama@gmail.com",0,0,now(),now()),
(5,"guest5","guest5","谷崎","潤一郎","たにざき","じゅんいちろう",0,"tani@gmail.com",0,0,now(),now()),
(6,"guest6","guest6","三島","由紀夫","みしま","ゆきお",0,"kinkakuji.com",0,0,now(),now()),
(7,"guest7","guest7","井伏","鱒二","いぶせ","ますじ",0,"sansyo@gmail.com",0,0,now(),now()),
(8,"guest8","guest8","川端","康成","かわばた","やすなり",0,"nobel@gmail.com",0,0,now(),now()),
(9,"guest9","guest9","宮沢","賢治","みやざわ","けんじ",0,"kurambon@gmail.com",0,0,now(),now()),
(10,"guest10","guest10","村上","春樹","むらかみ","はるき",0,"harukisuto@gmail.com",0,0,now(),now()),
(11,"guest11","guest11","中島","敦","なかじま","あつし",0,"atsushi@gmail.com",0,0,now(),now()),
(12,"guest12","guest12","フョードル","ドストエフスキー","ふょーどる","どすとえふすきい",0,"karamazof@gmail.com",0,0,now(),now());

create table product_info(
	id int not null primary key auto_increment comment "ID",
	product_id int unique not null,
	product_name varchar(100) unique not null,
	product_name_kana varchar(100) unique not null,
	product_description varchar(255),
	category_id int not null,
	price int not null,
	image_file_path varchar(100) not null,
	image_file_name varchar(50) not null,
	release_date datetime comment "発売年月",
	release_company varchar(50) comment "発売会社",
	status tinyint default 1 comment "ステータス",
	regist_date datetime comment "登録日",
	update_date datetime comment "更新日",
	foreign key(category_id) references m_category(category_id)
)
default charset=utf8
comment "商品情報テーブル";

insert into product_info values
( 1, 1,"intercessor","いんたーせっさー","とりなしをする人の本です。",2,1000,"./images/book","book1.jpg",now(),"orion",1,now(),now()),
( 2, 2,"カメラと本","かめらとほん","カメラに関する本です。",2,700,"./images/book","book2.jpg",now(),"orion",1,now(),now()),
( 3, 3,"ビールカタログ","びーるかたろぐ","ビールのカタログです。",2,1200,"./images/book","book3.jpg",now(),"orion",1,now(),now()),
( 4, 4,"蜘蛛男が読んでいる本","くもおとこがよんでいるほん","蜘蛛男が読んでいる本です。",2,3000,"./images/book","book4.jpg",now(),"orion",1,now(),now()),
( 5, 5,"Yellow Sun","いえろーさん","英語で書かれた小説です。",2,600,"./images/book","book5.jpg",now(),"orion",1,now(),now()),
( 6,6,"ラップトップPC","らっぷとっぷPC","軽くて高性能なラップトップです。",3,100000,"./images/PC_device","laptop.jpg",now(),"Orange",1,now(),now()),
( 7,7,"パソコンセット","ぱそこんせっと","ラップトップとデスクトップのセットです。",3,250000,"./images/PC_device","pc_set.jpg",now(),"Door",1,now(),now()),
( 8,8,"炊飯器","すいはんき","大容量の炊飯器です。",3,60000,"./images/PC_device","ricecooker.jpg",now(),"Cat",1,now(),now()),
( 9,9,"アンティーク風ミシン","あんてぃーくふうみしん","昔ながらのミシンです。",3,89000,"./images/PC_device","sawing.jpg",now(),"Sister",1,now(),now()),
( 10,10,"ソーダメーカー","そーだめーかー","お家で炭酸水を手軽に楽しめます。",3,15000,"./images/PC_device","sodamaker.jpg",now(),"Wilson",1,now(),now()),
( 11,11,"コントローラー","こんとろーらー","ゲーム機のコントローラーです。",4,2000,"./images/Toy","controller.jpg",now(),"Pony",1,now(),now()),
( 12,12,"箱型パズル","はこがたぱずる","色を揃える立体パズルです。",4,1000,"./images/Toy","cubePuzzle.jpg",now(),"6面Station",1,now(),now()),
( 13,13,"ハンドスピナー","はんどすぴなー","回しやすいハンドスピナーです。",4,500,"./images/Toy","handspinner.jpg",now(),"Cube",1,now(),now()),
( 14,14,"人生ボードゲーム","じんせいボードゲーム","お金持ちを目指すすごろくです。",4,3000,"./images/Toy","lifeGame.jpg",now(),"ダカラトミー",1,now(),now()),
( 15,15,"GrayStation","ぐれーすてーしょん","人気の据え置き型ゲーム機です。",4,15000,"./images/Toy","playstation.jpg",now(),"Pony",1,now(),now()),
( 16,16,"Christmas","くりすます","オリジナルクリスマスソングです",5,1500,"./images/cd","christmas.png",now(),"orion",1,now(),now()),
( 17,17,"Summer","さまー","夏にぴったりのBGMです",5,1500,"./images/cd","summer.png",now(),"orion",1,now(),now()),
( 18,18,"Healing","ひーりんぐ","森の中で癒されましょう",5,1500,"./images/cd","healing.png",now(),"orion",1,now(),now()),
( 19,19,"Party","ぱーてぃー","盛り上がること間違いなしです",5,1500,"./images/cd","party.png",now(),"orion",1,now(),now()),
( 20,20,"Contemporary","こんてんぽらりー","現代的な音楽を集めました",5,1500,"./images/cd","contemporary.png",now(),"orion",1,now(),now());

create table cart_info(
	id int not null primary key auto_increment comment "ID",
	user_id varchar(16) not null comment "ユーザーID",
	product_id int not null comment "商品ID",
	product_count int not null comment "個数",
	price int comment "金額",
	regist_date datetime comment "登録日",
	update_date datetime comment "更新日",
	foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="カート情報テーブル";

create table purchase_history_info(
	id int not null primary key auto_increment comment "ID",
	user_id varchar(16) not null comment "ユーザーID",
	product_id int not null comment "商品ID",
	product_count int comment "個数",
	price int comment "金額",
	destination_id int not null comment "宛先情報ID",
	regist_date datetime comment "登録日",
	update_date datetime comment "更新日",
	foreign key(user_id) references user_info(user_id),
	foreign key(product_id) references product_info(product_id)
)
default charset=utf8
comment="購入履歴情報テーブル";

create table destination_info(
	id int not null primary key auto_increment comment "ID",
	user_id varchar(16) not null comment "ユーザーID",
	family_name varchar(32) not null comment "姓",
	first_name varchar(32) not null comment "名",
	family_name_kana varchar(32) not null comment "姓かな",
	first_name_kana varchar(32) not null comment "名かな",
	email varchar(32) comment "メールアドレス",
	tel_number varchar(13) comment "電話番号",
	user_address varchar(50) comment "住所",
	regist_date datetime comment "登録日",
	update_date datetime comment "更新日",
	foreign key(user_id) references user_info(user_id)
)
default charset=utf8
comment="宛先情報テーブル";

create table m_category(
	id int not null primary key auto_increment comment "ID",
	category_id int unique not null comment "カテゴリID",
	category_name varchar(20) unique not null comment "カテゴリ名",
	category_description varchar(100) comment "カテゴリ詳細",
	insert_date datetime not null comment "登録日",
	update_date datetime comment "更新日"
)
default charset=utf8
comment="カテゴリマスターテーブル";

insert into m_category values
(1,1,"全てのカテゴリー","本、家電・パソコン",now(),now()),
(2,2,"本","本に関するカテゴリーが対象となります",now(),now()),
(3,3,"家電・パソコン","家電・パソコンに関するカテゴリーが対象となります",now(),now()),
(4,4,"おもちゃ・ゲーム","おもちゃ・ゲームに関するカテゴリーが対象となります",now(),now()),
(5,5,"CD","CDに関するカテゴリーが対象となります",now(),now());