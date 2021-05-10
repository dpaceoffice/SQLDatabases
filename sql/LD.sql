--1. List the names for all workers in alphabetical order by last name.
INSERT INTO person VALUES (
    0,
    'David',
    'Pace',
    'dpace12@gmail.com',
    0,
    '504-851-9685'
);

INSERT INTO person VALUES (
    1,
    'Andy',
    'Tran',
    'atran78@gmail.com',
    0,
    '504-875-6163'
);

INSERT INTO person VALUES (
    2,
    'Coral',
    'Mckeon',
    'cmckeon24@gmail.com',
    0,
    '504-981-3324'
);

INSERT INTO person VALUES (
    3,
    'Amanda',
    'Bui',
    'abui445@gmail.com',
    1,
    '578-441-3365'
);

INSERT INTO person VALUES (
    4,
    'Bobby',
    'Joe',
    'bjoe23@gmail.com',
    0,
    '598-481-3635'
);

INSERT INTO jobs VALUES (0, 0 -- fulltime
);
INSERT INTO jobs VALUES (1, 0 -- fulltime
);
INSERT INTO jobs VALUES (2,1 --part time
);
INSERT INTO jobs VALUES (3,1
);--0 = fulltime 1 = parttime
INSERT INTO jobs VALUES (4,0
);--0 = fulltime 1 = parttime
INSERT INTO jobs VALUES (5,0
);--0 = fulltime 1 = parttime

INSERT INTO person_job VALUES (
    1,--andy 
    1,
    '12-DEC-01',
    NULL
);

INSERT INTO person_job VALUES (
    0,--david
    2, -- job 2
    '20-JAN-16',
    '21-JAN-16'
);

INSERT INTO person_job VALUES (
    0,--david
    0, -- job 0
    '21-JAN-16',
    NULL
);

INSERT INTO person_job VALUES (
    2,
    3,
    '01-AUG-00',
    '05-SEP-16'
);

INSERT INTO person_job VALUES (
    3,
    4,
    '21-OCT-21',
   '22-OCT-22'
);

INSERT INTO person_job VALUES (
    3,
    3,
    '22-OCT-22',
    NULL
);
INSERT INTO person_job VALUES (
    4,--Bobby
    5, -- job 1
    '21-JAN-16',
    NULL
);


SELECT UNIQUE
    person.last_name,
    person.first_name
FROM
    jobs,
    person,
    person_job
WHERE
    ( jobs.job_id = person_job.job_id
      AND person.person_id = person_job.person_id )
ORDER BY
    person.last_name ASC;

--2. List the staff (salary workers) by salary in descending order.
INSERT INTO pay_type VALUES (
    0,
    1,
    500000
);
INSERT INTO pay_type VALUES (
    1,
    1,
    200000
);

INSERT INTO pay_type VALUES (
    2,
    1,
    132000
);

INSERT INTO pay_type VALUES (
    3,
    0,
    20
);

INSERT INTO pay_type VALUES (
    4,
    0,
    10
);

INSERT INTO pay_type VALUES (
    5,
    1,
    55000
);

INSERT INTO pay_type_job VALUES (
    0,
    0
);

INSERT INTO pay_type_job VALUES (
    1,
    1
);

INSERT INTO pay_type_job VALUES (
    3,
    3
);

INSERT INTO pay_type_job VALUES (
    3,
    2
);

INSERT INTO pay_type_job VALUES (
    5,
    5
);

SELECT
    person.last_name,
    person.first_name,
    pay_type.pay_value
FROM
    jobs,
    person,
    person_job,
    pay_type,
    pay_type_job
WHERE
    ( jobs.job_id = person_job.job_id
      AND person.person_id = person_job.person_id
      AND pay_type.pay_type_id = pay_type_job.pay_type_id
      AND jobs.job_id = pay_type_job.job_id
      AND pay_type.wage_salary = 1 
      AND person_job.end_date IS NULL)-- 1 = salary
ORDER BY
    pay_type.pay_value DESC;

--4. List the required skills of a given PositionCode in a readable format.
INSERT INTO positions VALUES (
    0,
    'Senior Developer',
    'Coolest cat in the room'
);

INSERT INTO positions VALUES (
    1,
    'Junior Developer',
    'Almost that guy youd go to'
);

INSERT INTO positions VALUES (
    2,
    'Developer',
    'Makes the coffee'
);

INSERT INTO positions VALUES (
    3,
    'Conductor',
    'Conducts music'
);

INSERT INTO skill VALUES (
    0,
    'SQL',
    'Database management language'
);

