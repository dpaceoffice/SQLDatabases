DROP TABLE pay_type_job;

DROP TABLE position_skill;

DROP TABLE company_address;

DROP TABLE person_address;

DROP TABLE company_sub_industry;

DROP TABLE industry_sub_industr;

DROP TABLE position_company;

DROP TABLE position_job;

DROP TABLE person_skill;

DROP TABLE person_job;

DROP TABLE person_section;

DROP TABLE section_course;

DROP TABLE section_skill;

DROP TABLE req_course;

DROP TABLE company;

DROP TABLE address;

DROP TABLE sub_industry;

DROP TABLE industry;

DROP TABLE person;

DROP TABLE positions;

DROP TABLE jobs;

DROP TABLE pay_type;

DROP TABLE skill;

DROP TABLE section;

DROP TABLE course;

CREATE TABLE sub_industry (
    sub_industry_id  NUMBER,
    sub_desc         VARCHAR(255),
    CONSTRAINT sub_industry_primary PRIMARY KEY ( sub_industry_id )
);

CREATE TABLE industry (
    industry_id  NUMBER,
    title        VARCHAR(255),
    CONSTRAINT industry_primary PRIMARY KEY ( industry_id )
);

CREATE TABLE positions (
    position_id  NUMBER,
    title        VARCHAR(255),
    pos_desc     VARCHAR(255),
    CONSTRAINT position_primary PRIMARY KEY ( position_id )
);

CREATE TABLE jobs (
    job_id        NUMBER,
    employeemode  NUMBER(1),--full time or part time, boolean?
    CONSTRAINT job_primary PRIMARY KEY ( job_id )
);


CREATE TABLE pay_type (
    pay_type_id  NUMBER,
    wage_salary  NUMBER(1),
    pay_value    NUMBER,
    CONSTRAINT pay_type_primary PRIMARY KEY ( pay_type_id )
);

CREATE TABLE skill (
    skill_id     NUMBER,
    title        VARCHAR(255),
    skill_desc   VARCHAR(255),
    CONSTRAINT skill_primary PRIMARY KEY ( skill_id )
);

CREATE TABLE section (
    section_id       NUMBER,
    sec_year         NUMBER,
    completion_date  DATE,
    offering_date    DATE,
    sec_format       NUMBER(1),--online/inperson
    price            NUMBER,
    CONSTRAINT section_primary PRIMARY KEY ( section_id )
);

CREATE TABLE person (
    person_id   NUMBER,
    first_name  VARCHAR(255),
    last_name   VARCHAR(255),
    email       VARCHAR(255),
    gender      NUMBER(1),
    phone       VARCHAR(255),
    CONSTRAINT person_primary PRIMARY KEY ( person_id )
);

CREATE TABLE address (
    address_id  NUMBER,
    zip         NUMBER(5),
    street      VARCHAR(255),
    city        VARCHAR(255),
    CONSTRAINT address_primary PRIMARY KEY ( address_id )
);

CREATE TABLE company (
    company_id  NUMBER,
    c_name      VARCHAR(255),
    c_desc      VARCHAR(255),
    c_website   VARCHAR(255),
    CONSTRAINT company_primary PRIMARY KEY ( company_id )
);

CREATE TABLE course (
    course_id  NUMBER,
    c_title    VARCHAR(255),
    c_level    VARCHAR(255),
    c_desc     VARCHAR(255),
    CONSTRAINT course_primary PRIMARY KEY ( course_id )
);

--LD Relations

CREATE TABLE pay_type_job (
    job_id       NUMBER,
    pay_type_id  NUMBER,
    CONSTRAINT pay_type_job_primary PRIMARY KEY ( job_id,
                                                  pay_type_id ),
    CONSTRAINT pay_type_job_foreign FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id ),
    CONSTRAINT pay_type_job_foreign_2 FOREIGN KEY ( pay_type_id )
        REFERENCES pay_type ( pay_type_id )
);

/*
CREATE TABLE pay_type_rate (
    pay_type_id  NUMBER,
    pay_rate_id  NUMBER,
    CONSTRAINT pay_type_rate_primary PRIMARY KEY ( pay_type_id,
                                                   pay_rate_id ),
    CONSTRAINT pay_type_rate_foreign FOREIGN KEY ( pay_type_id )
        REFERENCES pay_type ( pay_type_id ),
    CONSTRAINT pay_type_rate_foreign_2 FOREIGN KEY ( pay_rate_id )
        REFERENCES pay_rate ( pay_rate_id )
);
*/

CREATE TABLE company_address (
    company_id  NUMBER,
    address_id  NUMBER,
    CONSTRAINT company_address_primary PRIMARY KEY ( company_id,
                                                     address_id ),
    CONSTRAINT company_address_foreign FOREIGN KEY ( company_id )
        REFERENCES company ( company_id ),
    CONSTRAINT company_address_foreign_2 FOREIGN KEY ( address_id )
        REFERENCES address ( address_id )
);

CREATE TABLE person_address (
    person_id   NUMBER,
    address_id  NUMBER,
    CONSTRAINT person_address_primary PRIMARY KEY ( person_id,
                                                    address_id ),
    CONSTRAINT person_address_foreign FOREIGN KEY ( person_id )
        REFERENCES person ( person_id ),
    CONSTRAINT person_address_foreign_2 FOREIGN KEY ( address_id )
        REFERENCES address ( address_id )
);

