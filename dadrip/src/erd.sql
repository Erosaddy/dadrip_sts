
/* Drop Indexes */

DROP INDEX IDX_favorite_favoriteId_PK;
DROP INDEX IDX_joke_jokeId_PK;
DROP INDEX IDX_member_memberId_PK;
DROP INDEX IDX_reply_replyId_PK;
DROP INDEX IDX_vote_voteId_PK;



/* Drop Tables */

DROP TABLE favorite CASCADE CONSTRAINTS;
DROP TABLE reply CASCADE CONSTRAINTS;
DROP TABLE vote CASCADE CONSTRAINTS;
DROP TABLE joke CASCADE CONSTRAINTS;
DROP TABLE member CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE favorite
(
	favorite_id number(10,0) NOT NULL UNIQUE,
	member_id varchar2(20) NOT NULL UNIQUE,
	joke_id number(10,0) NOT NULL UNIQUE,
	CONSTRAINT favorite_favoriteId_PK PRIMARY KEY (favorite_id)
);


CREATE TABLE joke
(
	joke_id number(10,0) NOT NULL UNIQUE,
	member_id varchar2(20) DEFAULT '' NOT NULL UNIQUE,
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	joke_question varchar2(100) NOT NULL,
	joke_answer varchar2(100) NOT NULL,
	view_count number(5,0) DEFAULT 0 NOT NULL,
	CONSTRAINT joke_jokeId_PK PRIMARY KEY (joke_id)
);


CREATE TABLE member
(
	member_id varchar2(20) NOT NULL UNIQUE,
	nickname varchar2(30) NOT NULL,
	member_pw varchar2(60) NOT NULL,
	email varchar2(50) NOT NULL UNIQUE,
	birthday date,
	sex varchar2(1),
	registered_on date DEFAULT SYSDATE NOT NULL,
	CONSTRAINT member_memberId_PK PRIMARY KEY (member_id)
);


CREATE TABLE reply
(
	reply_id number(10,0) NOT NULL UNIQUE,
	member_id varchar2(20) NOT NULL UNIQUE,
	joke_id number(10,0) NOT NULL UNIQUE,
	parent_reply_id number(10,0),
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	content varchar2(100) NOT NULL,
	like_count number(5,0) DEFAULT 0,
	dislike_count number(5,0) DEFAULT 0,
	CONSTRAINT reply_replyId_PK PRIMARY KEY (reply_id)
);


CREATE TABLE vote
(
	vote_id number(10,0) NOT NULL UNIQUE,
	member_id varchar2(20) NOT NULL UNIQUE,
	joke_id number(10,0) NOT NULL UNIQUE,
	vote_date date DEFAULT SYSDATE NOT NULL,
	vote_type varchar2(1) NOT NULL,
	CONSTRAINT vote_voteId_PK PRIMARY KEY (vote_id)
);



/* Create Foreign Keys */

ALTER TABLE favorite
	ADD FOREIGN KEY (joke_id)
	REFERENCES joke (joke_id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (joke_id)
	REFERENCES joke (joke_id)
;


ALTER TABLE vote
	ADD FOREIGN KEY (joke_id)
	REFERENCES joke (joke_id)
;


ALTER TABLE favorite
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
;


ALTER TABLE joke
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
;


ALTER TABLE reply
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
;


ALTER TABLE vote
	ADD FOREIGN KEY (member_id)
	REFERENCES member (member_id)
;



/* Create Indexes */

CREATE UNIQUE INDEX IDX_favorite_favoriteId_PK ON favorite (favorite_id);
CREATE UNIQUE INDEX IDX_joke_jokeId_PK ON joke (joke_id);
CREATE UNIQUE INDEX IDX_member_memberId_PK ON member (member_id);
CREATE UNIQUE INDEX IDX_reply_replyId_PK ON reply (reply_id);
CREATE UNIQUE INDEX IDX_vote_voteId_PK ON vote (vote_id);