INSERT INTO skill VALUES (
    1,
    'Java',
    'Object oriented programming language'
);

INSERT INTO skill VALUES (
    2,
    'c++',
    'OG Programing language'
);

INSERT INTO skill VALUES (
    3,
    'Coffee maker',
    'Its a real skill'
);
INSERT INTO skill VALUES (
    4,
    'Music Theory',
    'Its a real skill'
);

INSERT INTO position_skill VALUES (
    0,
    0
);

INSERT INTO position_skill VALUES (
    0,
    1
);

INSERT INTO position_skill VALUES (
    0,
    2
);

INSERT INTO position_skill VALUES (
    1,
    0
);

INSERT INTO position_skill VALUES (
    1,
    1
);

INSERT INTO position_skill VALUES (
    2,
    3
);
INSERT INTO position_skill VALUES (
    3,
    4
);

SELECT
    positions.position_id,
    skill.title AS "Skill Title"
FROM
    skill,
    positions,
    position_skill
WHERE
    ( positions.position_id = &position_identifer
      AND position_skill.position_id = positions.position_id
      AND skill.skill_id = position_skill.skill_id );

--5. Given a person's identifier, list this person's skills in a readable format.
INSERT INTO person_skill VALUES (
    0,
    0
);

INSERT INTO person_skill VALUES (
    0,
    1
);

INSERT INTO person_skill VALUES (
    0,
    2
);

INSERT INTO person_skill VALUES (
    1,
    0
);

INSERT INTO person_skill VALUES (
    1,
    1
);

INSERT INTO person_skill VALUES (
    2,
    3
);
INSERT INTO person_skill VALUES (
    3,
    3
);
INSERT INTO person_skill VALUES (
    4,
    3
);
INSERT INTO person_skill VALUES (
    4,
    4
);

SELECT
    person.first_name,
    person.last_name,
    skill.title AS "Owned Skills"
FROM
    person,
    skill,
    person_skill
WHERE
    person.person_id = &person_identifer
    AND person.person_id = person_skill.person_id
    AND skill.skill_id = person_skill.skill_id;

--6. Given a person's identifier, list a person's missing skills for a specific PositionCode in a readable format.

SELECT
    positions.title AS "Position",
    skill.title AS "Missing Skill"
FROM position_skill
INNER JOIN skill ON ( position_skill.position_id = &position_identifer
                          AND skill.skill_id = position_skill.skill_id )
INNER JOIN positions ON (position_skill.position_id = positions.position_id)
WHERE skill.skill_id NOT IN (
        SELECT
            person_skill.skill_id
        FROM
            person_skill
        WHERE
            person_skill.person_id = &Person_id
    );

--13. For the LD database, given a person's identifier, find all the jobs this person is currently
-- holding and worked in the past.
SELECT 
    person.first_name,
    jobs.job_id,
    person_job.start_date,
    person_job.end_date
FROM 
    jobs,
    person_job,
    person
WHERE
    person.person_id = &person_identifier 
    AND jobs.job_id = person_job.job_id 
    AND person.person_id = person_job.person_id;

--14. In a local or national crisis, we need to find all the people who once held a position of the
--given PositionCode. List PersonID, Name, JobTitle and the Years the person worked in
--(starting year and ending year).

INSERT INTO position_job VALUES (0, 0);
INSERT INTO position_job VALUES (1, 1);
INSERT INTO position_job VALUES (2, 2);
INSERT INTO position_job VALUES (2, 3);
--INSERT INTO position_job VALUES (2, 1);
INSERT INTO position_job VALUES (3, 5);

SELECT
    positions.position_id,
    person.person_id,
    person.first_name,
    person.last_name,
    positions.title,
    person_job.start_date,
    person_job.end_date
FROM
    positions, jobs, position_job, person, person_job
WHERE (positions.position_id = &positionId 
AND positions.position_id = position_job.position_id 
AND position_job.job_id = jobs.job_id 
AND jobs.job_id = person_job.job_id
AND person.person_id = person_job.person_id);
    
--15.Find all the unemployed people who once held a job position of the given PositionCode.
SELECT
    person.first_name,
    person.last_name
FROM person, jobs, positions, person_job, position_job
WHERE (positions.position_id = &position_id 
AND positions.position_id = position_job.position_id 
AND jobs.job_id = position_job.job_id 
AND person.person_id = person_job.person_id
AND jobs.job_id = person_job.job_id
AND person.first_name NOT IN ( 
SELECT UNIQUE
    person.first_name
FROM
    jobs,
    person,
    person_job
WHERE
     jobs.job_id = person_job.job_id
    AND person.person_id = person_job.person_id  AND person_job.end_date IS NULL));