CREATE TABLE company_sub_industry (
    company_id       NUMBER,
    sub_industry_id  NUMBER,
    CONSTRAINT company_sub_industry_primary PRIMARY KEY ( company_id,
                                                          sub_industry_id ),
    CONSTRAINT company_sub_industry_foreign FOREIGN KEY ( company_id )
        REFERENCES company ( company_id ),
    CONSTRAINT company_sub_industry_foreign_2 FOREIGN KEY ( sub_industry_id )
        REFERENCES sub_industry ( sub_industry_id )
);

CREATE TABLE industry_sub_industr (
    industry_id      NUMBER,
    sub_industry_id  NUMBER,
    CONSTRAINT industry_sub_industr_primary PRIMARY KEY ( industry_id,
                                                           sub_industry_id ),
    CONSTRAINT industry_sub_industr_foreign FOREIGN KEY ( industry_id )
        REFERENCES industry ( industry_id ),
    CONSTRAINT industry_sub_industr_foreign_2 FOREIGN KEY ( sub_industry_id )
        REFERENCES sub_industry ( sub_industry_id )
);

CREATE TABLE position_company (
    position_id  NUMBER,
    company_id   NUMBER,
    CONSTRAINT position_company_primary PRIMARY KEY ( position_id,
                                                      company_id ),
    CONSTRAINT position_company_foreign FOREIGN KEY ( position_id )
        REFERENCES positions ( position_id ),
    CONSTRAINT position_company_foreign_2 FOREIGN KEY ( company_id )
        REFERENCES company ( company_id )
);

CREATE TABLE position_skill (
    position_id  NUMBER,
    skill_id   NUMBER,
    CONSTRAINT position_skill_primary PRIMARY KEY ( position_id,
                                                      skill_id ),
    CONSTRAINT position_skill_foreign FOREIGN KEY ( position_id )
        REFERENCES positions ( position_id ),
    CONSTRAINT position_skill_foreign_2 FOREIGN KEY ( skill_id )
        REFERENCES skill ( skill_id )
);

CREATE TABLE position_job (
    position_id  NUMBER,
    job_id       NUMBER,
    CONSTRAINT position_job_primary PRIMARY KEY ( position_id,
                                                  job_id ),
    CONSTRAINT position_job_foreign FOREIGN KEY ( position_id )
        REFERENCES positions ( position_id ),
    CONSTRAINT position_job_foreign_2 FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id )
);

CREATE TABLE person_skill (
    person_id  NUMBER,
    skill_id   NUMBER,
    CONSTRAINT person_skill_primary PRIMARY KEY ( person_id,
                                                  skill_id ),
    CONSTRAINT person_skill_foreign FOREIGN KEY ( person_id )
        REFERENCES person ( person_id ),
    CONSTRAINT person_skill_foreign_2 FOREIGN KEY ( skill_id )
        REFERENCES skill ( skill_id )
);

CREATE TABLE person_job (
    person_id  NUMBER,
    job_id     NUMBER,
    start_date DATE NOT NULL, 
    end_date   DATE,
    CONSTRAINT person_job_primary PRIMARY KEY ( person_id,
                                                job_id ),
    CONSTRAINT person_job_foreign FOREIGN KEY ( person_id )
        REFERENCES person ( person_id ),
    CONSTRAINT person_job_foreign_2 FOREIGN KEY ( job_id )
        REFERENCES jobs ( job_id )
);

CREATE TABLE person_section (
    person_id   NUMBER,
    section_id  NUMBER,
    CONSTRAINT person_section_primary PRIMARY KEY ( person_id,
                                                    section_id ),
    CONSTRAINT person_section_foreign FOREIGN KEY ( person_id )
        REFERENCES person ( person_id ),
    CONSTRAINT person_section_foreign_2 FOREIGN KEY ( section_id )
        REFERENCES section ( section_id )
);

CREATE TABLE section_course (
    section_id  NUMBER,
    course_id   NUMBER,
    CONSTRAINT section_course_primary PRIMARY KEY ( section_id,
                                                    course_id ),
    CONSTRAINT section_course_foreign FOREIGN KEY ( section_id )
        REFERENCES section ( section_id ),
    CONSTRAINT section_course_foreign_2 FOREIGN KEY ( course_id )
        REFERENCES course ( course_id )
);

CREATE TABLE section_skill (
    section_id  NUMBER,
    skill_id    NUMBER,
    CONSTRAINT section_skill_primary PRIMARY KEY ( section_id,
                                                   skill_id ),
    CONSTRAINT section_skill_foreign FOREIGN KEY ( section_id )
        REFERENCES section ( section_id ),
    CONSTRAINT section_skill_foreign_2 FOREIGN KEY ( skill_id )
        REFERENCES skill ( skill_id )
);

CREATE TABLE req_course (
    course_id      NUMBER,
    req_course_id  NUMBER,
    CONSTRAINT req_course_primary PRIMARY KEY ( course_id,
                                                req_course_id ),
    CONSTRAINT req_course_foreign FOREIGN KEY ( course_id )
        REFERENCES course ( course_id ),
    CONSTRAINT req_course_foreign_2 FOREIGN KEY ( req_course_id )
        REFERENCES course ( course_id )
);