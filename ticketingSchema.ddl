-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-10-29 09:13:51 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g


<<<<<<< HEAD
select * from performance;
select * from member;

CREATE USER ticketing
    IDENTIFIED BY 1234
    DEFAULT TABLESPACE users 
    QUOTA 10485760 ON users
    ACCOUNT UNLOCK;
    

GRANT UNLIMITED TABLESPACE TO TICKETING;

GRANT CONNECT,RESOURCE,DBA TO TICKETING;
GRANT CREATE TABLE, CREATE VIEW TO TICKETING;
GRANT CONNECT,DBA TO TICKETING;

=======

CREATE USER ticketing IDENTIFIED BY ACCOUNT UNLOCK ;
>>>>>>> 1c282fa0fd4a87abb6b996d9738fe3969e10efb3

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ticketing.faq (
    faq_code   NUMBER(5) NOT NULL,
    faq_type   VARCHAR2(20 BYTE),
    faq_quest  VARCHAR2(100 BYTE),
    faq_answer VARCHAR2(1000 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE ticketing.faq
    ADD CONSTRAINT faq_pk PRIMARY KEY ( faq_code )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE ticketing.manager (
    manager_id      VARCHAR2(20 BYTE) NOT NULL,
    manager_pwd     VARCHAR2(20 BYTE),
    manager_name    VARCHAR2(20 BYTE),
    manager_regdate DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX ticketing.manager_pk ON
    ticketing.manager (
        manager_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE ticketing.manager
    ADD CONSTRAINT manager_pk PRIMARY KEY ( manager_id )
        USING INDEX ticketing.manager_pk;

CREATE TABLE ticketing.member (
    member_id      VARCHAR2(20 BYTE) NOT NULL,
    member_pwd     VARCHAR2(20 BYTE),
    member_name    VARCHAR2(20 BYTE),
    member_email   VARCHAR2(50 BYTE),
    member_regdate DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX ticketing.member_pk ON
    ticketing.member (
        member_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE ticketing.member
    ADD CONSTRAINT member_pk PRIMARY KEY ( member_id )
<<<<<<< HEAD
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );
            
            
drop table ticketing.performance;

CREATE TABLE ticketing.performance (
    p_code      NUMBER(7) NOT NULL, --문자열 시 변환 이슈로 정수형으로 수정
    p_type      VARCHAR2(10 BYTE),
    p_title     VARCHAR2(50 BYTE),
    p_area      VARCHAR2(100 BYTE),
    p_date      VARCHAR2(50 BYTE),
    p_performer VARCHAR2(50 BYTE),
    p_price     NUMBER(7),
    p_seat     NUMBER(6),
    --p_poster    VARCHAR2(20 BYTE),
    P_DESCRIPTION   VARCHAR2(2000 BYTE),
    p_regdate   DATE,
    p_rating    NUMBER(2),--10/24 관람연령등급컬럼 생성
    p_FNAME VARCHAR2(100 BYTE), --10/24 파일명 컬럼 생성
	p_FSIZE NUMBER(10,0), -- 10/24 파일사이즈 컬럼 생성
    p_RFNAME VARCHAR2(100), -- 10/24 파일 실제 이름 컬럼 생성
    p_ref number(5), --10/25 페이징컬럼 추가 예정 컬럼 생성
    p_step number(5),
    p_level number(5),
    p_time  number(7)
    
=======
        USING INDEX ticketing.member_pk;

CREATE TABLE ticketing.performance (
    p_code        NUMBER(7) NOT NULL,
    p_type        VARCHAR2(10 BYTE),
    p_title       VARCHAR2(30 BYTE),
    p_area        VARCHAR2(10 BYTE),
    p_date        DATE,
    p_performer   VARCHAR2(50 BYTE),
    p_price       NUMBER(7),
    p_seat        NUMBER(6),
    p_description VARCHAR2(2000 BYTE),
    p_regdate     DATE,
    p_rating      NUMBER(2),
    p_fname       VARCHAR2(100 BYTE),
    p_fsize       NUMBER(10),
    p_rfname      VARCHAR2(100 BYTE),
    p_ref         NUMBER(5),
    p_step        NUMBER(5),
    p_level       NUMBER(5)
>>>>>>> 1c282fa0fd4a87abb6b996d9738fe3969e10efb3
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX ticketing.performance_pk ON
    ticketing.performance (
        p_code
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE ticketing.performance
    ADD CONSTRAINT performance_pk PRIMARY KEY ( p_code )
        USING INDEX ticketing.performance_pk;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             4
-- CREATE INDEX                             3
-- ALTER TABLE                              4
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
