SELECT DISTINCT(teachers.name), cohorts.name
FROM assistance_requests req
JOIN teachers ON teachers.id = req.teacher_id
JOIN students ON students.id = req.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02';