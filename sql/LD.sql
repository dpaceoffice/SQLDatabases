--1. List the names for all workers in alphabetical order by last name.
SELECT person.last_name, person.first_name
FROM job, person, p_works
WHERE (job.job_id = p_works.job_id AND person.person_id = p_works.person_id)
ORDER BY person.last_name ASC;

--2. List the staff (salary workers) by salary in descending order.
SELECT person.last_name, person.first_name, payrate.annual 
FROM job, person, p_works, payrate
WHERE ((job.job_id = p_works.job_id AND person.person_id = p_works.person_id) AND (job.pay_rate = payrate.pay_id AND job.pay_type = 1))-- 1 = salary
ORDER BY payrate.annual DESC;

--4. List the required skills of a given PositionCode in a readable format.
SELECT skill.title
FROM skill, position, requirement
WHERE position.position_id = requirement.pos_id AND requirement.skill_id = skill.skill_id;

--5. Given a person’s identifier, list this person’s skills in a readable format.
SELECT person.first_name, person.last_name, skill.title
FROM person, skill, p_has
WHERE person.person_id = p_has.person_id AND skill.skill_id = p_has.skill_id;

--6. Given a person’s identifier, list a person’s missing skills for a specific PositionCode in a readable format.
SELECT skill.title
FROM person, position, requirement, skill --gets all these results
LEFT JOIN p_has --includes nulls here 
ON (p_has.person_id IS NOT NULL) -- we have to atleast have the person id to look at skills
WHERE (position.position_id = requirement.pos_id AND 
skill.skill_id = requirement.skill_id AND p_has.person_id = person.person_id AND p_has.skill_id IS NULL);