--16.List the average, maximum and minimum annual pay (total salaries or wage rates multiplying
--by 1920 hours) of each industry (listed in GICS) in the order of the industry names.

INSERT INTO industry VALUES ( 0, 'Tech' ); 
INSERT INTO industry VALUES ( 1, 'Music' );
INSERT INTO sub_industry VALUES (0, 'Cybotics');
INSERT INTO sub_industry VALUES (1, 'Studio Rentals');
INSERT INTO industry_sub_industr VALUES (0, 0);
INSERT INTO industry_sub_industr VALUES (1, 1);
INSERT INTO company VALUES (0, 'Volt Maximum', 'We do robots', 'http://www.google.com');
INSERT INTO company VALUES (1, 'Real Auditions', 'We do studio stuff', 'http://www.google.com');
INSERT INTO company_sub_industry VALUES (0, 0);
INSERT INTO company_sub_industry VALUES (1, 1);
INSERT INTO position_company VALUES (0, 0);
INSERT INTO position_company VALUES (1, 0);
INSERT INTO position_company VALUES (2, 0);
INSERT INTO position_company VALUES (3, 1);

SELECT industry_salary.title, AVG(industry_salary.pay_value) AS Average, MAX(industry_salary.pay_value) AS Maximum, MIN(industry_salary.pay_value) AS Minimum
FROM (
SELECT person.first_name, industry.title, pay_type.pay_value
FROM 
    industry,
    sub_industry,
    industry_sub_industr,
    company,
    company_sub_industry,
    positions,
    position_company,
    jobs,
    position_job,
    person,
    person_job,
    pay_type,
    pay_type_job
WHERE industry.industry_id = industry_sub_industr.industry_id
    AND sub_industry.sub_industry_id = industry_sub_industr.sub_industry_id
    AND company.company_id = company_sub_industry.company_id
    AND sub_industry.sub_industry_id = company_sub_industry.sub_industry_id
    AND positions.position_id = position_company.position_id
    AND company.company_id = position_company.company_id
    AND jobs.job_id = position_job.job_id
    AND positions.position_id = position_job.position_id
    AND jobs.job_id = person_job.job_id
    AND person.person_id = person_job.person_id
    AND pay_type.pay_type_id = pay_type_job.pay_type_id
    AND jobs.job_id = pay_type_job.job_id
    AND pay_type.wage_salary = 1
    AND person_job.end_date IS NULL) industry_salary
    GROUP BY industry_salary.title;
--17. Find out the biggest employer, industry, and industry group in terms of number of employees.
--(Note: This should be three separate queries)
SELECT bemployer."Employer" AS "Biggest Employer", bindustry."Industry" AS "Biggest Industry", bsub."Sub-Industry" AS "Biggest Sub-Industry"
FROM(
SELECT e.c_name AS "Employer", COUNT(e.person_id) AS "Active Employees"
FROM(
SELECT company.c_name, person.person_id
FROM company, positions, jobs, person, position_company, position_job, person_job
WHERE company.company_id = position_company.company_id AND positions.position_id = position_company.position_id
    AND jobs.job_id = position_job.job_id AND positions.position_id = position_job.position_id
    AND person.person_id = person_job.person_id AND jobs.job_id = person_job.job_id
    AND person_job.end_date IS NULL) e
GROUP BY e.c_name
HAVING COUNT(e.person_id) = MAX(e.person_id)) bemployer,

(SELECT e.title AS "Industry", COUNT(e.person_id) AS "Active Employees"
FROM(
SELECT industry.title, person.person_id
FROM industry, sub_industry, industry_sub_industr,  company, company_sub_industry, positions, jobs, person, position_company, position_job, person_job
WHERE industry.industry_id = industry_sub_industr.industry_id
    AND sub_industry.sub_industry_id = industry_sub_industr.sub_industry_id
    AND sub_industry.sub_industry_id = company_sub_industry.sub_industry_id 
    AND company.company_id = company_sub_industry.company_id
    AND company.company_id = position_company.company_id AND positions.position_id = position_company.position_id
    AND jobs.job_id = position_job.job_id AND positions.position_id = position_job.position_id
    AND person.person_id = person_job.person_id AND jobs.job_id = person_job.job_id
    AND person_job.end_date IS NULL) e
GROUP BY e.title
HAVING COUNT(e.person_id) = MAX(e.person_id)) bindustry,

