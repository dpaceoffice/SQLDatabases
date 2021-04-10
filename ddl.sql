DROP TABLE skill;

DROP TABLE position;

DROP TABLE job;

DROP TABLE gics;

DROP TABLE course;

DROP TABLE section;

DROP TABLE person;
--TODO: Drop Table for AZ and GV
--TODO: Add constraints, Primary, and Foreign Keys to AZ and GV

CREATE TABLE gics (
    parent_id       NUMBER,
    industry_id     NUMBER,
    industry_title  VARCHAR(25),
    g_level         NUMBER,
    g_desc          VARCHAR(100),
    CONSTRAINT gics_pk PRIMARY KEY ( parent_id,
                                     industry_id )
);

CREATE TABLE person (
    person_id       NUMBER,
    first_name      CHAR(20),
    last_name       CHAR(20),
    email           VARCHAR(20),
    gender          NUMBER(1),
    phone           VARCHAR(20),
    CONSTRAINT person_pk PRIMARY KEY ( person_id )
);

CREATE TABLE company (
    company_id       NUMBER,
    industry_id      NUMBER,--forign, primary
    sub_industry_id  NUMBER,--forign, primary
    website          VARCHAR(20),
    CONSTRAINT company_pk PRIMARY KEY ( company_id,
                                        industry_id,
                                        sub_industry_id ),
    CONSTRAINT industry_fk FOREIGN KEY ( industry_id )
        REFERENCES gics ( parent_id ),
    CONSTRAINT subindustry_fk FOREIGN KEY ( sub_industry_id )
        REFERENCES gics ( industry_id )
);

CREATE TABLE address (
    address_id  NUMBER,
    company_id  NUMBER,
    person_id   NUMBER,
    zip         NUMBER(5),
    street      VARCHAR(20),
    city        VARCHAR(20),
    CONSTRAINT address_pk PRIMARY KEY ( address_id ),
    CONSTRAINT company_fk FOREIGN KEY ( company_id )
        REFERENCES company ( company_id ),
    CONSTRAINT person_fk FOREIGN KEY ( person_id )
        REFERENCES person ( person_id )
);

CREATE TABLE position (
    position_id  NUMBER,
    company_id   NUMBER,
    title        VARCHAR(20),
    p_desc       VARCHAR(25),
    pay          NUMBER(1), --high, low

    CONSTRAINT position_pk PRIMARY KEY ( position_id )
);

CREATE TABLE payrate (
    pay_id    NUMBER,
    hourly    NUMBER,
    annual    NUMBER,
    CONSTRAINT pay_pk PRIMARY KEY ( pay_id )
);

CREATE TABLE job (
    job_id        NUMBER,
    position_id   NUMBER,
    company       VARCHAR(20),
    category_id   NUMBER,
    employeemode  NUMBER(1),--full time or part time, multivalue boolean?
    pay_type      NUMBER(1), -- Wage or Salary, multivalue boolean?
    pay_rate      NUMBER, --derived, multivalue

    CONSTRAINT job_pk PRIMARY KEY ( job_id ),
    CONSTRAINT position_fk FOREIGN KEY ( position_id )
        REFERENCES position ( position_id ),
    CONSTRAINT payrate_fk FOREIGN KEY ( pay_rate )
        REFERENCES payrate ( pay_id )
);


CREATE TABLE skill (
    skill_id  NUMBER,
    title     VARCHAR(20),
    s_desc    VARCHAR(25),
    s_level   NUMBER(2),--advanced, beginner, medium

    CONSTRAINT skill_pk PRIMARY KEY ( skill_id )
);

CREATE TABLE requirment (
    req_id    NUMBER,--requirement id
    pos_id    NUMBER,--for position?
    job_id    NUMBER,--for job? 
    skill_id  NUMBER,--skill required

    CONSTRAINT req_pk PRIMARY KEY ( req_id ),
    CONSTRAINT pos_fk FOREIGN KEY ( pos_id )
        REFERENCES position ( position_id ),
    CONSTRAINT job_fk FOREIGN KEY ( job_id )
        REFERENCES job ( job_id ),
    CONSTRAINT skill_fk FOREIGN KEY ( skill_id )
        REFERENCES skill ( skill_id )
);

CREATE TABLE course (
    course_id   NUMBER,
    title       VARCHAR(20),
    level       VARCHAR(25),
    c_desc      VARCHAR(25),
    status      NUMBER(1),
    
    CONSTRAINT course_pk PRIMARY KEY ( course_id )
);

CREATE TABLE section (
    section_id  NUMBER,
    course_id   NUMBER,
    s_year        char(4),
    c_date      varchar(20),
    offering    varchar(20),
    s_format      NUMBER(1),--online/class
    price       NUMBER,
    
    CONSTRAINT section_pk PRIMARY KEY ( section_id ),
    CONSTRAINT course_fk FOREIGN KEY ( course_id ) REFERENCES course( course_id ) 
);


-------------------------------------------------------------------------------
CREATE TABLE store (
    storeid  NUMBER,
    address  VARCHAR(20),
    zipcode  NUMBER,
    phone    NUMBER
);

CREATE TABLE inventory (
    itemnum      NUMBER,
    title        VARCHAR(20),
    description  VARCHAR(20),
    quantity     NUMBER,
    unit         NUMBER,
    avgcost      NUMBER,
    shelfcode    NUMBER,
    minlevel     NUMBER
);

CREATE TABLE sale (
    invoicenbr  NUMBER,
    s_date      DATE,
    itemnbr     NUMBER,
    quantity    NUMBER,
    price       NUMBER,
    note        varchar,
    minlevel    NUMBER
);

CREATE TABLE purchase (
    puchasenbr  NUMBER,
    p_date      DATE,
    itemnbr     NUMBER,
    quantity    NUMBER,
    unitcost    NUMBER,
    note        VARCHAR(20)
);
-----------------------------------------------------------------------
CREATE TABLE factory (
    factoryid    NUMBER,
    factoryname  VARCHAR(50),
    address      VARCHAR(50),
    zipcode      NUMBER,
    phone        NUMBER,
    manager      VARCHAR(20)
);

CREATE TABLE material (
    materialcode  NUMBER,
    materialname  VARCHAR(50),
    quantity      NUMBER,
    unit          NUMBER,
    minlevel      NUMBER
);

CREATE TABLE product (
    productcode  NUMBER,
    productname  VARCHAR(20),
    description  VARCHAR(50),
    quantity     NUMBER,
    unit         NUMBER,
    avgcost      NUMBER
);

CREATE TABLE contract (
    contractid   NUMBER,
    customerid   NUMBER,
    c_date       DATE,
    saleamount   NUMBER,
    payschedule  DATE
);

CREATE TABLE lineitem (
    contractid   NUMBER,
    productcode  NUMBER,
    quantity     NUMBER
);

CREATE TABLE purchase (
    purchasenum       NUMBER,
    supplierid        NUMBER,
    supplierordernum  NUMBER,
    bookdate          DATE,
    paydate           DATE,
    note              VARCHAR(20)
);

CREATE TABLE purchaseline (
    purchasenum   NUMBER,
    materialcode  NUMBER,
    quantity      NUMBER
);

CREATE TABLE supplier (
    companyid     NUMBER,
    website       VARCHAR(50),
    contactemail  VARCHAR(50)
);

CREATE TABLE customer (
    companyid      NUMBER,
    contactperson  VARCHAR(20),
    contactemail   VARCHAR(50)
);

CREATE TABLE makes (
    factoryid    NUMBER,
    productcode  NUMBER,
    quantity     NUMBER
);