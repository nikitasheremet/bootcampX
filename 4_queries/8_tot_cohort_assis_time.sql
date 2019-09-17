SELECT coh.name, SUM(completed_at-started_at) AS total_duration
FROM students stu
JOIN cohorts coh ON coh.id = stu.cohort_id
JOIN assistance_requests req ON req.student_id = stu.id
GROUP BY coh.name
ORDER BY total_duration;