/*system으로 접속*/


DROP TABLE NOTICE;
DROP TABLE CENTER;
DROP TABLE HEARTBOARD;
DROP TABLE SELLBOARD;
DROP TABLE BUYBOARD;
DROP TABLE MYPAGE;
DROP TABLE WITHDRAWAL;
DROP TABLE CHATROOM;
DROP TABLE REPLY;
DROP TABLE MARKETBOARD;
DROP TABLE MARKETUSER;



--유저테이블
CREATE TABLE MARKETUSER(
   us_num NUMBER,
   us_id VARCHAR2(30) PRIMARY KEY,
   us_pass VARCHAR2(30) NOT NULL,
   us_name VARCHAR2(30) NOT NULL,
   us_nickname VARCHAR2(30) UNIQUE,
   us_birth CHAR(8),
   us_email VARCHAR2(30),
   us_gender VARCHAR2(8), --남성(male), 여성(female)
   us_address1 VARCHAR2(150) NOT NULL, -- 시군구
   us_address2 VARCHAR2(30) NOT NULL, -- 동
   us_phone CHAR(13) NOT NULL,
   us_joindate DATE DEFAULT SYSDATE,
   us_grade NUMBER(1) DEFAULT 1, -- 관리자(0), 일반회원(1)
   us_replyCnt number DEFAULT 0,
   us_boardCnt number DEFAULT 0,
   us_userpass number default 0
);

