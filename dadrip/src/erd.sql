
/* Drop Indicies */

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
	favorite_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	joke_id number(10,0) NOT NULL
);

CREATE TABLE joke
(
	joke_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	joke_question varchar2(100) NOT NULL,
	joke_answer varchar2(100) NOT NULL,
	view_count number(10,0) DEFAULT 0 NOT NULL,
    reply_count number(5,0) DEFAULT 0 NOT NULL,
    like_count number(5,0) DEFAULT 0 NOT NULL,
    dislike_count number(5,0) DEFAULT 0 NOT NULL
);

CREATE TABLE member
(
	member_id varchar2(20) NOT NULL,
	nickname varchar2(30) NOT NULL,
	member_pw varchar2(60) NOT NULL,
	email varchar2(50) NOT NULL UNIQUE,
	birthday date,
	sex varchar2(1),
	registered_on date DEFAULT SYSDATE NOT NULL
);

CREATE TABLE reply
(
	reply_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	joke_id number(10,0) NOT NULL,
	parent_reply_id number(10,0),
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	content varchar2(100) NOT NULL,
	like_count number(5,0) DEFAULT 0,
	dislike_count number(5,0) DEFAULT 0
);

CREATE TABLE vote
(
	vote_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	joke_id number(10,0) NOT NULL,
	voted_on date DEFAULT SYSDATE NOT NULL,
	vote_type varchar2(1) NOT NULL
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

/* Create Indicies and Primary keys */

CREATE UNIQUE INDEX IDX_favorite_favoriteId_PK ON favorite (favorite_id);

ALTER TABLE favorite
ADD CONSTRAINT favorite_favoriteId_PK PRIMARY KEY (favorite_id)
USING INDEX IDX_favorite_favoriteId_PK;


CREATE UNIQUE INDEX IDX_joke_jokeId_PK ON joke (joke_id);

ALTER TABLE joke
ADD CONSTRAINT joke_jokeId_PK PRIMARY KEY (joke_id)
USING INDEX IDX_joke_jokeId_PK;

CREATE UNIQUE INDEX IDX_member_memberId_PK ON member (member_id);

ALTER TABLE member
ADD CONSTRAINT member_memberId_PK PRIMARY KEY (member_id)
USING INDEX IDX_member_memberId_PK;


CREATE UNIQUE INDEX IDX_reply_replyId_PK ON reply (reply_id);

ALTER TABLE reply
ADD CONSTRAINT reply_replyId_PK PRIMARY KEY (reply_id)
USING INDEX IDX_reply_replyId_PK;


CREATE UNIQUE INDEX IDX_vote_voteId_PK ON vote (vote_id);

ALTER TABLE vote
ADD CONSTRAINT vote_voteId_PK PRIMARY KEY (vote_id)
USING INDEX IDX_vote_voteId_PK;

COMMIT;

---------------

CREATE SEQUENCE bestJokes_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE TABLE best_jokes_today (
    best_jokes_id NUMBER(20,0), 
    joke_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	joke_question varchar2(100) NOT NULL,
	joke_answer varchar2(100) NOT NULL,
	view_count number(10,0) DEFAULT 0 NOT NULL,
    reply_count number(5,0) DEFAULT 0 NOT NULL,
    like_count number(5,0) DEFAULT 0 NOT NULL,
    dislike_count number(5,0) DEFAULT 0 NOT NULL
);

CREATE TABLE best_jokes_week (
    best_jokes_id NUMBER(20,0), 
    joke_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	joke_question varchar2(100) NOT NULL,
	joke_answer varchar2(100) NOT NULL,
	view_count number(10,0) DEFAULT 0 NOT NULL,
    reply_count number(5,0) DEFAULT 0 NOT NULL,
    like_count number(5,0) DEFAULT 0 NOT NULL,
    dislike_count number(5,0) DEFAULT 0 NOT NULL
);

CREATE TABLE best_jokes_month (
    best_jokes_id NUMBER(20,0), 
    joke_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	joke_question varchar2(100) NOT NULL,
	joke_answer varchar2(100) NOT NULL,
	view_count number(10,0) DEFAULT 0 NOT NULL,
    reply_count number(5,0) DEFAULT 0 NOT NULL,
    like_count number(5,0) DEFAULT 0 NOT NULL,
    dislike_count number(5,0) DEFAULT 0 NOT NULL
);

CREATE TABLE best_jokes_total (
    best_jokes_id NUMBER(20,0), 
    joke_id number(10,0) NOT NULL,
	member_id varchar2(20) NOT NULL,
	created_on date DEFAULT SYSDATE NOT NULL,
	modified_on date DEFAULT SYSDATE NOT NULL,
	joke_question varchar2(100) NOT NULL,
	joke_answer varchar2(100) NOT NULL,
	view_count number(10,0) DEFAULT 0 NOT NULL,
    reply_count number(5,0) DEFAULT 0 NOT NULL,
    like_count number(5,0) DEFAULT 0 NOT NULL,
    dislike_count number(5,0) DEFAULT 0 NOT NULL
);

-- 인덱스 및 기본키 설정

-- 오늘
CREATE UNIQUE INDEX IDX_bestJokesToday_bestJokesId_PK ON best_jokes_today (best_jokes_id);

ALTER TABLE best_jokes_today
ADD CONSTRAINT bestJokesToday_bestJokesId_PK PRIMARY KEY (best_jokes_id)
USING INDEX IDX_bestJokesToday_bestJokesId_PK;

-- 일주일
CREATE UNIQUE INDEX IDX_bestJokesWeek_bestJokesId_PK ON best_jokes_week (best_jokes_id);

ALTER TABLE best_jokes_week
ADD CONSTRAINT bestJokesWeek_bestJokesId_PK PRIMARY KEY (best_jokes_id)
USING INDEX IDX_bestJokesWeek_bestJokesId_PK;

-- 한 달
CREATE UNIQUE INDEX IDX_bestJokesMonth_bestJokesId_PK ON best_jokes_month (best_jokes_id);

ALTER TABLE best_jokes_month
ADD CONSTRAINT bestJokesMonth_bestJokesId_PK PRIMARY KEY (best_jokes_id)
USING INDEX IDX_bestJokesMonth_bestJokesId_PK;

-- 전체
CREATE UNIQUE INDEX IDX_bestJokesTotal_bestJokesId_PK ON best_jokes_total (best_jokes_id);

ALTER TABLE best_jokes_total
ADD CONSTRAINT bestJokesTotal_bestJokesId_PK PRIMARY KEY (best_jokes_id)
USING INDEX IDX_bestJokesTotal_bestJokesId_PK;

-- 프로시저 생성
CREATE OR REPLACE NONEDITIONABLE PROCEDURE refresh_best_jokes (
    p_table_name IN VARCHAR2,  -- 업데이트할 테이블 이름
    p_days IN NUMBER  -- 조회 기간(예: 1일, 7일, 30일 또는 0일 경우 전체)
) IS
BEGIN
    -- 1. 기존 데이터 삭제
    EXECUTE IMMEDIATE 'DELETE FROM ' || DBMS_ASSERT.SQL_OBJECT_NAME(p_table_name);

    -- 2. 동적 SQL을 위한 변수
    DECLARE
        v_sql VARCHAR2(32767);
    BEGIN
        -- 기본 SQL 문 시작
        v_sql := 'INSERT INTO ' || DBMS_ASSERT.SQL_OBJECT_NAME(p_table_name) || ' (best_jokes_id, joke_id, member_id, created_on, modified_on, joke_question, joke_answer, view_count, reply_count, like_count, dislike_count) 
                  SELECT bestJokes_seq.NEXTVAL, joke_data.JOKE_ID, joke_data.member_id, joke_data.created_on, joke_data.modified_on, joke_data.joke_question, joke_data.joke_answer, joke_data.view_count, joke_data.reply_count, joke_data.like_count, joke_data.dislike_count
                  FROM (
                      SELECT j.JOKE_ID, j.member_id, j.created_on, j.modified_on, j.joke_question, j.joke_answer, j.view_count, j.reply_count, j.like_count, j.dislike_count
                      FROM joke j
                      INNER JOIN (
                          SELECT JOKE_ID, COUNT(*) AS like_count
                          FROM vote
                          WHERE VOTE_TYPE = ''1'' ';

        -- p_days가 0이 아닌 경우에만 조회 기간 조건 추가
        IF p_days > 0 THEN
            v_sql := v_sql || 'AND voted_on >= SYSDATE - ' || p_days || ' ';
        END IF;

        -- 나머지 SQL 문
        v_sql := v_sql || 'GROUP BY JOKE_ID
                      ) fv ON j.JOKE_ID = fv.JOKE_ID
                      WHERE fv.like_count > 0
                      ORDER BY fv.like_count DESC, j.created_on DESC
                  ) joke_data';

        -- 3. 동적 SQL 실행
        EXECUTE IMMEDIATE v_sql;

        -- 4. 커밋 (필요 시)
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            -- 에러 발생 시 처리 (예: 로그 기록)
            RAISE;
    END;
END;
/


BEGIN
    DBMS_SCHEDULER.create_job (
        job_name        => 'refresh_all_best_jokes_job',
        job_type        => 'PLSQL_BLOCK',
        job_action      => 'BEGIN 
                                refresh_best_jokes(''best_jokes_today'', 1);
                                COMMIT;
                                refresh_best_jokes(''best_jokes_week'',  7);
                                COMMIT;
                                refresh_best_jokes(''best_jokes_month'', 30);
                                COMMIT;
                                refresh_best_jokes(''best_jokes_total'', 0);
                                COMMIT;
                            END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=MINUTELY; BYSECOND=0,10,20,30,40,50',  -- 필요에 따라 간격을 조정
        enabled         => TRUE
    );
END;


