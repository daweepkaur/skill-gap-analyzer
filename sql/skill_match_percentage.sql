DROP TABLE IF EXISTS skill_match_percentage;

CREATE TABLE skill_match_percentage AS
SELECT
    j.domain,
    COUNT(DISTINCT j.skill) AS total_job_skills,
    COUNT(DISTINCT s.skill) AS matched_student_skills,
    ROUND(
        COUNT(DISTINCT s.skill) * 100.0 /
        COUNT(DISTINCT j.skill),
        2
    ) AS skill_match_percentage
FROM job_unique_skills j
LEFT JOIN student_unique_skills s
    ON j.domain = s.domain
   AND j.skill = s.skill
GROUP BY j.domain;
