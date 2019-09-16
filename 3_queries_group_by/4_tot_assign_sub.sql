SELECT cohorts.name AS cohorts, COUNT(*) AS total_submissions
FROM students JOIN cohorts ON students.cohort_id = cohorts.id
JOIN assignment_submissions ON students.id = assignment_submissions.student_id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;