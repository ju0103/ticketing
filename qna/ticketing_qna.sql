select * from QnA order by q_ref desc, q_step asc;

CREATE TABLE ticketing.review (
    performance_p_code NUMBER(7) NOT NULL,
    r_id               NUMBER(7),
    r_name             VARCHAR2(20 BYTE),
    r_title            VARCHAR2(30 BYTE),
    r_content          VARCHAR2(2000 BYTE),
    r_date             DATE,
    r_pwd              VARCHAR2(20 BYTE),
    r_ip               VARCHAR2(30 BYTE),
    r_fname            VARCHAR2(100 BYTE),
    r_fsize            NUMBER(10),
    r_rfname           VARCHAR2(100 BYTE)
);