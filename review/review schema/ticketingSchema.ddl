-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-10-31 23:45:41 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



CREATE USER ticketing IDENTIFIED BY ACCOUNT UNLOCK ;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ticketing.faq (
    faq_code   NUMBER(5) NOT NULL,
    faq_type   VARCHAR2(20 BYTE),
    faq_quest  VARCHAR2(50 BYTE),
    faq_answer VARCHAR2(1000 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE ticketing.faq
    ADD CONSTRAINT faq_pk PRIMARY KEY ( faq_code )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE ticketing.inquiry (
    member_member_id   VARCHAR2(20 BYTE) NOT NULL,
    manager_manager_id VARCHAR2(20 BYTE),
    i_id               NUMBER(5) NOT NULL,
    i_title            VARCHAR2(30 BYTE),
    i_type             VARCHAR2(20 BYTE),
    i_quest            VARCHAR2(1000 BYTE),
    i_ip               VARCHAR2(15 BYTE),
    i_ref              NUMBER(5),
    i_regdate          DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE ticketing.inquiry ADD CONSTRAINT inquiry_pk PRIMARY KEY ( i_id );

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
        USING INDEX ticketing.member_pk;

CREATE TABLE ticketing.performance (
    p_code        NUMBER(7) NOT NULL,
    p_type        VARCHAR2(10 BYTE),
    p_title       VARCHAR2(50 BYTE),
    p_area        VARCHAR2(100 BYTE),
    p_date        VARCHAR2(50 BYTE),
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
    p_level       NUMBER(5),
    p_time        NUMBER(7)
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

CREATE TABLE ticketing.qna (
    performance_p_code NUMBER(7) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE TABLE reservation (
    member_member_id   VARCHAR2(20 BYTE) NOT NULL,
    performance_p_code NUMBER(7) NOT NULL,
    reserve_id         VARCHAR2(20) NOT NULL,
    reserve_date       DATE,
    reserve_seat       VARCHAR2(5)
)
LOGGING;

ALTER TABLE reservation ADD CONSTRAINT reservation_pk PRIMARY KEY ( reserve_id );

CREATE TABLE ticketing.review (
    performance_p_code NUMBER(7) NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE ticketing.inquiry
    ADD CONSTRAINT inquiry_manager_fk FOREIGN KEY ( manager_manager_id )
        REFERENCES ticketing.manager ( manager_id )
    NOT DEFERRABLE;

ALTER TABLE ticketing.inquiry
    ADD CONSTRAINT inquiry_member_fk FOREIGN KEY ( member_member_id )
        REFERENCES ticketing.member ( member_id )
    NOT DEFERRABLE;

ALTER TABLE ticketing.qna
    ADD CONSTRAINT qna_performance_fk FOREIGN KEY ( performance_p_code )
        REFERENCES ticketing.performance ( p_code )
    NOT DEFERRABLE;

ALTER TABLE reservation
    ADD CONSTRAINT reservation_member_fk FOREIGN KEY ( member_member_id )
        REFERENCES ticketing.member ( member_id )
    NOT DEFERRABLE;

ALTER TABLE reservation
    ADD CONSTRAINT reservation_performance_fk FOREIGN KEY ( performance_p_code )
        REFERENCES ticketing.performance ( p_code )
    NOT DEFERRABLE;

ALTER TABLE ticketing.review
    ADD CONSTRAINT review_performance_fk FOREIGN KEY ( p_code )
        REFERENCES ticketing.performance ( p_code )
    NOT DEFERRABLE;

DESC ticketing.review;

DELETE FROM ticketing.member;
DELETE FROM ticketing.review;

COMMIT WORK;

SELECT * FROM ticketing.member;
SELECT * FROM ticketing.performance;
SELECT * FROM ticketing.review;

DESC ticketing.member;

CREATE TABLE ticketing.review
(P_CODE    NUMBER(7) NOT NULL,
 R_ID      NUMBER(7) NOT NULL,
 R_NAME    VARCHAR2(20),
 R_TITLE   VARCHAR2(30) ,
 R_CONTENT VARCHAR2(2000),
 R_DATE    TIMESTAMP(6),
 R_PWD     VARCHAR2(20),
 R_IP      VARCHAR2(30),
 R_FNAME   VARCHAR2(100),
 R_FSIZE   NUMBER(10),
 R_RFNAME  VARCHAR2(100)
);

-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             3
-- ALTER TABLE                             12
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
