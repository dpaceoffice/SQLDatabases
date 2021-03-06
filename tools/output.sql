CREATE TABLE PAY_TYPE_JOB (job_id NUMBER, pay_type_id
 NUMBER, CONSTRAINT PAY_TYPE_JOB_primary PRIMARY KEY ( job_id, pay_type_id
), CONSTRAINT PAY_TYPE_JOB_foreign FOREIGN KEY ( job_id ) REFERENCES job (job_id), CONSTRAINT PAY_TYPE_JOB_foreign_2 FOREIGN KEY ( pay_type_id
 ) REFERENCES pay_type
(pay_type_id
));
CREATE TABLE PAY_TYPE_RATE (pay_type_id NUMBER, pay_rate_id
 NUMBER, CONSTRAINT PAY_TYPE_RATE_primary PRIMARY KEY ( pay_type_id, pay_rate_id
), CONSTRAINT PAY_TYPE_RATE_foreign FOREIGN KEY ( pay_type_id ) REFERENCES pay_type (pay_type_id), CONSTRAINT PAY_TYPE_RATE_foreign_2 FOREIGN KEY ( pay_rate_id
 ) REFERENCES pay_rate
(pay_rate_id
));
CREATE TABLE COMPANY_ADDRESS (company_id NUMBER, address_id
 NUMBER, CONSTRAINT COMPANY_ADDRESS_primary PRIMARY KEY ( company_id, address_id
), CONSTRAINT COMPANY_ADDRESS_foreign FOREIGN KEY ( company_id ) REFERENCES company (company_id), CONSTRAINT COMPANY_ADDRESS_foreign_2 FOREIGN KEY ( address_id
 ) REFERENCES address
(address_id
));
CREATE TABLE PERSON_ADDRESS (person_id NUMBER, address_id
 NUMBER, CONSTRAINT PERSON_ADDRESS_primary PRIMARY KEY ( person_id, address_id
), CONSTRAINT PERSON_ADDRESS_foreign FOREIGN KEY ( person_id ) REFERENCES person (person_id), CONSTRAINT PERSON_ADDRESS_foreign_2 FOREIGN KEY ( address_id
 ) REFERENCES address
(address_id
));
CREATE TABLE COMPANY_SUB_INDUSTRY (company_id NUMBER, sub_industry_id
 NUMBER, CONSTRAINT COMPANY_SUB_INDUSTRY_primary PRIMARY KEY ( company_id, sub_industry_id
), CONSTRAINT COMPANY_SUB_INDUSTRY_foreign FOREIGN KEY ( company_id ) REFERENCES company (company_id), CONSTRAINT COMPANY_SUB_INDUSTRY_foreign_2 FOREIGN KEY ( sub_industry_id
 ) REFERENCES sub_industry
(sub_industry_id
));
CREATE TABLE INDUSTRY_SUB_INDUSTRY (industry_id NUMBER, sub_industry_id
 NUMBER, CONSTRAINT INDUSTRY_SUB_INDUSTRY_primary PRIMARY KEY ( industry_id, sub_industry_id
), CONSTRAINT INDUSTRY_SUB_INDUSTRY_foreign FOREIGN KEY ( industry_id ) REFERENCES industry (industry_id), CONSTRAINT INDUSTRY_SUB_INDUSTRY_foreign_2 FOREIGN KEY ( sub_industry_id
 ) REFERENCES sub_industry
(sub_industry_id
));
CREATE TABLE POSITION_COMPANY (position_id NUMBER, company_id
 NUMBER, CONSTRAINT POSITION_COMPANY_primary PRIMARY KEY ( position_id, company_id
), CONSTRAINT POSITION_COMPANY_foreign FOREIGN KEY ( position_id ) REFERENCES position (position_id), CONSTRAINT POSITION_COMPANY_foreign_2 FOREIGN KEY ( company_id
 ) REFERENCES company
(company_id
));
CREATE TABLE POSITION_JOB (position_id NUMBER, job_id
 NUMBER, CONSTRAINT POSITION_JOB_primary PRIMARY KEY ( position_id, job_id
), CONSTRAINT POSITION_JOB_foreign FOREIGN KEY ( position_id ) REFERENCES position (position_id), CONSTRAINT POSITION_JOB_foreign_2 FOREIGN KEY ( job_id
 ) REFERENCES job
(job_id
));
CREATE TABLE PERSON_SKILL (person_id NUMBER, skill_id
 NUMBER, CONSTRAINT PERSON_SKILL_primary PRIMARY KEY ( person_id, skill_id
), CONSTRAINT PERSON_SKILL_foreign FOREIGN KEY ( person_id ) REFERENCES person (person_id), CONSTRAINT PERSON_SKILL_foreign_2 FOREIGN KEY ( skill_id
 ) REFERENCES skill
(skill_id
));
CREATE TABLE PERSON_JOB (person_id NUMBER, job_id NUMBER, CONSTRAINT PERSON_JOB_primary PRIMARY KEY ( person_id, job_id), CONSTRAINT PERSON_JOB_foreign FOREIGN KEY ( person_id ) REFERENCES person (person_id), CONSTRAINT PERSON_JOB_foreign_2 FOREIGN KEY ( job_id ) REFERENCES job(job_id));
CREATE TABLE PERSON_SECTION (person_id NUMBER, section_id
 NUMBER, CONSTRAINT PERSON_SECTION_primary PRIMARY KEY ( person_id, section_id
), CONSTRAINT PERSON_SECTION_foreign FOREIGN KEY ( person_id ) REFERENCES person (person_id), CONSTRAINT PERSON_SECTION_foreign_2 FOREIGN KEY ( section_id
 ) REFERENCES section
(section_id
));
CREATE TABLE SECTION_COURSE (section_id NUMBER, course_id
 NUMBER, CONSTRAINT SECTION_COURSE_primary PRIMARY KEY ( section_id, course_id
), CONSTRAINT SECTION_COURSE_foreign FOREIGN KEY ( section_id ) REFERENCES section (section_id), CONSTRAINT SECTION_COURSE_foreign_2 FOREIGN KEY ( course_id
 ) REFERENCES course
(course_id
));
CREATE TABLE SECTION_SKILL (section_id NUMBER, skill_id
 NUMBER, CONSTRAINT SECTION_SKILL_primary PRIMARY KEY ( section_id, skill_id
), CONSTRAINT SECTION_SKILL_foreign FOREIGN KEY ( section_id ) REFERENCES section (section_id), CONSTRAINT SECTION_SKILL_foreign_2 FOREIGN KEY ( skill_id
 ) REFERENCES skill
(skill_id
));
CREATE TABLE REQ_COURSE (course_id NUMBER, req_course_id NUMBER, CONSTRAINT REQ_COURSE_primary PRIMARY KEY ( course_id, req_course_id), CONSTRAINT REQ_COURSE_foreign FOREIGN KEY ( course_id ) REFERENCES course (course_id), CONSTRAINT REQ_COURSE_foreign_2 FOREIGN KEY ( req_course_id ) REFERENCES req_course(req_course_id));
