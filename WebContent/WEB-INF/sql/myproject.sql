CREATE TABLE members (
    memberid VARCHAR2(50) PRIMARY KEY,
    password VARCHAR2(30) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    birth DATE NOT NULL,
    gender VARCHAR2(20) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    phone VARCHAR2(50) NOT NULL,
    manager NUMBER NOT NULL,
    regdate DATE NOT NULL
);

UPDATE members
SET birth = '1994-03-26'
WHERE birth is not null;

ALTER TABLE members MODIFY birth VARCHAR2(20) NOT NULL;
commit;
SELECT * FROM members;

SELECT * FROM member;
SELECT memberid, name, eamil FROM members WHERE memberid = 'admin';


INSERT INTO members VALUES('as211111d2212',1234,'이원석',
                        TO_DATE('1994,03,26', 'YYYY,MM,DD'), 'male', 'lws3793@naver.com', '010-2369-3793', 0, SYSDATE);
                        
DELETE FROM members WHERE memberid = 'xxx2';

commit;

SELECT name, memberid, email, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn, regdate, gender, memberid, name, birth, email, phone, manager
				FROM members) WHERE name lIKE'%이원석%' AND rn  BETWEEN 1 AND 10;

SELECT name, memberid, email, phone, regdate FROM members WHERE name lIKE '%이원석%'; 

SELECT COUNT(*) FROM members WHERE name LIKE '%이원석%';

SELECT name, memberid, email, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) 
                                                    rn, name, memberid, email, phone, regdate FROM members) 
WHERE name LIKE'%원석%' AND rn BETWEEN 1 AND 10;

SELECT COUNT(*) FROM members WHERE memberid LIKE '%admin%';


commit;
SELECT * FROM members WHERE name = '이원석';
SELECT * FROM members;
SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn, name, memberid, email, phone, regdate FROM members) 
WHERE rn BETWEEN 1 AND 10 
AND name LIKE '%이원석%';
commit;
SELECT name, memberid, email, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn, name, memberid, email, phone, regdate FROM members) 
WHERE name LIKE '%이원석%' AND rn BETWEEN 1 AND 10;

SELECT * FROM members WHERE memberid = 'admin';

SELECT memberid, name, email, password, manager FROM members WHERE memberid = 'admin';
UPDATE members SET manager = 1 WHERE memberid = 'lws3793';
SELECT * FROM members;
SELECT name, memberid, gender, phone, regdate FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn, name, memberid, gender, phone, regdate FROM members) 
WHERE gender = 'male' AND rn BETWEEN 1 AND 10;
commit;

-- 게시판 -- 
CREATE TABLE freeboard (
    post_no NUMBER GENERATED AS IDENTITY,
    memberid VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    body VARCHAR2(4000),
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnt NUMBER,
    like_cnt NUMBER,
    notice NUMBER,
    PRIMARY KEY (post_no)
);
commit;

SELECT * FROM freeboard;
UPDATE freeboard SET notice = 0 WHERE post_no = 10;
commit;
INSERT INTO freeboard (memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice) VALUES ('admin', '이원석', '제목입니다.', '내용입니다.', SYSDATE, SYSDATE, 0, 0, 1);

SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) 
rn, notice, post_no, memberid, name, title, body, regdate, read_cnt, like_cnt, moddate FROM freeboard ORDER BY notice ASC, rn ASC) 
WHERE rn BETWEEN 1 AND 10;

SELECT COUNT(*) FROM freeboard;
SELECT post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice 
FROM (SELECT ROW_NUMBER() OVER (ORDER BY regdate DESC) rn,  post_no, memberid, name, title, body, regdate, moddate, read_cnt, like_cnt, notice 
FROM freeboard ORDER BY notice ASC, rn ASC) WHERE name LIKE '%원석%' AND rn BETWEEN 1 AND 10;

-- 사진 게시판
CREATE TABLE pictureboard (
    post_no NUMBER GENERATED AS IDENTITY,
    memberid VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    body VARCHAR2(4000),
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnt NUMBER,
    like_cnt NUMBER,
    uploadfile CLOB,
    PRIMARY KEY (post_no)
);

commit;