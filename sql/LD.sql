--1. List the names for all workers in alphabetical order by last name.
SELECT person.last_name, person.first_name
FROM jobs, person, p_works
WHERE (jobs.job_id = p_works.job_id AND person.person_id = p_works.person_id)
ORDER BY person.last_name ASC;

--2. List the staff (salary workers) by salary in descending order.
SELECT person.last_name, person.first_name, payrate.annual 
FROM jobs, person, p_works, payrate
WHERE ((jobs.job_id = p_works.job_id AND person.person_id = p_works.person_id) AND (jobs.pay_rate = payrate.pay_id AND jobs.pay_type = 1))-- 1 = salary
ORDER BY payrate.annual DESC;

--4. List the required skills of a given PositionCode in a readable format.
SELECT jposition.position_id, skill.title
FROM skill, jposition, requirement
WHERE jposition.position_id = requirement.pos_id AND requirement.skill_id = skill.skill_id;

--5. Given a person’s identifier, list this person’s skills in a readable format.
SELECT person.first_name, person.last_name, skill.title
FROM person, skill, p_has
WHERE person.person_id = p_has.person_id AND skill.skill_id = p_has.skill_id;

--6. Given a person’s identifier, list a person’s missing skills for a specific PositionCode in a readable format.
SELECT person.first_name AS "First Name", jposition.title AS "Position", skill.title AS "Required Skill"
FROM skill
    INNER JOIN person ON person.person_id = &person_identifer
    LEFT JOIN p_has ON skill.skill_id = p_has.skill_id
    INNER JOIN jposition ON jposition.position_id = &position_code
    INNER JOIN requirement ON skill.skill_id = requirement.skill_id AND jposition.position_id = requirement.pos_id;