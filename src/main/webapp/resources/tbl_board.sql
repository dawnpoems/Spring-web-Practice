CREATE TABLE tbl_attach(
    uuid      VARCHAR2(100) CONSTRAINT pk_tbl_attach PRIMARY KEY,
    up_folder VARCHAR2(200) NOT NULL,
    file_name VARCHAR2(100) NOT NULL,
    image     CHAR(1),
    bno       NUMBER        CONSTRAINT fk_board_attach
                            REFERENCES tbl_board(bno)
)

CREATE TABLE tbl_sample1(col1 VARCHAR2(100));
CREATE TABLE tbl_sample2(col1 VARCHAR2(10));

UPDATE tbl_board
SET reply_cnt = (SELECT COUNT(rno)
                FROM tbl_reply
                WHERE tbl_reply.bno = tbl_board.bno);

ALTER TABLE tbl_board ADD reply_cnt NUMBER DEFAULT 0;

CREATE INDEX idx_tbl_reply ON tbl_reply(bno DESC, rno ASC);

CREATE TABLE tbl_reply(
     rno         NUMBER  CONSTRAINT pk_tbl_reply PRIMARY KEY,
     bno         NUMBER  CONSTRAINT fk_tbl_reply
                         REFERENCES tbl_board(bno) NOT NULL,
     reply       VARCHAR2(1000)     NOT NULL,
     replyer     VARCHAR2(50)       NOT NULL,
     reg_date    DATE       DEFAULT SYSDATE,
     update_date DATE  
)
CREATE SEQUENCE seq_tbl_reply NOCACHE;

CREATE TABLE tbl_board(
    bno         NUMBER  CONSTRAINT pk_tbl_board PRIMARY KEY,
    title       VARCHAR2(200)   NOT NULL,
    content     VARCHAR2(4000)  NOT NULL,
    writer      VARCHAR2(50)    NOT NULL,
    reg_date    DATE    DEFAULT SYSDATE,
    update_date DATE   
)

DROP TABLE tbl_board;
DROP SEQUENCE seq_tbl_board;

CREATE SEQUENCE seq_tbl_board NOCACHE;

INSERT INTO tbl_board(bno, title, content, writer)
VALUES (seq_tbl_board.NEXTVAL, 'title', 'content', 'aaa');

SELECT * FROM tbl_board;
COMMIT;