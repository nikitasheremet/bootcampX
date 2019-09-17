SELECT DISTINCT(teachers.name) AS names, cohorts.name, COUNT(req.id)
FROM assistance_requests req
JOIN teachers ON teachers.id = req.teacher_id
JOIN students ON students.id = req.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY names, cohorts.name
ORDER BY names;