(SELECT e.sub_desc AS "Sub-Industry", COUNT(e.person_id) AS "Active Employees"
FROM(
SELECT sub_industry.sub_desc, person.person_id
FROM sub_industry,  company, company_sub_industry, positions, jobs, person, position_company, position_job, person_job
WHERE sub_industry.sub_industry_id = company_sub_industry.sub_industry_id 
    AND company.company_id = company_sub_industry.company_id
    AND company.company_id = position_company.company_id AND positions.position_id = position_company.position_id
    AND jobs.job_id = position_job.job_id AND positions.position_id = position_job.position_id
    AND person.person_id = person_job.person_id AND jobs.job_id = person_job.job_id
    AND person_job.end_date IS NULL) e
GROUP BY e.sub_desc
HAVING COUNT(e.person_id) = MAX(e.person_id)) bsub;


--18.) Find out the job distribution among industries by showing the number of employees in each
--industry.
SELECT e.title AS "Industry", COUNT(e.person_id) AS "Active Employees"
FROM(
SELECT industry.title, person.person_id
FROM industry, sub_industry, industry_sub_industr,  company, company_sub_industry, positions, jobs, person, position_company, position_job, person_job
WHERE industry.industry_id = industry_sub_industr.industry_id
    AND sub_industry.sub_industry_id = industry_sub_industr.sub_industry_id
    AND sub_industry.sub_industry_id = company_sub_industry.sub_industry_id 
    AND company.company_id = company_sub_industry.company_id
    AND company.company_id = position_company.company_id AND positions.position_id = position_company.position_id
    AND jobs.job_id = position_job.job_id AND positions.position_id = position_job.position_id
    AND person.person_id = person_job.person_id AND jobs.job_id = person_job.job_id
    AND person_job.end_date IS NULL) e
GROUP BY e.title
ORDER BY "Active Employees" DESC;

--19. Given a person’s identifier and a PositionCode, find the courses (course id and title) that
--each alone teaches all the missing skills for this person to be qualified for the specified
--position, assuming the skill gap of the worker and the requirement of the position can be
--covered by one course.

INSERT INTO course VALUES (0, 'Coffee Making 101', 'Level 1', 'We teach coffee');
INSERT INTO section VALUES (0, 2021, NULL, NULL, 1, 50);
INSERT INTO section_skill VALUES(0, 3);
INSERT INTO section_course VALUES(0,0);

INSERT INTO course VALUES (1, 'C++ Programming Language', 'Level 1', 'Learn C++');
INSERT INTO section VALUES (1, 2021, NULL, NULL, 1, 100);
INSERT INTO section_skill VALUES(1, 2);
INSERT INTO section_course VALUES(1,1);

SELECT course.course_id, course.c_title
FROM course, section, skill, section_course, section_skill
WHERE course.course_id = section_course.course_id 
    AND section_course.section_id = section.section_id
    AND skill.skill_id = section_skill.skill_id
    AND section.section_id = section_skill.section_id
    AND skill.skill_id IN(
SELECT
    skill.skill_id
FROM position_skill
INNER JOIN skill ON ( position_skill.position_id = &position_identifer
                          AND skill.skill_id = position_skill.skill_id )
INNER JOIN positions ON (position_skill.position_id = positions.position_id)
WHERE skill.skill_id NOT IN (
        SELECT
            person_skill.skill_id
        FROM
            person_skill
        WHERE
            person_skill.person_id = &Person_id
    ));

--20. Given a person’s identifier, find the job position with the highest pay rate for this person
--according to his/her skill possession

--21. Given a position code, list all the names along with the emails of the persons who are
--qualified for this position.
define pinput = '&position_code'
SELECT
    person.first_name,
    person.last_name,
    person.email,
    e.title,
    COUNT(person_skill.skill_id) AS "Required Skills"
FROM
    (
        person
        INNER JOIN person_skill ON person_skill.person_id = person.person_id
        INNER JOIN positions e ON e.position_id = &pinput
        INNER JOIN position_skill ON position_skill.position_id = e.position_id
                                     AND position_skill.skill_id = person_skill.skill_id
    )
GROUP BY
    person.first_name, person.last_name, person.email, e.title
HAVING
    COUNT(person_skill.skill_id) = (
        SELECT
            COUNT(position_skill.skill_id)
        FROM
            (
                position_skill
                INNER JOIN skill ON position_skill.skill_id = skill.skill_id
                                    AND position_skill.position_id = &pinput
            )
        GROUP BY
            position_skill.position_id
    );