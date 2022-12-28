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