--상품 테이블
CREATE TABLE MARKETBOARD(
   bo_num NUMBER PRIMARY KEY,
   bo_id VARCHAR2(30),
   bo_title VARCHAR2(300) NOT NULL,
   bo_nickname VARCHAR2(30),
   bo_price NUMBER NOT NULL,
   bo_content VARCHAR2(3000) NOT NULL,
   bo_regdate DATE DEFAULT SYSDATE,
   bo_updatedate DATE DEFAULT SYSDATE,
   bo_image1 VARCHAR2(3000),
   bo_image2 VARCHAR2(3000),
   bo_image3 VARCHAR2(3000),
   bo_count NUMBER DEFAULT 0,
   bo_profile VARCHAR2(3000) default 'no-photo-gray.png',
   bo_heartcount NUMBER DEFAULT 0,
   bo_category VARCHAR2(150),
   bo_address1 VARCHAR2(150) NOT NULL,-- 시군구
   bo_address2 VARCHAR2(30), -- 동
   bo_ok number default 0, --상품 판매완료 :1 /판매중 :0  
   bo_buyer VARCHAR2(30), --상품 구매자
   bo_grade number default 1,
   CONSTRAINT fk_board_id FOREIGN KEY (bo_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--마이페이지
CREATE TABLE MYPAGE(
   my_name VARCHAR2(30),
   my_id VARCHAR2(30),
   my_image VARCHAR2(500) default 'no-photo.png',
   my_intro VARCHAR2(1500),
   my_nickname VARCHAR2(30) UNIQUE,
   wd_reason_pre VARCHAR2(300), --go to WITHDRAWAL
   wd_remark_pre VARCHAR2(1500), --go to WITHDRAWAL
   CONSTRAINT fk_my_id FOREIGN KEY (my_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--구매내역
CREATE TABLE BUYBOARD(
   buy_id VARCHAR2(30),
   buy_nickname VARCHAR2(30),
   buy_title VARCHAR2(300),
   buy_price NUMBER,
   buy_seller VARCHAR2(30),
   buy_buydate DATE DEFAULT SYSDATE,
   CONSTRAINT fk_buy_id FOREIGN KEY (buy_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--판매내역
CREATE TABLE SELLBOARD(
   sel_id VARCHAR2(30),
   sel_nickname VARCHAR2(30),
   sel_title VARCHAR2(300),
   sel_price NUMBER,
   sel_buyer VARCHAR2(30),
   sel_selldate DATE DEFAULT SYSDATE,
   CONSTRAINT fk_sell_id FOREIGN KEY (sel_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--찜목록
CREATE TABLE HEARTBOARD(
   he_bo_num NUMBER,
   he_id VARCHAR2(30),
   he_nickname VARCHAR2(30),
   he_heartdate DATE DEFAULT SYSDATE,
   CONSTRAINT fk_heart_id FOREIGN KEY (he_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE,
   CONSTRAINT fk_heart_bo_num FOREIGN KEY (he_bo_num) REFERENCES MARKETBOARD (bo_num)
   ON DELETE CASCADE
);

--고객센터 (1:1 문의하기, 건의하기 / 이용자 게시물)
CREATE TABLE CENTER (
   ce_num NUMBER PRIMARY KEY, --글번호
   ce_id VARCHAR2(30) NOT NULL,
   ce_nickname varchar2(30) not null,
   ce_email VARCHAR2(30),
   ce_title VARCHAR2(300) NOT NULL,
   ce_content VARCHAR2(3000) NOT NULL,
   ce_category VARCHAR2(30), --QNA : 1:1문의하기, SUGGESTION : 건의하기
   ce_status VARCHAR2(30), --답변 대기중 / 답변 완료
   ce_filenum NUMBER, --글번호와 동일
   ce_filename VARCHAR2(300),
   ce_filepath VARCHAR2(300),
   ce_filesize NUMBER,
   ce_date DATE DEFAULT SYSDATE, --작성일
   CONSTRAINT fk_center_id FOREIGN KEY (ce_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--고객센터 (자주 하는 질문, 공지사항 / 관리자 게시물)
CREATE TABLE NOTICE (
   no_num NUMBER PRIMARY KEY, --글번호
   no_id VARCHAR2(30) NOT NULL,
   no_nickname varchar2(30) not null,
   no_title VARCHAR2(300) NOT NULL,
   no_content VARCHAR2(3000) NOT NULL,
   no_category VARCHAR2(30), --FAQ : 자주 하는 질문, NOTICE : 공지사항
   no_readcount NUMBER DEFAULT 0, --조회수
   no_date DATE DEFAULT SYSDATE,
   CONSTRAINT fk_notice_id FOREIGN KEY (no_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--회원탈퇴
CREATE TABLE WITHDRAWAL (
   wd_id VARCHAR2(30),
   wd_reason VARCHAR2(300), --탈퇴사유
   wd_remark VARCHAR2(1500), --하고싶은말
   wd_date DATE DEFAULT SYSDATE,
   CONSTRAINT fk_withdrawal_id FOREIGN KEY (wd_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--채팅
CREATE TABLE CHATROOM (
   cr_roomnumber NUMBER,
   cr_roomname VARCHAR2(150),
   cr_seller VARCHAR2(30),
   cr_buyer VARCHAR2(30),
   cr_seller_id VARCHAR2(30),
   cr_buyer_id VARCHAR2(30),
   CONSTRAINT fk_chat_id FOREIGN KEY (cr_buyer_id) REFERENCES MARKETUSER (us_id)
   ON DELETE CASCADE
);

--게시물 댓글
create table reply(
re_num number not null,
bo_num number not null,
re_reply varchar2(1000) not null,
re_name varchar2(50) not null,
re_regdate date default sysdate,
re_updateDate date default sysdate,
re_profile varchar2(4000),
re_id varchar2(50) not null,
CONSTRAINT fk_re_num FOREIGN key(bo_num) REFERENCES marketboard(bo_num)on delete cascade);

--관리자 계정
insert into marketuser(us_num, us_id, us_pass, us_name, us_nickname, us_birth, us_email, us_gender, us_address1, us_address2, us_phone, us_grade)
values((select nvl(max(us_num), 0)+1 from marketuser),'admin','12341234','관리자','관리자1','20220814','admin@oe.com','male','수원시 권선구','호매실동','010-1234-1234', 0);

insert into mypage(my_id, my_nickname, my_name) values('admin','관리자1', '관리자');

--크롤링 유저
insert into marketuser(us_num, us_id, us_pass, us_name, us_nickname, us_birth, us_email, us_gender, us_address1, us_address2, us_phone)
values((select nvl(max(us_num), 0)+1 from marketuser),'crawling','12341234','크롤링','크롤링1','20220814','crawling@oe.com','female','수원시 권선구','권선동','010-1234-1234');

insert into mypage(my_name, my_id, my_nickname) values ('크롤링', 'crawling', '크롤링1');


commit;

--alter table MARKETUSER add us_userpass number default 0;
--alter table MARKETBOARD add bo_grade number default 1;